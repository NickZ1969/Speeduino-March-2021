/*
Speeduino - Simple engine management for the Arduino Mega 2560 platform
Copyright (C) Josh Stewart
A full copy of the license may be found in the projects root directory
*/
#include "globals.h"
#include "auxiliaries.h"
#include "maths.h"
#include "src/PID_v1/PID_v1.h"
#include "decoders.h"

//Old PID method. Retained incase the new one has issues
//integerPID boostPID(&MAPx100, &boost_pwm_target_value, &boostTargetx100, configPage6.boostKP, configPage6.boostKI, configPage6.boostKD, DIRECT);
integerPID_ideal boostPID(&currentStatus.MAP, &currentStatus.boostDuty , &currentStatus.boostTarget, &configPage10.boostSens, &configPage10.boostIntv, configPage6.boostKP, configPage6.boostKI, configPage6.boostKD, DIRECT); //This is the PID object if that algorithm is used. Needs to be global as it maintains state outside of each function call
integerPID vvtPID(&currentStatus.vvt1Angle, &vvt1_pwm_value, &vvt_pid_target_angle, configPage10.vvtCLKP, configPage10.vvtCLKI, configPage10.vvtCLKD, DIRECT); //This is the PID object if that algorithm is used. Needs to be global as it maintains state outside of each function call

/*
Fan control
*/
void initialiseFan()
{
  if( configPage6.fanInv == 1 ) { fanHIGH = LOW; fanLOW = HIGH; }
  else { fanHIGH = HIGH; fanLOW = LOW; }
  digitalWrite(pinFan, fanLOW);         //Initiallise program with the fan in the off state
  currentStatus.fanOn = false;

  fan_pin_port = portOutputRegister(digitalPinToPort(pinFan));
  fan_pin_mask = digitalPinToBitMask(pinFan);
}

void fanControl()
{
  if( configPage6.fanEnable == 1 )
  {
    int onTemp = (int)configPage6.fanSP - CALIBRATION_TEMPERATURE_OFFSET;
    int offTemp = onTemp - configPage6.fanHyster;
    bool fanPermit = false;

    if ( configPage2.fanWhenOff == true) { fanPermit = true; }
    else { fanPermit = BIT_CHECK(currentStatus.engine, BIT_ENGINE_RUN); }

    if ( (currentStatus.coolant >= onTemp) && (fanPermit == true) )
    {
      //Fan needs to be turned on.
      if(BIT_CHECK(currentStatus.engine, BIT_ENGINE_CRANK) && (configPage2.fanWhenCranking == 0))
      {
        //If the user has elected to disable the fan during cranking, make sure it's off 
        FAN_OFF();
      }
      else 
      {
        FAN_ON(); 
      }
      currentStatus.fanOn = true;
    }
    else if ( (currentStatus.coolant <= offTemp) || (!fanPermit) )
    {
      //Fan needs to be turned off. 
      FAN_OFF();
      currentStatus.fanOn = false;
    }
  }
}

