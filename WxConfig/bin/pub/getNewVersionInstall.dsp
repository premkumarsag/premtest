<html> 
	<head>
		<title>Get New Version - Installation</title>
		%include snippets/htmlHeadDefaults.dsp%
	</head> 

	 <body>
		<form method="post" action="index.dsp" target="_top"> 
			<table width="100%" class="tableView">
				<tr>
					<td class="heading">
						Installation of New Version
					</td>
				</tr>
				<tr>
					<td style="border: none;">
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
				%invoke wx.config.impl.update:installUpdate%
					%include snippets/successAndMessage.dsp%
					%onerror%
						%include snippets/error.dsp%
				%endinvoke%
				<tr>
					<td>
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
				<tr>
					<td class="action" colspan="3">
						<input type="submit" value="Work with New Version">
					</td>
				</tr>   
			</table>
		</form>
		
	</body> 
</html> 
