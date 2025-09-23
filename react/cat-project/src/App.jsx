import Contact from "./components/contact/Contact.jsx"
import MrWhiskerson from "./images/mr-whiskerson.png"
import Felix from "./images/felix.png"
import fluffykins from "./images/fluffykins.png"
import pumpkin from "./images/pumpkin.png"

export default function App() {
	return (
		<div className="contacts">
			<Contact
				img={MrWhiskerson}
				name="Mr Whiskerson"
				phone="(212) 555-1234"
				email="mr.whiskaz@catnap.meow"
			/>
			<Contact
				img={Felix}
				name="Felix"
				phone="(212) 555-1234"
				email="mr.whiskaz@catnap.meow"
			/>
			<Contact
				img={fluffykins}
				name="Fluffykins"
				phone="(212) 555-1234"
				email="mr.whiskaz@catnap.meow"
			/>
			<Contact
				img={pumpkin}
				name="Pumpkin"
				phone="(212) 555-1234"
				email="mr.whiskaz@catnap.meow"
			/>
		</div >
	)
}