void initialiseAuxPWM()
{
  boost_pin_port = portOutputRegister(digitalPinToPort(pinBoost));
  boost_pin_mask = digitalPinToBitMask(pinBoost);
  vvt1_pin_port = portOutputRegister(digitalPinToPort(pinVVT_1));
  vvt1_pin_mask = digitalPinToBitMask(pinVVT_1);
  vvt2_pin_port = portOutputRegister(digitalPinToPort(pinVVT_2));
  vvt2_pin_mask = digitalPinToBitMask(pinVVT_2);
  n2o_stage1_pin_port = portOutputRegister(digitalPinToPort(configPage10.n2o_stage1_pin));
  n2o_stage1_pin_mask = digitalPinToBitMask(configPage10.n2o_stage1_pin);
  n2o_stage2_pin_port = portOutputRegister(digitalPinToPort(configPage10.n2o_stage2_pin));
  n2o_stage2_pin_mask = digitalPinToBitMask(configPage10.n2o_stage2_pin);
  n2o_arming_pin_port = portInputRegister(digitalPinToPort(configPage10.n2o_arming_pin));
  n2o_arming_pin_mask = digitalPinToBitMask(configPage10.n2o_arming_pin);

  //This is a safety check that will be true if the board is uninitialised. This prevents hangs on a new board that could otherwise try to write to an invalid pin port/mask (Without this a new Teensy 4.x hangs on startup)
  //The n2o_minTPS variable is capped at 100 by TS, so 255 indicates a new board.
  if(configPage10.n2o_minTPS == 255) { configPage10.n2o_enable = 0; }

  if(configPage10.n2o_enable > 0)
  {
    //The pin modes are only set if the if n2o is enabled to prevent them conflicting with other outputs. 
    if(configPage10.n2o_pin_polarity == 1) { pinMode(configPage10.n2o_arming_pin, INPUT_PULLUP); }
    else { pinMode(configPage10.n2o_arming_pin, INPUT); }
  }

  boostPID.SetOutputLimits(configPage2.boostMinDuty, configPage2.boostMaxDuty);
  if(configPage6.boostMode == BOOST_MODE_SIMPLE) { boostPID.SetTunings(SIMPLE_BOOST_P, SIMPLE_BOOST_I, SIMPLE_BOOST_D); }
  else { boostPID.SetTunings(configPage6.boostKP, configPage6.boostKI, configPage6.boostKD); }

  if( configPage6.vvtEnabled > 0)
  {
    currentStatus.vvt1Angle = 0;
    currentStatus.vvt2Angle = 0;

    #if defined(CORE_AVR)
      vvt_pwm_max_count = 1000000L / (16 * configPage6.vvtFreq * 2); //Converts the frequency in Hz to the number of ticks (at 16uS) it takes to complete 1 cycle. Note that the frequency is divided by 2 coming from TS to allow for up to 512hz
    #elif defined(CORE_TEENSY)
      vvt_pwm_max_count = 1000000L / (32 * configPage6.vvtFreq * 2); //Converts the frequency in Hz to the number of ticks (at 16uS) it takes to complete 1 cycle. Note that the frequency is divided by 2 coming from TS to allow for up to 512hz
    #endif

    if(configPage6.vvtMode == VVT_MODE_CLOSED_LOOP)
    {
      vvtPID.SetOutputLimits(percentage(configPage10.vvtCLminDuty, vvt_pwm_max_count), percentage(configPage10.vvtCLmaxDuty, vvt_pwm_max_count));
      vvtPID.SetTunings(configPage10.vvtCLKP, configPage10.vvtCLKI, configPage10.vvtCLKD);
      vvtPID.SetSampleTime(33); //30Hz is 33,33ms
      vvtPID.SetMode(AUTOMATIC); //Turn PID on
    }

    currentStatus.vvt1Duty = 0;
    vvt1_pwm_value = 0;
    currentStatus.vvt2Duty = 0;
    vvt2_pwm_value = 0;
    ENABLE_VVT_TIMER(); //Turn on the B compare unit (ie turn on the interrupt)
  }
  if( (configPage6.vvtEnabled == 0) && (configPage10.wmiEnabled >= 1) )
  {
    // config wmi pwm output to use vvt output
    #if defined(CORE_AVR)
      vvt_pwm_max_count = 1000000L / (16 * configPage6.vvtFreq * 2); //Converts the frequency in Hz to the number of ticks (at 16uS) it takes to complete 1 cycle. Note that the frequency is divided by 2 coming from TS to allow for up to 512hz
    #elif defined(CORE_TEENSY)
      vvt_pwm_max_count = 1000000L / (32 * configPage6.vvtFreq * 2); //Converts the frequency in Hz to the number of ticks (at 16uS) it takes to complete 1 cycle. Note that the frequency is divided by 2 coming from TS to allow for up to 512hz
    #endif
    currentStatus.wmiEmpty = 0;
    currentStatus.wmiPW = 0;
    vvt1_pwm_value = 0;
    ENABLE_VVT_TIMER(); //Turn on the B compare unit (ie turn on the interrupt)
  }

  currentStatus.boostDuty = 0;
  boostCounter = 0;
  currentStatus.vvt1Duty = 0;
  currentStatus.vvt2Duty = 0;
  vvtCounter = 0;

  currentStatus.nitrous_status = NITROUS_OFF;

}

