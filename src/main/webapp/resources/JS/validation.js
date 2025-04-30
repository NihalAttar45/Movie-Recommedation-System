// validation.js

// Validate username
function validateUsername() {
    var username = document.getElementById("username").value;
    if (username.length < 3 || username.length > 15) {
        alert("Username must be between 4 to 15 characters.");
        return false;
    }
    return true;
}

// Validate password
function validatePassword() {
    var password = document.getElementById("password").value;
    if (password.length < 6) {
        alert("Password must be at least 6 characters long.");
        return false;
    }
    return true;
}

// Validate email
function validateEmail() {
    var email = document.getElementById("email").value;
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address.");
        return false;
    }
    return true;
}

// Validate contact number
function validateContact() {
    var contact = document.getElementById("contact").value;
    var contactPattern = /^[0-9]{10}$/;  // Only allows 10 digits
    if (!contactPattern.test(contact)) {
        alert("Please enter a valid 10-digit contact number.");
        return false;
    }
    return true;
}

// Validate entire form
function validateForm() {
    if (!validateUsername()) return false;
    if (!validatePassword()) return false;
    if (!validateEmail()) return false;
    if (!validateContact()) return false;
    return true;
}
