function modalShow(size, index){
	let modal = document.querySelector("#crs > .crs-bg");
	let modalImg = document.querySelector(".crs-imagebox > img");
	let imgs = document.querySelectorAll(".image-box img");
	
	modal.style = "display:block";
	modalImg.src = imgs[index-1].src;
	
	let currentVal = document.querySelector("#crs .crs-buttonbox > input");
	currentVal.value = index-1;
	
}

function modalHide(){
	let modal = document.querySelector("#crs > .crs-bg");
	modal.style = "display:none";
}

function pre(size){
	let currentVal = document.querySelector("#crs .crs-buttonbox > input");
	let modalImg = document.querySelector(".crs-imagebox > img");
	let imgs = document.querySelectorAll(".image-box img");
	
	modalImg.src = imgs[currentVal.value-1].src;
	currentVal.value = currentVal.value-1;
}

function next(size){
	let currentVal = document.querySelector("#crs .crs-buttonbox > input");
	let modalImg = document.querySelector(".crs-imagebox > img");
	let imgs = document.querySelectorAll(".image-box img");
	
	modalImg.src = imgs[Number(currentVal.value)+1].src;
	currentVal.value = Number(currentVal.value)+1;
}
