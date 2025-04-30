 
        function validateName(str) {
            let len = str.length;
            let flag = false;
            for (var i = 0; i < len; i++) {
                let ascii = str.charCodeAt(i);
                if (!((ascii >= 65 && ascii <= 90) || (ascii >= 97 && ascii <= 122))) {
                    flag = true;
                    break;
                }
            }
            if (flag) {
                document.getElementById("s").innerHTML = "Invalid name";
                return false;
            } else {
                document.getElementById("s").innerHTML = "";
                return true;
            }
        }

        function validateEmail(str) {
            let index = str.indexOf("@");
            if (index <= 0) {
                document.getElementById("s").innerHTML = "Invalid email address";
                return false;
            } else {
                let lastIndex = str.lastIndexOf("@");
                let diff = lastIndex - index;
                if (diff > 0) {
                    document.getElementById("s").innerHTML = "@ should not repeat";
                    return false;
                } else {
                    let afterAt = str.slice((index + 1));
                    let dotIndex = afterAt.lastIndexOf(".");
                    if (!(dotIndex == (afterAt.length - 4) || dotIndex == (afterAt.length - 3))) {
                        document.getElementById("s").innerHTML = "Invalid email address";
                        return false;
                    } else {
                        document.getElementById("s").innerHTML = "";
                        return true;
                    }
                }
            }
        }

        function validateContact(str) {
            let len = str.length;
            let flag = false;
            if (len != 10) {
                flag = true;
            } else {
                for (let i = 0; i < len; i++) {
                    let ch = str.charCodeAt(i);
                    if (!(ch >= 48 && ch <= 57)) {
                        flag = true;
                        break;
                    }
                }
            }
            if (flag) {
                document.getElementById("s").innerHTML = "Invalid number";
                return false;
            } else {
                document.getElementById("s").innerHTML = "";
                return true;
            }
        }

        function validatePassword(str) {
            let len = str.length;
            if (len < 8) {
                document.getElementById("s").innerHTML = "Invalid password";
                return false;
            } else {
                var specials = 0;
                var capital = 0;

                for (let i = 0; i < len; i++) {
                    let ch = str.charCodeAt(i);
                    if (!((ch >= 65 && ch <= 90) || (ch >= 97 && ch <= 122) || (ch >= 48 && ch <= 57))) {
                        specials++;
                    }
                    if (ch >= 65 && ch <= 90) {
                        capital++;
                    }
                }
                if (capital < 1 || specials < 1) {
                    document.getElementById("s").innerHTML = "Invalid password";
                    return false;
                } else {
                    document.getElementById("s").innerHTML = "";
                    return true;
                }
            }
        }

        function validateAdminForm() {
            let name = document.getElementById("adminname").value;
            let email = document.getElementById("adminemail").value;
            let contact = document.getElementById("admincontact").value;
            let password = document.getElementById("adminpassword").value;

            let isValid = validateName(name) && validateEmail(email) && validateContact(contact) && validatePassword(password);

            return isValid; // Prevent form submission if any validation fails
        }
   