<html> 

		<title>Settings - Environment</title>
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
			
			function refreshTopFrame()
			{
				top.topmenu.location.reload();
			}
		</script>
	</head> 

	<body>
		<table width=100%>
			%ifvar actionMode equals('SAVE')%
				%invoke wx.config.impl.ui:settingsEnvironmentSave%
					%include snippets/successAndMessage.dsp%
				%endinvoke%
				<script>refreshTopFrame();</script>
			%endifvar%
			
			%ifvar actionMode equals('DELETE')%
				%invoke wx.config.impl.environment:deleteEnvironmentType%
					%include snippets/successAndMessage.dsp%
				%endinvoke%
				<script>refreshTopFrame();</script>
			%endifvar%
			
			%ifvar actionMode equals('SYNC_CC')%
				%invoke wx.config.impl.central:copySettingsFromCceCfg%
					%include snippets/successAndMessage.dsp%
				%endinvoke%
			%endifvar%
			
			%ifvar actionMode equals('SYNC_ENVS')%
				%invoke wx.config.impl.central:copyEnvsFromCce%
					%include snippets/successAndMessage.dsp%
				%endinvoke%
			%endifvar%
			
			%ifvar actionMode equals('ENABLE_CC')%
				%invoke wx.config.impl.central:enableCce%
					%include snippets/successAndMessage.dsp%
				%endinvoke%
			%endifvar%
			
			%ifvar actionMode equals('DISABLE_CC')%
				%invoke wx.config.impl.central:disableCce%
					%include snippets/successAndMessage.dsp%
				%endinvoke%
			%endifvar%
		</table>
		
		%invoke wx.config.impl.ui:settingsEnvironmentGet%
		%endinvoke%
		
		<!-- Needs default values from invocation of wx.config.impl.ui:settingsEnvironmentGet -->
		<script type="text/javascript">
			function onChangeEnvironmentType(dropdown)
			{
				var myindex  = dropdown.selectedIndex
				var environmentType = dropdown.options[myindex].value
				if (environmentType == "%value defaults/wxConfigEnvironmentType%") {
					$('#wxConfigEnvironmentNameForUI').val("%value defaults/wxConfigEnvironmentNameForUI%")
					$('#wxConfigEnvironmentCommentText').val("%value defaults/wxConfigEnvironmentCommentText%")
					$('#wxConfigEnvironmentCommentUrl').val("%value defaults/wxConfigEnvironmentCommentUrl%")
					$('#wxConfigEnvironmentCssFontSize').val("%value defaults/wxConfigEnvironmentCssFontSize%")
					$('#wxConfigEnvironmentCssColorFont').val("%value defaults/wxConfigEnvironmentCssColorFont%")
					$('#wxConfigEnvironmentCssColorBackground').val("%value defaults/wxConfigEnvironmentCssColorBackground%")
				} else {
					$('#wxConfigEnvironmentNameForUI').val($('#wxConfigEnvironmentType').val())
				}
				return true;
			}
		</script>	
		
		%include snippets/headerUpdates.dsp%
			<table width=100% cellspacing=0 cellpadding=0>
				<tr>
					<td class="breadcrumb">
						Settings &gt; Environment
					</td>
				</tr>
				<tr>
					<td>
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
			</table>
			<form name="saveForm" method="post" action="settingsEnvironment.dsp" 
				target="_self"> 
				<input type="hidden" name="editMode" value="NEW" />
				<input type="hidden" name="actionMode" value="SAVE" />
				
				<table width="100%" class="tableView">
				<tr>
					<td class="heading" colspan=3>Current Machine's Settings</td>
				</tr>
				<script>resetRows();</script>
				<tr>
					<script>writeTD('row');</script>
						Environment
					</td>
					<script>writeTD('row-l');</script>
						%invoke wx.config.impl.environment:getAvailableEnvironmentTypes%
							%onerror%
							  %include /snippets/error.dsp%
						%endinvoke%
						<select  id="wxConfigEnvironmentType" name="wxConfigEnvironmentType" onchange='onChangeEnvironmentType(this);'>
							<option value="%value defaults/wxConfigEnvironmentType%">- Select -</option>
							%loop envTypeList%
								<option value="%value%" 
								%ifvar envTypeList vequals(/wxConfigEnvironmentType)%
									selected
								%endifvar%
								>%value%</option>
							%endloop%
						</select>
					</td>
					<script>writeTD('row-l');</script>
						Environment type of this system
					</td>
					<script>swapRows();</script>
				</tr>
				
				<tr>
					<script>writeTD('row');</script>
						Display Name
					</td>
					<script>writeTD('row-l');</script>
						<script>writeInputFieldWithId("wxConfigEnvironmentNameForUI","wxConfigEnvironmentNameForUI", "%value wxConfigEnvironmentNameForUI%", 50, "EDIT");</script>
					</td>
					<script>writeTD('row-l');</script>
						Name of environment shown in UI
					</td>
					<script>swapRows();</script>
				</tr>
				
				<tr>
					<script>writeTD('row');</script>
						Comment Text
					</td>
					<script>writeTD('row-l');</script>
						<script>writeInputFieldWithId("wxConfigEnvironmentCommentText","wxConfigEnvironmentCommentText", "%value wxConfigEnvironmentCommentText%", 50, "EDIT");</script>
						(optional)
					</td>
					<script>writeTD('row-l');</script>
						Additional text shown next to &quot;Display Name&quot;
					</td>
					<script>swapRows();</script>
				</tr>
				
				<tr>
					<script>writeTD('row');</script>
						Comment URL
					</td>
					<script>writeTD('row-l');</script>
						<script>writeInputFieldWithId("wxConfigEnvironmentCommentUrl","wxConfigEnvironmentCommentUrl", "%value wxConfigEnvironmentCommentUrl%", 90, "EDIT");</script>
						(optional)
					</td>
					<script>writeTD('row-l');</script>
						If specified, a link will be attached to the comment text
					</td>
					<script>swapRows();</script>
				</tr>
				
				<tr>
					<script>writeTD('row');</script>
						Font Color
					</td>
					<script>writeTD('row-l');</script>
						<script>writeInputFieldWithId("wxConfigEnvironmentCssColorFont","wxConfigEnvironmentCssColorFont", "%value wxConfigEnvironmentCssColorFont%", 20, "EDIT");</script>
					</td>
					<script>writeTD('row-l');</script>
						Font color for environment info in UI
					</td>
					<script>swapRows();</script>
				</tr>
				
				<tr>
					<script>writeTD('row');</script>
						Background Color
					</td>
					<script>writeTD('row-l');</script>
						<script>writeInputFieldWithId("wxConfigEnvironmentCssColorBackground","wxConfigEnvironmentCssColorBackground", "%value wxConfigEnvironmentCssColorBackground%", 20, "EDIT");</script>
					</td>
					<script>writeTD('row-l');</script>
						Background color for environment info in UI
					</td>
					<script>swapRows();</script>
				</tr>
				
				<tr>
					<script>writeTD('row');</script>
						Font Size
					</td>
					<script>writeTD('row-l');</script>
						<script>writeInputFieldWithId("wxConfigEnvironmentCssFontSize","wxConfigEnvironmentCssFontSize", "%value wxConfigEnvironmentCssFontSize%", 10, "EDIT");</script>
					</td>
					<script>writeTD('row-l');</script>
						Font size for environment info in UI
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<td style="border: none;">
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
				
				
				
				
				
				<tr>
					<td class="heading" colspan=3>Types Available for Config File Creation</td>
				</tr>
				<script>resetRows();</script>
				<tr>
					<script>writeTD('row');</script>
						%ifvar ui/lockdown/availableEnvironmentTypes equals('true')%
							<img src="images/lock.gif" title="Available environment types managed centrally" 
								alt="Available environment types managed centrally" border="0"/>
						%endifvar%
						Available Environment Types
					</td>
					<script>writeTD('row-l');</script>
						%loop wxConfigEnvironmentAvailableTypesList%
							%ifvar ui/lockdown/availableEnvironmentTypes equals('true')%
							%else%
								<a href="settingsEnvironment.dsp?actionMode=DELETE&envType=%value wxConfigEnvironmentAvailableTypesList%"> 
									<img src="/WmRoot/icons/delete.gif" title="Delete" alt="Delete" border="0" height=11 width=11/>
								</a>
							%endifvar%
							
							%value%<br>
						%endloop%
					</td>
					<script>writeTD('row-l');</script>
						List of environment types for which config files can be created
					</td>
					<script>swapRows();</script>
				</tr>
				%ifvar ui/lockdown/availableEnvironmentTypes equals('true')%
					
				%else%
					<tr>
						<script>writeTD('row');</script>
							Add Environment Type(s)
						</td>
						<script>writeTD('row-l');</script>
							<script>writeInputFieldWithId("wxConfigEnvironmentNewTypes","wxConfigEnvironmentNewTypes", "", 100, "EDIT");</script>
						</td>
						<script>writeTD('row-l');</script>
							Environment type(s) to be added; multiple entries can be specified separated by comma
						</td>
						<script>swapRows();</script>
					</tr>
				%endifvar%
				<tr>
					<td style="border: none;">
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
				
				
				
				
				
				
				<tr>
					<td class="heading" colspan=3>Command Central</td>
				</tr>
				<script>resetRows();</script>
				
				%invoke wx.config.impl.central:getCceCfg%
				%endinvoke%
				
				<tr>
					<script>writeTD('row');</script>
						Environments
					</td>
					<script>writeTD('row-l');</script>
						%ifvar isCceEnabled equals('true')%
						
							%invoke wx.config.impl.central:getEnvsFromCce%
								%ifvar success equals('true')%
									%ifvar environmentList -notempty%
										<table>
											%loop environmentList%
												<tr>
													<td>%value name%</td>
													<td>&nbsp;&nbsp;</td>
													<td>%value description%</td>
												</tr>
											%endloop%
										</table>
									%else%
										<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=10 width=10 />
										No environments defined
									%endifvar%
								%else%
									<IMG SRC="/WmRoot/icons/red-ball.gif" border="0" height=10 width=10 />
									Error message: %value error%
								%endifvar%
								%onerror% Error
									%include snippets/error.dsp%
							%endinvoke%
						%else%
							<IMG SRC="/WmRoot/icons/yellow-ball.gif" title="Connection disabled, status unknown" border="0" height=10 width=10 />
							Not enabled
						%endifvar%
					</td>
					<script>writeTD('row-l');</script>
						Environment type(s) as defined in Command Central
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Environments in Sync
					</td>
					<script>writeTD('row-l');</script>
						%ifvar isCceEnabled equals('true')%
							%ifvar success equals('false')%
								<IMG SRC="/WmRoot/icons/yellow-ball.gif" title="Status unknown" border="0" height=10 width=10 />
								Environment sync status unknown
							%else%
								%invoke wx.config.impl.central:isEnvsInSync%
								%endinvoke%
								%ifvar isEnvsInSync equals('true')%
									<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=10 width=10 />
									Yes
								%else%
									<IMG SRC="/WmRoot/icons/red-ball.gif" title="Environments not in sync" border="0" height=10 width=10 />
									No
									(<a href="settingsEnvironment.dsp?actionMode=SYNC_ENVS">sync to WxConfig</a>)
								%endifvar%
							%endifvar%
						%else%
							<IMG SRC="/WmRoot/icons/yellow-ball.gif" title="Connection disabled, status unknown" border="0" height=10 width=10 />
						%endifvar%
					</td>
					<script>writeTD('row-l');</script>
						Environment types in sync between WxConfig and CCE
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Connection Enabled
					</td>
					<script>writeTD('row-l');</script>
						%ifvar isCceEnabled equals('true')%
							<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=10 width=10 />
							Yes
							(<a href="settingsEnvironment.dsp?actionMode=DISABLE_CC" title="Disable connection to CCE">disable</a>)
						%else%
							<IMG SRC="/WmRoot/icons/red-ball.gif" border="0" height=10 width=10 />
							No
							(<a href="settingsEnvironment.dsp?actionMode=ENABLE_CC" title="Enable connection to CCE">enable</a>)
						%endifvar%
					</td>
					<script>writeTD('row-l');</script>
						Is connection to CCE enabled?
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Connection URL
					</td>
					<script>writeTD('row-l');</script>
						%ifvar isCceEnabled equals('true')%
							%ifvar isCceReachable equals('false')%
								<IMG SRC="/WmRoot/icons/red-ball.gif" title="CCE not reachable" border="0" height=10 width=10 />
							%else%
								<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=10 width=10 />
							%endifvar%
						%else%
							<IMG SRC="/WmRoot/icons/yellow-ball.gif" title="Connection disabled, status unknown" border="0" height=10 width=10 />
						%endifvar%
						%ifvar cceServer -notempty%
							%value cceServer%
						%else%
							&lt;Undefined&gt;
						%endifvar%
					</td>
					<script>writeTD('row-l');</script>
						URL of CCE server
						%ifvar cceServer -notempty%
							(<a href="%value cceServer%/web" target="_blank">link to web interface</a>)
						%endifvar%
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Username
					</td>
					<script>writeTD('row-l');</script>
						%ifvar isCceEnabled equals('true')%
							%ifvar isCceReachable equals('false')%
								<IMG SRC="/WmRoot/icons/yellow-ball.gif" title="CCE not reachable, username status unknown" border="0" height=10 width=10 />
							%else%
								%ifvar isUserAllowed equals('true')%
									<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=10 width=10 />
								%else%
									<IMG SRC="/WmRoot/icons/red-ball.gif" title="Username and/or password invalid" border="0" height=10 width=10 />
								%endifvar%
							%endifvar%
						%else%
							<IMG SRC="/WmRoot/icons/yellow-ball.gif" title="Connection disabled, status unknown" border="0" height=10 width=10 />
						%endifvar%
						%ifvar cceUsername -notempty%
							%value cceUsername%
						%else%
							&lt;Undefined&gt;
						%endifvar%
					</td>
					<script>writeTD('row-l');</script>
						User through which to interact with CCE
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Password Set
					</td>
					<script>writeTD('row-l');</script>
						%ifvar ccePassword -notempty%
							<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=10 width=10 />
							Password already set, <a href="">update here</a>
						%else%
							<IMG SRC="/WmRoot/icons/red-ball.gif" border="0" height=10 width=10 />
							Password not set, <a href="">define here</a>
						%endifvar%
					</td>
					<script>writeTD('row-l');</script>
						Password used for connecting to CCE
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						CLI Config Found
					</td>
					<script>writeTD('row-l');</script>
						%ifvar ccClientCfgExists equals('true')%
							<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=10 width=10 />
							Yes
						%else%
							<IMG SRC="/WmRoot/icons/red-ball.gif" border="0" height=10 width=10 />
							No
						%endifvar%
					</td>
					<script>writeTD('row-l');</script>
						Found config file for Command Central CLI
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						CLI Config in Sync
					</td>
					<script>writeTD('row-l');</script>
						%ifvar ccClientCfgExists equals('true')%
							%ifvar ccClientCfgInSync equals('false')%
								<IMG SRC="/WmRoot/icons/red-ball.gif" border="0" height=10 width=10 />
								No
								(<a href="settingsEnvironment.dsp?actionMode=SYNC_CC" title="">perform sync</a>)
							%else%
								<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=10 width=10 />
								Yes
							%endifvar%
						%else%
							<IMG SRC="/WmRoot/icons/yellow-ball.gif" border="0" height=10 width=10 />
							N/A (file not found)
						%endifvar%
					</td>
					<script>writeTD('row-l');</script>
						CCE settings in sync between WxConfig and Command Central CLI
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<td style="border: none;">
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
				<tr>
					<td class="action" colspan="3">
						<input type="submit" value="Save">
					</td>
				</tr>
			</table>
		</form>
	</body> 
</html> 

