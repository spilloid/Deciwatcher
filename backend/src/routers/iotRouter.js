let express = require('express');
let router = express.Router();
let connection = require('../tools/connection').getWrap();

/**
 * Recieve packet from IoT
 */
router.post('/receive', (req,res)=>{
	connection.select('IoTSensors',{MAC : req.body.mac}).then((formPak)=>{
		connection.insert(
			'DBReadings',
			{
				IoTSensor : formPak[0].PrimaryID,
				Decibels : req.body.data
			}
		)
	});
	res.send("Packet Inserted into DB");
});


module.exports = router;