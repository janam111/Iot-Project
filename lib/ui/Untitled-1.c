// Program for Minor Project 6th sem (18bec026,18bec045,18bec062)
// Esp 8266 - Firebase Real Time DataBase - Flutter Application
#include <OneWire.h>
#include <DallasTemperature.h>
#include <FirebaseESP8266.h>
#include  <ESP8266WiFi.h>
#define ONE_WIRE_BUS 4  // DS18B20 to be integrated to GPIO PIN 4(D2) Pin of ESP 8266
#define PIN A0          // ADC 712 to be integrated to analog pin

float resolution  = 3.3 / 1024; 
uint32_t period = 1000000 / 60;    // periodic wave 1 period
uint32_t t_start = 0;
float zero_ADC_Value = 0, zero_voltageValue = 0;
float ADC = 0, Vrms = 0, Current = 0, Q = 0.0147;
float sensitivity = 0.185; 

#define ssid "Sound Of Silence"                                          //WiFi SSID
#define password "wD_$ElvBGAOdF;}~{AHm"                                 //WiFi Password
#define FIREBASE_HOST "flutterauth7-default-rtdb.firebaseio.com"       //Firebase Project URL 
#define FIREBASE_AUTH "2ZLPoQ00biHwe8PoCcHhT8R0AYkNgzqBkW7T5mk3" //Firebase Auth Token

OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensor(&oneWire);  


FirebaseData firebaseData;

int Device_1 = D0;                           //initialize D0 Pin
int Device_2 = D1;                          //initialize D1 Pin


void setup() {
  
  Serial.begin(9600);

    pinMode(PIN, INPUT);                            //  pin A0 as read.  
    t_start = micros();                             
    uint32_t ADC_SUM = 0, n = 0;
    while(micros() - t_start < period) {            
    ADC_SUM += analogRead(PIN);                   // reading the analog value.
    n++;                                          //  for avg. 
  }
  zero_ADC_Value = (ADC_SUM / n);               
  zero_voltageValue = zero_ADC_Value * resolution;
  
   WiFi.begin (ssid, password);
   while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println ("");
  Serial.println ("WiFi Connected!");
  Firebase.begin(FIREBASE_HOST,FIREBASE_AUTH);
    pinMode(Device_1,OUTPUT);                               //initialize the Device OUTPUT  
    pinMode(Device_2,OUTPUT);                                //initialize the Device OUTPUT  
    sensor.begin();
   

}

void loop() {

   t_start = micros();                             
  uint32_t ADC_Dif = 0, ADC_SUM = 0, m = 0;        
  while(micros() - t_start < period) {            
    ADC_SUM += ADC_Dif * ADC_Dif;               
    m++;                                          
  
  ADC = sqrt(ADC_SUM / m);                  
  Vrms = ADC * resolution ;                         
  Current = (Vrms  / sensitivity) - Q; 
  Serial.print("Irms = ");                     // printing irms
  Serial.print(Current, 6);
  Serial.println(" A");
  Serial.print("\n");

  String fireCurrent = float(Current) + String("A");
  
  
  sensor.requestTemperatures();
  float c = sensor.getTempCByIndex(0);
   if (isnan(c)) {                                                // Read Fail Check.
    Serial.println(F("Failed to read temperature!"));
    return;
  }
   Serial.print("Celsius: "); 
   Serial.print(c);
   Serial.println("°C");
   String fireCelsius = String(c) + String("°C");       // converting integer value to string
    delay(4000);
   Firebase.setString("/DS18B20/Celsius",fireCelsius);      // sends temperature readings to Firebase
   Firebase.setString("/ADC712/Amperes", fireCurrent);      // sneds current to firebase

  if (Firebase.get(firebaseData,"/D1")) {
    if (firebaseData.dataType() == "string") {
      String De1 = firebaseData.stringData();
          if (De1=="1"){
              digitalWrite(Device_1,HIGH);                 //Device1(Heater) is ON
          }
          else if (De1=="0"){
              digitalWrite(Device_1,LOW);                 //Device19(Heater) if OFF
            }}}

    if (Firebase.get(firebaseData,"/D2")) {
    if (firebaseData.dataType() == "string") {
      String De2 = firebaseData.stringData();
          if (De2=="1"){
              digitalWrite(Device_2,HIGH);               //Device2 is ON
          }
              else if (De2=="0"){
              digitalWrite(Device_2,LOW);               // Device2 os OFF
            }}}
            
            
 
}