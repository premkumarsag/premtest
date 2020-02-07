<html>

	<head>
    	<title>View File</title> 
    	%include snippets/htmlHeadDefaults.dsp%
		%include snippets/htmlHeadAce.dsp%
	</head>
	<!-- Check if MyVersions plugin is activated -->
	%include snippets/plugins/myversions/checkMyVersionsPluginStatus.dsp%
	
	<body>
		%include snippets/headerUpdates.dsp%
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb">
					View File
				</td>
			</tr>
		
				
			%include snippets/invokeSaveFileAfterEdit.dsp%
				
			%invoke wx.config.impl.util.file:getFile%
				%onerror%
					%include /snippets/error.dsp%
			%endinvoke%
	
			<tr>
				<td colspan=3>
					<ul class="listitemsplain">
						<li> <a href="showValues.dsp?showPkg=%value package%">Show values of package %value package%</a></li>
						<li> <a href="listFiles.dsp?package=%include snippets/configFileOptionalParams.dsp%">Show files of package %value package%</a></li>
						%ifvar /calledFromAutoSetup%
							%ifvar /calledFromAutoSetup equals('true')%
								<li> <a href="autoSetup.dsp?calledFromAutoSetup=true">Back to Auto-Setup</a></li>
							%endifvar%
						%endifvar%
					</ul>
				</td>
			</tr>
		</table>
			
		<table width="100%" class="tableView">
			<tr>
				<td class="heading">%value fileNameWithPath%</td>
			</tr>
			<tr>
				<td>
					<form method="post" action="editFile.dsp" target="_self">
						<input type="hidden" name="fileNameWithPath" value="%value /fileNameWithPath%">
						<input type="hidden" name="mode" value="edit">
						<input type="hidden" name="package" value="%value package%">
						<input type="submit" value="Edit File">
						<INPUT type="hidden" name="showPkg" value="%value showPkg%">
						<INPUT type="hidden" name="targetPage" value="encryptedValues.dsp">
						<INPUT type="hidden" name="isInPassmanFilter" value="%value isInPassmanFilter%">
						<INPUT type="hidden" name="type" value="%value type%">
						%ifvar /fileNameFilter%
							<input type="hidden" name="fileNameFilter" value="%value /fileNameFilter%"  >
						%endifvar%
						%ifvar /stageDetailFilter%
							<input type="hidden" name="stageDetailFilter" value="%value /stageDetailFilter%"  >
						%endifvar%
						%ifvar /calledFromAutoSetup%
							%ifvar /calledFromAutoSetup equals('true')%
								<input type="hidden" name="calledFromAutoSetup" value="true">
							%endifvar%
						%endifvar%
						%ifvar /calledFromEncryptedValues%
							%ifvar /calledFromEncryptedValues equals('true')%
								<input type="hidden" name="calledFromEncryptedValues" value="true">
							%endifvar%
						%endifvar%
						%ifvar targetPage%
							<input type="hidden" name="targetPage" value="%value targetPage%"  >
						%endifvar%
					</form>
				</td>
			</tr>
			<tr>
				<td class="oddrow-l" colspan=2>
					<div id="editor">%value fileContent%</div>
					<script>setReadOnly();</script>
				</td>
			</tr>
		</table>
		<p>
		%include snippets/displayHostAndPort.dsp%
	</body>
</html>
