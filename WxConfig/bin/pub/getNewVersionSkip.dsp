<html> 

  <!-- Copyright (c) 2014, Software AG  All Rights Reserved. -->

	<head>
		<title>Get New Version - Skip</title>
		%include snippets/htmlHeadDefaults.dsp%
	</head> 

	 <body>
	 
	 <form method="post" action="index.dsp" target="_top"> 
			<table width="100%" class="tableView">
				<tr>
					<td class="heading">
						%ifvar actionMode equals('SET')%
							Set Skip Installation of New Version
						%endifvar%
						%ifvar actionMode equals('CLEAR')%
							Remove Skip Installation of New Version
						%endifvar%
					</td>
				</tr>
			</table>
			<table width="100%">
				<tr>
					<td>
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
				%ifvar actionMode equals('SET')%
					%invoke wx.config.impl.update:skipUpdateSet%
						%include snippets/successAndMessage.dsp%
						%onerror%
							%include snippets/error.dsp%
					%endinvoke%
				%endifvar%
				
				%ifvar actionMode equals('CLEAR')%
					%invoke wx.config.impl.update:skipUpdateClear%
						%include snippets/successAndMessage.dsp%
						%onerror%
							%include snippets/error.dsp%
					%endinvoke%
				%endifvar%
				<tr>
					<td>
						<img src="images/blank.gif" height=10 width=10>
					</td>
				</tr>
				<tr>
					<td class="action" colspan="3">
						<input type="submit" value="Continue with Current Version">
					</td>
				</tr>   
			</table>
		</form>
	 
	</body> 
</html> 
