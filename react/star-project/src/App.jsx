import { useState } from "react";
import avatar from "./images/user.png";
import "./App.css";
import Star from "./Components/Star/star";

export default function App() {
	const [contact, setContact] = useState({
		firstName: "John",
		lastName: "Doe",
		phone: "+1 (212) 555-1212",
		email: "itsmyrealname@example.com",
		isFavorite: false
	})
	// How do i flip the state of this star?? and pass it .....
	const [showStar, setShowStar] = useState(false);

	function toggleFav() {
		setShowStar(prev => (!prev));
	}

	return (
		<main>
			<article className="card">
				<img
					src={avatar}
					className="avatar"
					alt="User profile picture of John Doe"
				/>
				<div className="info">

					<Star isFilled={showStar} handleClick={toggleFav} />

					<h2 className="name">
						{contact.firstName} {contact.lastName}
					</h2>
					<p className="contact">{contact.phone}</p>
					<p className="contact">{contact.email}</p>
				</div>

			</article>
		</main>
	)
}

