const wishlist = document.getElementById("wishlist-content")

if(wishlist) {  
  const chooseAll = document.querySelector("#wishlist-content form input[name='select-all']")
  const listChoose = document.querySelectorAll("#wishlist-content tbody .wishlist_item .wishlist-choice input")

  chooseAll.addEventListener("click", function() {
    listChoose.forEach(choose => {
      choose.checked = this.checked
    })
  })
}