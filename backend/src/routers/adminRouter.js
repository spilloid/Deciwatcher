
let express = require('express');
let connection = require('../tools/connection').getWrap();
let router = express.Router();

/**
 * Edit sensor display name.
 * Body: { data: <new name>, sid: <sensor PrimaryID> }
 */
router.put('/title', (req, res) => {
    connection.update(
        'IoTSensors',
        { SensorName: req.body.data },
        { PrimaryID: req.body.sid }
    ).then(() => res.send("Title updated"))
     .catch((err) => {
        console.error("Admin /title error:", err);
        res.status(500).send("Server error");
     });
});

/**
 * Edit sensor location label.
 * Body: { data: <new location>, sid: <sensor PrimaryID> }
 */
router.put('/location', (req, res) => {
    connection.update(
        'IoTSensors',
        { Location: req.body.data },
        { PrimaryID: req.body.sid }
    ).then(() => res.send("Location updated"))
     .catch((err) => {
        console.error("Admin /location error:", err);
        res.status(500).send("Server error");
     });
});

/**
 * Edit sensor location photo.
 * Body: { data: <image blob>, sid: <sensor PrimaryID> }
 */
router.put('/picture', (req, res) => {
    connection.update(
        'IoTSensors',
        { Picture: req.body.data },
        { PrimaryID: req.body.sid }
    ).then(() => res.send("Picture updated"))
     .catch((err) => {
        console.error("Admin /picture error:", err);
        res.status(500).send("Server error");
     });
});

/**
 * Register a new IoT sensor.
 * Body: { name: <sensor name>, location: <location label>, picture: <image blob> }
 */
router.post('/iot', (req, res) => {
    connection.insert(
        'IoTSensors',
        {
            SensorName: req.body.name,
            Location: req.body.location,
            Picture: req.body.picture
        }
    ).then(() => res.send("Sensor registered"))
     .catch((err) => {
        console.error("Admin POST /iot error:", err);
        res.status(500).send("Server error");
     });
});

/**
 * Toggle a sensor's active status.
 * Body: { set: <1|0>, sid: <sensor PrimaryID> }
 */
router.put('/iot', (req, res) => {
    connection.update(
        'IoTSensors',
        { isActive: req.body.set },
        { PrimaryID: req.body.sid }
    ).then(() => res.send("Sensor status updated"))
     .catch((err) => {
        console.error("Admin PUT /iot error:", err);
        res.status(500).send("Server error");
     });
});

module.exports = router;
