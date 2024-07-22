const express = require("express");
const path = require("path");

const app = express();

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname + "/index.html"));
})
app.get("/main", (req, res) => {
    res.sendFile(path.join(__dirname + "/main.html"));
})
app.use(express.static(path.join(__dirname, 'public')));

// serving the index.html file 

const server = app.listen(5000);
const portNumber = server.address().port;
console.log(`port: ${portNumber}`);
// can see the port number in terminal - you can dictate the port number