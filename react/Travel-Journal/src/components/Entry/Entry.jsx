import locationSvg from "../../images/location.svg"

export default function Entry(props) {
    console.log(props);
	return (
		<section>
			<article>
				<img className="blog-img" src={props.img.src} alt={props.img.alt} title={props.country} />
				<div className="blog-div">
					<div className="blog-header-div">
						<img className="location-svg" src={locationSvg} alt="location" title="location-svg" />
						<p className="blog-country">{props.country}</p>
						<a href={props.googleMapsLink}>View on Google Maps</a>
					</div>
					<h1 className="blog-place">{props.title}</h1>
					<p className="blog-date">{props.dates}</p>
					<p className="blog-description">{props.text}</p>
				</div>
			</article>
		</section>
	);
}
