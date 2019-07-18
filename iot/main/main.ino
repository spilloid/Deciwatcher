#include <ESP8266HTTPClient.h>
#include <ESP8266WiFi.h>
#define INTERVAL 1000 
#define PACKETSIZE 60
#define SSID "PrettyFlyForAWifi"
#define WIFIPWD "idontknow"
void setup() {

  Serial.begin(115200);                                  //Serial connection
  WiFi.begin(SSID, WIFIPWD);   //WiFi connection

  while (WiFi.status() != WL_CONNECTED) {  //Wait for the WiFI connection completion

    delay(500);
    Serial.println("Waiting for connection");

  }

}

/**
   @param interval : time to wait between recordings
   @param packetSize number of recordings to average
 **/
int listen(int interval, int packetSize) {
  Serial.println("Listening");
  int total = 0;
  for (int counter = 0; counter < packetSize; counter++) { //data needs logged
    total += (analogRead(A0)+83.2073)/11.003;
    delay(interval);
  }
  return total / packetSize; //get average rounded down
}

void send(String msg) {
  if (WiFi.status() == WL_CONNECTED) { //Check WiFi connection status

    HTTPClient http;    //Declare object of class HTTPClient

    http.begin("http://192.168.0.177:3001/iot/receive");      //Specify request destination
    http.addHeader("Content-Type", "application/json");  //Specify content-type header
    //send JSON style body to Express
    int httpCode = http.POST(
      String("{")
        + "\"data\" : \"" + msg + "\"," 
        + "\"mac\" : \"" + WiFi.macAddress() + "\"" 
      +"}"
      );  //Send the request
    String payload = http.getString();                  //Get the response payload

    Serial.println(httpCode);   //Print HTTP return code
    Serial.println(payload);    //Print request response payload

    http.end();  //Close connection

  } else {
    Serial.println("Error in WiFi connection");
  }
}
void loop() {
  String msg = String(listen(INTERVAL,PACKETSIZE));
  send(msg);
}