#define BOOST_HYSTER  40
void boostControl()
{
  if( configPage6.boostEnabled==1 )
  {
    if(configPage4.boostType == OPEN_LOOP_BOOST)
    {
      //Open loop
      currentStatus.boostDuty = get3DTableValue(&boostTable, currentStatus.TPS, currentStatus.RPM) * 2 * 100;

      if(currentStatus.boostDuty > 10000) { currentStatus.boostDuty = 10000; } //Safety check
      if(currentStatus.boostDuty == 0) { DISABLE_BOOST_TIMER(); BOOST_PIN_LOW(); } //If boost duty is 0, shut everything down
      else
      {
        boost_pwm_target_value = ((unsigned long)(currentStatus.boostDuty) * boost_pwm_max_count) / 10000; //Convert boost duty (Which is a % multipled by 100) to a pwm count
        ENABLE_BOOST_TIMER(); //Turn on the compare unit (ie turn on the interrupt) if boost duty >0
      }
    }
    else if (configPage4.boostType == CLOSED_LOOP_BOOST)
    {
      if( (boostCounter & 7) == 1) { currentStatus.boostTarget = get3DTableValue(&boostTable, currentStatus.TPS, currentStatus.RPM) * 2; } //Boost target table is in kpa and divided by 2
      if(currentStatus.MAP >= 100 ) //Only engage boost control above 100kpa. 
      {
        //If flex fuel is enabled, there can be an adder to the boost target based on ethanol content
        if( configPage2.flexEnabled == 1 )
        {
          currentStatus.boostTarget += table2D_getValue(&flexBoostTable, currentStatus.ethanolPct);;
        }
        else
        {
          currentStatus.flexBoostCorrection = 0;
        }

        if(currentStatus.boostTarget > 0)
        {
          //This only needs to be run very infrequently, once every 16 calls to boostControl(). This is approx. once per second
          if( (boostCounter & 15) == 1)
          {
            boostPID.SetOutputLimits(configPage2.boostMinDuty, configPage2.boostMaxDuty);

            if(configPage6.boostMode == BOOST_MODE_SIMPLE) { boostPID.SetTunings(SIMPLE_BOOST_P, SIMPLE_BOOST_I, SIMPLE_BOOST_D); }
            else { boostPID.SetTunings(configPage6.boostKP, configPage6.boostKI, configPage6.boostKD); }
          }

          bool PIDcomputed = boostPID.Compute(); //Compute() returns false if the required interval has not yet passed.
          if(currentStatus.boostDuty == 0) { DISABLE_BOOST_TIMER(); BOOST_PIN_LOW(); } //If boost duty is 0, shut everything down
          else
          {
            if(PIDcomputed == true)
            {
              boost_pwm_target_value = ((unsigned long)(currentStatus.boostDuty) * boost_pwm_max_count) / 10000; //Convert boost duty (Which is a % multipled by 100) to a pwm count
              ENABLE_BOOST_TIMER(); //Turn on the compare unit (ie turn on the interrupt) if boost duty >0
            }
          }

        }
        else
        {
          //If boost target is 0, turn everything off
          boostDisable();
        }
      }
      else
      {
        //Boost control does nothing if kPa below the hyster point
        boostDisable();
      } //MAP above boost + hyster
    } //Open / Cloosed loop
  }
  else { // Disable timer channel and zero the flex boost correction status
    DISABLE_BOOST_TIMER();
    currentStatus.flexBoostCorrection = 0;
  }

  boostCounter++;
}

