
var dom = false; //No support for Netscape yet // = (document.getElementsByTagName) ? true : false;
var ie5 = (document.getElementsByTagName && document.all) ? true : false;
var arrowUp, arrowDown;

if (ie5 || dom)
	initSortTable();

function parentClick(e) {

	var tmp;
	var el;
	
	tmp = e.srcElement;
	el = getParent(tmp, "TD");
	
	el.click();
	
	
}

function initSortTable() {



	arrowUp = document.createElement("SPAN");
	var tn = document.createTextNode("6");
	arrowUp.appendChild(tn);
	arrowUp.className = "arrow";
	if (ie5) arrowUp.attachEvent("onclick", parentClick );

	arrowDown = document.createElement("SPAN");
	var tn = document.createTextNode("5");
	arrowDown.appendChild(tn);
	arrowDown.className = "arrow";
	if (ie5) arrowDown.attachEvent("onclick", parentClick );
}



function sortTable(tableNode, nCol, bDesc, sType, trNode) {



	var tdClass;
	
	var tdClasses = new Array();
	
	for (var n=0; n< trNode.cells.length; n++) {
		tdClass = trNode.cells[n].getAttribute("tdclass");
		if (!tdClass) tdClass = "rowdata";
		tdClasses[n] = tdClass;
	
	}

	
	
	var tBody = tableNode.tBodies[1];
	
	
	
	var trs = tBody.rows;
	var a = new Array();
	
	for (var i=0; i<trs.length; i++) {
		a[i] = trs[i];
	}
	
	a.sort(compareByColumn(nCol,bDesc,sType));

	for (var i=0; i<a.length; i++) {


		if ((i/2)==Math.floor(i/2)) {
			for (var n=0; n< a[i].cells.length; n++) {
				a[i].cells[n].className = "even"+tdClasses[n];
			}
		}
		else
		{ 
			for (var n=0; n< a[i].cells.length; n++) {
				a[i].cells[n].className = "odd"+tdClasses[n];
			}
		}


		tBody.appendChild(a[i]);
	}
}

function CaseInsensitiveString(s) {
	return String(s).toUpperCase();
}

function parseDate(s) {
	return Date.parse(s.replace(/\-/g, '/'));
}

/* alternative to number function
 * This one is slower but can handle non numerical characters in
 * the string allow strings like the follow (as well as a lot more)
 * to be used:
 *    "1,000,000"
 *    "1 000 000"
 *    "100cm"
 */

function toNumber(s) {
    return Number(s.replace(/[^0-9\.]/g, ""));
}

function compareByColumn(nCol, bDescending, sType) {
	var c = nCol;
	var d = bDescending;
	
	var fTypeCast = String;
	
	if (sType == "Number")
		fTypeCast = Number;
	else if (sType == "Date")
		fTypeCast = parseDate;
	else if (sType == "CaseInsensitiveString")
		fTypeCast = CaseInsensitiveString;

	return function (n1, n2) {
		if (fTypeCast(getInnerText(n1.cells[c])) < fTypeCast(getInnerText(n2.cells[c])))
			return d ? -1 : +1;
		if (fTypeCast(getInnerText(n1.cells[c])) > fTypeCast(getInnerText(n2.cells[c])))
			return d ? +1 : -1;
		return 0;
	};
}


function sortColumn(e) {

	var tmp, el, tHeadParent;

	if (ie5)
		tmp = e.srcElement;
	else if (dom)
		tmp = e.target;

	doSort(tmp);
	
	return; 

}

function doSort(tmp) {

	var el, tHeadParent;

	tHeadParent = getParent(tmp, "TBODY");
	
	el = getParent(tmp, "TD");
	


	if (tHeadParent == null)
		return;
		
		
	if (el.getAttribute("sortable") != "true")
		return;
		

		
	if (el != null) {

		

		var p = el.parentNode;

		var i;

		if (el._descending)	// catch the null
			el._descending = false;
		else
			el._descending = true;
		
		if (tHeadParent.arrow != null) {
			if (tHeadParent.arrow.parentNode != el) {
				tHeadParent.arrow.parentNode._descending = null;	//reset sort order		
			}
			tHeadParent.arrow.parentNode.removeChild(tHeadParent.arrow);
		}

		if (el._descending)
			tHeadParent.arrow = arrowDown.cloneNode(true);
		else
			tHeadParent.arrow = arrowUp.cloneNode(true);

		el.appendChild(tHeadParent.arrow);

			

		// get the index of the td
		for (i=0; i<p.cells.length; i++) {
			if (p.cells[i] == el) break;
		}

		var table = getParent(el, "TABLE");
		
		
		sortTable(table,i,el._descending, el.getAttribute("type"), el.parentNode);
	}
}


function getInnerText(el) {
	
	if (ie5) return el.innerText;	//Not needed but it is faster
	
	var str = "";
	
	for (var i=0; i<el.childNodes.length; i++) {
		switch (el.childNodes.item(i).nodeType) {
			case 1: //ELEMENT_NODE
				str += getInnerText(el.childNodes.item(i));
				break;
			case 3:	//TEXT_NODE
				str += el.childNodes.item(i).nodeValue;
				break;
		}
		
	}
	
	return str;
}

function getParent(el, pTagName) {

	if (el == null) return null;
	else if (el.nodeType == 1 && el.tagName.toLowerCase() == pTagName.toLowerCase())	// Gecko bug, supposed to be uppercase
		return el;
	else
		return getParent(el.parentNode, pTagName);
}