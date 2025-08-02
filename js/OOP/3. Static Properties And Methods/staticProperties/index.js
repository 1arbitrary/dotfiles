class Article {
	constructor(title, date) {
		this.title = title;
		this.date = date;
	}
	static createTodays() {
		// remember 'this' stands for Article in this
		return new this("Today's Digest", new Date());
	}
}

let article = Article.createTodays();
console.log(article.title + " Dated : " + article.date); // Today's digest
