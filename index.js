var mssql = require("mssql");
var express = require("express");
var router = express.Router();
var Connection = require("tedious").Connection;
var app = express();
const port = process.env.PORT || 3001;

app.set("view engine", "ejs");
var config = {
  user: "postgres",
  password: "amkatop94445093",
  server: "localhost",
  database: "urgoooo",
};

// var connection = new Connection(config);
// connection.on("connect", function (err) {
//   // If no error, then good to proceed.
//   console.log("Connected");
// });

// connection.connect();

app.get("/", function (req, res, next) {
  var connection = new mssql.ConnectionPool(config, function (err) {
    var request = new mssql.Request(connection);
    request.query("select * from Customers", function (err, recordset) {
      if (err)
        // ... error checks
        console.log("Database connection error");
    });

    //   var sql = "select * from Customers";
    //   var request = new sql.Request(config);
    //   config.query(sql, function (err, data) {
    //     if (err) throw err;
    //     res.render("pages/customers", { title: "User List", editData: data[0] });
  });
});

app.listen(port);
console.log(`Server is listening on port ${port}`);

// var connection = new sql.ConnectionPool(webconfig, function (err) {

// });module.exports = config;
// var Connection = require("tedious").Connection;
// var config = {
//   server: "",
//   authentication: {
//     type: "default",
//     options: {
//       userName: "sa", //update me
//       password: "", //update me
//     },
//   },
//   options: {
//     // If you are on Microsoft Azure, you need encryption:
//     encrypt: true,
//     database: "", //update me
//   },
// };
// var connection = new Connection(config);
// connection.on("connect", function (err) {
//   // If no error, then good to proceed.
//   console.log("Connected");
// });

// connection.connect();

//Initializing connection string
// var express = require("express");
// var app = express();

// var sql = require("mssql");

// var http = require("http");
// const port = process.env.PORT || 3001;
// app.set("view engine", "ejs");

// var mssql = require("mssql");
// var conn = mssql.createConnection({
//   port: 1433,
// });
// conn.connect(function (err) {
//   if (err) throw err;
//   console.log("Database is connected successfully !");
// });

// app.listen(port);
// console.log(`Server is listening on port ${port}`);

// var connection = new sql.Connection(webconfig, function (err) {
//   var request = new sql.Request(connection);
//   request.query("select * from Users", function (err, recordset) {
//     if (err)
//       // ... error checks
//       console.log("Database connection error");

//     console.dir("User Data: " + recordset);
//   });
// });

// var app = express();

// var port = process.env.PORT || 8000;

// app.get("/api/v1/employee", function (req, res) {
//   var sql = require("mssql");

//   // config for your databasevar
//   var config = {
//     user: "sa",
//     password: "reallyStrongPwd123",
//     server: "localhost",
//     database: "Urgoo",
//     port: 1433,
//   };

//   // connect to your database
//   sql.connect(config, function (err) {
//     if (err) console.log(err);

//     // create Request objectvar request = new sql.Request();

//     // query to the database and get the records
//     request.query("select * from Customers", function (err, recordset) {
//       if (err) console.log(err);

//       // send records as a response
//       res.send(recordset);
//     });
//   });
// });

// var server = app.listen(8080, function () {
//   console.log("Server is running..");
// });
