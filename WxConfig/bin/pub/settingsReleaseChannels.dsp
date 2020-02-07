<html> 

  <!-- Copyright (c) Software AG.  All Rights Reserved. -->

	<head>
		<title>Settings - Release Channels</title>
		%include snippets/htmlHeadDefaults.dsp%
		%include snippets/htmlHeadJquery.dsp%
		%include snippets/htmlHeadAce.dsp%
	</head> 

	<body>
		<table width=100% cellspacing=0 cellpadding=0>
				<tr>
					<td class="menusection-Server" colspan=6>
						Configuration &gt; Release Channels
					</td>
				</tr>
			</table>
		%ifvar actionMode equals('newChannel')%
			<table width=100%>
				<tr>
					<td>
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
				<tr>
					<td width=120>
						<form name="saveForm" method="post" action="settingsReleaseChannels.dsp" 
							target="_self"> 
							<input type="hidden" name="editMode" value="NEW" />
							<input type="hidden" name="actionMode" value="update" />
							<input type="hidden" name="channelId" value="%value newReleaseChannelId%" />
							<input type="submit" value="Update">
						</form>
					</td>
					<td>
						Switch to new release channel
					</td>
				</tr>
				<tr>
					<td width=120>
						<form name="saveForm" method="post" action="settingsReleaseChannels.dsp" 
							target="_self"> 
							<input type="hidden" name="editMode" value="NEW" />
							<input type="hidden" name="actionMode" value="ignoreChannel" />
							<input type="submit" value="Ignore">
						</form>
					</td>
					<td>
						Ignore this update channel
					</td>
				</tr>
				
			</table>
			
					
			
		%endifvar%

		%ifvar actionMode equals('update')%
			<table width=100%>
				<tr>
					<td>
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
				%invoke wx.config.impl.update.channels:setChannelId%
					%include snippets/successAndMessage.dsp%
				%endinvoke%
				
				%invoke wx.config.impl.update:getLatestVersion%
					%include snippets/successAndMessage.dsp%
				%endinvoke%
				
			</table>
			
		%endifvar%
		
			

			
	</body> 
</html> 

