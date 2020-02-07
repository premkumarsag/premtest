<html> 
	<head>
		<title>Settings - File Locations</title>
		%include snippets/htmlHeadDefaults.dsp%
		%include snippets/htmlHeadJquery.dsp%
		%include snippets/htmlHeadAce.dsp%
		
		<script type="text/javascript">
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
		</script>
	</head> 

	<body>
		<table width=100%>
		%ifvar actionMode equals('ADD')%
			%invoke wx.config.impl.location:addAlias%
				%ifvar message%
					%ifvar success equals('true')%
						<tr>
							<td class="success"><pre>%value message%</pre></td>
						</tr>
					%else%
						<tr>
							<td class="error"><pre>%value message%</pre></td>
						</tr>
					%endifvar%
				%else%
					<script>parent.menu.treeRefreshButton.click();</script>
				%endifvar%   
					%onerror%
						%include snippets/error.dsp%
			%endinvoke%
		%endifvar%
		
		%ifvar actionMode equals('EDITSAVE')%
			%invoke wx.config.impl.location:editAlias%
				%ifvar message%
					%ifvar success equals('true')%
						<tr>
							<td class="success"><pre>%value message%</pre></td>
						</tr>
					%else%
						<tr>
							<td class="error"><pre>%value message%</pre></td>
						</tr>
					%endifvar%
				%else%
					<script>parent.menu.treeRefreshButton.click();</script>
				%endifvar%   
					%onerror%
						%include snippets/error.dsp%
			%endinvoke%
		%endifvar%
		
		%ifvar actionMode equals('DELETE')%
			%invoke wx.config.impl.location:deleteAlias%
				%ifvar message%
					%ifvar success equals('true')%
						<tr>
							<td class="success"><pre>%value message%</pre></td>
						</tr>
					%else%
						<tr>
							<td class="error"><pre>%value message%</pre></td>
						</tr>
					%endifvar%
				%else%
					<script>parent.menu.treeRefreshButton.click();</script>
				%endifvar%   
					%onerror%
						%include snippets/error.dsp%
			%endinvoke%
		%endifvar%
		</table>
		
		%invoke wx.config.impl.location:getAvailableAliasesWithValues%
		%endinvoke%
		
		%include snippets/headerUpdates.dsp%
			<table width=100% cellspacing=0 cellpadding=0>
				<tr>
					<td class="breadcrumb" colspan=6>
						Settings &gt; File Locations
					</td>
				</tr>
				<tr>
					<td>
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
			</table>

			<table width=100%>
				
				<tr>
					<td>
						<table class="tableView">
							<tr>
								<td class="heading" colspan=6>Available File Locations</td>
							</tr>
							<tr class="subheading2">
								<td class="oddcol-l">Alias</td>
								<td class="oddcol-l">Path</td>
								<td class="oddcol">Delete</td>
								<td class="oddcol">Edit</td>
								<td class="oddcol">Description</td>
								<td class="oddcol">Using Files</td>
							</tr>
							%loop aliasList%
								<tr>
									<script>writeTD('rowdata-l');</script>
										%value @name%
									</td>
									<script>writeTD('rowdata-l');</script>
										%ifvar isValid equals('false')%
											<IMG SRC="images/dependency.gif" border="0" height=14 width=14 alt="Location invalid" title="Location invalid">
										%endifvar%
										%value value%
									</td>
										
									<script>writeTD('rowdata');</script>
										%ifvar canBeDeleted equals('true')%
											<a href="settingsFileLocations.dsp?actionMode=DELETE&alias=%value @name%"> 
												<img src="/WmRoot/icons/delete.gif" title="Delete" alt="Delete" border="0"/>
											</a>
										%endifvar%
									</td>
									<script>writeTD('rowdata');</script>
										%ifvar canBeEdited equals('true')%
											<a href="settingsFileLocations.dsp?actionMode=EDIT
													&fileLocationAlias=%value @name%
													&fileLocationPath=%value value%
													&fileLocationDescription=%value description%"> 
												<img src="/WmRoot/icons/file.gif" alt="Edit" title="Edit" border="0" />
											</a>
										%endifvar%
									</td>
									<script>writeTD('row-l');</script>
										%value description%
									</td>
									<script>writeTD('row-l');</script>
										%loop files%
											%rename path fileNameWithPathRelative -copy%
											%rename canonicalPath fileNameWithPath -copy%
											%rename cfgId pkgID -copy%
											%include snippets/configFileWithLink.dsp% (<b>%value cfgId%</b>)<br>
										%endloop%
									</td>
									<script>swapRows();</script>
								</tr>
							%endloop%
							<tr>
								<td style="border: none;">
									<img src="images/blank.gif" height=10 width=10>
								</td>
							</tr>
							<tr>
								<td style="border: none;" colspan="6">
									Please note that the above settings are maintained outside the WxConfig package. 
									They are sitting in the Integration Server's configuration directory
									(%value ui/path/serverConfigDir%), where there
									is a separate directory for all WxConfig-related settings that are stored outside
									the package. The main rationale for this is that package updates do not override
									changes you have made.
								</td>
							</tr>
							
							<tr>
								<td style="border: none;">
									<img src="images/blank.gif" height=10 width=10>
								</td>
							</tr>
							%invoke wx.config.impl.location:getUndefinedAliases%
							%endinvoke%
							%ifvar undefinedAliases%
								<table class="tableView" width="100%">
									<tr>
										<td class="heading" colspan=3>Undefined File Locations</td>
									</tr>
									<tr class="subheading2">
										<td class="oddcol-l">Alias</td>
										<td class="oddcol">Using Files</td>
										<td class="oddcol">Define</td>
									</tr>
									
									%loop undefinedAliases%
										<tr>
											<script>writeTD('rowdata-l');</script>
												%value @name%
											</td>
											<script>writeTD('row-l');</script>
												%loop files%
													%rename path fileNameWithPathRelative -copy%
													%rename canonicalPath fileNameWithPath -copy%
													%rename cfgId pkgID -copy%
													%include snippets/configFileWithLink.dsp% (<b>%value cfgId%</b>)<br>
												%endloop%
											</td>
											<script>writeTD('rowdata-l');</script>
												<a href="settingsFileLocations.dsp?actionMode=ADDUNDEF
														&fileLocationAlias=%value @name%
														&fileLocationPath=%value value%"> 
													<img src="images/configure.gif" alt="Create" title="Create" border="0" />
												</a>
											</td>
											<script>swapRows();</script>
										</tr>
									%endloop%
								</table>
							%else%
								<tr>
									<td class="success" style="text-indent: 40px; height: 50px;"colspan=2>All used file locations are defined on this system</td>
								</tr>
							%endifvar%
							<tr>
								<td style="border: none;">
									<img src="images/blank.gif" height=10 width=10>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				%ifvar ui/license/isFeatureLicensed/locationAlias equals('true')%
					<tr>
						<td>
							%scope param(defaultChoice='on')%
							<form name="saveForm" method="post" action="settingsFileLocations.dsp" 
								target="_self"> 
								<input type="hidden" name="editMode" value="NEW" />
								%ifvar actionMode equals('EDIT')%
										<input type="hidden" name="actionMode" value="EDITSAVE" />
										<input type="hidden" name="fileLocationAlias" value="%value fileLocationAlias%" />
									%else%
										<input type="hidden" name="actionMode" value="ADD" />
										%ifvar actionMode equals('ADDUNDEF')%
											<input type="hidden" name="fileLocationAlias" value="%value fileLocationAlias%" />
										%endifvar%
									%endifvar%
									
								
								<table width="100%" class="tableView">
								
							
								<tr>
									<td class="heading" colspan=3>
										%ifvar actionMode equals('EDIT')%
											Edit File Location
										%else%
											New File Location
										%endifvar%
									</td>
								</tr>

								<tr>
									<script>writeTD('row');</script>
										Alias
									</td>
									<script>writeTD('row-l');</script>
										%ifvar actionMode equals('EDIT')%
											<script>writeInputFieldWithId("fileLocationAlias","fileLocationAlias", "%value fileLocationAlias%", 60, "");</script>
										%else%
											%ifvar actionMode equals('ADDUNDEF')%
												<script>writeInputFieldWithId("fileLocationAlias","fileLocationAlias", "%value fileLocationAlias%", 60, "");</script>
											%else%
												<script>writeInputFieldWithId("fileLocationAlias","fileLocationAlias", "", 60, "EDIT");</script>
											%endifvar%
										%endifvar%
									</td>
									<script>writeTD('row-l');</script>
										Logical Name to Access File Location
									</td>
									<script>swapRows();</script>
								</tr>
								
								<tr>
									<script>writeTD('row');</script>
										Path
									</td>
									<script>writeTD('row-l');</script>
										%ifvar actionMode equals('EDIT')%
											<script>writeInputFieldWithId("fileLocationPath","fileLocationPath", "%value fileLocationPath%" , 100, "EDIT");</script>
										%else%
											%ifvar actionMode equals('ADDUNDEF')%
												<script>writeInputFieldWithId("fileLocationPath","fileLocationPath", "%value fileLocationPath%" , 100, "EDIT");</script>
												<script>document.getElementById("fileLocationPath").focus();</script>
											%else%
												<script>writeInputFieldWithId("fileLocationPath","fileLocationPath", "" , 100, "EDIT");</script>
											%endifvar%
										%endifvar%
									</td>
									<script>writeTD('row-l');</script>
										Path that is referenced by alias. This value is environment-specific and not maintained within a package but on Integration Server
									</td>
									<script>swapRows();</script>
								</tr>
								
									<script>writeTD('row');</script>
										Description
									</td>
									<script>writeTD('row-l');</script>
										%ifvar actionMode equals('EDIT')%
											<script>writeInputFieldWithId("fileLocationDescription","fileLocationDescription", "%value fileLocationDescription%" , 100, "EDIT");</script>
										%else%
											%ifvar actionMode equals('ADDUNDEF')%
												<script>writeInputFieldWithId("fileLocationDescription","fileLocationDescription", "%value fileLocationDescription%" , 100, "EDIT");</script>
											%else%
												<script>writeInputFieldWithId("fileLocationDescription","fileLocationDescription", "" , 100, "EDIT");</script>
											%endifvar%
										%endifvar%
									</td>
									<script>writeTD('row-l');</script>
										What is alias used for?
									</td>
									<script>swapRows();</script>
								</tr>
									
								<tr>
									<td class="action" colspan="3">
										<input type="submit" value="Save">
									</td>
								</tr>
							</table>
						</form>
						%endscope%
					</td>
				</tr>
			%else%
				<tr>
					<td class="info">
						Location Aliases are not licensed. Therefore it is not possible to add new aliases to 
						the above list of built-in aliases. Also, the list of files using those built-in
						aliases is pre-defined, no custom files can be added.<p>
						Files needed for WxConfig to work correctly are on a whitelist and work without
						a license for file locations. All other files will be ignored and an error 
						(code "0002:0020") send	to the log file.
					</td>
				</tr>
				
			%endifvar%
				
		</table>
		%ifvar actionMode equals('EDIT')%
			<script>document.getElementById("fileLocationPath").focus();</script>
		%endifvar%
	</body> 
</html> 

