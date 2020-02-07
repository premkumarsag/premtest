<html> 
	<head>
		<title>Orphaned Keys</title>
		%include snippets/htmlHeadDefaults.dsp%
	</head> 

	<body>
		%include snippets/headerUpdates.dsp%
		

		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb" colspan=6>
					Development &gt; Orphaned Keys
				</td>
			</tr>
	   
			%ifvar actionMode equals('addToIgnoreList')%
				%invoke wx.config.impl.ui:addServiceToIgnoreListForKeyStatusUnclear%
				%include snippets/successAndMessage.dsp%
					%onerror%
						%include snippets/error.dsp%
				%endinvoke%
				<!-- % invoke wx.config.ui:reloadPackageCfg%
				% endinvoke wx.config.ui:reloadPackageCfg% -->
			%endifvar%
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
			<tr>
				<td colspan=3>
					<ul class="listitemsplain">
						%ifvar hideKeySubstitution equals('true')%
							<li><a href="orphanedKeys.dsp?hideKeySubstitution=false">Services that use variable 
								substitution for keys are currently hidden. Click here to show them</a></li>
						%else%
							<li><a href="orphanedKeys.dsp?hideKeySubstitution=true">Services that use variable 
								substitution for keys are currently shown. Click here to hide them</a></li>
						%endifvar%
						<li><a href="viewFile.dsp?fileNameWithPath=%value config/ignoreOrphanedKeysPath encode(url)%">Show/edit currently ignored services</a></li>
					</ul>
				</td>
			</tr>
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
		</table>

		<form method="post" action="orphanedKeys.dsp" target="_self"> 
			<input type="hidden" name="actionMode" value="addToIgnoreList"> 
			<input type="hidden" name="hideKeySubstitution" value="%value hideKeySubstitution%">    
	   
			<table width="100%" class="tableView">
				%invoke wx.config.impl.ui:getServicesKeyStatusUnclear%
				%endinvoke%
			
				%ifvar groupedServiceList%
					%loop groupedServiceList%
						<tr>
							<td class="heading" colspan=5>%value pkgName%</td>
						</tr>
						<tr class="subheading2">
							<td class="oddcol-l" width="5%" tdclass="rowdata" sortable="false" type="CaseInsensitiveString" style="cursor: hand;">&nbsp;Ignore&nbsp;</td>
							<td class="oddcol-l" width="15%" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Service&nbsp;</td>
							<td class="oddcol-l" width="10%" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;" id=defaultsort>&nbsp;Key&nbsp;</td>
							<td class="oddcol-l" width="10%" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;" id=defaultsort>&nbsp;Substitute&nbsp;</td>
							<td class="oddcol-l" width="50%" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Path&nbsp;</td>
						</tr>
					  
						<script>resetRows();</script>
						%loop serviceList%
							<tr>
								<script>writeTD('row-l');
									</script><input type="checkbox" name="ignoreService" value="%value pkgName%/%value serviceName%|%value position%" >
								</td>
								<script>writeTD('row-l');</script>
									%value serviceName%
								</td>
								<script>writeTD('row-l');</script>
									%value key%
								</td>
								<script>writeTD('row-l');</script>
									%value substituteVariables%
								</td>
								<script>writeTD('row-l')</script>
									%value position%
								</td>
							</tr>
							<script>swapRows();</script>
						%endloop%
						<tr>
							<td/ style="border: none;">
						</tr>
					%endloop%
				%else%
					<tr>
						<td class="oddrowdata" colspan=5>
							Everything is fine, no keys with unknown value found
						</td>
					</tr>
				%endifvar%
				 
				<tr>
					<td style="border: none;" colspan=5>To exclude an entire package permanently from the list, please add "wx.config.dev.keyCheck.ignorePackage=PACKAGE_NAME" 
						to the configuration for WxConfig
					</td>
				</tr>
			 
			
				<tr>
					<td style="border: none;" class="action" colspan="5">
						<input type="submit" value="Add selected values to ignore list">
					</td>
				</tr>   
			</table>
		</form>
	</body> 
</html> 
