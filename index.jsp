<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Web Form</title>
<style>
.error {
    color: red;
}
</style>
</head>
<body>
<h2>Web Form</h2>
<form id="myForm" action="submit" method="post">
    <label for="name">Name:</label><br>
    <input type="text" id="name" name="name" required><br><br>

    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" required><br><br>

    <label for="age">Age:</label><br>
    <input type="number" id="age" name="age" required><br><br>

    <label for="dob">Date of Birth:</label><br>
    <input type="date" id="dob" name="dob" required><br><br>

    <input type="submit" value="Submit">
</form>

<div id="errorMessages"></div>

<script>
document.getElementById("myForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent form submission

    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var age = document.getElementById("age").value;
    var dob = document.getElementById("dob").value;

    // Validate email format
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        displayError("Invalid email format");
        return;
    }

    // Validate age
    if (isNaN(age) || age <= 0) {
        displayError("Age must be a positive integer");
        return;
    }

    // Submit form if validation passes
    document.getElementById("myForm").submit();
});

function displayError(message) {
    var errorDiv = document.getElementById("errorMessages");
    errorDiv.innerHTML = '<p class="error">' + message + '</p>';
}
</script>
</body>
</html>

