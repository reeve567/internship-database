const path = require("path");
const http = require("http");
const sqlite3 = require("sqlite3");
const fs = require("fs");
const url = require("url");

const db = new sqlite3.Database("./sql/db.sqlite");

var server = http.createServer(function (req, res) {
	console.log(req.url)
	if (req.url === "/") {
		res.writeHead(200, {"Content-Type": "text/html"})
		
		res.end(fs.readFileSync("./web/index.html"));
	} else if (req.url.startsWith("/api/searchPositionsByCompany")) {
		var q = url.parse(req.url, true).query;
		
		res.writeHead(200, {"Content-Type": "application/json"})
		
		db.all("select * from companiesPositions where name like " + "'" + q["company"] + "'", function (err, rows) {
			res.end(JSON.stringify(rows));
		});
	} else if (req.url.startsWith("/api/createStudent")) {
		var q = url.parse(req.url, true).query;
		
		res.writeHead(200, {"Content-Type": "application/json"})
		
		const statement = `insert into students (first, last, email, address, phoneNumber, internshipId)
                           values ('${q.first}', '${q.last}', '${q.email}', '${q.address}', '${q.phone}',
                                   ${q.internshipId})`;
		
		db.run(statement);
	} else if (req.url.startsWith("/api/createInternshipPosition")) {
		var q = url.parse(req.url, true).query;
		
		res.writeHead(200, {"Content-Type": "application/json"})
		
		const statement = `insert into internshipPositions (companyId, title)
                           values (${q.companyId}, '${q.title}');`
		
		db.run(statement);
	} else if (req.url.startsWith("/api/createInternshipApplication")) {
		var q = url.parse(req.url, true).query;
		
		res.writeHead(200, {"Content-Type": "application/json"})
		
		const statement = `insert into internshipApplications (internshipPositionId, studentId, successful)
                           values (${q.internshipPositionId}, ${q.studentId}, ${q.successful});`
		
		db.run(statement);
	} else if (req.url.startsWith("/api/createInternship")) {
		var q = url.parse(req.url, true).query;
		
		res.writeHead(200, {"Content-Type": "application/json"})
		
		const statement = `insert into internships (internshipApplicationId, duties, wages, story)
                           values (${q.internshipApplicationId}, '${q.duties}', ${q.wages}, ${q.story});`
		
		db.run(statement);
	}  else if (req.url.startsWith("/api/deleteStudent")) {
		var q = url.parse(req.url, true).query;
		
		res.writeHead(200, {"Content-Type": "application/json"})
		
		const statement = `delete from students where id = ${q.id}`
		
		db.run(statement);
	}
})

server.listen(8080);