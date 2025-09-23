import { useState } from "react";

export default function App() {
	const [messages, setMessages] = useState(["ab", "bc", "cd", "ef"]);

	function checkMessages() {
		if (messages.length > 1) {
			return "You have " + messages.length + " unread messages.";
		} else if (messages.length === 1) {
			return "You have " + messages.length + " unread message.";
		} else {
			return "You're All Caught Up.";
		}
	}

	return (
		<div>
			<h1>{checkMessages()}</h1>
		</div>
	);
}
