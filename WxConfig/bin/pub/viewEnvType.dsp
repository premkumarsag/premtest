<html>

  <!-- Copyright (c) 2012, Software AG  All Rights Reserved. -->

	<head>
    	<title>View Environment Type</title> 
    	%include snippets/htmlHeadDefaults.dsp%
	</head>


	
	<body onLoad="setNavigation('about.dsp', 'help.dsp');">
		%include snippets/headerUpdates.dsp%
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="menusection-Server" colspan=6>
					View Environment
				</td>
			</tr>
		</table>
		
		<table width=100%>
			%ifvar action equals('change')%
				%invoke wx.config.impl.util.file:saveFile%
					%include snippets/successAndMessage.dsp%
					%onerror%
						%include /snippets/error.dsp%
				%endinvoke wx.config.impl.util.file:saveFile%
				
				%invoke wx.config.impl.ui:reloadAllCfgs%
					%ifvar message%
						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>
						<TR>
							<TD class="info" colspan="4">&nbsp;&nbsp;Result from Global Reload :&nbsp;&nbsp;&nbsp;<pre>%value message%</pre></TD>
						</TR>
					%endif%
				%endinvoke wx.config.impl.ui:reloadAllCfgs%
				
			%endif%
			%invoke wx.config.impl.util.file:getFile%
				%onerror%
					%include /snippets/error.dsp%
			%endinvoke%
		</table>
      
		<table width="100%">
			<tr>
				<td><img src="/WmRoot/images/blank.gif" height=10 width=10>%include snippets/displayHostAndPort.dsp%</td>
			</tr>
			<tr>
				<td><img src="/WmRoot/images/blank.gif" height=10 width=10></td>
			</tr>
			<tr>
				<td>
					<table width="100%" cellspacing=0 cellpadding=1 border=0>
						<tr>
							<td class="heading">
								<br>
		                        <form method="post" action="editEnvType.dsp" target="_self">
									<input type="hidden" name="fileNameWithPath" value="%value /fileNameWithPath%">
									<input type="hidden" name="mode" value="edit">
									<input type="hidden" name="package" value="WxConfig">
									<input type="submit" value="Edit File">
        		                </form>
							</td>
							<td class="heading">%value fileNameWithPath%</td>
						</tr>
						<tr>
							<td class="oddrow-l" colspan=2>
								<font size="+1">    
        		                <pre>%value fileContent%</pre>
							</td>
						</tr>
						<tr>
							<td class="oddrow-l" colspan=2></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
