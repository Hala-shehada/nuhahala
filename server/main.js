
const express = require("express");
const mysql = require("mysql2/promise");

let db = null;
const app = express();

app.use(express.json());

app.get('/hi', async (req, res, next) => {
  
  const text = req.url;
  const myArray = text.split("%22");
  let result = "hh";

  res.json(result);

  next();
});

app.post('/create-user', async (req, res, next) => {

  const name = req.body.name;
  const email = req.body.email;
  const city= req.body.city;
  const phone = req.body.phone;
  const password = req.body.password;
  const [rows] = await db.query("SELECT * FROM `user` WHERE `email` = (?);", [email]);
  if(rows.length==0){
    await db.query("INSERT INTO user (`name`, `email`, `city`, `phone` ,`Password`) VALUES (?,?,?,?,?);", [name,email, city, phone , password]);
    res.json({ status: "Registration Done" });
  }
  else  res.json({ status: "email already exist" });
  next();
});


app.get('/userlog', async (req, res, next) => {
  const text = req.url;
   const myArray = text.split("%22");
    const email = myArray[3];
    const password =myArray[7];
    console.log(text);
   const [rows] =
   await db.query("SELECT id FROM `user` WHERE `email` = (?)and `password`= (?);", [email,password]);
   var str = JSON.stringify(rows[0]);
   const n2 = " ";
   console.log(rows);
   console.log(myArray[7]);
 if(rows.length>0){const n = str.split(":");
 console.log("jj");
   const n2 = n[1].split("}");
   console.log(n2[0]);
   res.json(n2[0]);
 }
  else  res.json( "email or password are not correct" );
   next();
 });


 app.get('/forgetPassword', async (req, res, next) => {
  const text = req.url;
   const myArray = text.split("%22");
    const email = myArray[3];
    console.log(text);
   const [rows] =
   await db.query("SELECT id FROM `user` WHERE `email` = (?);", [email]);
   var str = JSON.stringify(rows[0]);
   const n2 = " ";
   console.log(rows);
   console.log(myArray[7]);
 if(rows.length>0){const n = str.split(":");
 console.log("jj");
   const n2 = n[1].split("}");
   console.log(n2[0]);
   res.json(n2[0]);
 }
  else  res.json( "you don't have an account on this email" );
   next();
 });


 app.get('/accountinfo', async (req, res, next) => {
  const text = req.url;
  //console.log(text);
  const myArray = text.split("%22");
  const idd = myArray[3];
  //console.log(idd);
  const [rows] = await db.query("SELECT  * FROM `user` WHERE `id` = (?);", [idd]);
  console.log (rows);
  var str = JSON.stringify(rows[0]);

  const myArr = str.split(",");
  const name = myArr[1].split(":");
  const email = myArr[2].split(":");
  const city = myArr[3].split(":");
  const phone = myArr[4].split(":");
  let t = name[1] + "&" +  email[1] + "&" + city[1] +"&" + phone[1];
  let result = t.replaceAll("\"", "");
  res.json(result);
  next();
});


app.post('/change-account', async (req, res, next) => {
  const id = req.body.id;
  const name = req.body.name;
  // const email = req.body.email;
  const city = req.body.city; 
  // const phone = req.body.phone;

  await db.query("UPDATE `user` SET `name`= (?) , `city`= (?)  WHERE `id`= (?);", [name,city,id]);

  res.json( "OK" );
  next();
});


app.get('/userpassword', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  console.log(text);
  const idd = myArray[3];

  const [rows] = await db.query("SELECT `Password` FROM `user` WHERE `id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);
  console.log(str);
  const password  = str.split(":");
  console.log(password)
  const password1= password[1].split("\"");
  console.log(password1[1]);
  let result = password1[1].replaceAll("\"}", "");
  res.json(result);
  next();
});

app.get('/userdelete', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  console.log(text);
  const idd = myArray[3];

  const [rows] = await db.query("DELETE  FROM `user` WHERE `id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);
  console.log(str);
  const password  = str.split(":");
  console.log(password)
  const password1= password[1].split("\"");
  console.log(password1[1]);
  let result = password1[1].replaceAll("\"}", "");
  res.json({ status: "OK" });
  next();
});

app.post('/change-password', async (req, res, next) => {
  const id = req.body.id;
  const password = req.body.password;
  await db.query("UPDATE `user` SET `Password`= (?) WHERE `id`= (?);", [password, id]);

  res.json({ status: "OK" });
  next();
});




// app.get('/users', async (req, res, next) => {

//   const [rows] = await db.query("SELECT * FROM user;");

//   res.json(rows);
//   next();
// });

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