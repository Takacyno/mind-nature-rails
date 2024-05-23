// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
//=reuquire_tree
import "./custom/observation.js"
// window.textDisplayCheck=function(obj){
//     if(obj.checked){
//         obj.parentNode.nextElementSibling.classList.remove("hidden");
//     }else if(!obj.parentNode.nextElementSibling.classList.contains("hidden")){
//         obj.parentNode.nextElementSibling.classList.add("hidden");
//     }
// };
// window.textDisplaySelect=function(obj,displayNums){
//     if(displayNums.includes(Number(obj.value))){
//         obj.nextElementSibling.classList.remove("hidden");
//     }else if(!obj.nextElementSibling.classList.contains("hidden")){
//         obj.nextElementSibling.classList.add("hidden");
//     }
// };