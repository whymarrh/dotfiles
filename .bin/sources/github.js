var url   = "https://github.com/whymarrh?tab=repositories";
var https = require("https");
var util  = require("util");

if (process.argv[2] === "status") {

	https.get("https://status.github.com/api/last-message.json", function(response) {

		var obj = "";
		response.on("data", function (chunk) {
			obj += chunk;
		});
		response.on("end", function () {
			var lmsg = JSON.parse(obj);
			util.puts(lmsg.body);
		})

	}).on("error", function(e) {

		util.puts("Whoa. Something went wrong.");

	});

}
else if (process.argv[2] === "open") {

	require('child_process').exec("open " + url);

}