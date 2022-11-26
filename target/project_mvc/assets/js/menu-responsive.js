const btn = document.getElementById("menu_btn-responsive");
const dropdown = document.querySelector("#menu_btn-responsive ~ .menu_list")

btn?.addEventListener("click", function() {
  dropdown.classList.toggle("menu_list_block")
  this.classList.toggle("is-open")

  this.innerHTML = btn.getAttribute("class").split(" ")[2] ? '<i class="fa-solid fa-xmark"></i>' : '<i class="fa-solid fa-bars"></i>'
})