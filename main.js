const path = require("path");
const express = require("express");
const sqlite3 = require("sqlite3");

const db = new sqlite3.Database("./sql/db.sqlite");

const app = express()


app.use(express.static(path.join(__dirname, "web")))
app.use("/", express.static("index.html"))

app.get("/api/searchPositionsByCompany/:company", function (req, res) {
	db.all("select * from ", function () {
		
	})
});

app.listen(8080);

module.exports = app;