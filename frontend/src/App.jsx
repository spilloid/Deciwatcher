import React from 'react';
import './assets/css/main.css';
import NoiseChart from './NoiseChart';

// Build a browser-safe <img> src from whatever the API returns for Picture.
// The column is a MySQL blob, so JSON gives us either a base64 string, a
// data URL, or a { type: 'Buffer', data: [...] } shape. Node's Buffer is not
// available in the browser (webpack 5 no longer polyfills it), so decode by hand.
function pictureSrc(picture){
	if(!picture) return null;
	if(typeof picture === 'string'){
		return picture.startsWith('data:') ? picture : `data:image/jpeg;base64,${picture}`;
	}
	if(Array.isArray(picture.data)){
		let binary = '';
		const bytes = new Uint8Array(picture.data);
		for(let i = 0; i < bytes.length; i++) binary += String.fromCharCode(bytes[i]);
		return `data:image/jpeg;base64,${btoa(binary)}`;
	}
	return null;
}

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
								const imgSrc = pictureSrc(sensor.Picture);
								return(<section className="post" key={sensor.MAC}>
										<h2>{sensor.SensorName}</h2>
										<p>{sensor.Location}</p>
										{imgSrc &&
											<img style={{width: 200, height: 200}} src={imgSrc} alt={sensor.SensorName} />}
										<NoiseChart
											data={
												this.state.readings.filter(reading=>reading.MAC===sensor.MAC).map((reading)=> {
													let time = new Date(reading.Time);
														return ({
															x: time.getHours() + ":" + time.getMinutes().toString().padStart(2,'0'),
															y: reading.Decibels
														});
													})
											}
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
