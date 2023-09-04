/**
 * testjs.js
 */
$(function(){
	
var output = document.querySelector(".output");
var myFiles = document.querySelector("#myfiles");

 function logFilenames() {
	
	var fileInput = document.querySelector("#input_imgs");
	var files = fileInput.files;
	var fileListLength = files.length;
	var result = "";
	for (var i = 0; i < fileListLength; i++) {
		result += files.item(i).name;
		if (i != fileListLength - 1) {
			result += "<br>";
		}
		console.log(files.item(i).name);
	}
	$('#output').html(result);
}

input_imgs.addEventListener("change", logFilenames);


});