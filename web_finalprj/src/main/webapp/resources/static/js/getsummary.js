$(document).ready(function(){
	const summary = document.querySelector(".before-summary");
	const changedSummary = summary.value.replaceAll('\n', '<br>');
	document.querySelector(".summary").innerHTML = changedSummary;
	const firstline = document.querySelector('.summary').firstChild;
	const h2 = document.createElement('h2');
	h2.append(firstline);
	document.querySelector(".summary").prepend(h2);
});