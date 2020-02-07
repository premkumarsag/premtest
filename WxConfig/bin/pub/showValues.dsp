<html> 
	<head>
		<title>Show Values</title>
		%include snippets/htmlHeadDefaults.dsp%
		
		<SCRIPT LANGUAGE="JavaScript">
			function OnChange(dropdown)
			{
				var myindex  = dropdown.selectedIndex
				var SelValue = dropdown.options[myindex].value
				var baseURL  = "showValues.dsp?showPkg=" + SelValue
				parent.frames["body"].location.href = baseURL;
				return true;
			}

			window.onkeypress = function(event) {
				if (event.charCode === 114 && event.ctrlKey) {  // CTRL-R pressed
					event.preventDefault();
					parent.frames["body"].location.href = "showValues.dsp?showPkg=%value showPkg%";
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
					Development &gt; Show Values
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
					Values
				</td>
			</tr> 
			<form name="pkgSelect" method="post" action="showValues.dsp" target="_self"> 
				<tr>
					<td  colspan=4>
						Package: &nbsp;&nbsp;
						<select  name="showPkg" onchange='OnChange(this);' >
							<option value="-choose-">-choose-</option>
							%ifvar showPkg equals('-all-')%
								<option value="-all-" selected>-All Packages-</option>
							%else%
								<option value="-all-">-All Packages-</option>
							%endifvar%
							<option value="GLOBAL">&lt;GLOBAL&gt;</option>
							%invoke wx.config.impl.ui:getPackagesWithConfig%
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
				
						<noscript>
							<input type="submit" value="Refresh">
						</noscript>
						%ifvar showPkg -notempty%
							&nbsp;
							<a href="showValues.dsp?showPkg=%value showPkg%"><img name="refreshButton" border="0" 
								src="/WmRoot/icons/icon_reload.gif" alt='Refresh (or press CTRL-R)' 
								title="Refresh  (or press CTRL-R)"></a>
							<a href="listFiles.dsp?showPkg=%value showPkg%"><b>Package Files</b></a>
						%endifvar%
					</td>
				</tr>  
	   
	   
	   
				%ifvar showPkg -notempty%
					%invoke wx.config.pub:getServicesWithConfig%
						%onerror%
							%include /snippets/error.dsp%
					%endinvoke wx.config.pub:getServicesWithConfig%
				
					%invoke wx.config.impl.ui:getValuesForPackage%
						%onerror%
							%include /snippets/error.dsp%
					%endinvoke%
					
					
					<tr class="subheading2">
						%ifvar showPkg equals('-all-')%
							<td class="oddcol-l"  tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;" id=defaultsort>&nbsp;Package&nbsp;</td>
						%endifvar%
						<td class="oddcol-l"  tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;" >&nbsp;Key&nbsp;</td>
						<td class="oddcol-l"  tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;" >&nbsp;Used&nbsp;</td>
						<td class="oddcol-l"  tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;" >&nbsp;Value(s)&nbsp;</td>
						<td class="oddcol-l"  tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;" >&nbsp;File(s)&nbsp;</td>
					</tr>
					<script>resetRows();</script>		 

					%ifvar contents%
						%loop contents%
							%rename ../showPkg pkgID -copy%  <!-- needed for inclusion of snippets/configFileWithLink.dsp -->
							
							%rename ../serviceWithConfigList serviceWithConfigList -copy%
							<tr>
								%ifvar ../showPkg equals('-all-')%
									<script>writeTD('rowdata-l');</script>
										%value pkg%
									</td>
									%rename pkg package -copy%  <!-- needed for wx.config.pub:getServicesUsingKey -->
								%else%
									%rename ../showPkg package -copy%  <!-- needed for wx.config.pub:getServicesUsingKey -->
								%endifvar%
								<script>writeTD('rowdata-l');</script>
									%value key%
								</td>
								<script>writeTD('rowdata-l');</script>
									%invoke wx.config.pub:getServicesUsingKey%
										%value noOfServicesUsingKey%
										%ifvar noOfServicesUsingKey equals('0')%
										%else%
											<a href="showKeyUsage.dsp?wxConfigKey=%value key encode(url)%&showPkg=%value package%"><image src="/WmRoot/icons/magnifyglass.gif"/></a>
										%endifvar%
										%ifvar keyUsedByOtherPackage equals('true')%
											<a href="showKeyUsage.dsp?wxConfigKey=%value key encode(url)%&showPkg=%value package%"><image src="images/dependency.gif"/></a>
										%endifvar%
									%endinvoke wx.config.pub:getServicesUsingKey%
								</td>
								<script>writeTD('row-l')</script>
									%ifvar containsUnresolvedInterpolator equals('true')%
										<image src="images/warning.gif" title="Unresolved interpolation found"/>
									%endifvar%
									%loop valueList%
										%value% <br>
									%end%
								</td>
								<script>writeTD('row-l');swapRows();</script>
									%loop files%
										%include snippets/configFileWithLink.dsp% <br>
									%endloop%
								</td>
							</tr>
						%endloop%
					%else%
						<tr>
							<td class="oddrowdata" colspan=5>There are no values available.</td>
						</tr>
					%endifvar%
					<tr>
						<td style="border: none;">
							<img src="images/blank.gif" height=10 width=10>
						</td>
					</tr>
					
					%include snippets/tableWithFiles.dsp%
				%endifvar%

					 
			</table>
		</form>
	</body>
</html> 
