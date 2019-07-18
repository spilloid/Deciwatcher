import React from 'react';
import './assets/css/main.css';
import {BarChart} from 'react-easy-chart';
class App extends React.Component{

	constructor(props){
		super(props);
		this.state ={
			sensors : [],
			readings : []
		};
	}

	componentDidMount(){
		fetch('/client/data', {
			method: "GET",
			headers: {
				'Content-type': 'application/json',
			}
		})
			.then(response => response.json())
			.then(data => {
				console.log(data);
				this.setState({
					sensors :data.sensors,
					readings : data.readings
				});
			});
	}

	render(){
		if(this.state.sensors.length >0)
			return(
				<div>
					<header id="header">
						<h1>DeciWatcher</h1>
					</header>
				<div id="wrapper" className="fade-in">
					<div id="main">
							{this.state.sensors.map((sensor)=>{
								return(<section className="post">
										<h2>{sensor.SensorName}</h2>
										<p>{sensor.Location}</p>
										<img style={{width: 200, height: 200}} src={`data:image/jpeg;base64,${ new Buffer(sensor.Picture).toString('base64')}`} />
										<BarChart
											xTickNumber={5}
											yTickNumber={5}
											axisLabels={{ x: 'Time', y: 'Decibels' }}
											grid
											colorBars
											data={
												this.state.readings.filter(reading=>reading.MAC===sensor.MAC).map((reading)=> {
													let time = new Date(reading.Time);
														return ({
															x: time.getHours() + ":" + time.getMinutes().toString().padStart(2,'0') +" "+ time.toDateString(),
															y: reading.Decibels
														});
													})
										}
										          axes
										/>
										<p>Dangerous sound @ 120+ dB</p>
									</section>
								);
							})
							}
				</div>
				</div>
				</div>
					);
					else
					return(<p>Loading...</p>);
					}
					}

					export default App;
