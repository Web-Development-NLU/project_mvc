var ipValue = document.getElementById("value");
var btnGetCode = document.getElementById("btnGetCode");
if(btnGetCode){
    btnGetCode.addEventListener("click", createCode);
    function createCode() {
        var code = randomCode();
        ipValue.value = code;
    }
    function randomCode() {
        var result ='';
        var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        for (var i=0; i< 6; i++){
            result += characters.charAt(Math.floor(Math.random() * characters.length));
        }
        return result;
    }
}