const express = require("express");
const app = express();
const { Client, Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "postgres",
  password: "amkatop94445093",
  port: 5432,
});

// pool.query(`Select * from customers`, (err, res) => {
//   if (!err) {
//     console.log(res.rows);
//   } else {
//     console.log(err.message);
//   }
//   pool.end;
// });

pool.query("SELECT * from Customers", (err, res) => {
  console.log(err, res);
  pool.end();
});

// pool.query("SELECT * from customers", (err, res) => {
//   console.log(err, res);
//   pool.end();
// });
// console.log("step1");

// app.listen(5050, () => {
//   console.log("Sever is now listening at port 3300");
// });

// Replace the $1 with the value of the name variable (prevents SQL injection)

const conn = async () => {
  try {
    await pool.connect();
    console.log("DB connect OKAY");
  } catch (e) {
    console.log("failed");
  }
};

conn();

// console.log("done!");
