import { useState } from "react";

export default function Jokes({ setup, punchline }) {
	const [isShown, setIsShown] = useState(false);

	function changeShowState() {
		setIsShown(prev => !(prev));
	}

	console.log(isShown);
	return (
		<article>
			<div className="joke-div">
				{/* One way to do it  */}
				{setup && <p className="setup">Setup : {setup}</p>}

				{
					/* another way to achieve that behavior :
						{<p style={{ display: setup ? "block" : "none" }} className="setup">Setup : {setup}</p>}
					 */
				}

				{(isShown) ? <p className="punchline">Punchline : {punchline} </p> : null}
				<hr />
				<button onClick={changeShowState}>{(isShown) ? "Hide" : "Show"} Punchline</button>
			</div>
		</article>
	);
}
