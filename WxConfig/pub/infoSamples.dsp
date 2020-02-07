<HTML>
	<HEAD>
		<title>Info Samples</title>
		%include snippets/htmlHeadDefaults.dsp%
	</HEAD>

	
	<BODY>
		%include snippets/headerUpdates.dsp%
	
	<TABLE WIDTH="100%">
	
		%ifvar action equals('install')%
			%invoke wx.config.impl.ui:samplePkgInstallation%
				%include snippets/successAndMessage.dsp%
				%onerror%
					%include /snippets/error.dsp%
			%endinvoke wx.config.impl.ui:samplePkgInstallation%
		%endifvar%
		
		%ifvar action equals('enable')%
			%invoke wx.config.impl.ui:samplePkgEnable%
				%include snippets/successAndMessage.dsp%
				%onerror%
					%include /snippets/error.dsp%
			%endinvoke wx.config.impl.ui:samplePkgEnable%
		%endifvar%
	
		<TR>
			<TD class="menusection-Info" colspan="4">
				Samples
			</TD>
		</TR>
		<TR/>
		
		<TR>
			<TD><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
     		<TD colspan=2></TD>
		</tr>
		
		%invoke wx.config.impl.ui:samplePkgAvailable%
		%endinvoke wx.config.impl.ui:samplePkgAvailable%
		
		%ifvar isSamplePkgAvailable equals('true')%
			<tr>
				<td>
					There is a dedicated samples package called %value config/wxConfigSamplesPackageName%,
					which is available on this system.
				</td>
			</tr>
		%else%
			%ifvar isSamplePkgInstalled equals('true')%
				<form method="post" action="infoSamples.dsp" target="_self">
					<input type="hidden" name="action" value="enable">
					<table width="100%" class=tableView">
						<tr>
							<td>
								There is a dedicated samples package called %value config/wxConfigSamplesPackageName%. 
								It is already installed on this system, but not enabled.
							</td>
							<script>swapRows();</script>
						</tr>
						
						<TR>
							<TD><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
							<TD colspan=2></TD>
						</tr>
						<tr>
							<td class="action" colspan="3">
								<input type="submit" value="Enable %value config/wxConfigSamplesPackageName%">
							</td>
						</tr>
					</table>
				</form>
			%else%
				<form method="post" action="infoSamples.dsp" target="_self">
					<input type="hidden" name="action" value="install">
					<table width="100%" class=tableView">
						<tr>
							<td>
								There is a dedicated samples package called %value config/wxConfigSamplesPackageName%. 
								It is located within
								WxConfig in the <code>./resources</code> folder and can be installed from here.
							</td>
							<script>swapRows();</script>
						</tr>
						
						<TR>
							<TD><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
							<TD colspan=2></TD>
						</tr>
						<tr>
							<td class="action" colspan="3">
								<input type="submit" value="Install %value config/wxConfigSamplesPackageName%">
							</td>
						</tr>
					</table>
				</form>
			%endifvar%
		%endifvar%
  	</TABLE>
</BODY>
