#include "I2Cdev.h"
#include "MPU6050.h"
#include <SPI.h>
#include <SD.h>
#include "Wire.h"

File myFile;
MPU6050 accelgyro;

int16_t ax, ay, az;
//int16_t gx, gy, gz;

#define OUTPUT_READABLE_ACCELGYRO

#define LED_PIN 13
bool blinkState = false;

String dataName = "Test.csv";

void setup() {

  //#if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
  //  Wire.begin();
  //#elif I2CDEV_IMPLEMENTATION == I2CDEV_BUILTIN_FASTWIRE
  //  Fastwire::setup(400, true);
  //#endif

  Wire.begin();
  Serial.begin(9600);

  while (!Serial) {
    ;
  }

  Serial.print("Initializing SD card...");

  if (!SD.begin(4)) {
    Serial.println("initialization failed!");
    return;
  }

  Serial.println("initialization done.");
  myFile = SD.open(dataName, FILE_WRITE);

  if (myFile) {
    Serial.print("Writing...");
  //myFile.println("aX, aY, aZ");
    myFile.println("0 , 0 , 0");
    myFile.println("0 , 0 , 0");
    myFile.println("0 , 0 , 0");
    Serial.println("done.");
    myFile.close();

    accelgyro.initialize();
    delay(500);
  } else {
    Serial.println("error opening test.txt");
  }
}

void loop() {
  myFile = SD.open(dataName, FILE_WRITE);
  //accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);
  accelgyro.getAcceleration(&ax,&ay,&az);

  if (myFile) {
    myFile.print(ax); myFile.print(",");
    myFile.print(ay); myFile.print(",");
    myFile.println(az);
    myFile.close();
  }

//#ifdef OUTPUT_READABLE_ACCELGYRO
//  Serial.print(ax); Serial.print("\t");
//  Serial.print(ay); Serial.print("\t");
//  Serial.println(az);
//#endif

  delay(15);
  blinkState = !blinkState;
  digitalWrite(LED_PIN, blinkState);
}
