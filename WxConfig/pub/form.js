

function writeInputField(fieldName, fieldValue, fieldSize, editMode, isPwd)
{
   var result = "<input type=\"";
	
	if (isPwd)
	   result = result + "password";
	else   
	   result = result + "text";
	   
	result = result + "\" name=\"" + fieldName + "\" value=\"" + fieldValue + "\" size=\"" + fieldSize + "\"";
	
	switch (editMode)
	   {
   	   case "VIEW":
   	   case "DELETE":
   	   case "":
   	      result = result + " disabled=\"true\"";
   	      break;
	   }
	result = result + ">";
	
   document.write(result);	   
}

function writeInputFieldWithId(fieldId, fieldName, fieldValue, fieldSize, editMode, isPwd)
{
	var result = "<input id=\"";
	result = result + fieldId + "\"";
	result = result + " type=\"";

	if (isPwd)
		result = result + "password";
	else   
		result = result + "text";
	result = result + "\" name=\"" + fieldName + "\" value=\"" + fieldValue + "\" size=\"" + fieldSize + "\"";

	switch (editMode)
	{
		case "VIEW":
		case "DELETE":
		case "":
			result = result + " disabled=\"true\"";
		break;
	}

	result = result + ">";

	document.write(result);	   
}

function writeTextareaField(fieldName, fieldValue, fieldSize, fieldHeight, editMode)
{
  	var result = "<textarea name=\"" + fieldName + "\" cols=\"" + fieldSize + "\" rows=\"" + fieldHeight + "\"";

  	switch (editMode)
	   {
   	   case "VIEW":
   	   case "DELETE":
   	   case "":
   	      result = result + " disabled=\"true\"";
   	      break;
	   }
	result = result + ">" + fieldValue + "</textarea>";
   
   document.write(result);	   
}
 

 
function writeTextField(fieldName, fieldValue, fieldSize, fieldHeight, editMode, isPwd)
{
	if (fieldHeight>0)  
	   writeTextareaField(fieldName, fieldValue, fieldSize, fieldHeight, editMode);
	else   
	   writeInputField(fieldName, fieldValue, fieldSize, editMode, isPwd);
}



function writeDropdownListField(fieldName, options, fieldValue, editMode, allowUndef)
{
	var result    = "<select name=\"" + fieldName + "\" size=\"1\"";
	var optionArr = new Array();
	var idx;
	
	optionArr = options.split("|");
   
	switch (editMode)
	   {
   	   case "VIEW":
   	   case "DELETE":
   	   case "":
   	      result = result + " disabled=\"true\">";
   	      break;
   	   default:
   	      result = result + ">";   
	   }
	
	if (allowUndef)
	   result = result + "<option value=\"undef\">(undefined)";   
	   
   for (idx in optionArr)
      {
      result = result + "<option";
      if (optionArr[idx]==fieldValue)
         result = result + " selected";
      result = result + " value=\"" + optionArr[idx] + "\">" + optionArr[idx];   
      }
	
	result = result + "</select>";
	
	document.write(result);
}


function writeMultiChoiceListField(fieldName, options, fieldValues, editMode, size)
{
	var result    = "<select name=\"" + fieldName + "\" size=\"" + size + "\" multiple";
	var optionArr = new Array();
	var valuesArr = new Array();
	var idx;
	
	optionArr = options.split("|");
	valuesArr = fieldValues.split("|");
   
	switch (editMode)
	   {
   	   case "VIEW":
   	   case "DELETE":
   	   case "":
   	      result = result + " disabled=\"true\">";
   	      break;
   	   default:
   	      result = result + ">";   
	   }
	
   for (idx in optionArr)
      {
      result = result + "<option";
      for (valIdx in valuesArr)
         if (optionArr[idx] == valuesArr[valIdx])
            result = result + " selected";
      result = result + " value=\"" + optionArr[idx] + "\">" + optionArr[idx];   
      }
	
	result = result + "</select>";
	
	document.write(result);
}


function writeUIStateMsg(uiState)
{
   if (uiState=="NEW")
      msg = "Configuration is NEW";
   else if (uiState=="CHG")
      msg = "Configuration has CHANGED";
   else if (uiState=="DEL")
   {
      msg =       "Configuration has been marked for DELETE<br>"
      msg = msg + "Remove again to purge the data, or change to restore<br>"
      msg = msg + "Unpurged data will be purged when deployed";
   }
      
   if (msg)
      document.write(msg);   
}