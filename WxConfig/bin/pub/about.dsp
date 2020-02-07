<html>
  <head>
    <title>About WxConfig</title>
	%include snippets/htmlHeadDefaults.dsp%
  </head>

<body onLoad="setNavigation('about.dsp', 'help.dsp');">
  
	%ifvar actionMode equals('updateCheck')%
    	%invoke wx.config.impl.update:getLatestVersion%
		%endinvoke wx.config.impl.update:getLatestVersion%
	%endifvar%
  
    %include snippets/headerUpdates.dsp%
     
      
	<table width="100%" class="tableview">
		<tr>
			<td style="border: none;"><img src="/WmRoot/images/blank.gif" height=10 width=10></td>
		</tr>
		<tr>
			<td class="heading" colspan=4>Copyright</td>
		</tr>
		<tr>
            <td class="oddrow-l">
				<a target="_blank" href="http://www.softwareag.com">
					<IMG src="%include snippets/logo.dsp%" border=0 />
				</a>
            </td>
            <td class="oddrow-l" colspan=3>
				All product and brand names are trademarks of their respective owners.
				<br><br>
			  Copyright &copy; 2017, <a target="_blank" href="http://www.softwareag.com">Software AG</a>
			  All Rights Reserved.
			</td>
		</tr>
		<tr>
			<td style="border: none;"><img src="/WmRoot/images/blank.gif" height=10 width=10></td>
		</tr>
		<tr>
			<td class="heading" colspan=4>Version</td>
		</tr>
		<tr>
			<td class="oddrow" width="10%">Product</td>
			<td class="oddrowdata-l" colspan=3>WxConfig</td>
		</tr>
		<tr>
			<td class="evenrow">Version</td>
			<td class="evenrowdata-l" colspan=3>
               %invoke wx.config.impl.about:getVersionInfo%
                  %value version%
               %onerror%
                  unknown
               %end%
			</td>
		</tr>
		<tr>
            <td class="evenrow">Build</td>
            <td class="evenrowdata-l" colspan=3>
                  %value build%
			</td>
		</tr>

		<tr>
			<td class="evenrow">Updates</td>
			<td class="evenrowdata-l" colspan=3>
				%invoke wx.config.impl.update:areCredentialsDefined%
					%ifvar credentialsDefined equals('true')%
						<form method="post" action="about.dsp" target="_self">
							<input type="hidden" name="actionMode" value="updateCheck">
							<input type="submit" value="Check for Updates Now">
						</form>
					%endifvar%
				%endinvoke wx.config.impl.update:areCredentialsDefined%
				
				%invoke wx.config.impl.update:isSkipUpdateSet%
					%ifvar isSkipUpdateSet equals('true')%
						<form method="post" action="getNewVersionSkip.dsp" target="_self">
							<input type="hidden" name="actionMode" value="CLEAR">
							<input type="submit" value="Clear Update Skip">
						</form>
					%endifvar%
				%endinvoke wx.config.impl.update:isSkipUpdateSet%
				<form method="post" action="settingsMain.dsp" target="_self">
					<input type="submit" value="Configure automatic check for updates">
				</form>
			</td>
		</tr>
		<tr>
			<td style="border: none;"><img src="/WmRoot/images/blank.gif" height=10 width=10></td>
		</tr>
		<tr>
			<td class="heading" colspan=4>Environment</td>
		</tr>
		<tr>
			<td class="oddrow" valign=top>Web Host</td>
			<td class="oddrowdata-l" colspan=3>
				<a href="/WmRoot/server-environment.dsp">webMethods Integration Server</a> 
				running on %sysvar host% at port %sysvar property(watt.server.port)%
			</td>
		</tr>
		%invoke wm.server.query:getCurrentUser%
			<tr>
				<td class="evenrow" valign=top>Current User</td>
				<td class="evenrowdata-l" colspan=3>%value username%&nbsp;</td>
			</tr>
		%endinvoke%
		<tr>
			<td style="border: none;"><img src="/WmRoot/images/blank.gif" height=10 width=10></td>
		</tr>	 
	</table>
      </td>
	   %invoke wx.config.impl.about:getChanges%
					%ifvar success equals('true')%
						
								%include snippets/listChanges.dsp%
						
	  %endinvoke%
    </table>
</body>
</html>
