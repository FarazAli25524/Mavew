const facebookBtn = document.querySelector(".facebook-btn");
const twitterBtn = document.querySelector(".twitter-btn");
const linkedinBtn = document.querySelector(".linkedin-btn");
const pinterestBtn = document.querySelector(".pinterest-btn");
const whatsappBtn = document.querySelector(".whatsapp-btn");

function init(){
	let postURL = encodeURI(document.location.href);
	let postTitle = encodeURI("Hi Everyone! please check this out: ");
	const pinterestImg = document.querySelector(".pinterest-img");
	let postImg = encodeURI(pinterestImg.src);
	
	facebookBtn.setAttribute(
		"href",
		`https://www.facebook.com/sharer.php?u=${postURL}`
		);
		
	twitterBtn.setAttribute(
		"href",
		`https://twitter.com/share?url=${postURL}&text=${postTitle}`
	);	
	
	linkedinBtn.setAttribute(
		"href",
		`https://www.linkedin.com/shareArticle?url=${postURL}&title=${postTitle}`
	);
	
	pinterestBtn.setAttribute(
		"href",
		`https://pinterest.com/pin/create/bookmarklet/?media=${postImg}&url=${postURL}&description=${postTitle}`
	);
	
	whatsappBtn.setAttribute(
		"href",
		`https://api.whatsapp.com/send?text=${postTitle} ${postURL}`
	);
}

init();