void vvtControl()
{
  if( (configPage6.vvtEnabled == 1) && (currentStatus.RPM > 0) )
  {
    //currentStatus.vvt1Duty = 0;
    //Calculate the current cam angle
    if( configPage4.TrigPattern == 9 ) { currentStatus.vvt1Angle = getCamAngle_Miata9905(); }

    if( (configPage6.vvtMode == VVT_MODE_OPEN_LOOP) || (configPage6.vvtMode == VVT_MODE_ONOFF) )
    {
      //Lookup VVT duty based on either MAP or TPS
      if(configPage6.vvtLoadSource == VVT_LOAD_TPS) { currentStatus.vvt1Duty = get3DTableValue(&vvtTable, currentStatus.TPS, currentStatus.RPM); }
      else { currentStatus.vvt1Duty = get3DTableValue(&vvtTable, currentStatus.MAP, currentStatus.RPM); }

      //VVT table can be used for controlling on/off switching. If this is turned on, then disregard any interpolation or non-binary values
      if( (configPage6.VVTasOnOff == true) && (currentStatus.vvt1Duty < 100) ) { currentStatus.vvt1Duty = 0; }

      vvt1_pwm_value = percentage(currentStatus.vvt1Duty, vvt_pwm_max_count);
      if(currentStatus.vvt1Duty > 0) { ENABLE_VVT_TIMER(); }

    } //Open loop
    else if( (configPage6.vvtMode == VVT_MODE_CLOSED_LOOP) )
    {
      //Lookup VVT duty based on either MAP or TPS
      if(configPage6.vvtLoadSource == VVT_LOAD_TPS) { currentStatus.vvt1TargetAngle = get3DTableValue(&vvtTable, currentStatus.TPS, currentStatus.RPM); }
      else { currentStatus.vvt1TargetAngle = get3DTableValue(&vvtTable, currentStatus.MAP, currentStatus.RPM); }

      if( (vvtCounter & 31) == 1) { vvtPID.SetTunings(configPage10.vvtCLKP, configPage10.vvtCLKI, configPage10.vvtCLKD); } //This only needs to be run very infrequently, once every 32 calls to vvtControl(). This is approx. once per second

      //Check that we're not already at the angle we want to be
      if((configPage6.vvtCLUseHold > 0) && (currentStatus.vvt1TargetAngle == currentStatus.vvt1Angle) )
      {
        currentStatus.vvt1Duty = configPage10.vvtCLholdDuty;
        vvt1_pwm_value = percentage(currentStatus.vvt1Duty, vvt_pwm_max_count);
        vvtPID.Initialize();
      }
      else
      {
        //This is dumb, but need to convert the current angle into a long pointer
        vvt_pid_target_angle = currentStatus.vvt1TargetAngle;

        //If not already at target angle, calculate new value from PID
        bool PID_compute = vvtPID.Compute(false);
        //vvtPID.Compute2(currentStatus.vvt1TargetAngle, currentStatus.vvt1Angle, false);
        //vvt_pwm_target_value = percentage(40, vvt_pwm_max_count);
        //if (currentStatus.vvt1Angle > currentStatus.vvt1TargetAngle) { vvt_pwm_target_value = 0; }
        if(PID_compute == true) { currentStatus.vvt1Duty = (vvt1_pwm_value * 100) / vvt_pwm_max_count; }
      }
      
      if( (currentStatus.vvt1Duty > 0) || (currentStatus.vvt2Duty > 0) ) { ENABLE_VVT_TIMER(); }
      
      //currentStatus.vvt1Duty = 0;
      vvtCounter++;
    }

    //SET VVT2 to be the same as VVT1 - THIS WILL NEED TO BE REMOVED IN THE FUTURE WHEN VVT2 IS SUPPORTED!!!
    currentStatus.vvt2Duty = currentStatus.vvt1Duty;
    vvt2_pwm_value = vvt1_pwm_value ;

    //Set the PWM state based on the above lookups
    if( (currentStatus.vvt1Duty == 0) && (currentStatus.vvt2Duty == 0) )
    {
      //Make sure solenoid is off (0% duty)
      VVT1_PIN_OFF();
      VVT2_PIN_OFF();
      vvt1_pwm_state = false;
      vvt1_max_pwm = false;
      vvt2_pwm_state = false;
      vvt2_max_pwm = false;
      DISABLE_VVT_TIMER();
    }
    else if( (currentStatus.vvt1Duty >= 100) && (currentStatus.vvt2Duty >= 100) )
    {
      //Make sure solenoid is on (100% duty)
      VVT1_PIN_ON();
      VVT2_PIN_ON();
      vvt1_pwm_state = true;
      vvt1_max_pwm = true;
      vvt2_pwm_state = true;
      vvt2_max_pwm = true;
      DISABLE_VVT_TIMER();
    }
    else
    {
      //Duty cycle is between 0 and 100. Make sure the timer is enabled
      ENABLE_VVT_TIMER();
      if(currentStatus.vvt1Duty < 100) { vvt1_max_pwm = false; }
      if(currentStatus.vvt2Duty < 100) { vvt2_max_pwm = false; }
    }
 
  }
  else 
  { 
    // Disable timer channel
    DISABLE_VVT_TIMER(); 
    currentStatus.vvt1Duty = 0;
    vvt1_pwm_value = 0;
    currentStatus.vvt2Duty = 0;
    vvt2_pwm_value = 0;
    vvt1_pwm_state = false;
    vvt1_max_pwm = false;
    vvt2_pwm_state = false;
    vvt2_max_pwm = false;
  } 
}

