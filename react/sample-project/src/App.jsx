import { useState } from "react";
import Header from "./Components/Header/header";
import Body from "./Components/Body/Body";
import "./App.css";

export default function App() {
	const [userName, setUserName] = useState("Joe");
	return (
		<main>
			<Header userName={userName} />
			<Body userName={userName} />
		</main>
	)
}
