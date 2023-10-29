const express = require("express");
const app = express(); // tạo ra localhost
const PORT = 3333;

// connect mysql
const configDB = {
    host: '139.180.186.20',
    port: 3306,
    user: 't2305e',
    password: 'UAk8iWfsnJ.*17[f',
    database: 't2305e',
    multipleStatements: true // cho phép viết nhiều câu SQL trong 1 lần query
}
const mysql = require("mysql");
const conn = mysql.createConnection(configDB);

// cấp phép cho sử dụng các file static
app.use(express.static("public"));

app.listen(PORT, function() {
    console.log("Server is running...");
});

// Routes
app.get("/", function(req, res) {
    res.sendFile(__dirname + "/public/views/home.html");
});

app.get("/api/categories", function(req, res) {
    const sql = `select * from nhom1_categories`;
    conn.query(sql, function(err, rs) {
        if (err) return res.send("Error");
        return res.send(rs);
    });
});
app.get("/api/products", function(req, res) {
    const sql = `select * from nhom1_products`;
    conn.query(sql, function(err, rs) {
        if (err) return res.send("Error");
        return res.send(rs);
    });
});
// api hiển thị các product theo tên
app.get("/api/search", function(req, res) {
    // get paramaters
    const search = req.query.q;
    const sql = `select * from nhom1_products where name like '%${search}%'`;
    conn.query(sql, function(err, rs) {
        if (err) return res.send("Error");
        return res.send(rs);
    });
});
// api hiển thị các product trong categories tìm kiếm
app.get("/api/categories/:id", function(req, res) {
    // get paramaters
    const id = req.params.id;
    const sql = `select * from nhom1_products where category_id = ${id}`;
    conn.query(sql, function(err, rs) {
        if (err) return res.send("Error");
        return res.send(rs);
    });
});

// api hiển thị product theo id
app.get("/api/products/:id", function(req, res) {
    // get paramaters
    const id = req.params.id;
    const sql = `select * from nhom1_products where id = ${id}`;
    conn.query(sql, function(err, rs) {
        if (err) return res.send("Error");
        return res.send(rs);
    });
});

//searh chi tiết 1 product
app.get("/api/products/:name", function(req, res) {
    // get paramaters
    const name = req.params.name;
    const sql = `select * from nhom1_products where name like '%${name}%'`;
    conn.query(sql, function(err, rs) {
        if (err) return res.send("Error");
        return res.send(rs);
    });
});