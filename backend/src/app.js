require('dotenv').config();
const express = require('express');
const app = express();
const port = process.env.PORT || 3001;

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

 let iotRouter = require('./routers/iotRouter');
 let frontRouter = require('./routers/frontRouter');
 let adminRouter = require('./routers/adminRouter');

app.use('/iot',iotRouter);
app.use('/client',frontRouter);
app.use('/admin',adminRouter);

app.get('/', (req, res) => res.send('<p>Splash Page!</p>'));

app.listen(port, () => console.log(`Listening on port ${port}!`));