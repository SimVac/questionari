console.log("ok")
pass = document.getElementById("Password")
passc = document.getElementById("PasswordConfirmation")
error = document.getElementById("error")

if (pass.value != passc.value){
    error.classList.remove("invisible")
    error.classList.add("visible")
}
if(pass.value == passc.value){
    error.classList.remove("visible")
    error.classList.add("invisible")
}