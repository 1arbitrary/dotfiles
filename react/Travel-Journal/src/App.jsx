import "./App.css"
import Header from "./components/Header/Header.jsx"
import Entry from "./components/Entry/Entry.jsx"
import destinationData from "./data.js"

export default function App() {
	const destinations = destinationData.map(destination => {
		return (
			<Entry
				key={destination.id}
				/* Basically copied the object here  */
				{...destination}
			/>
		);
	});
	return (
		<>
			<Header />
			<main className="container">
				{destinations}
			</main>
		</>
	);
}
