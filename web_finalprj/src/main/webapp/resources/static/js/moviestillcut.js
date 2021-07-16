function modalShow(size, index){
     let modal = document.querySelector("#crs > .crs-bg");
     let modalImg = document.querySelector(".crs-imagebox > img");
     let imgs = document.querySelectorAll(".image-box img");
     
     modal.style = "display:block";
     modalImg.src = imgs[index-1].src;
     
     let currentVal = document.querySelector("#crs .crs-buttonbox > input");
     currentVal.value = index-1;
     
     document.body.classList.add("no-scroll");
     
}
function modalHide(){
     let modal = document.querySelector("#crs > .crs-bg");
     modal.style = "display:none";
     
     document.body.classList.remove("no-scroll");
}
function pre(size){
     let currentVal = document.querySelector("#crs .crs-buttonbox > input");
     let modalImg = document.querySelector(".crs-imagebox > img");
     let imgs = document.querySelectorAll(".image-box img");
     
     if(Number(currentVal.value) > 0){
           modalImg.src = imgs[Number(currentVal.value)-1].src;
           currentVal.value = Number(currentVal.value)-1;
     } else{
           currentVal.value = size;
           modalImg.src = imgs[Number(currentVal.value)-1].src;
     }
}
function next(size){
     let currentVal = document.querySelector("#crs .crs-buttonbox > input");
     let modalImg = document.querySelector(".crs-imagebox > img");
     let imgs = document.querySelectorAll(".image-box img");
     
     if(Number(currentVal.value) < size-1){
           modalImg.src = imgs[Number(currentVal.value)+1].src;
     currentVal.value = Number(currentVal.value)+1;
     } else{
           currentVal.value = 0;
           modalImg.src = imgs[Number(currentVal.value)+1].src;
     }
     
}