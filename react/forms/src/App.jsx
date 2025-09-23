export default function App() {

	/* Basically in this we're passing the event as a parameter */
	function signup(formData) {
		// This basically prevents the page from refreshing which is the default behavior

		// With the action attribute passed to the function it would prevent refresh by default
		// and would also eliminate the need of using `event.preventDefault()`
		// event.preventDefault();

		// Then we just create a new FormData object and pass in the current form into it  ; with `action` attribute this is not needed 

		// 		const formData = new FormData(event.currentTarget);

		// Now we grab the email from the form by entering it's name (input's name ig of the element we want to grab from the form)
		const employmentStatus = formData.get("employmentStatus");
		/* 		const dietaryRestrictions = formData.get("dietaryRestrictions"); */
		// or use `formData.getAll()` to get all the values.

		/* To grab the whole form we can use :
		   Object.fromEntries(formData)
*/

	    const data = Object.fromEntries(formData);
	    const dietaryRestrictions = formData.getAll("dietaryRestrictions");

	    const allData = {...data, dietaryRestrictions};
	    console.log(allData);

	    
		/* I can also do : 
		   const data = formData
		   to get all the data of the form. */
	//	console.log(dietaryRestrictions);
		// To reset the form; to clear all the information that was entered eventCurrentTarget.reset()
	}

	return (
		<section>
			<h1 className="heading">Signup Form </h1>
			<form action={signup}>
				<label htmlFor="email">Email:
					<input type="email" id="email" name="email" defaultValue="joe@schmoe.com" />
				</label>

				<br />

				<label htmlFor="password">Password:
					<input type="password" defaultValue="something123" id="password" name="password" />
				</label>

				<br />

				<label>Description:
					<textarea id="description" defaultValue="Put A Description" name="description"></textarea>
				</label>

				<fieldset>
					<legend>
						Employment Status :
					</legend>

					<label className="checkbox-label">
						<input type="radio" value="Unemployed" id="employmentStatus" name="employmentStatus" className="checkbox" />
						Unemployed
					</label>

					<label className="checkbox-label">
						<input type="radio" value="Part-Time" id="employmentStatus" name="employmentStatus" className="checkbox" />
						Part-Time
					</label>

					<label className="checkbox-label">
						<input type="radio" id="employmentStatus" value="Full-Time" name="employmentStatus" className="checkbox" />
						Full-Time
					</label>

				</fieldset>

				<fieldset>
					<legend>
						Dietary Restrictions :
					</legend>

					<label className="checkbox-label">
						<input type="checkbox" value="Kosher" id="dietaryRestrictions" name="dietaryRestrictions" className="checkbox" />
						Kosher
					</label>

					<label className="checkbox-label">
						<input type="checkbox" value="Vegan" id="dietaryRestrictions" name="dietaryRestrictions" className="checkbox" />
						Vegan
					</label>

					<label className="checkbox-label">
						<input type="checkbox" id="dietaryRestrictions" value="Gluten-Free" name="dietaryRestrictions" className="checkbox" />
						Gluten-Free
					</label>

				</fieldset>

				<label htmlFor="favColor">What Is Your Favorite Color?</label>
				<select id="favColor" name="favColor" defaultValue="Blue">
					<option value="" disabled>--CHOOSE-A-COLOR--</option>
					<option value="Red">Red</option>
					<option value="Orange">Orange</option>
					<option value="Yellow">Yellow</option>
					<option value="Green">Green</option>
					<option value="Blue">Blue</option>
					<option value="Indigo">Indigo</option>
					<option value="Violet">Violet</option>
				</select>

				<button type="submit">Submit</button>
			</form>
		</section>
	);
}
