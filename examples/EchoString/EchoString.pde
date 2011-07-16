/* This sketch accepts strings and raw sysex messages and echos them back.
 *
 * This example code is in the public domain.
 */
#include <FirmataLite.h>

void stringCallback(char *myString)
{
    FirmataLite.sendString(myString);
}


void sysexCallback(byte command, byte argc, byte*argv)
{
    Serial.print(START_SYSEX, BYTE);
    Serial.print(command, BYTE);
    for(byte i=0; i<argc; i++) {
        Serial.print(argv[i], BYTE);
    }
    Serial.print(END_SYSEX, BYTE);
}

void setup()
{
    FirmataLite.attach(STRING_DATA, stringCallback);
    FirmataLite.attach(START_SYSEX, sysexCallback);
    FirmataLite.begin(57600);
}

void loop()
{
    while(FirmataLite.available()) {
        FirmataLite.processInput();
    }
}


