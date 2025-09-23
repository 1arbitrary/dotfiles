import React, { useState } from "react";
import WindowTracker from "./components/window/windows"
import "./App.css";

export default function App() {
	const [showWindow, setShowWindow] = useState<boolean>(true);
	return (
		<main>
			<button onClick={(): void => setShowWindow(prev => (!prev))}>Toggle Window Tracker</button>
			{showWindow && <WindowTracker />}
		</main>
	);
}
