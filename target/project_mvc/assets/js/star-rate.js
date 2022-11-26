
const allStarRates = document.querySelectorAll(".star-rate");

allStarRates.forEach((rate, index) => {
    const rate_point = parseFloat(rate.getAttribute("data-rate"));
    let star_fill = Math.floor(rate_point);
    const part_star = rate_point - star_fill;

    let i = 0;
    while( i < star_fill) {
        rate.innerHTML += '<span><i class="fa-solid fa-star"></i></span>'
        i++;
    }

    if(part_star >= 0.5) {
        rate.innerHTML += '<span><i class="fa-solid fa-star-half-stroke"></i></span>'
        star_fill++;
    }

    let j = 0;
    while(j < (5 - star_fill)) {
        rate.innerHTML += '<span class="no-point"><i class="fa-regular fa-star"></i></span>'
        j++
    }
})