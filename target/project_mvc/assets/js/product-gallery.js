const gallery = document.querySelector('.product-gallery')

if(gallery) {
  const slider = tns({
    container: ".product-gallery",
    item: 1,
    controls: false,
    mouseDrag: true,
    navContainer: ".gallery-action",
  })
}