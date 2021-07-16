$(document).ready(function(){
     let poster = document.querySelector("#poster");
     let stillcut = document.querySelector("#stillcut");
     
     poster.onchange = function(){
           let label = poster.nextElementSibling;
           let filenames = "";
           /*let index = 1;*/
           
           for(item of poster.files){
                filenames += item.name;
          filenames += ", ";
          
          /*let main = document.querySelector("#mainposter");
          let sub = document.querySelector("#subposter");
          main.append(document.createElement('option'));
          main.children[index].value = item.name;
          main.children[index].text = item.name;
          
          sub.append(document.createElement('option'));
          sub.children[index].value = item.name;
          sub.children[index].text = item.name;
          index++;*/
          
     }
     label.innerText = filenames.slice(0, -2);
     
     }
     
     stillcut.onchange = function(){
           let label = stillcut.nextElementSibling;
           let filenames = "";
           let index = 0;
           
           for(item of stillcut.files){
                filenames += item.name;
          filenames += ", ";
     }
     
     label.innerText = filenames.slice(0, -2);
     }
});