<html> 
	<head>
		<title>Values per Stage</title>
		%include snippets/htmlHeadDefaults.dsp%
		
		<SCRIPT LANGUAGE="JavaScript">
			function OnChange(dropdown)
			{
				var myindex  = dropdown.selectedIndex
				var SelValue = dropdown.options[myindex].value
				var baseURL  = "valuesPerStage.dsp?showPkg=" + SelValue
				parent.frames["body"].location.href = baseURL;
				return true;
			}

			window.onkeypress = function(event) {
				if (event.charCode === 114 && event.ctrlKey) {  // CTRL-R pressed
					event.preventDefault();
					parent.frames["body"].location.href = "valuesPerStage.dsp?showPkg=%value showPkg%";
					return true;
				}
			};
		</SCRIPT>
	</head> 

	<body>
		%include snippets/headerUpdates.dsp%

		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb">
					Development &gt; Values per Stages
				</td>
			</tr>
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
		</table>

		<table width="100%" class="tableView">
			<tr>
				<td class="heading" colspan=5>
					Values per Stage
				</td>
			</tr> 
			<form name="pkgSelect" method="post" action="valuesPerStage.dsp" target="_self"> 
				<tr>
					<td  colspan=4>
						Package: &nbsp;&nbsp;
						<select  name="showPkg" onchange='OnChange(this);' >
							<option value="-choose-">-choose-</option>
							<option value="GLOBAL">&lt;GLOBAL&gt;</option>
							%invoke wx.config.impl.staging:getPackagesWithConfigPerStage%
								%onerror%
								  %include /snippets/error.dsp%
							%endinvoke%
							%loop packageList%
								%ifvar packageList vequals(showPkg)%
									<option value="%value packageList%" selected>%value packageList%</option>
									<!-- <INPUT type="hidden" name="showPkg" value="%value packageList%"> -->
								%else%
									<option value="%value packageList%">%value packageList%</option>
								%endifvar%
							%endloop%
						</select> 
		
						<noscript><input type="submit" value="Refresh"></noscript>
					   %ifvar showPkg -notempty%
							&nbsp;
							<a href="valuesPerStage.dsp?showPkg=%value showPkg%"><img name="refreshButton" border="0" 
								src="/WmRoot/icons/icon_reload.gif" alt='Refresh (or press CTRL-R)' 
								title="Refresh  (or press CTRL-R)"></a>
							<a href="listFiles.dsp?showPkg=%value showPkg%"><b>Package Files</b></a>
						%endifvar%
					</td>
				</tr>  
	  
				%ifvar showPkg -notempty%
					%rename showPkg wxConfigPkgName -copy%
					
					%invoke wx.config.impl.staging:getValuesPerStage%
						%onerror%
							%include /snippets/error.dsp%
					%endinvoke%
					 
					<tr class="subheading2">
						<td class="oddcol-l"  tdclass="rowdata-l">&nbsp;Key&nbsp;</td>
						%loop stages%
							<td class="oddcol-l"  tdclass="rowdata-l">&nbsp;<b>%value detail%</b>&nbsp;&nbsp;&nbsp; (%value type%)&nbsp;</td>
						%endloop%
					</tr>
					<script>resetRows();</script>		 
		  
					%ifvar noStages equals('0')%
						<tr>
							<td class="oddrowdata" colspan=%value colSpan%>There are no stage-specific values available.</td>
						</tr>
					%else%
						%loop valuesPerStage%
							<tr>
								
								<script>writeTD('rowdata-l');</script>
									%value key%
								</td>
								%loop data%
									<script>writeTD('row-l');</script>
										%loop values%
											%value% <br>
										%endloop%
										
									</td>
								%endloop%
							</tr>
							<script>swapRows();</script>
						%endloop%
					%endifvar%
					<tr>
						<td style="border: none;">
							<img src="images/blank.gif" height=10 width=10>
						</td>
					</tr>
					%include snippets/tableWithFiles.dsp%
				%endifvar%
			</form>
		</table>
	</body>
</html> 
