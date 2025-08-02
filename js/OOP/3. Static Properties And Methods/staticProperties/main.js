/* class User {
*     static staticMethod(){
* 	console.log(this === User);
*     }
* 
*     static sum(){
* 	return console.log(2+2);
*     }
* }
* 
* User.staticMethod();
* User.sum(); */

class Article {
    constructor(title, date){
	this.title = title;
	this.date = date;
    }

    static compare(articleA,articleB){
	return (articleA.date - articleB.date);
    }
}

/* Basically this array is just storing the values of Articles objects/instances*/
let articles = [
	new Article("HTML", new Date(2019, 1, 1)),
	new Article("CSS", new Date(2019, 0, 1)),
	new Article("Javascript", new Date(2019, 11, 1)),
];

articles.sort(Article.compare);
console.log(articles[0].title);
