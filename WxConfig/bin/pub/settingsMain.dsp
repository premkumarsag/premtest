<html> 
	<head>
		<title>Settings - Main</title>
		%include snippets/htmlHeadDefaults.dsp%
		%include snippets/htmlHeadJquery.dsp%
		%include snippets/htmlHeadAce.dsp%

		<script type="text/javascript">
			function enableOrDisableUpdateCredentialsInputs(authenticationType) {
				if (authenticationType == "anonymous") {
					disableUpdateCredentialsInputs();
				} else {
					enableUpdateCredentialsInputs();
				}
			}
			
			
			function enableUpdateCredentialsInputs() {
				$('#updatesUsername').prop('disabled', false);
				$('#updatesPassword').prop('disabled', false);
				$('#updatesPasswordRepeat').prop('disabled', false);
			}
			
			function disableUpdateCredentialsInputs() {
				$('#updatesUsername').prop('disabled', true);
				$('#updatesPassword').prop('disabled', true);
				$('#updatesPasswordRepeat').prop('disabled', true);
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
			
			function onChangeAuthenticationType(dropdown)
			{
				var myindex  = dropdown.selectedIndex
				var authenticationType = dropdown.options[myindex].value
				enableOrDisableUpdateCredentialsInputs(authenticationType);
				return true;
			}
		</script>
	</head> 
	<body>
		<table width=100%>
			%ifvar clearUpdateCheckError equals('true')%
				%invoke wx.config.impl.update:clearUpdateCheckError%
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
				%endivoke%
			%endifvar%
			%ifvar actionMode equals('SAVE')%
				%invoke wx.config.impl.ui:settingsMainSave%
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
				%ifvar checkForUpdatesAfterSave equals('true')%
					%invoke wx.config.impl.update:getLatestVersion%
					%endinvoke%
				%endifvar%
			%endifvar%

		</table>
		%invoke wx.config.impl.ui:settingsMainGet%
		%endinvoke%
	
		%include snippets/headerUpdates.dsp%
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb">
					Configuration &gt; Main
				</td>
			</tr>
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
		</table>

		<form name="saveForm" method="post" action="settingsMain.dsp" 
			onSubmit="putEditorContentsToFileContentVariables();" target="_self"> 
			<input type="hidden" name="editMode" value="NEW" />
			<input type="hidden" name="actionMode" value="SAVE" />
	   
			<table width="100%" class="tableView">
				<tr>
					<td class="heading" colspan=3>General</td>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Show Files and Values of WxConfig
					</td>
					<script>writeTD('row-l');</script>
						%switch showWxConfigFiles%
							%case 'true'%
								<input id="showWxConfigFiles-false" type="radio" name="showWxConfigFiles" value="false" >No</input>
								<input id="showWxConfigFiles-true" type="radio" name="showWxConfigFiles" value="true" checked>Yes</input>
							%case 'false'%
								<input id="showWxConfigFiles-false" type="radio" name="showWxConfigFiles" value="false" checked>No</input>
								<input id="showWxConfigFiles-true" type="radio" name="showWxConfigFiles" value="true" >Yes</input>
							%case%
								<input id="showWxConfigFiles-false" type="radio" name="showWxConfigFiles" value="false" >No</input>
								<input id="showWxConfigFiles-true" type="radio" name="showWxConfigFiles" value="true" >Yes</input>
							%end%
					</td>
					<script>writeTD('row-l');</script>
						Allows users to hide things from WxConfig
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Config Values Document
					</td>
					<script>writeTD('row-l');</script>
						<script>writeInputFieldWithId("addToFlowSvcResultDocName","addToFlowSvcResultDocName", "%value addToFlowSvcResultDocName%", 30, "EDIT");</script>
					</td>
					<script>writeTD('row-l');</script>
						Name of IS document that gets created by "Config To Flow Service"
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Show Date/Time of Last File Change
					</td>
					<script>writeTD('row-l');</script>
						%switch showFileLastChangeDateTime%
							%case 'true'%
								<input id="showFileLastChangeDateTime-false" type="radio" name="showFileLastChangeDateTime" value="false" >No</input>
								<input id="showFileLastChangeDateTime-true" type="radio" name="showFileLastChangeDateTime" value="true" checked>Yes</input>
							%case 'false'%
								<input id="showFileLastChangeDateTime-false" type="radio" name="showFileLastChangeDateTime" value="false" checked>No</input>
								<input id="showFileLastChangeDateTime-true" type="radio" name="showFileLastChangeDateTime" value="true" >Yes</input>
							%case%
								<input id="showFileLastChangeDateTime-false" type="radio" name="showFileLastChangeDateTime" value="false" >No</input>
								<input id="showFileLastChangeDateTime-true" type="radio" name="showFileLastChangeDateTime" value="true" >Yes</input>
							%end%
					</td>
					<script>writeTD('row-l');</script>
						Allows users to gain space for other columns in the file list
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Show Path For Alias Files
					</td>
					<script>writeTD('row-l');</script>
						%switch showPathForAliasFiles%
							%case 'true'%
								<input id="showPathForAliasFiles-false" type="radio" name="showPathForAliasFiles" value="false" >No</input>
								<input id="showPathForAliasFiles-true" type="radio" name="showPathForAliasFiles" value="true" checked>Yes</input>
							%case 'false'%
								<input id="showPathForAliasFiles-false" type="radio" name="showPathForAliasFiles" value="false" checked>No</input>
								<input id="showPathForAliasFiles-true" type="radio" name="showPathForAliasFiles" value="true" >Yes</input>
							%case%
								<input id="showPathForAliasFiles-false" type="radio" name="showPathForAliasFiles" value="false" >No</input>
								<input id="showPathForAliasFiles-true" type="radio" name="showPathForAliasFiles" value="true" >Yes</input>
							%end%
					</td>
					<script>writeTD('row-l');</script>
						Should local path ("yes") or alias ("no") be shown in file lists, for files that are included via a location alias
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<td style="border: none;">
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
				
				
				
				
				<tr>
					<td class="heading" colspan=3>Updates</td>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Scheduled Check for Updates
					</td>
					<script>writeTD('row-l');</script>
						%switch enableCheckForUpdates%
							%case 'true'%
								<input id="enableCheckForUpdates-false" type="radio" name="enableCheckForUpdates" value="false">No</input>
								<input id="enableCheckForUpdates-true" type="radio" name="enableCheckForUpdates" value="true" checked>Yes</input>
							%case 'false'%
								<input id="enableCheckForUpdates-false" type="radio" name="enableCheckForUpdates" value="false" checked>No</input>
								<input id="enableCheckForUpdates-true" type="radio" name="enableCheckForUpdates" value="true">Yes</input>
							%case%
								<input id="enableCheckForUpdates-false" type="radio" name="enableCheckForUpdates" value="false">No</input>
								<input id="enableCheckForUpdates-true" type="radio" name="enableCheckForUpdates" value="true">Yes</input>
						%end%
					</td>
					<script>writeTD('row-l');</script>
						Automatically check for new release of WxConfig. Even if turned off, you can always 
						<a href="about.dsp?actionMode=updateCheck" target="_self">check manually</a>
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Check for Updates after Save
					</td>
					<script>writeTD('row-l');</script>
						<input id="checkForUpdatesAfterSave-false" type="radio" name="checkForUpdatesAfterSave" value="false" checked>No</input>
						<input id="checkForUpdatesAfterSave-true" type="radio" name="checkForUpdatesAfterSave" value="true" >Yes</input>
					</td>
					<script>writeTD('row-l');</script>
						Check for new release of WxConfig after pressing the "Save" button below.
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Channel
					</td>
					<script>writeTD('row-l');</script>
						%invoke wx.config.impl.update.channels:getAvailableChannels%
							%onerror%
							  %include /snippets/error.dsp%
						%endinvoke%
						<select  id="channelId" name="channelId" >
							%loop channelList/channel%
								<option value="%value @id%" 
								%ifvar @id vequals(../../channelId)%
									selected
								%endifvar%
								>%value name%</option>
							%endloop%
						</select>
					</td>
					<script>writeTD('row-l');</script>
						Pre-defined channel for getting updates (added to base URL)
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Base URL
					</td>
					<script>writeTD('row-l');</script>
						<script>writeInputFieldWithId("updatesURL","updatesURL", "%value updatesURL%", 150, "EDIT");</script>
					</td>
					<script>writeTD('row-l');</script>
						Location of updates; do not change unless you want to run your own update server.
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Authentication Type
					</td>
					<script>writeTD('row-l');</script>
						%invoke wx.config.impl.update:getAvailableAuthenticationTypes%
							%onerror%
							  %include /snippets/error.dsp%
						%endinvoke%
						<select  id="updatesAuthenticationType" name="updatesAuthenticationType" onchange='onChangeAuthenticationType(this);'>
							%loop availableAuthenticationTypes%
								<option value="%value availableAuthenticationTypes%" 
								%ifvar availableAuthenticationTypes vequals(updatesAuthenticationType)%
									selected
								%endifvar%
								>%value availableAuthenticationTypes%</option>
							%endloop%
						</select>
						%ifvar updatesAuthenticationType equals('anonymous')%
							<script>disableUpdateCredentialsInputs();</script>
						%else%
							<script>enableUpdateCredentialsInputs();</script>
						%endifvar%
					</td>
					<script>writeTD('row-l');</script>
						Authentication type used to check for updates
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Username
					</td>
					<script>writeTD('row-l');</script>
						<script>writeInputFieldWithId("updatesUsername","updatesUsername", "%value updatesUsername%", 30, "EDIT");</script>
					</td>
					<script>writeTD('row-l');</script>
						Username for HTTP basic authentication against URL
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Password
					</td>
					<script>writeTD('row-l');</script>
						<script>writeInputFieldWithId("updatesPassword","updatesPassword", "", 30, "EDIT", true);</script> 
						%invoke wx.config.impl.update:isPasswordDefined%
							%ifvar isPasswordDefined equals('true')%
								<IMG SRC="/WmRoot/images/green_check.gif" border="0" height=13 width=13>
								Password already set. Provide values to update, otherwise leave empty.
							%else%
								<IMG SRC="/WmRoot/icons/delete.gif" border="0" height=13 width=13>
								Password not set. You need to provide values to check for updates.
							%endifvar%
						%endinvoke wx.config.impl.update:isPasswordDefined%
					</td>
					<script>writeTD('row-l');</script>
						Password for HTTP basic authentication against URL
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Password (repeat)
					</td>
					<script>writeTD('row-l');</script>
						<script>writeInputFieldWithId("updatesPasswordRepeat","updatesPasswordRepeat", "", 30, "EDIT", true);</script>
						(Password will be stored encrypted in Password Manager)
					</td>
					<script>writeTD('row-l');</script>
						Repeated Password for HTTP basic authentication against URL
					</td>
					<script>swapRows();</script>
				</tr>
				%ifvar enableCheckForUpdates equals('true')%
					<script>doEnableUpdateInputs();</script>
				%else%
					<script>doDisableUpdateInputs();</script>
				%endifvar%
			
				<tr>
					<td class="action" colspan="3">
						<input type="submit" value="Save">
					</td>
				</tr>
			</table>
		</form>
	</body> 
</html> 

