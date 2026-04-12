let express = require('express');
let router = express.Router();
let connection = require('../tools/connection').getWrap();

/**
 * Receive decibel packet from IoT device.
 * Body: { data: <decibels>, mac: <MAC address> }
 */
router.post('/receive', (req, res) => {
	const { mac, data } = req.body;

	if (!mac || data === undefined) {
		return res.status(400).send("Missing mac or data field");
	}

	connection.select('IoTSensors', { MAC: mac })
		.then((formPak) => {
			if (!formPak || formPak.length === 0) {
				return res.status(404).send("Sensor not registered");
			}
			return connection.insert('DBReadings', {
				IoTSensor: formPak[0].PrimaryID,
				Decibels: data
			}).then(() => res.send("Packet Inserted into DB"));
		})
		.catch((err) => {
			console.error("IoT receive error:", err);
			res.status(500).send("Server error");
		});
});


module.exports = router;