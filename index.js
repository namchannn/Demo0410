const express = require("express");
const app = express(); // tạo ra localhost
const PORT = 3333;

// connect mysql
const configDB = {
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
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
    const sql = `select * from categories`;
    conn.query(sql, function(err, rs) {
        if (err) return res.send("Error");
        return res.send(rs);
    });
});
app.get("/api/products", function(req, res) {
    const sql = `select * from products`;
    conn.query(sql, function(err, rs) {
        if (err) return res.send("Error");
        return res.send(rs);
    });
});
// api hiển thị các product theo tên
app.get("/api/search", function(req, res) {
    // get paramaters
    const search = req.query.q;
    const sql = `select * from products where name like '%${search}%'`;
    conn.query(sql, function(err, rs) {
        if (err) return res.send("Error");
        return res.send(rs);
    });
});
// api hiển thị các product trong categories tìm kiếm
app.get("/api/category/:id", function(req, res) {
    // get paramaters
    const id = req.params.id;
    const sql = `select * from products where category_id = ${id}`;
    conn.query(sql, function(err, rs) {
        if (err) return res.send("Error");
        return res.send(rs);
    });
});
// chi tiết 1 product
app.get("/api/product/:name", function(req, res) {
    // get paramaters
    const name = req.params.name;
    const sql = `select * from products where name like '%${name}%'`;
    conn.query(sql, function(err, rs) {
        if (err) return res.send("Error");
        return res.send(rs);
    });
});