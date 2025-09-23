export default function Pad({ id, color, isOn, handleClick }) {
	return (
		<div>
			<button
				style={{ backgroundColor: color }}
				className={(isOn) ? "on" : undefined}
				onClick={() => handleClick(id)}></button>
		</div>

	);
}
