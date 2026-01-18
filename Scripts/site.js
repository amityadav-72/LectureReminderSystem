function confirmLogout() {
    return confirm("Are you sure you want to logout?");
}

function validateEmpty(fieldId, message) {
    var value = document.getElementById(fieldId).value;
    if (value === "") {
        alert(message);
        return false;
    }
    return true;
}
