import globeSvg from "../../images/globe.svg"

export default function Header() {
	return (
		<header>
			<img src={globeSvg} className="globe-svg" alt="globe-uk" title="Globe-UK" />
			<h1 className="main-heading">my travel journal.</h1>
		</header>
	);
}
