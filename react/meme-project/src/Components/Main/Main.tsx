import React, { ChangeEvent, useEffect, useState } from "react";

export default function Main() {
	type Text = {
		topText: string;
		bottomText: string;
		imageUrl: string;
	}

	const [meme, setMeme] = useState<Text>({
		topText: "One does not simply",
		bottomText: "Walk into Mordor",
		imageUrl: "http://i.imgflip.com/1bij.jpg"
	});

	const [allMemes, setAllMemes] = useState<Text[]>([]);

	useEffect((): void => {
		fetch("https://api.imgflip.com/get_memes")
			.then(res => res.json())
			.then(data => setAllMemes(data.data.memes))
			.catch(err => console.log(err));
	}, []);

	{ /*So basically in this i'm extracting the value and the name attributes of the `input` element by de-structuring them. */ }
	function handleChange(event: ChangeEvent<HTMLInputElement>): void {
		const { value, name } = event.currentTarget;
		setMeme(prev => ({ ...prev, [name]: value }));
	}

	return (
		<main>
			<div className="form">
				<label>Top Text
					<input
						type="text"
						placeholder="One does not simply"
						name="topText"
						onChange={handleChange}
						value={meme.topText}
					/>
				</label>

				<label>Bottom Text
					<input
						type="text"
						placeholder="Walk into Mordor"
						name="bottomText"
						onChange={handleChange}
						value={meme.bottomText}
					/>
				</label>
				<button>Get a new meme image 🖼</button>
			</div>
			<div className="meme">
				<img src={meme.imageUrl} />
				<span className="top">{meme.topText}</span>
				<span className="bottom">{meme.bottomText}</span>
			</div>
		</main>
	)
}
