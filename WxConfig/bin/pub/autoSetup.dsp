<html> 

  <!-- Copyright (c) 2017, Software AG  All Rights Reserved. -->

	<head>
		<title>Auto Setup</title>
		%include snippets/htmlHeadDefaults.dsp%
	</head> 

	<body>

		<!-- Check if MyVersions plugin is activated -->
		%include snippets/plugins/myversions/checkMyVersionsPluginStatus.dsp%

		<!-- Create the new file -->
		%include snippets/invokeCreateConfigFile.dsp%
		
		<!-- Delete operation? -->
		%include snippets/invokeDeleteConfigFile.dsp%

		%include snippets/headerUpdates.dsp%
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb">
					Auto Setup &gt; Overview
				</td>
			</tr>
		</table>

		<table width=100%>
		
			%include snippets/invokeSaveFileAfterEdit.dsp%
		
			%ifvar actionMode equals('update')%
				%invoke wx.config.impl.autoSetup:enableDisableForPackage%
				%include snippets/successAndMessage.dsp%
					%onerror%
						%include snippets/error.dsp%
				%endinvoke%
			%endifvar%
			%ifvar actionMode equals('execute')%
				%invoke wx.config.impl.autoSetup:executeFromUI%
				%include snippets/successAndMessage.dsp%
					%onerror%
						%include snippets/error.dsp%
				%endinvoke%
			%endifvar%
		</table>
			
	
		<table width="100%" class="tableView">
			<tr>
				<td class="heading" colspan=5 >Configuration</td>
			</tr>
			<tr class="subheading2">
				<td class="oddcol-l" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;" id=defaultsort>&nbsp;Package&nbsp;</td>
				<td class="oddcol" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Enabled&nbsp;</td>
				<td class="oddcol" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Simulation&nbsp;
				<img src="./images/info.png" width=13 height=13 title="Perform auto-setup actions as if the package was started, stopped, or re-loaded"/></td>
				<td class="oddcol"  tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;New&nbsp;</td>
				<td class="oddcol"  tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Files&nbsp;</td>
			</tr>
			 <script>resetRows();</script>
			%invoke wx.config.impl.autoSetup.util:getAutoSetupInfo%
			%endinvoke%
			
			%loop autoSetupInfo%
				<tr>
					<script>writeTD('rowdata-l');</script>
						<a href="listFiles.dsp?showPkg=%value cfgId%">%value cfgId%</a>
					</td>
					<script>writeTD('rowdata');</script>
						%ifvar isEnabled equals('true')%
							<a href="autoSetup.dsp?actionMode=update&pkgName=%value cfgId%&enable=false">Yes</a>
						%else%
							<a href="autoSetup.dsp?actionMode=update&pkgName=%value cfgId%&enable=true">No</a>
						%endifvar%
					</td>
					<script>writeTD('rowdata');</script>
						<a href="autoSetup.dsp?actionMode=execute&mode=startup&pkgName=%value cfgId%">
							<img src="/WmRoot/icons/checkdot.gif" title="Run for Package Startup"></a>
						<a href="autoSetup.dsp?actionMode=execute&mode=shutdown&pkgName=%value cfgId%">
							<img src="/WmRoot/images/redpixel.gif" width=13 height=13 title="Run for Package Shutdown"></a>
						<a href="autoSetup.dsp?actionMode=execute&mode=reload&pkgName=%value cfgId%">
							<img src="/WmRoot/icons/icon_reload.gif" title="Run for Package Reload"></a>
					</td>
					<script>writeTD('rowdata');</script>
						<a href="createConfigFile.dsp?pkgName=%value cfgId%
							&templateFileCategory=autoSetup&editMode=NEW&linkBack=autoSetup.dsp
							&calledFromAutoSetup=true
							&targetPage=autoSetup.dsp
							&linkBack=autoSetup.dsp
							&skipCheckIsPackageUsingWxConfig=true
							&skipConfigFilesForTemplate=true
							&disableGlobalValues=true">
							<img src="/WmRoot/icons/addspec.gif" title="New Configuration File">
						</a>
					</td>
					<script>writeTD('row-l');resetRows();</script>
						
						<table>
						%loop configFiles%
							<tr>
								<td class="row-l" style="border: none; border-collapse:collapse;" width="300">
									%rename ../cfgId cfgId -copy%
									<a href="deleteFile.dsp?fileNameWithPath=%value canonicalPath encode(url)%
											&package=%value cfgId%
											&linkBack=autoSetup.dsp
											&targetPage=autoSetup.dsp
											&calledFromAutoSetup=true
											&isMissing=false
										">
											<img src="/WmRoot/icons/delete.gif" alt="Delete" Title="Delete File" border="0" height=9 width=9/>
									</a>
									%include snippets/configFileWithLink.dsp%<br>
								</td>
								<td class="row-l" style="border: none;">
									<img src="images/blank.gif" height=1 width=10>
									%loop autoSetupAreas%
										%ifvar hasContent equals('true')%
											%value name% &nbsp;&nbsp;
										%endifvar%
									%endloop%
									<br>
								</td>
							</tr>
							%endloop%
						</table>
						
					</td>
				</tr>
			%endloop%
		</table>
		<table width="100%">
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
			<tr>
				<td colspan=3>The above list shows all active packages that use WxConfig (with or without auto-setup configuration defined). 
				In the column "Enabled" the value of <code>wx.config.autoSetup.execute</code> is reflected. This special
				property (defined per package) determines whether or not the auto-setup configuration in the package
				should be applied during package startup or shutdown. If set to true, automated execution via 
				a custom PackageListener is enabled. If set to false or not defined at all, nothing happens.</td>
			</tr>
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
		</table>
			
		<table width="100%" class="tableView">
			<tr>
				<td class="heading" colspan=2 >Information</td>
			</tr>
			%include snippets/infoAutoSetup.dsp%
		</table>
			
	</body> 
</html> 
