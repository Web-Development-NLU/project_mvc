const tokenInput = document.querySelector("input[name='token']");
localStorage.setItem("token", JSON.stringify(tokenInput?.value));
tokenInput?.removeAttribute("value");
