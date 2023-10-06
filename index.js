const express = require("express");
const app = express(); // tạo ra localhost
const PORT = 3333;

app.use("/public", express.static(__dirname + "/public"));

app.listen(PORT, function() {
    console.log("Server is running...");
});

// Routes
app.get("/", function(req, res) {
    res.sendFile(__dirname + "/public/views/login.html");
});
app.get("/", function(req, res) {
    res.sendFile(__dirname + "/public/views/register.html");
});
app.get("/about-us", function(req, res) {
    res.send("About us page");
});