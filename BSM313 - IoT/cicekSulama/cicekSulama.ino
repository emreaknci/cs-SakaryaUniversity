#include <ESP8266HTTPClient.h>

#include <ArduinoJson.h> //thingspeakten gelen verileri blynke vermek icin kullanildi
#include <dummy.h>
#define BLYNK_PRINT Serial
#include <ESP8266WiFi.h>  //Gerekli kütüphanelerimizi ekliyoruz.
#include <BlynkSimpleEsp8266.h>
#include "ThingSpeak.h"



#define writeAPIKey "KG6Q7433TYUAYW21"  // Thingspeak write API Key 
#define readAPIKey  "YSX3Y6Q6IORP5QR9"   // Thingspeak read API Key 
char token[] = "RKpNiNfxhRBQr40gJ1Sdj0_5Ixn0cGVF";
char agAdi[] = "PocoEmre"; //Blynk uygulamasının bize vermiş olduğu token ve bağlanmak istediğimiz wifi ve şifresini char komutu ile belirliyoruz.
char agSifre[] = "emre2587";


const char* thingSpeakHost = "api.thingspeak.com";
unsigned long channelID = 1996113; // Thingspeak channel ID
unsigned int field_no = 1;


#define sensor A0
#define buton 5
int deger;
int donusturulmusDeger;

WiFiClient client;
/* ESP8266 WiFi Kurulum Fonksiyonu */
void wifiSetup () {
  delay (10);
  Serial.println();
  Serial.println(agAdi);
  Serial.println(F("Kablosuz Agina Baglaniyor"));
  WiFi.begin(agAdi, agSifre);
  // WiFi durum kontrolÃ¼
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println();
  Serial.print(agAdi);
  Serial.println("Kablosuz Aga Baglandi");
  Serial.println("IP adresi: ");
  Serial.println(WiFi.localIP());
}
void setup() {
  Serial.begin(115200);
  wifiSetup();
  digitalWrite(buton, HIGH); //baslangicta su pompasi calismiyor
  ThingSpeak.begin(client);
  Blynk.begin(token, agAdi, agSifre);
  Blynk.notify("Cihaz çalışıyor!");
}
void sendToThingSpeak(){
   if (client.connect (thingSpeakHost, 80)) {
    ThingSpeak.writeField(channelID, 1, donusturulmusDeger, writeAPIKey); // donusuturulmus degeri thingspeake de gonderdim
  }
  client.stop(); 
}

void loop() {
  deger = analogRead(sensor);
  donusturulmusDeger = map(deger , 0, 1023, 0, 100); //sensorden gelen 0-1023 arasindaki degeri 0-100 arasina ceviriyoruz
  Blynk.virtualWrite (V1, donusturulmusDeger);
  Blynk.run();
  sendToThingSpeak();
}
