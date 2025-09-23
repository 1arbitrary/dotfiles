export default function Contact(props) {
	return (
		<article className="contact-card">
			<img
				src={props.img}
				alt="Photo of Mr. Whiskerson"
			/>
			<h3>{props.name}</h3>
			<div className="info-group">
				<img
					src={props.img}
					alt="phone icon"
				/>
				<p>{props.phone}</p>
			</div>
			<div className="info-group">
				<img
					src={props.img}
					alt="mail icon"
				/>
				<p>{props.email}</p>
			</div>
		</article>
	);
}

// Alternatively, we can destructure the prop's attributes

/* export default function Contact({ img, name, phone, email }) {
* 	return (
* 		<article className="contact-card">
* 			<img
* 				src={img}
* 				alt="Photo of Mr. Whiskerson"
* 			/>
* 			<h3>{name}</h3>
* 			<div className="info-group">
* 				<img
* 					src={img}
* 					alt="phone icon"
* 				/>
* 				<p>{phone}</p>
* 			</div>
* 			<div className="info-group">
* 				<img
* 					src={img}
* 					alt="mail icon"
* 				/>
* 				<p>{props.email}</p>
* 			</div>
* 		</article>
* 	);
* } */

const person = {
	img: "somelink",
	name: "Mr.Whiskerson",
	phone: "(800) 555-1234",
	email: "mr.whiskas@catnap.meow"
};

console.log(person.name);

// We can destructure this object and declare it's keys as variables
// For example :
const { img, phone } = person;

console.log(img);

// Alternatively, i can do this and rename the variables:
// const {img: image, phone: telephone}

// so if i console.log them now then i'll just whatever value they're holding
// without having to write `Object.key`.
