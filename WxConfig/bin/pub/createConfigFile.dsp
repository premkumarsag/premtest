<html> 

  <head>
	<title>Create Configuration File</title>
	%include snippets/htmlHeadDefaults.dsp%
	%include snippets/htmlHeadJquery.dsp%
	<script src="wx.js"></script>
	
	<script type="text/javascript">

	
		function setStageGlobal() {
			doDisableStageEnvInput();
			doDisableStageHostInput();
		}
		
		function setStageEnv() {
			doEnableStageEnvInput();
			doDisableStageHostInput();
		}
		
		function setStageHost() {
			doDisableStageEnvInput();
			doEnableStageHostInput();
		}
		
		function setStageHostPort() {
			doDisableStageEnvInput();
			doEnableStageHostInput();
		}
	
		function doDisableStageEnvInput() {
			$('#stage-env-input').prop('disabled', true);
		}
		
		function doEnableStageEnvInput(source) {
			$('#stage-env-input').prop('disabled', false);
		}
		
		function doDisableStageHostInput() {
			$('#stage-host-input').prop('disabled', true);
		}
		
		function doEnableStageHostInput(source) {
			$('#stage-host-input').prop('disabled', false);
		}
		
		
		function doDisableLocationDetailInput() {
			$('#location-path-input').prop('disabled', true);
			$('#location-alias-input').prop('disabled', true);
		}

		
		function doEnablePathDetailInput(source) {
			$('#location-path-input').prop('disabled', false);
			$('#location-alias-input').prop('disabled', true);
		}
		
		function doEnableAliasDetailInput(source) {
			$('#location-path-input').prop('disabled', true);
			$('#location-alias-input').prop('disabled', false);
		}
		
		function doDisableConditionInputs() {
			$('#cnd-active-none').attr('checked', true);
			$('#cnd-active-dateTime').attr('checked', false);
			$('#cnd-active-os').attr('checked', false);
			$('#cnd-active-wmVersion').attr('checked', false);
			$('#cnd-value-dateTimeStart').prop('disabled', true);
			$('#cnd-value-dateTimeStop').prop('disabled', true);
			$('#cnd-value-os').prop('disabled', true);
			$('#cnd-value-wmVersion').prop('disabled', true);
		}
		
		function doToggleConditionDateTimeInput(source) {
			if ( $('#cnd-active-dateTime').attr('checked') ) {
				$('#cnd-active-none').attr('checked', false);
				$('#cnd-active-dateTime').attr('checked', true);
				$('#cnd-value-dateTimeStart').prop('disabled', false);
				$('#cnd-value-dateTimeStop').prop('disabled', false);
			} else {
				checkAllConditionsDisabled();
				$('#cnd-active-dateTime').attr('checked', false);
				$('#cnd-value-dateTimeStart').prop('disabled', true);
				$('#cnd-value-dateTimeStop').prop('disabled', true);
			}
		}
		
		function doToggleConditionOSInput(source) {
			if ( $('#cnd-active-os').attr('checked') ) {
				$('#cnd-active-none').attr('checked', false);
				$('#cnd-active-os').attr('checked', true);
				$('#cnd-value-os').prop('disabled', false);
			} else {
				checkAllConditionsDisabled();
				$('#cnd-active-os').attr('checked', false);
				$('#cnd-value-os').prop('disabled', true);
			}
		}
		
		function doToggleConditionWmVersionInput(source) {
			if ( $('#cnd-active-wmVersion').attr('checked') ) {
				$('#cnd-active-none').attr('checked', false);
				$('#cnd-active-wmVersion').attr('checked', true);
				$('#cnd-value-wmVersion').prop('disabled', false);
			} else {
				checkAllConditionsDisabled();
				$('#cnd-active-wmVersion').attr('checked', false);
				$('#cnd-value-wmVersion').prop('disabled', true);
			}
		}
		
		function doToggleNatureGlobalValues(source) {
			if ( $('#nature-active-globalValues').attr('checked') ) {
				$('#nature-active-globalValues').attr('checked', true);
			} else {
				$('#nature-active-globalValues').attr('checked', false);
			}
		}
		
		function doToggleNatureOverrideDefaults(source) {
			if ( $('#nature-active-overrideDefaults').attr('checked') ) {
				$('#nature-active-overrideDefaults').attr('checked', true);
			} else {
				$('#nature-active-overrideDefaults').attr('checked', false);
			}
		}
		
		function checkAllConditionsDisabled() {
			if ( (!$('#cnd-active-os').attr('checked')) 
				&& (!$('#cnd-active-dateTime').attr('checked'))
				&& (!$('#cnd-active-wmVersion').attr('checked'))
				) {
				
				$('#cnd-active-none').attr('checked', true);
			} else {
				$('#cnd-active-none').attr('checked', false);;
			}
		}
		
		function setOptionsNewPackage(flag) {
			$('#loc-path').prop('disabled', flag);
			$('#loc-alias').prop('disabled', flag);
			$('#stg-env').prop('disabled', flag);
			$('#stg-host').prop('disabled', flag);
			$('#stg-host-port').prop('disabled', flag);
			$('#cnd-active-os').prop('disabled', flag);
			$('#cnd-active-dateTime').prop('disabled', flag);
			$('#cnd-active-wmVersion').prop('disabled', flag);
			$('#nature-active-globalValues').prop('disabled', flag);
		}
		
		
		function checkIsPackageUsingWxConfigFromDropDown(dropdown) {
			var myindex  = dropdown.selectedIndex;
			var SelValue = dropdown.options[myindex].value;
			checkIsPackageUsingWxConfig(SelValue);
		}
		
		function checkIsPackageUsingWxConfig(SelValue) {
			
			var pipeline = {
							cfgId: SelValue
						};
			var invocation = wx.invoke("wx.config.impl.admin:isPackageUsingWxConfig", pipeline);
			invocation.always(function(result) {
				// result = either output pipeline, or error object
				if (result.isPackageUsingWxConfig == 'false') {
					$('#newConfigFileName').prop('readonly', true);
					$('#newConfigFileName').val('wxconfig.cnf');
					$('#commentFileName').text('(The first config file for each package must be "wxconfig.cnf")');
					setOptionsNewPackage(true);
				} else {
					$('#newConfigFileName').prop('readonly', false);
					$('#newConfigFileName').val('.cnf');
					$('#commentFileName').text('(The new config file must not be called "wxconfig.cnf", because it already exists)');
					setOptionsNewPackage(false);
					$('#newConfigFileName').focus();
				}
			})
		}
		
		function buildFileNameFromTemplateFromDropDown(dropdown) {
			var myindex  = dropdown.selectedIndex;
			var SelValue = dropdown.options[myindex].value;
			buildFileNameFromTemplate(SelValue);
		}

		function buildFileNameFromTemplate(SelValue) {
			var pipeline = {
							templateFileName: SelValue
						};
			var invocation = wx.invoke("wx.config.impl.ui:buildNewFileNameFromTemplateFileName", pipeline);
			invocation.always(function(result) {
				
				// result = either output pipeline, or error object
				$('#newConfigFileName').prop('readonly', false);
				$('#newConfigFileName').val(result.newConfigFileName);
				setOptionsNewPackage(false);
				$('#nature-active-globalValues').prop('disabled', true);
				$('#newConfigFileName').focus();
			})
		}

	</script>
	
	
  </head> 

  <body>
	%include snippets/headerUpdates.dsp%
    
	<!-- Check if MyVersions plugin is activated -->
	%include snippets/plugins/myversions/checkMyVersionsPluginStatus.dsp%
	<!-- Create the new file -->
	%include snippets/invokeCreateConfigFile.dsp%

   <table width=100% cellspacing=0 cellpadding=0>
      <tr>
         <td class="breadcrumb" colspan=6>
         Configuration &gt; New File
         </td>
      </tr>
   </table>

   <table width=100%>
   <!-- ************************************************************* -->
   <!-- ** Hyperlink menu options                                  ** -->
   <!-- ************************************************************* -->
        <tr>
      	  <td colspan=2>
            <ul>
              <li>
				%include snippets/linkBack.dsp%
	      	  </li>
            </ul>
      	  </td>
      	</tr>
      	<tr>
      	  <td>
	         <img src="images/blank.gif" height=10 width=10>
	        </td>
      	</tr>
      	
		%ifvar calledFromAutoSetup%
			%ifvar calledFromAutoSetup equals('true')%
				<tr>
					<td class="info">When a new file shall be created for auto-setup, the package
					is pre-selected and cannot be changed. The filename will be filled upon the
					selection of the template and should usually only be changed if different 
					files are needed for different stages (DEV, TEST, etc.).<p>
					Global values are disabled.</td>
				</tr>
				<tr>
					<td>
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
			%endifvar%
		%endifvar%
		
		%ifvar showPkg -notempty%
			%rename showPkg pkgName -copy% 
		%endifvar%
	
         <tr>
      	  <td>
   <!-- ************************************************************* -->
   <!-- ** FORM creation code block                                ** -->
   <!-- ************************************************************* -->
   %scope param(defaultChoice='on')%
   <form method="post" action=
		%ifvar targetPage%
			"%value targetPage%"
		%else%
			"createConfigFile.dsp"
		%endifvar%
  		target="_self"> 
	   <input type="hidden" name="editMode" value="NEW">           
	   <input type="hidden" name="actionMode" value="SAVE">
	   %ifvar calledFromAutoSetup equals('true')%
			<input type="hidden" name="package" value="%value pkgName%">
			<input type="hidden" name="calledFromAutoSetup" value="true">
		%endifvar%
		%ifvar disableTemplate equals('true')%
			<input type="hidden" name="templateFileName" value="%value templateFileName%">
		%endifvar%
		%ifvar targetPage%
			<input type="hidden" name="targetPage" value="%value targetPage%">
		%endifvar%
	
   
   <table width="100%" class="tableView">
      <tr>
         <td class="heading" colspan=2>Configuration File Creation</td>
      </tr>
	  
	    <tr>
         <script>writeTD('row');</script>
			Package
		 </td>
         <script>writeTD('row-l');</script>
			<select  
				 %ifvar calledFromAutoSetup%
					%ifvar calledFromAutoSetup equals('true')%
						disabled
					%endifvar%
				%endifvar%
				%ifvar skipCheckIsPackageUsingWxConfig equals('true')%
				%else%
					onChange="checkIsPackageUsingWxConfigFromDropDown(this.form.package)"
				%endifvar%
				name="package" id="package">
				<option value="-none-">-none-</option>
					%invoke wx.config.impl.ui:packageListForNewFile%
						%onerror%
						  %include /snippets/error.dsp%
					%endinvoke%
					%loop packageList%
						<option value="%value packageList%" 
						%ifvar /pkgName%
							%ifvar packageList vequals(/pkgName)%
								selected
							%endifvar%
						%endifvar%
						>%value packageList%</option>
					%endloop%
			</select>
			
		 </td>
         <script>swapRows();</script>
      </tr>

      <tr>
         <script>writeTD('row');</script>
			Config File
		 </td>
		 
         <script>writeTD('row-l');</script>
			<script>writeInputFieldWithId("newConfigFileName", "newConfigFileName", "", 40, "%value /editMode%");</script> <span id="commentFileName"></span>
		 </td>
         <script>swapRows();</script>
      </tr>
	  
	   <tr>
         <script>writeTD('row');</script>
			File Location
		 </td>
         <script>writeTD('row-l');doDisableLocationDetailInput();</script>
			<table>
				<tr>
					<td style="border: none;">
						<input id="loc-default" type="radio" name="location" value="package" onClick="doDisableLocationDetailInput();" checked>In package's <code>config</code> directory</input><br>
						<input id="loc-path" type="radio" name="location" value="path" onClick="doEnablePathDetailInput(this)">Path</input><br>
						<input id="loc-alias" type="radio" name="location" value="alias" onClick="doEnableAliasDetailInput(this)">Alias</input><br>
					</td>
					<td style="border: none;">
						&nbsp;&nbsp;&nbsp;
					</td>
					<td style="border: none;">
						<br>
						<script>writeInputFieldWithId("location-path-input","locationDetail", "", 60, "%value /editMode%");</script>
						<br>
						
						%invoke wx.config.impl.location:getAvailableAliases%
							%onerror%
							  %include /snippets/error.dsp%
						%endinvoke%
						<select  id="location-alias-input" name="locationDetail" onchange='onChangeLocationAlias(this);'>
							%loop aliasList%
								<option value="%value%">%value%</option>
							%endloop%
						</select>
						&nbsp;&nbsp;&nbsp;(<a href="settingsFileLocations.dsp">Edit Aliases</a>)
						<script>doDisableLocationDetailInput();$('#location').val("package")</script>
					</td>
				</tr>
		   </table>
		 </td>
         <script>swapRows();</script>
      </tr>
     
      <tr>
         <script>writeTD('row');</script>
			Template
		 </td>
         <script>writeTD('row-l');</script>
         <select  
			%ifvar disableTemplate%
				%ifvar disableTemplate equals('true')%
					disabled
				%endifvar%
			%endifvar%
			name="templateFileName"
			id="templateFileName"
			onChange="buildFileNameFromTemplateFromDropDown(this.form.templateFileName);">
         	<option value="-none-">-none-</option>
			

