const path = require("path");
const express = require("express");
const app = express()


app.use("/", express.static("index.html"))

app.get("/api", function (req, res) {

})

app.listen(8080);

module.exports = app;