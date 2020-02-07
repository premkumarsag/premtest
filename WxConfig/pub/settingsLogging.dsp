<HTML>
	<HEAD>
		<title>Settings - Logging</title>
		%include snippets/htmlHeadDefaults.dsp%
		<SCRIPT LANGUAGE="JavaScript">
			var agent = navigator.userAgent.toLowerCase();   
			var ie = (agent.indexOf("msie") != -1);

			var margin = 2;
			var modified = false;
			

			window.onbeforeunload = checkModified;
			function checkModified()
			{

				if (modified)
				{
					//event.returnValue = '--- Logging changes have not been saved. ---';
					return '--- Logging changes have not been saved. ---';
				}
			}

			  
			function getThreshold (index)
			{

			switch(index){
			case 0:
				return 'Off';
				break;
			case 1:
				return 'Fatal';
				break;
			case 2:
				return 'Error';
				break;
			case 3:
				return 'Warn';
				break;
			case 4:
				return 'Info';
				break;
			case 5:
				return 'Debug';
				break;
			case 6:
				return 'Trace';
				break;
			default:
				return 'Undefined';
			}
			}

			function getThresholdDisplayFromValue (value)
			{
			if ( value == "Off" ) {
				return "Off";
			}
			
			if ( value == "Fatal" ) {
				return "Fatal";
			}

			if ( value == "Error" ) {
				return "Error";
			}

			if ( value == "Warn" ) {
				return "Warn";
			}

			if ( value == "Info" ) {
				return "Info";
			}

			if ( value == "Debug" ) {
				return "Debug";
			}

			if ( value == "Trace" ) {
				return "Trace";
			}
			
			return "Undefined";
			}
			

			function toggleNode(node){
			var body=document.getElementById("Default");
			rows = body.rows;
			
			if (node.childNodes.item(0).src.indexOf('plus') !=-1){
				node.childNodes.item(0).src = "/WmRoot/images/minus.gif";
				for(var i = 3; i < rows.length; i++){
					var title=rows[i].title;
				if(title!=null && title.length>0){
				var image=document.getElementById('img'+rows[i].title);
				image.src = "/WmRoot/images/plus.gif";		
				
					if (ie) {
					rows[i].style.display="block";
					}else{
					rows[i].style.display="block";
					rows[i].style.display="table-row";
					}
				}
				}
			}else{
				node.childNodes.item(0).src = "/WmRoot/images/plus.gif";
				for(var i = 3; i < rows.length; i++)
						rows[i].style.display="none";  
				
			}
			restripe();

			}



			function toggle(node, bodyName)
			{

			var body=document.getElementById(bodyName);
			var image=document.getElementById('img'+bodyName);

			rows = body.rows;
			
			if (image.src.indexOf('plus') !=-1){
				image.src = "/WmRoot/images/minus.gif";

				for(i = 0; i < rows.length; i++){
				   if (ie) {
					 rows[i].style.display="block";
				   }else{
					 rows[i].style.display="block";
					 rows[i].style.display="table-row";
				   }
				}
			}else{
				image.src = "/WmRoot/images/plus.gif";
			
				for(i = 0; i < rows.length; i++)
					rows[i].style.display = 'none';

			}
			restripe();
			}



			var inheritedVar;
			function beforeChange(value)
			{
			inheritedVar = value;
			}
			
			function spreadNodeChange(box, oldVar){
				var newVar = box.selectedIndex;

				var body=document.getElementById("Default");

				var rows = body.rows;

			var length = rows.length;
				for(var i = 3; i < length; i++){

					title=rows[i].title;

				if(title!=null && title.length>0){

						cells = rows[i].cells;
						nodes = cells[1].childNodes;//2nd td
					for(var j = 0; j < nodes.length; j++){
						
						if(nodes[j].nodeName=='SELECT'){
							var int = nodes[j].selectedIndex;
						//changing text
						options = nodes[j].options;
						options[oldVar].text = getThreshold(oldVar); 
					options[oldVar].style.color="#000000";
					options[oldVar].style.fontWeight="bold";
						options[newVar].text = options[newVar].text; 
					options[newVar].style.color="#657383";
					options[newVar].style.fontWeight="normal";
						if(int==oldVar){
							nodes[j].selectedIndex = newVar;
						//spread over children
							spreadChange(nodes[j], oldVar);
			
						}else{//if inherited var
						   // alert('int: '+int+'oldVar: '+oldVar);////////
						
						}
					nodes[j].style.color=options[nodes[j].selectedIndex].style.color;
					if(nodes[j].selectedIndex==newVar)
						nodes[j].style.fontWeight="normal";
					else
						nodes[j].style.fontWeight="bold";
					break; //we are done with this loop
						}//if SELECT
				
						}//for j
					}//if

				}//for i
			inheritedVar = newVar; //reset just in case focus in not refreshed for nexttime
			}

			function spreadChange(box, oldVar){
				var newVar = box.selectedIndex;
				var title = box.title;

				if (title.length > 0){
					var body=document.getElementById(title);
					var rows = body.rows;

					for(var i = 0; i < rows.length; i++){
						var cells = rows[i].cells;
					var nodes = cells[1].childNodes;//2nd td
					for(var j = 0; j < nodes.length; j++){
						if(nodes[j].nodeName=='SELECT'){
							var int = nodes[j].selectedIndex;
						//changing text
						options = nodes[j].options;
						options[oldVar].text = getThreshold(oldVar); 
					options[oldVar].style.color="#000000"
					options[oldVar].style.fontWeight="bold"
						options[newVar].text = options[newVar].text; 
					options[newVar].style.color="#657383"
					options[newVar].style.fontWeight="normal"
						if(int==oldVar){
							nodes[j].selectedIndex = newVar;
						}else{//if inherited var
						   // alert('int: '+int+'oldVar: '+oldVar);
						
						}

					nodes[j].style.color=options[nodes[j].selectedIndex].style.color;
					if(nodes[j].selectedIndex==newVar)
						nodes[j].style.fontWeight="normal";
					else
						nodes[j].style.fontWeight="bold";
					break;
						}//if SELECT
						}//for j
					}//for i
				}//if
			inheritedVar = newVar; //reset just in case focus in not refreshed for nexttime
			}
			
			function afterChange(box)
			{
				if(box.title!=null&&box.title=="Default"){
					var textbox=document.getElementById("debugLevel");
					textbox.value = box.value;
				spreadNodeChange(box, inheritedVar);
				}else{
				spreadChange(box, inheritedVar);
			}
			}

			function commonChange(box)
			{
			modified=true;
			var newVar = box.selectedIndex;
			box.style.color=box.options[newVar].style.color;
			if(box.options[newVar].style.color =="rgb(101, 115, 131)" || box.options[newVar].style.color=="#657383")
				box.style.fontWeight="normal";
			else
				box.style.fontWeight="bold";
			}

			function changeStatus(id, status)
			{
				var tag=document.getElementById(id);
				tag.childNodes[0].nodeValue = status;
			}



			function writeOptions(value, parentValue){
			   for(var i = 0;i < 7;i++){
				   var threshold = getThreshold(i);
				   w(IWebOption(threshold, parentValue, threshold==value));
			   }
			 }

			function IWebOption(value, parentValue, selected){
			  option = "<OPTION value=\""+value+"\" style=\"color:";
			  if(value==parentValue)
				  option = option + "#657383; font-weight:normal\"";
			  else
				  option = option + "#000000; font-weight:normal\"";

			  option = option + " value='value'";
			  
			  if(selected)
				  option = option + " selected";
			  
			  displayText = getThresholdDisplayFromValue(value);
			  
			  return option+">"+displayText+"</OPTION>";
			}   


			function writePreview(value, parentValue){
			   w(IWeb(value, parentValue));
			}
				
		   

			function IWeb(value, parentValue){
			
				displayText = getThresholdDisplayFromValue(value);
			
			if(value==parentValue)
				return  "<SPAN style='color:#657383; font-weight:normal'>" + displayText + "</SPAN>";
			else
				return  "<SPAN style='color:#000000; font-weight:bold'>" + displayText + "</SPAN>";
			}   

		   

			function end(bodyName){

			var body=document.getElementById(bodyName);
			
			rows = body.rows;	
			lastrow = rows[rows.length-1];
				cell = lastrow.cells[0]//1st cell;
				nodes = cell.childNodes;
				for(var j = 0; j < nodes.length; j++){
					if(nodes[j].nodeName == "IMG" && nodes[j].src.indexOf('link') !=-1)
						nodes[j].src = "/WmRoot/images/lastlink.gif"
			}
				
			}

			function restripe(){
			var body=document.getElementById("Default");

			var rows = body.rows;

			resetRows();
			//loop through each child
				for(var i = 2; i < rows.length; i++){
				if(rows[i].style.display != 'none'){
					rows[i].cells[0].className=row+"rowdata-l";
					rows[i].cells[1].className=row+"rowdata"
				swapRows();	    
				}
				}//for i
			}



			function getData(listboxName){
			var body=document.getElementById("Default");
			var listbox=document.getElementById(listboxName);

			var rows = body.rows;
			
			//loop through each child
				for(var i = 3; i < rows.length; i++){
					cells = rows[i].cells;
					nodes = cells[1].childNodes;//2nd td
					for(var j = 0; j < nodes.length; j++){

					  if(nodes[j].nodeName=='SELECT'){
						var select = nodes[j];
					
				//this part only includes non-inherited props
				if(!(select.style.color =="rgb(101, 115, 131)" || select.style.color=="#657383")){
					var option = document.createElement("OPTION");
					var text=select.name;
					if (text==null || text.length==0)
						text=select.title;
					option.value = text+'='+getThreshold(select.selectedIndex);
					option.selected=true;
					listbox.appendChild(option);
						}//end if
					///////////////////////////////////////////////    
					  }
					}//for j
				}//for i
			}
			

			function submit(){
				getData('facilityList');
				

				
				document.logform.submit();
			}
		</SCRIPT>
	</HEAD>
	<body>

		<TABLE width="100%">
			<TR>
				<TD class="breadcrumb" colspan=2>
					Settings &gt; Logging
				</TD>
			</TR>
			%ifvar action equals('change')%
				%invoke wx.config.impl.ui:settingsLoggingSave%
					%ifvar message%
						%ifvar success equals('true')%
							<table width=100%>
								<tr>
									<td class="success"><pre>%value message%</pre></td>
								</tr>
							</table>
						%else%
							<table width=100%>
								<tr>
									<td class="error"><pre>%value message%</pre></td>
								</tr>
							</table>
						%endifvar%
					%else%
						<script>parent.menu.treeRefreshButton.click();</script>
					%endifvar%   
						%onerror%
							%include snippets/error.dsp%
				%endinvoke%
			%endif%
			%invoke wx.config.impl.ui:settingsLoggingGet%
			<TR>
				<TD><IMG SRC="/WmRoot/images/blank.gif" height=10 width=10></TD>
			</TR>
		</table>
		
		<FORM name="logtreeform" method="POST">
			<table class="tableView" id="fileSettings">
				<tr>
					<td class="heading" colspan=4>Log File</td>
				</tr>
				<tr>
					<script>writeTD('rowdata-l');</script>
						<div style="margin-left: 10px;margin-right: 10px;">
							Location
						</div>
					</td>
					<script>writeTD('rowdata');</script>
						<div style="margin-left: 10px;margin-right: 10px;">
							%value logCfgFile%
						</div>
					</td>
					<script>writeTD('row-l');</script>
						<div style="margin-left: 10px;margin-right: 10px;">
							Path is relative to <b>%value serverHomeDir%</b>
						</div>
					</td>
					<script>swapRows();</script>
				</tr>
			
				<tr>
					<script>writeTD('rowdata-l');</script>
						<div style="margin-left: 10px;margin-right: 10px;">
							Reload Interval
						</div>
					</td>
					<script>writeTD('rowdata');</script>
						<div style="margin-left: 10px;margin-right: 10px;">
							
						</div>
						
					</td>
					<script>writeTD('row-l');</script>
						<div style="margin-left: 10px;margin-right: 10px;">
							The reload interval is defined in the log4j2.xml file and outside the direct control of WxConfig
						</div>
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('rowdata-l');</script>
						<div style="margin-left: 10px;margin-right: 10px;">
							Automatic Reload Active
						</div>
					</td>
					<script>writeTD('rowdata');</script>
						<div style="margin-left: 10px;margin-right: 10px;">
							
						</div>
					</td>
					<script>writeTD('row-l');</script>
						<div style="margin-left: 10px;margin-right: 10px;">
							The switch to enable reloading is defined in the log4j2.xml file and outside the direct control of WxConfig
						</div>
						<p/>
					</td>
					<script>swapRows();</script>
				</tr>
				
				<tr>
					<td style="border: none;">
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
			</table>
		
			<TABLE  class="tableView"id="Default">	
				<TR>
					<TD CLASS="heading" colspan="2" width="360">
						Log Levels
						<SPAN id="loggerstatus" style='font-family:monospace;font-size:14;font-style:italic'>&nbsp;</SPAN>
					</TD>
					<script>resetRows();</script>
					<TR class="subheading2">
						<TD CLASS="oddcol-l">Facility</TD>
						<TD CLASS="oddcol">Logging Level</TD>
					</TR>
				
					%loop Components% 
						<TR title="%value CompCode%" style='display:none'>
							<SCRIPT>writeTD('rowdata-l');</SCRIPT>
								<A onClick="toggle(this,'%value CompCode%');">&nbsp;&nbsp;&nbsp;<img id="img%value CompCode%" src="/WmRoot/images/plus.gif">%value CompDesc%</A>
							</TD>
							<SCRIPT>writeTD('rowdata');swapRows();</SCRIPT>
						</TR>                  
						<TBODY id="%value CompCode%">
							%loop Facs%
								<TR style='display:none'> 
									<TD CLASS="evenrow-l">
										&nbsp;&nbsp;&nbsp;&nbsp;%value FacCode% &nbsp; %value FacDesc%
									</TD>
									<TD>
										<SELECT name="%value ../CompCode%.%value FacCode%" onchange="commonChange(this);" style="width:80px">
											<SCRIPT>writeOptions('%value Threshold%','%value ../Threshold%');</SCRIPT>
										</SELECT>
									</TD>    
								</TR>
							%endloop%
						</TBODY>
						<script>toggle(img%value CompCode%,'%value CompCode%');</script>
					%endloop% <!-- components -->
			</TABLE>
		
			NOTE: <b>BOLD</b> text signifies changes made.
		
			</FORM>
			<FORM name="logform" action="settingsLogging.dsp" method="POST">
				<INPUT type="hidden" name="logSettings" value="true">
				<INPUT type="hidden" name="action" value="change">
				<INPUT type="hidden" name="doc" value="edit">
				<SELECT style="display:none" id="facilityList" name="facility" multiple=true>
			   </SELECT>
			
			</FORM>
			<INPUT onclick="modified = false;submit();" type="submit" value="Save Changes" name="submit">
		%endinvoke%
		
	</body>
</HTML>
