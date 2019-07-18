
let express = require('express');
let connection = require('../tools/connection').getWrap();
let router = express.Router();

router.get('/data', async (req, res) => {
	console.log("Sending data...");
	res.send({
		sensors: await connection.query('select MAC,SensorName, Location, Picture from IoTSensors where isActive=1').catch(err=>console.log(err)),
		readings: await connection.query('select IoTSensors.MAC,Decibels,Time from DBReadings inner JOIN IoTSensors on IoTSensor=IoTSensors.PrimaryID').catch(err=>console.log(err))
	});
});

module.exports = router;