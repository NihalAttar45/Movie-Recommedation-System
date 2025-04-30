function searchMoviesU(name) {
    let xhttp = new XMLHttpRequest();
    
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            // Assuming response is HTML, insert it into a specific element
            document.getElementById("showgrid").innerHTML = this.responseText;
        }
    };
    
    xhttp.open("GET", "searchbyNamefromuser?n=" + encodeURIComponent(name), true);
    xhttp.send();
}
