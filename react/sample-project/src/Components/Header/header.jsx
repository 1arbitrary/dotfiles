import avatar from "../../icons/user.png";

export default function Header({userName}) {
	return (
		<header>
			<img src={avatar} />
			<p>{userName}</p>
		</header>
	)
}
