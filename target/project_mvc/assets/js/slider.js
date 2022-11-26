const slide = document.querySelector(".head_bottom-slider")
if(slide) {
  const slider = tns({
    container: ".head_bottom-slider",
    items: 1,
    mouseDrag: true,
    controls: false,
    navPosition: "bottom"
  })
} 