var getShowPass = document.getElementById("show-password");
var getIpPass = document.getElementById("ip_password-login");
var getIconShowPass = document.getElementById("show-password");

if (getShowPass) {
  getShowPass.addEventListener("click", showPassword);
  function showPassword() {
    if (getIpPass.getAttribute("type") == "password") {
      getIpPass.setAttribute("type", "text");
      getIconShowPass.innerHTML = '<i class="bi bi-eye"></i>';
    } else {
      getIpPass.setAttribute("type", "password");
      getIconShowPass.innerHTML = '<i class="bi bi-eye-slash"></i>';
    }
  }
}
