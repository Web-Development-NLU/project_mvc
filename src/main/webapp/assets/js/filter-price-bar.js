let min = 140;
let max = 969;
const calcLeftPosition = value => 100/ (969 -140)*(value -140);
let ipRangeMin = document.getElementById("range-min");
let ipRangeMax = document.getElementById("range-max");
let getSlider = document.getElementById("slider-range");
if(ipRangeMin && ipRangeMax) {
    ipRangeMin.addEventListener("input",function (e){
        changeMin(e);
    })
    ipRangeMax.addEventListener("input",function (e){
        changeMax(e);
    })
}

function  changeMin(e){
    let newValue = parseInt(e.target.value);
    let filterMin = document.getElementById("state-thumb-left");
    if(newValue > max){
        e.target.value = max;
        newValue = max;
    }
    min = newValue;
    filterMin.style.left = calcLeftPosition(newValue) + '%';
    document.getElementById("min-price").innerHTML = newValue + '.00$';
    getSlider.style.left = calcLeftPosition(newValue) + '%';
    getSlider.style.right = (100 - calcLeftPosition(max)) + '%';
    setIndex(min, e.target.max, ipRangeMin);
}

function  changeMax(e) {
    let newValue = parseInt(e.target.value);
    let filterMax = document.getElementById("state-thumb-right");
    if(newValue < min) {
        e.target.value = min;
        newValue = min;
    }
    max = newValue;
    filterMax.style.left = calcLeftPosition(newValue) + '%';
    document.getElementById("max-price").innerHTML = newValue + '.00$';
    getSlider.style.left = calcLeftPosition(min) + '%';
    getSlider.style.right = (100 - calcLeftPosition(newValue))+ '%';
    setIndex(max, e.target.min, ipRangeMax);
}


function setIndex(value,valueTarget, element) {
    if(value == valueTarget){
        element.style.zIndex = '4';
    }else {
        element.style.zIndex = '3';
    }
}

