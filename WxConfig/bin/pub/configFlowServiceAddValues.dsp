<html> 

	<head>
		<title>Add Configuration Value to Flow Service (Step 2 of 2)</title>
		%include snippets/htmlHeadDefaults.dsp%
		<script>
			 window.onkeypress = function(event) {
				if (event.charCode === 115 && event.ctrlKey) {
					event.preventDefault();
					document.saveForm.submit();
				}
			};
		</script>
	</head> 
	<body>
		%include snippets/headerUpdates.dsp%

		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb">
					Development &gt; Update Flow Service with Configuration Values (Step 2 of 2)
				</td>
			</tr>
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
		</table>

		
			%invoke wx.config.impl.util.pkg:getPackageForService%
			%endinvoke%
			
			%ifvar showPkg%
				<form name="saveForm" method="post" action="configFlowService.dsp" target="_self"> 
					<input type="hidden" name="editMode" value="NEW">
					<input type="hidden" name="actionMode" value="SAVE">        
					<input type="hidden" name="package" value="%value showPkg%">
					<input type="hidden" name="serviceName" value="%value serviceName%">
					
					%invoke wx.config.impl.ui:getKeysAvailableForServiceWithGlobalValues%
					%endinvoke%
					 
					<table width=100% class="tableView">
						<tr>
							<td class="heading" colspan=2>
								Target
							</td>
						</tr>
						<tr class="subheading2">
							<td>
								Package
							</td>
							<td>
								Service Name
							</td>
						</tr>
						<tr>
							<td>
								%value showPkg%
							</td>
							<td>
								%value serviceName%
							</td>
						</tr>
					</table>
					
					<p>
					When selecting a checkbox in the "Add" column, the respective value will be added
					to the Service. To have the value added as a list, also check the "Add as List"
					box.<br>
					If multiple values exist for a key, but "Add as List" is not checked,
					the first value will be used. If "Add as List" is checked, but only one value
					exists, it will be returned as a list with only one element in it.
					<p>
					
					<table width=100% class="tableView">					
								
						<tr>
							<td class="heading" colspan=7>Add Configuration Values</td>
						</tr>
						<tr class="subheading2">
							<td class="oddcol"  tdclass="rowdata" sortable="false" type="CaseInsensitiveString" style="cursor: hand;">&nbsp;Used&nbsp;</td>
							<td class="oddcol" width="5%" tdclass="rowdata" sortable="false" type="CaseInsensitiveString" style="cursor: hand;">&nbsp;Add&nbsp;</td>
							<td class="oddcol" width="5%" tdclass="rowdata" sortable="false" type="CaseInsensitiveString" style="cursor: hand;">Add as List</td>
							<td class="oddcol" width="5%" tdclass="rowdata" sortable="false" type="CaseInsensitiveString" style="cursor: hand;">Global Only</td>
							<td class="oddcol-l" width="15%" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Variable&nbsp;</td>
							<td class="oddcol-l" width="10%" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;" id=defaultsort>&nbsp;Key&nbsp;</td>
							<td class="oddcol-l" width="50%" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Value(s)&nbsp;</td>
						</tr>
						<script>resetRows();</script>		 
						%ifvar contents%
							%loop contents%
								<tr>
									<script>writeTD('rowdata');</script>
										%ifvar isUsed equals('true')%
											<IMG SRC="/WmRoot/images/green_check.gif" border="0" height=13 width=13>
										%endifvar%
									</td>
									<script>writeTD('rowdata');</script>
										<input type="checkbox" name="create" value="%value $index%">
									</td>
									<script>writeTD('rowdata');</script>
										<input type="checkbox" name="listFlag" value="%value $index%">
									</td>
									<script>writeTD('rowdata');</script>
										%ifvar isGlobalValue equals('true')%
											<input type="checkbox" name="globalOnlyFlag" value="%value $index%" checked>
											<img src="images/info.png" alt="Global Only Info" border="0" height=13 width=13
												title="If checked, do not try to retrieve value from package first, but go directly to global values"  />
										%endifvar%
									</td>
									<script>writeTD('rowdata-l');writeTextField("variable", "%value variable%", 50, 0, "%value /editMode%");</script>
									</td>
									<script>writeTD('rowdata-l');writeTextField("newKey", "%value key%", 50, 0, "%value /editMode%");</script>
									</td>
									<script>writeTD('row-l');</script>
										%ifvar isGlobalValue equals('true')%
											<img src="images/globalValues.gif" alt="Global Value" title="Global Value" border="0" />
										%endifvar%
										%loop valueList%
											%value% <br> 
										%end%
									</td>
									<script>swapRows();</script>
							%endloop%
						%else%
							<tr>
								<td class="oddrowdata" colspan=7>
									There are no values available.
								</td>
							</tr>
						%endifvar%
						<tr>
							<td class="action" colspan="7">
								<input type="submit" value="Create/Update Service"> <span style="letter-spacing:1px;color:#000000">(or press CTRL-S to save)</span>
							</td>
						</tr>   
					</table>
				</form>
					
			
			%else%  <!-- Invalid service -->
				<form name="saveForm" method="post" action="configFlowService.dsp" target="_self">
					<input type="hidden" name="editMode" value="NEW">
					<table width=100% class="tableView">
						<tr>
							<td class="heading" colspan=2>Error</td>
						</tr>
						<tr>
							<td class="error-small">
								
							
								Invalid service specified : %value serviceName% does not exist
							</td>
						</tr>
						<tr>
							<td class="action" colspan="2">
								<input type="submit" value="Go Back">
							</td>
						</tr>
					</table>
				</form>
			%endifvar%
		</table>
	</body> 
</html> 
