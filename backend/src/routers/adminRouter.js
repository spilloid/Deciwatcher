
let express = require('express');
let connection = require('../tools/connection').getWrap();
let router = express.Router();

/**
 * Edit Title
 */
router.put('/title', (req, res) => {
    connection.update(
        'IoTSensor',
        { SensorName: req.body.data },
        { PrimaryID: req.body.sid }
    )

});
/**
 * Edit Location
 */
router.put('/location', (req, res) => {
    connection.update(
        'IoTSensor',
        { Location: req.body.data },
        { PrimaryID: req.body.sid }
    )

});

/**
 * Edit Picture
 * Body : {
 *  data : picture in blob format
 *  sid : sensor id to update
 * }
 */
router.put('/picture', (req, res) => {
    connection.update(
        'IoTSensor',
        { Picture: req.body.data },
        { PrimaryID: req.body.sid }
    )
});

/**
 * Add IoT
 * Body: {
 *  name : sensor name
 *  location : sensor location
 *  picture : blob pic of sensor recording location
 * }
 */
router.post('/iot', (req, res) => {
    connection.insert(
        'IoTSensor',
        {
            SensorName : req.body.name,
            Location : req.body.location,
            Picture : req.body.picture
        }
    );
});

/**
 * Mark IoT (in)active
 * Body : 
 *  set : t/f , 
 *  sid : Sensor ID
 */
router.put('/iot', (req, res) => {
    connection.update(
        'IoTSensor',
        { isActive : req.body.set },
        { PrimaryID: req.body.sid }
    )

});

module.exports = router;