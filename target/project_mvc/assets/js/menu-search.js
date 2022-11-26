const btnTrigger = document.getElementById("triggerSearchBar")
const searchBar = document.getElementById("menu-search-bar")
if(btnTrigger) {
  btnTrigger.addEventListener("click", function() {
    searchBar.classList.toggle("display-search-bar")
  })
  
  document.addEventListener("click", function(e) {
    const isInsideSearch = searchBar.contains(e.target)
    const isInsideBtn = btnTrigger.contains(e.target)
    if(!isInsideSearch && !isInsideBtn) {
      searchBar.classList.remove("display-search-bar")
    }
  })
}