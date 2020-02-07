<HTML>
	<HEAD>
		<title>Install Dependent myVersions Packages</title>
		%include snippets/htmlHeadDefaults.dsp%
	</HEAD>

	
	<BODY>
		%include snippets/headerUpdates.dsp%
	
	<TABLE WIDTH="100%" class="tableview">
	
		%ifvar action equals('install')%
			%invoke wx.config.plugins.myversion.impl.ui:wxsvnPkgInstallation%
				%include snippets/successAndMessage.dsp%
				%onerror%
					%include /snippets/error.dsp%
			%endinvoke wx.config.plugins.myversion.impl.ui:wxsvnPkgInstallation%
		%endifvar%
		
		%ifvar action equals('enable')%
			%invoke wx.config.plugins.myversion.impl.ui:wxsvnPkgEnable%
				%include snippets/successAndMessage.dsp%
				%onerror%
					%include /snippets/error.dsp%
			%endinvoke wx.config.plugins.myversion.impl.ui:wxsvnPkgEnable%
		%endifvar%
	
		<TR>
			<TD class="breadcrumb" colspan="4">
				Plugins &gt; MyVersions &gt; Install Dependent Packages
			</TD>
		</TR>
		<TR/>
		
		<TR>
			<TD style="border: none;"><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
		</tr>
		<tr>
			<td class="heading" colspan=2 >MyVersions - Install Dependent Packages</td>
		</tr>
		<TR>
			<TD style="border: none;"><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
		</tr>
		%invoke wx.config.plugins.myversion.impl.ui:wxsvnPkgAvailable%
		%endinvoke wx.config.plugins.myversion.impl.ui:wxsvnPkgAvailable%
		
		%ifvar isVcsPkgAvailable equals('true')%
			<tr>
				<td>
					WxConfig dependent package - WxSvn - is already installed on this IS Host.
				</td>
			</tr>
		%else%
			%ifvar isVcsPkgInstalled equals('true')%
				<form method="post" action="myVersionsDependentInstall.dsp" target="_self">
					<input type="hidden" name="action" value="enable">
					<table width="100%" class=tableView">
						<tr>
							<td>
								There is a dedicated VCS package - WxSvn already installed on this system, but not enabled.
							</td>
							<script>swapRows();</script>
						</tr>
						
						<TR>
							<TD><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
							<TD colspan=2></TD>
						</tr>
						<tr>
							<td class="action" colspan="3">
								<input type="submit" value="Enable %value config/vcsPackageName%">
							</td>
						</tr>
					</table>
				</form>
			%else%
				<form method="post" action="myVersionsDependentInstall.dsp" target="_self">
					<input type="hidden" name="action" value="install">
					<table width="100%" class=tableView">
						<tr>
							<td>
								There is a dedicated VCS package called WxSvn.
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
								<input type="submit" value="Install %value config/vcsPackageName%">
							</td>
						</tr>
					</table>
				</form>
			%endifvar%
		%endifvar%
  	</TABLE>
</BODY>
