%invoke wx.config.impl.license:getLicenseDetails%
	%ifvar isLicenseValid equals('true')%
	%else%
		<p class="error">
			No valid license found (reason = %value resultLicenseCheck%). <a href="settingsLicense.dsp">
			<b>Please enter license here.</b></a>
		</p>
	%endifvar%
	%ifvar expiringVerySoon equals('true')%
		<p class="error">
			License will expire very soon (%value expires%). <a href="settingsLicense.dsp">
			<b>Please enter new license here.</b></a>
		</p>
	%else%
		%ifvar expiringSoon equals('true')%
			<p class="info">
				License will expire soon (%value expires%). <a href="settingsLicense.dsp">
				<b>Please enter new license here.</b></a>
			</p>
		%endifvar%
	%endifvar%
%endinvoke%
%invoke wx.config.impl.update:areCredentialsNeeded%
	%ifvar credentialsAreNeeded equals('false')%
		%invoke wx.config.impl.update:isNewVersionAvailable%
			%ifvar errorMessageUpdateCheck%
				<p class="error">Error while checking for update: %value errorMessageUpdateCheck%.
				<a href="settingsMain.dsp?clearUpdateCheckError=true"><b>Please check settings here.</b></a>
				</p>
			%endifvar%
			%ifvar isNewVersionAvailable equals('true')%
				<p class="info">Update for current version of WxConfig available: 
					%value newVersion% (build %value newBuild%) &nbsp;&nbsp;
					<a href="getNewVersion.dsp"><b>Install</b></a> or 
					<a href="getNewVersionSkip.dsp?actionMode=SET"><b>Skip</b></a> Update
				</p>
			%endifvar%
			%ifvar isNewReleaseChannelAvailable equals('true')%
				<p class="info">New release of WxConfig available: 
					%value newReleaseChannelName%&nbsp;&nbsp;
					<a href="settingsReleaseChannels.dsp?actionMode=newChannel&newReleaseChannelId=%value newReleaseChannelId%"><b>Details</b></a>
				</p>
			%endifvar%
		%endinvoke%
	%else%
		<p class="info">Credentials undefined for checking for new version of WxConfig. 
			<a href="settingsMain.dsp"><b>Please provide username and password or deactivate check here.</b></a>
		</p>
	%endifvar%
%endinvoke%