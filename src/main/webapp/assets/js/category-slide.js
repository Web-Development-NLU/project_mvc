const category_slide = document.querySelector(".category-slide")

if(category_slide) {
  tns({
    container: ".category-slide",
    items: 3,
    nav: false,
    controlsContainer: ".control-slide",
    responsive: {
      1025: {
        items: 5
      },
      768: {
        items: 4
      }
    }
  })
}