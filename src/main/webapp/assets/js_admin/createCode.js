var ipValue = document.getElementById("value");
var btnGetCode = document.getElementById("btnGetCode");
var btnCreateCode = document.getElementById("creatCode");
var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
let errorCode = document.getElementById("error_code");

if(btnGetCode){
    btnGetCode.addEventListener("click", createCode);
    function createCode() {
        var code = randomCode();
        ipValue.value = code;
        setValid();
    }
    function randomCode() {
        var result ='';
        for (var i=0; i< 6; i++){
            result += characters.charAt(Math.floor(Math.random() * characters.length));
        }
        return result;
    }

}
if(ipValue){
    ipValue.addEventListener("blur", checkCode)
    function checkCode() {
        let value = ipValue.value;
        if (value.length != 6) {
            setErrorCode();
            return;
        }
        for(let i=0; i< value.length;i++){
            if(!characters.includes(value.charAt(i))) {
                setErrorCode();
                return;
            }
        }
        setValid();
    }
    function setValid() {
        ipValue.style.border = "1px solid #d9dee3";
        errorCode.innerHTML = "";
    }
    function setErrorCode() {
        ipValue.style.border = "1px solid red";
        errorCode.innerHTML = "Mã không được trống và có 6 ký tự a-z,A-Z";
    }
}


