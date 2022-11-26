
const allPrices = document.querySelectorAll(".card-price");

allPrices.forEach((element, index)=>{
    let currentPrice = element.firstElementChild;
    let cost = element.lastElementChild;
    let txt = cost.innerHTML;
    if(txt == "") {
        currentPrice.classList.add("cl-text-price");
    }else {
        currentPrice.classList.remove("cl-text-price");
    }
})