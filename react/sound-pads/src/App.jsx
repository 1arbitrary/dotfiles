import padsData from "./pads";
import "./App.css";
import Pad from "./Components/Pads/pads";
import { useState } from "react";

export default function App() {
	const [pads, setPad] = useState(padsData);
	const soundPads = pads.map(pad => <Pad key={pad.id} id={pad.id} color={pad.color} isOn={pad.on} handleClick={togglePad} />);

	function togglePad(id) {
		setPad(prev => prev.map(prevObj => (prevObj.id === id) ? { ...prevObj, on: !(prevObj.on) } : prevObj));
	}

	function allOff() {
		setPad(prev => prev.map(prevObj => { return { ...prevObj, on: false } }));
	}
	return (
		<main>
			<div className="inner-div">
				<div className="pads-container">
					{soundPads}
				</div>
				<button className="all-off" onClick={allOff}>Turn All Off</button>
			</div>
		</main>
	);
}
