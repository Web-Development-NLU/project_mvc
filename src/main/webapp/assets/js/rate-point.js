const reviewPoint = document.querySelector(".review-point")
const checkboxs = document.querySelectorAll(".review-point .radio-icon")
if(reviewPoint) {
  checkboxs.forEach((checkbox) => {
    checkbox.addEventListener("click", function() {
      const checked = document.querySelector(".review-point .isChecked") 
      checked?.classList.remove("isChecked") 
      this.classList.add("isChecked")
    })
  })
}