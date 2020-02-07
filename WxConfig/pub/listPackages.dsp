<html> 

 
	<head>
		<title>List Packages</title>
		%include snippets/htmlHeadDefaults.dsp%
		<SCRIPT LANGUAGE="JavaScript">
			function OnChange(dropdown)
			{
				var myindex  = dropdown.selectedIndex
				var SelValue = dropdown.options[myindex].value
				var baseURL  = "listFiles.dsp?action=showPkg&showPkg=" + SelValue
				parent.frames["body"].location.href = baseURL;
				return true;
			}

			window.onkeypress = function(event) {
							if (event.charCode === 114 && event.ctrlKey) {  // CTRL-R pressed
								event.preventDefault();
								parent.frames["body"].location.href = "listFiles.dsp?showPkg=%value showPkg%";
								return true;
							}
						};
		</SCRIPT>
	</head> 

	<body>   
		%include snippets/headerUpdates.dsp%
		<table width="100%">
			<tr>
               <td class="breadcrumb" colspan=2>Configuration &gt; Packages</TD>
            </TR>
		
		<!-- Enable package for WxConfig -->
		%ifvar package equals('-empty-')%
			<tr>
				<td colspan="4">&nbsp;</td>
			</tr>
			<TR>
				<TD class="error" colspan="4">No package selected for enablement of WxConfig, please choose a package.</TD>
			</TR>
		%else%
			%include snippets/invokeCreateConfigFile.dsp%
		%endifvar%
		
		%ifvar action equals('reload')%
			 %invoke wx.config.impl.ui:reloadPackageCfg%
			%ifvar message%
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
	      		<TR>
      				<TD class="info" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<pre>%value message%</pre></TD>
	      		</TR>
			%endif%
			%endinvoke wx.config.impl.ui:reloadPackageCfg%
		%endif%
		
		
		%ifvar action equals('rescan')%
			%include snippets/invokeReloadAllCfgs.dsp%
		%endif%
		
		%ifvar action equals('deployment')%
			%invoke wx.config.impl.reload:deployment%
			%ifvar message%
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
	      		<TR>
      				<TD class="info" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<pre>%value message%</pre></TD>
	      		</TR>
				
			%endif%
			%endinvoke wx.config.impl.reload:deployment%
		%endif%
		
	
	
			<tr>
				<td colspan=2>
					<ul class="listitemsplain">
						
						<li> <a href="listPackages.dsp?action=rescan">Re-scan all active packages</a></li>
						%ifvar showPkg -notempty%
							<li><a href="showValues.dsp?showPkg=%value showPkg%">Show package values</a></li>
						%endifvar%
					</ul>
				</td>
			</tr>
			<tr>
				<td>
					<img src="/WmRoot/images/blank.gif" height=10 width=10>
				</td>
			</tr>
		</table>
		<table class=tableView>
			<tr>
				<td class="heading" colspan=8 >Packages</td>
			</tr>
			<tr class="subheading2">
				<td class="oddcol-l" tdclass="rowdata-l" style="margin-left: 10px;margin-right: 10px;">Package</td>
				<td class="oddcol" tdclass="rowdata-l" style="margin-left: 10px;margin-right: 10px;">Auto-Setup
					%ifvar ui/license/isFeatureLicensed/autoSetup equals('true')% %else%*%endifvar%</td>
				<td class="oddcol" tdclass="rowdata-l"  style="margin-left: 10px;margin-right: 10px;">Audit
					%ifvar ui/license/isFeatureLicensed/audit equals('true')% %else%*%endifvar%</td>
				<td class="oddcol" tdclass="rowdata-l" style="margin-left: 10px;margin-right: 10px;">Publish
					%ifvar ui/license/isFeatureLicensed/publish equals('true')% %else%*%endifvar%</td>
				<td class="oddcol" tdclass="rowdata-l" style="margin-left: 10px;margin-right: 10px;">Files Valid</td>
				<td class="oddcol" tdclass="rowdata-l" style="margin-left: 10px;margin-right: 10px;">Interpolators</td>
				<td class="oddcol" tdclass="rowdata-l" style="margin-left: 10px;margin-right: 10px;">Encrypted</td>
				<td class="oddcol" tdclass="rowdata-l" style="margin-left: 10px;margin-right: 10px;">Deployment
					%ifvar ui/license/isFeatureLicensed/deploymentController equals('true')% %else%*%endifvar%</td>
			</tr>
			 <script>resetRows();</script>
			%invoke wx.config.impl.ui:getPkgOverview%
			%endinvoke%
				
			%loop pkgList%
				<tr>
					<script>writeTD('rowdata-l');</script>
						<a href="listFiles.dsp?showPkg=%value cfgId%">%value cfgId%</a>
					</td>
					<script>writeTD('rowdata');</script>
						%ifvar autoSetup%
							%ifvar autoSetup/containsCfg equals('true')%
								<IMG SRC="images/contentAutoSetup.gif" border="0" height=13 width=13>
							%endifvar%
							%ifvar autoSetup/isEnabled equals('true')%
								<IMG SRC="/WmRoot/images/green_check.gif" border="0" height=13 width=13>
							%else%
								<img src="images/blank.gif" border="0" height=13 width=13>
							%endifvar%
						%else%
							-
						%endifvar%
					</td>
					<script>writeTD('rowdata');</script>
						%ifvar audit%
							%ifvar audit/containsCfg equals('true')%
								<IMG SRC="images/contentAudit.gif" border="0" height=13 width=13>
							%else%
								<img src="images/blank.gif" border="0" height=13 width=13>
							%endifvar%
							%ifvar audit/isEnabled equals('true')%
								<IMG SRC="/WmRoot/images/green_check.gif" border="0" height=13 width=13>
							%else%
								<img src="images/blank.gif" border="0" height=13 width=13>
							%endifvar%
						%else%
							-
						%endifvar%
					</td>
					<script>writeTD('rowdata');</script>
						%ifvar publish%
							%ifvar publish/containsCfg equals('true')%
								<IMG SRC="images/contentPublish.gif" border="0" height=13 width=13>
							%else%
								<img src="images/blank.gif" border="0" height=13 width=13>
							%endifvar%
							%ifvar publish/isEnabled equals('true')%
								<IMG SRC="/WmRoot/images/green_check.gif" alt="Publish Enabled" Title="Publish Enabled" border="0" height=13 width=13>
							%else%
								<img src="images/blank.gif" border="0" height=13 width=13>
							%endifvar%
						%else%
							-
						%endifvar%
					</td>
					<script>writeTD('rowdata');</script>
						%ifvar allFilesValid equals('true')%
							<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=13 width=13>
						%else%
							<IMG SRC="/WmRoot/icons/red-ball.gif" border="0" height=13 width=13>
						%endifvar%
					</td>
					<script>writeTD('rowdata');</script>
						%ifvar interpolatorsOk equals('true')%
							<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=13 width=13>
						%else%
							<IMG SRC="/WmRoot/icons/red-ball.gif" border="0" height=13 width=13>
						%endifvar%
					</td>
					<script>writeTD('rowdata');</script>
						%ifvar encryptedOk equals('true')%
							<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=13 width=13 />
							<IMG SRC="images/blank.gif" border="0" height=13 width=13 />
						%else%
							<IMG SRC="/WmRoot/icons/red-ball.gif" border="0" height=13 width=13 />
							<a href="encryptedValues.dsp?showPkg=%value cfgId%&isInPassmanFilter=UNDEFINED&calledFromEncryptedValues=true&targetPage=encryptedValues.dsp">
								<IMG SRC="images/magnifyglass.gif" border="0" height=13 width=13 />
							</a>
						%endifvar%
						%ifvar encryptedLocked equals('true')%
							<IMG SRC="images/Locked.gif" border="0" height=13 width=13 title="Value(s) locked against changes" />
						%else%
							<IMG SRC="images/LockOpen.gif" border="0" height=13 width=13 title="All values can be changed" />
						%endifvar%
					</td>
					<script>writeTD('rowdata');</script>
						%ifvar deployment%
							%ifvar deployment equals('false')%
								<a href="listPackages.dsp?action=deployment&pkgName=%value cfgId%&operation=START">Start</a>
							%else%
								<a href="listPackages.dsp?action=deployment&pkgName=%value cfgId%&operation=FINISH">Finish</a> |
								<a href="listPackages.dsp?action=deployment&pkgName=%value cfgId%&operation=CANCEL">Cancel</a>
							%endifvar%
						%else%
							-
						%endifvar%
					</td>
					<script>swapRows();</script>
				</tr>
			%endloop%
			
			%ifvar ui/license/isFeatureLicensed/all equals('true')%
			%else%
				<tr>
					<td>
						* Feature not Licensed
					</td>
				</tr>
			%endifvar%
			
			
			<tr>
				<td class="action" colspan=1>
				<form method="post" target="_self">
					<input type="hidden" name="actionMode" value="SAVE" />
					<input type="hidden" name="newConfigFileName" value="wxconfig.cnf" />
					<input type="hidden" name="stage" value="Global" />
					<input type="hidden" name="location" value="package" />
					
					
					
					
					<select  name="package" >
						<option value="-empty-">-Select Package-</option>
						%invoke wx.config.impl.admin:getPackagesWithoutConfig%
							%onerror%
							  %include /snippets/error.dsp%
						%endinvoke%
						%loop packageList%
							<option value="%value packageList%">%value packageList%</option>
						%endloop%
					</select>
					<input type="submit" value="Enable WxConfig"></input>
				</form>
			</tr>
		</table>  
	</body> 
</html> 
