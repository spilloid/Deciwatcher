const express = require('express');
const app = express();
const port = 3001;

let bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

 let iotRouter = require('./routers/iotRouter');
 let frontRouter = require('./routers/frontRouter');
 let adminRouter = require('./routers/adminRouter');

app.use('/iot',iotRouter);
app.use('/client',frontRouter);
app.use('/admin',adminRouter);

app.get('/', (req, res) => res.send('<p>Splash Page!</p>'));

app.listen(port, () => console.log(`Listening on port ${port}!`));