%invoke wx.config.impl.ui:getTemplateFiles%
    %onerror%
      %include /snippets/error.dsp%
%endinvoke%
%loop templateFiles%		         	
         	
         	<option value="%value path%"
			%ifvar ../templateFileName%
				%ifvar ../templateFileName vequals(path)%
					selected
				%endifvar%
			%endifvar%
			>%value name%</option>
%endloop%

%ifvar skipConfigFilesForTemplate equals('true')%
%else%       	
	%invoke wx.config.impl.ui:getConfigFiles%
		%onerror%
		  %include /snippets/error.dsp%
	%endinvoke%
	%loop configFiles%		         	
				
				<option value="%value canonicalPath%"
				%ifvar ../templateFileName%
					%ifvar ../templateFileName vequals(canonicalPath)%
						selected
					%endifvar%
				%endifvar%
				>%value canonicalPath%</option>
	%endloop%
%endifvar%

         </select> (Contents will be copied into new file)
         
		</td>
         <script>swapRows();</script>
      </tr>
	  
	   <tr>
         <script>writeTD('row');</script>
         Stage
		 </td>
         <script>writeTD('row-l')</script>
			<table>
				<tr>
					<td style="border: none;">
						
						<input id="stg-global" type="radio" name="stage" value="Global" onClick="setStageGlobal();" checked>Global</input><br>
						<input id="stg-env" type="radio" name="stage" value="Environment" onClick="setStageEnv(this)">Environment</input><br>
						<input id="stg-host" type="radio" name="stage" value="Host" onClick="setStageHost(this)">Host</input><br>
						<input id="stg-host-port" type="radio" name="stage" value="HostPort" onClick="setStageHostPort(this)">Host+Port</input><br>
						<br>
					</td>
					<td style="border: none;">
						&nbsp;&nbsp;&nbsp;
					</td>
					<td style="border: none;">
						<br>
						
						
									%invoke wx.config.impl.environment:getAvailableEnvironmentTypes%
										%onerror%
										  %include /snippets/error.dsp%
									%endinvoke%
									<select  id="stage-env-input" name="stageDetail" onchange='onChangeEnvironmentType(this);'>
										%loop envTypeList%
											<option value="%value%">%value%</option>
										%endloop%
									</select>
									&nbsp;&nbsp;&nbsp;
									
						<br>
						
						
						
						<script>writeInputFieldWithId("stage-host-input","stageDetail", "", 30, "%value /editMode%");</script><br>
						<script>setStageGlobal();$('#stage').val("Global")</script>
						
						%include snippets/displayHostAndPort.dsp%
					</td>
				</tr>
		   </table>
		 </td>
         <script>swapRows();</script>
      </tr>
	  
	   <tr>
         <script>writeTD('row');</script>
         Conditions
		 </td>
         <script>writeTD('row-l')</script>
			<table>
				<tr>
					<td style="border: none;">
						<input id="cnd-active-none" type="checkbox" name="conditionActiveNone" value="true" onClick="doDisableConditionInputs();" checked>None</input><br>
						<input id="cnd-active-os" type="checkbox" name="conditionActiveOS" value="true" onClick="doToggleConditionOSInput(this)">Operating System</input><br>
						<input id="cnd-active-dateTime" type="checkbox" name="conditionActiveDateTime" value="true" onClick="doToggleConditionDateTimeInput(this)">Date+Time</input><br>
						<input id="cnd-active-wmVersion" type="checkbox" name="conditionActiveWmVersion" value="true" onClick="doToggleConditionWmVersionInput(this)">webMethods Version</input><br>
					</td>
					<td style="border: none;">
						&nbsp;&nbsp;&nbsp;
					</td>
					<td style="border: none;">
						<br>
						<br>
						<select id="cnd-value-os" name="conditionValueOS">
							<option value="windows" select>Windows</option>
							<option value="linux">Linux</option>
							<option value="unix">Unix (incl. Linux)</option>
						</select>
						<br>
						%invoke wx.config.impl.ui:getFormatDateTimeConditionalFileInclusion%
						%endinvoke wx.config.impl.ui:getFormatDateTimeConditionalFileInclusion%
						Start <script>writeInputFieldWithId("cnd-value-dateTimeStart","conditionValueDateTimeStart", "", 20, "%value /editMode%");</script>
						Stop <script>writeInputFieldWithId("cnd-value-dateTimeStop","conditionValueDateTimeStop", "", 20, "%value /editMode%");</script>
						(Format: %value dateTimeFormat%) 
						<br>
						%invoke wx.config.impl.util.system:getCurrentWebMethodsVersion%
						%endinvoke wx.config.impl.util.system:getCurrentWebMethodsVersion%
						<script>writeInputFieldWithId("cnd-value-wmVersion","conditionValueWmVersion", "", 10, "%value /editMode%");</script>
						(Current version: %value currentWebMethodsVersion%)
						<script>doDisableConditionInputs();$('#condition').val("None")</script>
					</td>
				</tr>
		   </table>
		 </td>
         <script>swapRows();</script>
      </tr>
	  
	   <tr>
         <script>writeTD('row');</script>
         Other
		 </td>
         <script>writeTD('row-l')</script>
			<table>
				<tr>
					<td style="border: none;">
						<input id="nature-active-globalValues" type="checkbox" name="natureActiveGlobalValues" value="true" 
						%ifvar disableGlobalValues equals('true')%
							disabled
						%endifvar%
						onClick="doToggleNatureGlobalValues(this);">Global Values</input><br>
					</td>
					<td style="border: none;">
						&nbsp;&nbsp;&nbsp;
					</td>
					<td style="border: none;">
						Values from this file are visible to all packages (see below for details)
					</td>
				</tr>
				<tr>
					<td style="border: none;">
						<input id="nature-active-overrideDefaults" type="checkbox" name="natureActiveOverrideDefaults" value="true" 
						
						onClick="doToggleNatureOverrideDefaults(this);">Override Defaults</input><br>
					</td>
					<td style="border: none;">
						&nbsp;&nbsp;&nbsp;
					</td>
					<td style="border: none;">
						Values from this file will replace those from other files that have the same keys
					</td>
				</tr>
		   </table>
		 </td>
         <script>swapRows();</script>
      </tr>
	  
      <!-- ************************************************************* -->
      <!-- ** FORM action buttons code block                          ** -->
      <!-- ************************************************************* -->
	%ifvar myVersionsActivated equals('true')%
		%invoke wx.config.plugins.myversion.impl.ui:getCommitMessageTemplate%
		%endinvoke%
		<tr>
			<script>writeTD('row');</script>
			Comment to commit
			</td>
			<script>writeTD('row-l');</script>
			<script>writeTextField("myversions_commentToCommit", "%value myVersionsCommitMessageTemplate%", 100,0, "%value /editMode%");</script>  <br>(if you are placing the file in a shared version controlled location)
			 </td>
		</tr>   
	%endifvar%  
      

			<tr>
				<td class="action" colspan="2">
           <input type="submit" value="Create">
        </td>
     </tr>   
	
	
	<tr>
		<td style="border: none;" colspan="2">
			<br>
			Each package will be scanned for a file "wxconfig.cnf", which will be loaded automatically by WxConfig.
			All other configuration files must explicitly be referenced for inclusion from within "wxconfig.cnf".
			This inclusion will be set up automatically using the parameters from the "Stage" section above (XXX represents
			the value entered to the input field). You find the inclusion in the package's "wxconfig.cnf" file 
			and can manually change (or even remove) this whenever you want.
			<br><br><br>
			<table width=100%>
				<tr>
					<td class="heading" colspan=4>Stage</td>
				</tr>
				<tr class="subheading2">
					<td>Type</td>
					<td>Description</td>
					<td>Format</td>
					<td>Example</td>
				</tr>
				<tr>
					<script>writeTD('rowdata-l');</script>Global</td>
					<script>writeTD('row-l');</script>Always include file (no parameter needed, input field disabled)</td>
					<script>writeTD('row-l');</script>n/a</td>
					<script>writeTD('row-l');swapRows();</script>n/a</td>
				</tr>
				<tr>
					<script>writeTD('rowdata-l');</script>Environment</td>
					<script>writeTD('row-l');</script>Only include on environment type XXX</td>
					<script>writeTD('row-l');</script>Free</td>
					<script>writeTD('row-l');swapRows();</script>DEV</td>
				</tr>
				<tr>
					<script>writeTD('rowdata-l');</script>Host</td>
					<script>writeTD('row-l');</script>Only include on host with name XXX</td>
					<script>writeTD('row-l');</script>As shown for "Current System [..]"</td>
					<script>writeTD('row-l');swapRows();</script>esbprod1</td>
				</tr>
				<tr>
					<script>writeTD('rowdata-l');</script>Host+Port</td>
					<script>writeTD('row-l');</script>Only include on host/port combination XXX</td>
					<script>writeTD('row-l');</script>HOST_PRIMARY-PORT</td>
					<script>writeTD('row-l');swapRows();</script>esbprod1_5555</td>
				</tr>
			</table>
		</td>
	 </tr>
	 
	 
	<tr>
		<td style="border: none;" colspan="2">
			<br>
			The inclusion of configuration files can, in addition to the stage, be dependent on various other
			conditions. It is possible to combine multiple conditions, which will then be combined with an AND
			operation; i.e. all conditions must be met for the file to be loaded.
			<br><br>
			<table width=100%>
				<tr>
					<td class="heading" colspan=4>Conditions</td>
				</tr>
				<tr class="subheading2">
					<td>Type</td>
					<td>Description</td>
					<td>Format</td>
					<td>Example</td>
				</tr>
				<tr>
					<script>writeTD('rowdata-l');</script>Operating System</td>
					<script>writeTD('row-l');</script>Only include if OS type from drop-down list matches</td>
					<script>writeTD('row-l');</script>n/a</td>
					<script>writeTD('row-l');swapRows();</script>n/a</td>
				</tr>
				<tr>
					<script>writeTD('rowdata-l');</script>Date+Time</td>
					<script>writeTD('row-l');</script>Only include if specified timeframe is met</td>
					<script>writeTD('row-l');</script>%value dateTimeFormat%</td>
					<script>writeTD('row-l');swapRows();</script>2013-01-01_00:00:00</td>
				</tr>
				<tr>
					<script>writeTD('rowdata-l');</script>webMethods Version</td>
					<script>writeTD('row-l');</script>Only include if version of webMethods Integration Server matches. 
						It is possible to specify the required version less granular than the value provided by the system.
						So if '8.2' is specified, the file will be loaded on 8.2.0.0, 8.2.1.0, and 8.2.2.0</td>
					<script>writeTD('row-l');</script>MAJOR.MINOR.SERVICEPACK.FIXLEVEL</td>
					<script>writeTD('row-l');swapRows();</script>%value currentWebMethodsVersion%</td>
				</tr>
			</table>
			
			<br><br>
			<table width=100%>
				<tr>
					<td class="heading" colspan=2>Other</td>
				</tr>
				<tr class="subheading2">
					<td>Field</td>
					<td>Description</td>
				</tr>
				<tr>
					<script>writeTD('rowdata-l');</script>Global Values</td>
					<script>writeTD('row-l');swapRows();</script>Include file contents as global values. 
							%include snippets/infoGlobalValues.dsp%</td>
				</tr>
				%ifvar myVersionsActivated equals('true')%
					<tr>
						<script>writeTD('rowdata-l');</script>SVN commit</td>
						<script>writeTD('row-l');swapRows();</script>%include snippets/myversions.dsp%</td>
					</tr>
				%endifvar%
			</table>
		</td>
	</tr>
	 
   </table>
   </form>
   %endscope%

      	  </td>
      	</tr>
    </table>
		<!-- Position cursor either in package selection (no package chosen yet)
		     or in file name input (package already chosen) -->
		%ifvar /pkgName%
			%ifvar skipCheckIsPackageUsingWxConfig%
				%ifvar skipCheckIsPackageUsingWxConfig equals('true')%
					<script>$('#newConfigFileName').val('%value newConfigFileName%');</script>
				%else%
					<script>checkIsPackageUsingWxConfig("%value /pkgName%")</script>
				%endifvar%
			%else%
				<script>checkIsPackageUsingWxConfig("%value /pkgName%")</script>
			%endifvar%
			<script>
				$('#newConfigFileName').focus();
				$('#newConfigFileName').val('%value newConfigFileName%');
			</script>
		%else%
			<script>
				$('#package').focus();
				$('#newConfigFileName').val('%value newConfigFileName%');
			</script>
		%endifvar%
  </body>
</html> 

%ifvar myVersionsActivated equals('true')%
<script language="javascript">
	document.getElementById('loc-path').disabled = true;
	document.getElementById('loc-default').checked = true;
	document.getElementById('loc-path').checked =false;
	document.getElementById('location-central-config-value').disabled = true;
	document.getElementById('location-central-config').checked = true;
</script>
%endifvar%
