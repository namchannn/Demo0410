const express = require("express");
const app = express(); // tạo ra localhost
const PORT = 3333;

app.listen(PORT, function() {
    console.log("Server is running...");
});

// Routes
app.get("/", function(req, res) {
    res.sendFile(__dirname + "/public/views/home.html");
});
app.get("/about-us", function(req, res) {
    res.send("About us page");
});