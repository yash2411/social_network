$(document).ready(function(){
    if (window.innerWidth < 301) {
        document.getElementById("signup-btn").value = "Sign up"
    }
    else{
        document.getElementById("signup-btn").value = "Create an account"
    }
})
