import reactLogo from "../../assets/react.svg"

export default function Header() {
	return (
		<header>
			<nav>
				<img className="logo" src={reactLogo} alt="React-logo" title="React" />
				<h1>ReactFacts</h1>
			</nav>
		</header>
	)
}
