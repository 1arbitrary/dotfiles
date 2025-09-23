import starFilled from "../../images/star-filled.png";
import starEmpty from "../../images/star-empty.png";

export default function Star({ isFilled, handleClick }) {
	return (
		<div>
			<button
				aria-label={(isFilled) ? "Remove from favorites" : "Add to Favorites"}
				onClick={handleClick}
				aria-pressed={false}
				className="favorite-button">
				<img
					src={(isFilled) ? starFilled : starEmpty}
					alt={(isFilled) ? "Filled star" : "Empty Star"}
					className="favorite"
				/>
			</button>

		</div>
	);
}
