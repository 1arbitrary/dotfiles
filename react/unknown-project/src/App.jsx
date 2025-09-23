import Jokes from "./Components/Jokes/Jokes"
import jokesData from "./Components/Jokes/jokesData.js"

export default function App() {
	const jokeElements = jokesData.map((joke) => {
		return (
			<Jokes
				setup={joke.setup}
				punchline={joke.punchline}
			/>
		);
	})
	return (
		<section>
			{jokeElements}
		</section>
	);
}
