window.onload = function() {
	today = new Date();
	tomorrow = new Date(today.getTime()+(1000*60*60*24));
	today = today.toISOString().slice(0, 10);
	tomorrow = tomorrow.toISOString().slice(0, 10);
	chkin = document.getElementById("today");
	chkout = document.getElementById("tomorrow");
	chkin.value = today;
	chkout.value = tomorrow;
	chkin.setAttribute("min", today);
	chkout.setAttribute("min", tomorrow);

}



 