void nitrousControl()
{
  bool nitrousOn = false; //This tracks whether the control gets turned on at any point. 
  if(configPage10.n2o_enable > 0)
  {
    bool isArmed = READ_N2O_ARM_PIN();
    if (configPage10.n2o_pin_polarity == 1) { isArmed = !isArmed; } //If nitrous is active when pin is low, flip the reading (n2o_pin_polarity = 0 = active when High)

    //Perform the main checks to see if nitrous is ready
    if( (isArmed == true) && (currentStatus.coolant > (configPage10.n2o_minCLT - CALIBRATION_TEMPERATURE_OFFSET)) && (currentStatus.TPS > configPage10.n2o_minTPS) && (currentStatus.O2 < configPage10.n2o_maxAFR) && (currentStatus.MAP < (uint16_t)(configPage10.n2o_maxMAP * 2)) )
    {
      //Config page values are divided by 100 to fit within a byte. Multiply them back out to real values. 
      uint16_t realStage1MinRPM = (uint16_t)configPage10.n2o_stage1_minRPM * 100;
      uint16_t realStage1MaxRPM = (uint16_t)configPage10.n2o_stage1_maxRPM * 100;
      uint16_t realStage2MinRPM = (uint16_t)configPage10.n2o_stage2_minRPM * 100;
      uint16_t realStage2MaxRPM = (uint16_t)configPage10.n2o_stage2_maxRPM * 100;

      //The nitrous state is set to 0 and then the subsequent stages are added
      // OFF    = 0
      // STAGE1 = 1
      // STAGE2 = 2
      // BOTH   = 3 (ie STAGE1 + STAGE2 = BOTH)
      currentStatus.nitrous_status = NITROUS_OFF; //Reset the current state
      if( (currentStatus.RPM > realStage1MinRPM) && (currentStatus.RPM < realStage1MaxRPM) )
      {
        currentStatus.nitrous_status += NITROUS_STAGE1;
        BIT_SET(currentStatus.status3, BIT_STATUS3_NITROUS);
        N2O_STAGE1_PIN_HIGH();
        nitrousOn = true;
      }
      if(configPage10.n2o_enable == NITROUS_STAGE2) //This is really just a sanity check
      {
        if( (currentStatus.RPM > realStage2MinRPM) && (currentStatus.RPM < realStage2MaxRPM) )
        {
          currentStatus.nitrous_status += NITROUS_STAGE2;
          BIT_SET(currentStatus.status3, BIT_STATUS3_NITROUS);
          N2O_STAGE2_PIN_HIGH();
          nitrousOn = true;
        }
      }
    }
  }

  if (nitrousOn == false)
  {
    currentStatus.nitrous_status = NITROUS_OFF;
    BIT_CLEAR(currentStatus.status3, BIT_STATUS3_NITROUS);

    if(configPage10.n2o_enable > 0)
    {
      N2O_STAGE1_PIN_LOW();
      N2O_STAGE2_PIN_LOW();
    }
  }
}

