<html> 

	<head>
		<title>Auditing</title>
		%include snippets/htmlHeadDefaults.dsp%
		%include snippets/htmlHeadAce.dsp%
		%include snippets/htmlHeadJquery.dsp%
		
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
	%include snippets/headerUpdates.dsp%
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb">
					Logging &gt; Auditing
				</td>
			</tr>
			<!-- Create new file? -->
			%include snippets/invokeCreateConfigFile.dsp%

			<!-- Delete operation? -->
			%include snippets/invokeDeleteConfigFile.dsp%

			<!-- Save changes -->
			%include snippets/invokeSaveFileAfterEdit.dsp%

			<!-- Special handling needed for default configuration -->
			%ifvar action equals('change')%
				%ifvar package equals('*default')%
					%invoke wx.config.impl.auditing:reloadDefaultAuditCfg%
					%endinvoke%
				%endifvar%
			%endifvar%
			
			%invoke wx.config.impl.auditing:getAllAuditCfgs%
			%endinvoke%
	
			<tr>
				<td colspan=3>
					<ul class="listitemsplain">
						<li>
							<a href="createConfigFile.dsp?newConfigFileName=audit.xml&
								&templateFileName=%value /ui/auditing/pathTemplate%&editMode=NEW&linkBack=audit.dsp
								&skipCheckIsPackageUsingWxConfig=true
								&disableTemplate=true
								&targetPage=audit.dsp
								&disableGlobalValues=true">
									Create new audit configuration
							</a>
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
		</table>
	
		<table class="tableView">
			<tr>
				<td class="heading" colspan=10>Available Audit Configurations</td>
			</tr>
			<tr class="subheading2">
				<td class="oddcol-l">Package</td>
				<td class="oddcol-l">Enabled</td>
				<td class="oddcol">Log Dir</td>
				<td class="oddcol">Archiving Enabled</td>
				<td class="oddcol">Target Dir</td>
				<td class="oddcol">Days Aggregate</td>
				<td class="oddcol">Days Delete</td>
				<td class="oddcol">Delete</td>
				<td class="oddcol">Edit</td>
				<td class="oddcol">Config File</td>
			</tr>
			%loop auditCfgs%
				<tr>
					<script>writeTD('rowdata-l');</script>
						%value cfgId%
					</td>
					<script>writeTD('rowdata');</script>
						%ifvar enabled equals('true')%
							Yes
						%else%
							No
						%endifvar%
					</td>
						
					<script>writeTD('row-l');</script>
						%value logDir%
					</td>
					<script>writeTD('rowdata');</script>
						%ifvar archiving/enabled equals('true')%
							Yes
						%else%
							No
						%endifvar%
					</td>
					<script>writeTD('row-l');</script>
						%value archiving/targetDir%
					</td>
					<script>writeTD('rowdata');</script>
						%value archiving/retentionPeriod/aggregate%
					</td>
					<script>writeTD('rowdata');</script>
						%value archiving/retentionPeriod/delete%
					</td>
					<script>writeTD('rowdata');</script>
						<a href="deleteFile.dsp?fileNameWithPath=%value cfgFilePath encode(url)%
								&package=%value cfgId%
								&linkBack=audit.dsp
								&targetPage=audit.dsp
								&calledFromAuditing=true
								&isMissing=false
							">
								<img src="/WmRoot/icons/delete.gif" alt="Delete" Title="Delete File" border="0" />
						</a>
					</td>
					<script>writeTD('rowdata');</script>
						
						<a href="editFile.dsp?fileNameWithPath=%value cfgFilePath encode(url)%&package=
								%include snippets/configFileOptionalParams.dsp%
								&targetPage=audit.dsp
								&hideConfigFileInfo=true
								&calledFromAuditing=true
								&type=XML
							">
								<img src="/WmRoot/icons/file.gif" alt="Edit" title="Edit" border="0" />
						</a>
					</td>
					<script>writeTD('rowdata');</script>
						%value cfgFilePath%
					</td>
					<script>swapRows();</script>
				</tr>
			%endloop%		
		</table>
		%ifvar actionMode equals('EDIT')%
			<script>document.getElementById("fileLocationPath").focus();</script>
		%endifvar%
	</body> 
</html> 

