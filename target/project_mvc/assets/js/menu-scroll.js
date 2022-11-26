const menu = document.querySelector("menu");
let point = 0;
if(menu) {
  window.addEventListener("scroll", function() {
    if((this.scrollY > point)) {
      menu?.classList.add("hidden_menu");
    }else {
      menu?.classList.remove("hidden_menu");
    }
    point = this.scrollY;
    
    if(point > 0) {
      menu?.classList.add("scroll_menu")
    }else {
      menu?.classList.remove("scroll_menu")
    }
  })  
}