// Water methanol injection control
void wmiControl()
{
  int wmiPW = 0;
  
  // wmi can only work when vvt is disabled 
  if( (configPage6.vvtEnabled == 0) && (configPage10.wmiEnabled >= 1) )
  {
    currentStatus.wmiEmpty = WMI_TANK_IS_EMPTY();
    if(currentStatus.wmiEmpty == 0)
    {
      if( (currentStatus.TPS >= configPage10.wmiTPS) && (currentStatus.RPMdiv100 >= configPage10.wmiRPM) && ( (currentStatus.MAP / 2) >= configPage10.wmiMAP) && ( (currentStatus.IAT + CALIBRATION_TEMPERATURE_OFFSET) >= configPage10.wmiIAT) )
      {
        switch(configPage10.wmiMode)
        {
        case WMI_MODE_SIMPLE:
          // Simple mode - Output is turned on when preset boost level is reached
          wmiPW = 100;
          break;
        case WMI_MODE_PROPORTIONAL:
          // Proportional Mode - Output PWM is proportionally controlled between two MAP values - MAP Value 1 = PWM:0% / MAP Value 2 = PWM:100%
          wmiPW = map(currentStatus.MAP/2, configPage10.wmiMAP, configPage10.wmiMAP2, 0, 100);
          break;
        case WMI_MODE_OPENLOOP:
          //  Mapped open loop - Output PWM follows 2D map value (RPM vs MAP) Cell value contains desired PWM% [range 0-100%]
          wmiPW = get3DTableValue(&wmiTable, currentStatus.MAP, currentStatus.RPM);
          break;
        case WMI_MODE_CLOSEDLOOP:
          // Mapped closed loop - Output PWM follows injector duty cycle with 2D correction map applied (RPM vs MAP). Cell value contains correction value% [nom 100%] 
          wmiPW = max(0, ((int)currentStatus.PW1 + configPage10.wmiOffset)) * get3DTableValue(&wmiTable, currentStatus.MAP, currentStatus.RPM) / 100;
          break;
        default:
          // Wrong mode
          wmiPW = 0;
          break;
        }
      }
    }

    currentStatus.wmiPW = wmiPW;
    vvt1_pwm_value = wmiPW;

    if(wmiPW == 0)
    {
      // Make sure water pump is off
      VVT1_PIN_LOW();
      DISABLE_VVT_TIMER();
      digitalWrite(pinWMIEnabled, LOW);
    }
    else
    {
      digitalWrite(pinWMIEnabled, HIGH);
      if (wmiPW >= 100)
      {
        // Make sure water pump is on (100% duty)
        VVT1_PIN_HIGH();
        DISABLE_VVT_TIMER();
      }
      else
      {
        ENABLE_VVT_TIMER();
      }
    }
  }
}

void boostDisable()
{
  boostPID.Initialize(); //This resets the ITerm value to prevent rubber banding
  currentStatus.boostDuty = 0;
  DISABLE_BOOST_TIMER(); //Turn off timer
  BOOST_PIN_LOW(); //Make sure solenoid is off (0% duty)
}

//The interrupt to control the Boost PWM
#if defined(CORE_AVR)
  ISR(TIMER1_COMPA_vect)
#else
  static inline void boostInterrupt() //Most ARM chips can simply call a function
#endif
{
  if (boost_pwm_state == true)
  {
    BOOST_PIN_LOW();  // Switch pin to low
    BOOST_TIMER_COMPARE = BOOST_TIMER_COUNTER + (boost_pwm_max_count - boost_pwm_cur_value);
    boost_pwm_state = false;
  }
  else
  {
    BOOST_PIN_HIGH();  // Switch pin high
    BOOST_TIMER_COMPARE = BOOST_TIMER_COUNTER + boost_pwm_target_value;
    boost_pwm_cur_value = boost_pwm_target_value;
    boost_pwm_state = true;
  }
}

//The interrupt to control the VVT PWM
#if defined(CORE_AVR)
  ISR(TIMER1_COMPB_vect)
#else
  static inline void vvtInterrupt() //Most ARM chips can simply call a function
