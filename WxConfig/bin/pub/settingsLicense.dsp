<html> 
	<head>
		<title>Settings - License</title>
		%include snippets/htmlHeadDefaults.dsp%
		%include snippets/htmlHeadAce.dsp%
		<script type="text/javascript">
			window.onkeypress = function(event) {
					if (event.charCode === 115 && event.ctrlKey) {
						event.preventDefault();
						submit();
					}
					
					function submit(){
						putEditorContentToFileContentVariable();
						document.saveForm.submit();
					}
				};
				
			function refreshMenuFrame()
			{
				top.menu.location.reload();
			}
		</script>
	</head> 

	<body>
		<table width=100%>
			%ifvar actionMode equals('SAVE')%
				%invoke wx.config.impl.ui:settingsLicenseSave%
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
							<tr>
								<td class="info">License changes were not automatically activated 
									to avoid any impact on currently running services. 
									<a href="settingsLicense.dsp?action=rescan"><b>Click here to activate the changes.</b></a> 
									This will likely cause errors for in-flight services.
								</td>
							</tr>
					%else%
						<script>parent.menu.treeRefreshButton.click();</script>
					%endifvar%   
						%onerror%
							%include snippets/error.dsp%
				%endinvoke%
				<script>refreshMenuFrame();</script>
			%endifvar%
			
			%ifvar action equals('rescan')%
				%include snippets/invokeReloadAllCfgs.dsp%
			%endif%
		</table>

		%invoke wx.config.impl.ui:settingsLicenseGet%
		%endinvoke%
		
		%invoke wx.config.impl.license:messageLicenseRetrieval%
		%endinvoke%
	
		%include snippets/headerUpdates.dsp%
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb">
					Settings &gt; License
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
					<form name="saveForm" method="post" action="settingsLicense.dsp" 
						onSubmit="putEditorContentToFileContentVariable();" target="_self"> 
						<input type="hidden" name="editMode" value="NEW" />
						<input type="hidden" name="actionMode" value="SAVE" />
						<input type="hidden" name="fileContent" value=""  >
						
						<table width="100%" class="tableView">
							<tr>
								<td class="heading" colspan=2>License</td>
							</tr>
							<tr>
								<script>writeTD('row-l');</script>
									<pre id="editor">%value fileContent%</pre>
								</td>
								
								<script>swapRows();</script>
							</tr>
							<tr>
								<td class="action" colspan="3">
									<input type="submit" value="Save"> <span style="letter-spacing:1px;color:#000000">(or press CTRL-S to save)</span>
								</td>
							</tr>   
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td colspan=4 >
					License is stored in <b>%value fileNameWithPath%</b>
				</td>
			</tr>
				<tr>
					<td>
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
			<tr>
				<td colspan=4 class="rowdata">
					<b>%value messageLicenseRetrieval%</b>
					%ifvar linkLicenseRetrieval%
						<a href="%value linkLicenseRetrieval%" target="_blank">%value linkLicenseRetrieval%</a>
					%endifvar%
				</td>
			</tr>
		</table>
	</body> 
</html> 

