
const express = require("express");
const mysql = require("mysql2/promise");

let db = null;
const app = express();

app.use(express.json());

app.post('/create-user', async(req, res, next)=>{
  const name = req.body.name;

  await db.query("INSERT INTO user (name) VALUES (?);", [name]);

  res.json({status:"OK"});
  next();
});
app.get('/users', async (req, res, next) => {

  const [rows] = await db.query("SELECT * FROM user;");

  res.json(rows);
  next();
});

async function main(){
  db = await mysql.createConnection({
    host:"localhost",
    user: "root",
    password: "",
    database: "sem_db",
    timezone: "+00:00",
    charset: "utf8mb4_general_ci",
  });

  app.listen(8000);
}

main();