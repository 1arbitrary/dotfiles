import React, { useEffect, useState } from 'react';
import './App.css';

export default function App() {
	const [count, setCount] = useState<number>(1);
	const [starWarsData, setStarWarsData] = useState<object>({});

	useEffect((): void => {
		console.log("rendering");
		fetch(`https://swapi.dev/api/people/${count}`)
			.then(res => res.json())
			.then(data => setStarWarsData(data))
	    .catch(err=> console.log(err))
	}, [count]);

	return (
		<div>
			<button onClick={() => setCount(prev => prev + 1)}>Get Next Character</button>
			<h2>Count is {count}</h2>
			<pre>{JSON.stringify(starWarsData)}</pre>
		</div>
	);
}
