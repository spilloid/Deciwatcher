#include <ESP8266HTTPClient.h>
#include <ESP8266WiFi.h>

// Sample interval in milliseconds between individual microphone reads
#define INTERVAL   1000

// Number of samples to average into one reported decibel value (1 packet = ~1 minute of data)
#define PACKETSIZE 60

// ----- WiFi credentials -----
// Flash these with Arduino IDE before deploying.
// Future: replace with SoftAP provisioning from a companion mobile app.
#define SSID   "YourNetworkSSID"
#define WIFIPWD "YourNetworkPassword"

// ----- Backend target -----
// Set this to the IP/hostname of the machine running the Express backend.
#define BACKEND_URL "http://192.168.0.1:3001/iot/receive"

void setup() {
  Serial.begin(115200);
  WiFi.begin(SSID, WIFIPWD);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("Waiting for WiFi...");
  }
  Serial.println("WiFi connected");
}

/**
 * Reads PACKETSIZE analog samples from the sound sensor on A0, applies a
 * linear calibration to convert raw ADC counts to decibels, and returns the
 * average.
 *
 * Calibration formula:  dB = (analogRead(A0) + 83.2073) / 11.003
 *
 * The constants were derived via linear regression comparing the cheap
 * KY-038 condenser microphone output against a reference sound level meter
 * across a range of known dB values. See: Raj, A. (2018). "Measure
 * Sound/Noise Level in dB with Microphone and Arduino." Circuit Digest.
 *
 * @param interval    Milliseconds to wait between each sample
 * @param packetSize  Number of samples to collect before averaging
 * @return            Averaged decibel reading (integer)
 */
int listen(int interval, int packetSize) {
  Serial.println("Listening...");
  int total = 0;
  for (int counter = 0; counter < packetSize; counter++) {
    // Apply calibration: shift raw ADC value then scale to dB range
    total += (analogRead(A0) + 83.2073) / 11.003;
    delay(interval);
  }
  return total / packetSize; // integer average (rounds down)
}

/**
 * Sends a decibel reading to the Express backend as a JSON POST.
 * The device's MAC address is included so the backend can identify
 * which registered sensor this packet belongs to.
 *
 * @param msg  String representation of the averaged dB value
 */
void send(String msg) {
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("WiFi disconnected — skipping send");
    return;
  }

  HTTPClient http;
  http.begin(BACKEND_URL);
  http.addHeader("Content-Type", "application/json");

  String body = String("{")
    + "\"data\" : \"" + msg + "\","
    + "\"mac\" : \"" + WiFi.macAddress() + "\""
    + "}";

  int httpCode = http.POST(body);
  Serial.print("HTTP response: ");
  Serial.println(httpCode);
  Serial.println(http.getString());

  http.end();
}

void loop() {
  String reading = String(listen(INTERVAL, PACKETSIZE));
  send(reading);
}
