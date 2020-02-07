<html> 

	<head>
		<title>Get New Version - Download</title>
		%include snippets/htmlHeadDefaults.dsp%
	</head> 

	 <body>
		%invoke wx.config.impl.update:downloadUpdate%
		%ifvar message%
			%ifvar success equals('true')%
				<table width=100%>
					<tr>
						<td>
							<img src="images/blank.gif" height=10 width=10>
						</td>
					</tr>
					<tr>
						<td class="success"><pre>%value message%</pre></td>
					</tr>
					<tr>
						<td>
							<img src="images/blank.gif" height=10 width=10>
						</td>
					</tr>
				</table>

				%scope param(defaultChoice='on')%
				<form method="post" action="getNewVersionInstall.dsp" target="_self"> 
					<table width="100%" class="tableView">
						<tr>
							<td class="heading">Start Installation of New Version</td>
						</tr>
						<tr>
							<script>writeTD('row-l');</script>
								The download has finished and the update is ready to be installed.
							</td>
							<script>swapRows();</script>
						</tr>
						<tr>
							<td class="action" colspan="3">
								<input type="submit" value="Install Update">
							</td>
						</tr>   
					</table>
				</form>
				%endscope%
			%else%
				<table width=100%>
					<tr>
						<td>
							<img src="images/blank.gif" height=10 width=10>
						</td>
					</tr>
					<tr>
						<td class="error"><pre>%value message%</pre></td>
					</tr>
				</table>
			%endifvar%
		%else%
			<script>parent.menu.treeRefreshButton.click();</script>
		%endifvar%   
			%onerror%
				%include snippets/error.dsp%
		%endinvoke%
	</body> 
</html> 