#endif
{
  if ( ((vvt1_pwm_state == false) || (vvt1_max_pwm == true)) && ((vvt2_pwm_state == false) || (vvt2_max_pwm == true)) )
  {
    if( (vvt1_pwm_value > 0) && (vvt1_max_pwm == false) ) //Don't toggle if at 0%
    {
      VVT1_PIN_ON();
      vvt1_pwm_state = true;
    }
    if( (vvt2_pwm_value > 0) && (vvt2_max_pwm == false) ) //Don't toggle if at 0%
    {
      VVT2_PIN_ON();
      vvt2_pwm_state = true;
    }

    if( (vvt1_pwm_state == true) && ((vvt1_pwm_value <= vvt2_pwm_value) || (vvt2_pwm_state == false)) )
    {
      VVT_TIMER_COMPARE = VVT_TIMER_COUNTER + vvt1_pwm_value;
      vvt1_pwm_cur_value = vvt1_pwm_value;
      vvt2_pwm_cur_value = vvt2_pwm_value;
      if (vvt1_pwm_value == vvt2_pwm_value) { nextVVT = 2; } //Next event is for both PWM
      else { nextVVT = 0; } //Next event is for PWM0
    }
    else if( vvt2_pwm_state == true )
    {
      VVT_TIMER_COMPARE = VVT_TIMER_COUNTER + vvt2_pwm_value;
      vvt1_pwm_cur_value = vvt1_pwm_value;
      vvt2_pwm_cur_value = vvt2_pwm_value;
      nextVVT = 1; //Next event is for PWM1
    }
    else { VVT_TIMER_COMPARE = VVT_TIMER_COUNTER + vvt_pwm_max_count; } //Shouldn't ever get here
  }
  else
  {
    if(nextVVT == 0)
    {
      if(vvt1_pwm_value < (long)vvt_pwm_max_count) //Don't toggle if at 100%
      {
        VVT1_PIN_OFF();
        vvt1_pwm_state = false;
        vvt1_max_pwm = false;
      }
      else { vvt1_max_pwm = true; }
      nextVVT = 1; //Next event is for PWM1
      if(vvt2_pwm_state == true){ VVT_TIMER_COMPARE = VVT_TIMER_COUNTER + (vvt2_pwm_cur_value - vvt1_pwm_cur_value); }
      else
      { 
        VVT_TIMER_COMPARE = VVT_TIMER_COUNTER + (vvt_pwm_max_count - vvt1_pwm_cur_value);
        nextVVT = 2; //Next event is for both PWM
      }
    }
    else if (nextVVT == 1)
    {
      if(vvt2_pwm_value < (long)vvt_pwm_max_count) //Don't toggle if at 100%
      {
        VVT2_PIN_OFF();
        vvt2_pwm_state = false;
        vvt2_max_pwm = false;
      }
      else { vvt2_max_pwm = true; }
      nextVVT = 0; //Next event is for PWM0
      if(vvt1_pwm_state == true) { VVT_TIMER_COMPARE = VVT_TIMER_COUNTER + (vvt1_pwm_cur_value - vvt2_pwm_cur_value); }
      else
      { 
        VVT_TIMER_COMPARE = VVT_TIMER_COUNTER + (vvt_pwm_max_count - vvt2_pwm_cur_value);
        nextVVT = 2; //Next event is for both PWM
      }
    }
    else
    {
      if(vvt1_pwm_value < (long)vvt_pwm_max_count) //Don't toggle if at 100%
      {
        VVT1_PIN_OFF();
        vvt1_pwm_state = false;
        vvt1_max_pwm = false;
        VVT_TIMER_COMPARE = VVT_TIMER_COUNTER + (vvt_pwm_max_count - vvt1_pwm_cur_value);
      }
      else { vvt1_max_pwm = true; }
      if(vvt2_pwm_value < (long)vvt_pwm_max_count) //Don't toggle if at 100%
      {
        VVT1_PIN_OFF();
        vvt2_pwm_state = false;
        vvt2_max_pwm = false;
        VVT_TIMER_COMPARE = VVT_TIMER_COUNTER + (vvt_pwm_max_count - vvt2_pwm_cur_value);
      }
      else { vvt2_max_pwm = true; }
    }
  }
}
