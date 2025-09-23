const arr = [1,2,3,4,5];
// Desired Output = [1,4,9,16,25];

// Basically stored those values into another array 
const arr2 = arr.map(num => num = num * num);
console.log(arr2);

const names = ["alice", "bob" , "charlie", "danielle"];
const namesCapped = names.map(alias => alias[0].toUpperCase() + alias.slice(1));
console.log(namesCapped);

const pokemon = ["Bulbasaur", "Charmander", "Squirtle"];
// Desired Output : ["<p>Bulbasaur</p>", "<p>Charmander</p>", "<p>Squirtle</p>"];
const pokemonPara = pokemon.map((pokeAlias) => "<p>".concat(pokeAlias, "</p>"));

console.log(pokemonPara);
