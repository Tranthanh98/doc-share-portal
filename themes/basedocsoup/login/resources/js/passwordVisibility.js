function togglePasswordVisibility(event) {
  var inputName = event.target.getAttribute("for");
  var inputPassword = document.getElementById(inputName);
  if (inputPassword.type === "password") {
    inputPassword.type = "text";
    event.target.classList.remove("icon-eye-slash");
    event.target.classList.add("icon-eye");
  } else {
    inputPassword.type = "password";
    event.target.classList.remove("icon-eye");
    event.target.classList.add("icon-eye-slash");
  }
}
