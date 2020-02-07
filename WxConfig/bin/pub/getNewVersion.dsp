<html> 

  <!-- Copyright (c) 2012, Software AG  All Rights Reserved. -->

	<head>
		<title>Get New Version</title>
		%include snippets/htmlHeadDefaults.dsp%
	</head> 

	 <body>
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb" colspan=6>
					Download New Version
				</td>
			</tr>
		</table>
		
		<table width=100%>
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
			%invoke wx.config.impl.update:getBuildInfo%
				%ifvar success equals('true')%
					<tr>
						<td>
							%scope buildInfo%
								<form method="post" action="getNewVersionDownload.dsp" target="_self"> 	   
									<table width="100%" class="tableView">
										<tr>
											<td>
												<img src="images/blank.gif" height=10 width=10>
											</td>
										</tr>
										<tr>
											<script>writeTD('rowdata-l');</script>
												Please do not interrupt the download, it may take some time. Once the download is finished, you can install the update.
											</td>
											<script>swapRows();</script>
										</tr>
										<tr>
											<td>
												<img src="images/blank.gif" height=10 width=10>
											</td>
										</tr>
										<tr>
											<td class="action" colspan="3">
												<input type="submit" value="Start Download" />
											</td>
										</tr>   
									</table>
									%include snippets/listChanges.dsp%
								</form>
							%endscope%
						</td>
					</tr>
				%else%
					<tr class="error">
						<td>Error while trying to retrieve local copy of build information: %value message%</td>
					</tr>
				%endifvar%
			%endinvoke%
		</table>
	</body> 
</html> 
