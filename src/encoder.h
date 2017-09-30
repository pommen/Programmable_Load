//encoder stuff:
#define MAXENCODERS 2
volatile int encstate[MAXENCODERS];
volatile int encflag[MAXENCODERS];
boolean A_set[MAXENCODERS];
boolean B_set[MAXENCODERS];
volatile int16_t encoderpos[MAXENCODERS];
volatile int encodertimer = millis();  // acceleration measurement
int encoderpinA[MAXENCODERS] = {PA4, PA6}; // pin array of all encoder A inputs
int encoderpinB[MAXENCODERS] = {PA5, PA7}; // pin array of all encoder B inputs
unsigned int lastEncoderPos[MAXENCODERS];
#define ENCODER_RATE 1000    // in microseconds;
HardwareTimer timer(1);
// ********encoder function
void readEncoders() {
								for (byte counter = 0; counter < MAXENCODERS; counter++)
								{
																if ( (gpio_read_bit(PIN_MAP[encoderpinA[counter]].gpio_device, PIN_MAP[encoderpinA[counter]].gpio_bit) ? HIGH : LOW) != A_set[counter] )
																{
																								A_set[counter] = !A_set[counter];
																								if ( A_set[counter] && !B_set[counter] )
																								{
																																if (millis() - encodertimer > 5)
																																								encoderpos[counter] += 1;
																																else
																																if (millis() - encodertimer > 3)
																																								encoderpos[counter] += 5;

																																else
																																								encoderpos[counter] += 50;
																								}
																								if (encoderpos[counter] > 4095 ) encoderpos[counter] = 4095;        //make sure encoderpos dosent count negative or higher than 12 bit.


																								encodertimer = millis();
																}
																if ( (gpio_read_bit(PIN_MAP[encoderpinB[counter]].gpio_device, PIN_MAP[encoderpinB[counter]].gpio_bit) ? HIGH : LOW) != B_set[counter] )
																{
																								B_set[counter] = !B_set[counter];
																								if ( B_set[counter] && !A_set[counter] )
																																if (millis() - encodertimer > 5)
																																								encoderpos[counter] -= 1;
																																else
																																if (millis() - encodertimer > 3)
																																								encoderpos[counter] -= 5;

																																else
																																								encoderpos[counter] -= 50;
																								if (encoderpos[counter] < 0 ) encoderpos[counter] =0;                        //make sure encoderpos dosent count negative or higher than 12 bit.


																								encodertimer = millis();
																}
								}
}

void initEncoders(){
								encodertimer = millis(); // acceleration measurement
								for (byte counter = 0; counter < MAXENCODERS; counter++)
								{
																encstate[counter] = HIGH;
																encflag[counter] = HIGH;
																A_set[counter] = false;
																B_set[counter] = false;
																encoderpos[counter] = 0;
																pinMode(encoderpinA[counter], INPUT);
																pinMode(encoderpinB[counter], INPUT);
																lastEncoderPos[counter] = 1;
								}
								// timer setup for encoder
								timer.pause();
								timer.setPeriod(ENCODER_RATE); // in microseconds
								timer.setChannel1Mode(TIMER_OUTPUT_COMPARE);
								timer.setCompare(TIMER_CH1, 1); // Interrupt 1 count after each update
								timer.attachCompare1Interrupt(readEncoders);
								timer.refresh();
								timer.resume();
}
