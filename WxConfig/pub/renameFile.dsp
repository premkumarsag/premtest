<html>
	<head>
		<title>Rename Configuration File</title> 
		%include snippets/htmlHeadDefaults.dsp%
		
		<script>
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

	<body onLoad="setNavigation('about.dsp', 'help.dsp');">
		%include snippets/headerUpdates.dsp%
		
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb" colspan=6>
					Rename File
				</td>
			</tr>
		
			%invoke wx.config.impl.admin:removeDeletedConfigFileFromConfiguration%
				%ifvar message%
					<tr><td colspan="4">&nbsp;</td></tr>
					<TR><TD class="info" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message%</TD></TR>
					<tr><td><img src="images/blank.gif" height=10 width=10></td></tr>
					<tr>
						<td colspan=2>         
							<ul>
								<li>
									<a href="listFiles.dsp">Up One Level...</a>
								</li>
							</ul>
						</td>
					</tr>
				%else%
					%invoke wx.config.impl.util.file:getFile%
					%onerror%
						%include /snippets/error.dsp%
					%endinvoke wx.config.impl.util.file:getFile%
					
					%invoke wx.config.impl.admin:getIncludeForConfigFile%
					%onerror%
						%include /snippets/error.dsp%
					%endinvoke wx.config.impl.admin:getIncludeForConfigFile%
					<tr>
						<td colspan=2>
							<ul>
								<li>
									<a href="listFiles.dsp">Up One Level...</a>
								</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td><img src="images/blank.gif" height=10 width=10></td>
					</tr>
					<tr>
						<td>
							<table class="tableView" width="100%">
						<tr>
							<td class="heading" colspan=2>Rename File</td>
						</tr>
						<tr class="subheading2">
							<td>
								<br>
								<form method="post" action=
									%ifvar targetPage%
										"%value targetPage%"
									%else%
										"listFiles.dsp"
									%endifvar%
									target="_self">
									<input type="hidden" name="fileNameWithPath" value="%value /fileNameWithPath%">
									<input type="hidden" name="package" value="%value /package%"> <!-- Needed for wx.config.impl.ui:deleteCfgFile called from listFiles.dsp-->
									<input type="hidden" name="showPkg" value="%value /showPkg%"> <!-- Used by listFiles.dsp to only show packages from -->
									<input type="hidden" name="action" value="rename">
									<input type="submit" value="Rename File">
								
								
							</td>
							<td style="text-align:left;">
								<b>%value fileNameWithPath%</b>
							</td>
						</tr>
								<tr>
									<script>writeTD('rowdata-l');</script>
										New Name
									</td>
									<script>writeTD('row-l');swapRows();</script>
										<script>writeInputFieldWithId("newFileName","newFileName", "%value newFileName%", 30, "EDIT");</script>
									</td>
								</tr>
								</form>
								<tr>
									<script>writeTD('rowdata-l');</script>
										Package
									</td>
									<script>writeTD('row-l');swapRows();</script>
										%value package%
									</td>
								</tr>
								%ifvar includeKey%
									
									<tr>
										<script>writeTD('rowdata-l');</script>
											Include
										</td>
										<script>writeTD('row-l');swapRows();</script>
											%value includeKey% = %value includeValue%
										</td>
									</tr>
								%endifvar%
								<tr>
									<script>writeTD('rowdata-l');</script>
										Other Files in Package
									</td>
									<script>writeTD('row-l');swapRows();</script>
										%rename package showPkg -copy% 
										%invoke wx.config.impl.ui:getConfigFiles%
											%loop configFiles%
												%value relativePath%<br>
											%endloop%
										%endinvoke wx.config.impl.ui:getConfigFiles%
									</td>
									</td>
								</tr>
								<tr>
									<script>writeTD('rowdata-l');</script>
										Content
									</td>
									<script>writeTD('row-l');swapRows();</script>
									<pre>%value fileContent%
									</pre>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				%endif%
			%endinvoke wx.config.impl.admin:removeDeletedConfigFileFromConfiguration%
		</table>
		<script>document.getElementById("newFileName").focus();</script>
	</body>
</html>
