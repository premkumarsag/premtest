<html> 

	<head>
		<title>Show Usage of Keys</title>
		%include snippets/htmlHeadDefaults.dsp%
	</head> 

	<body>
		%include snippets/headerUpdates.dsp%

		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb" colspan=6>
					Show Usage of Keys
				</td>
			</tr>
		</table>

		<table width=100%>
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
			<tr>
				<td>
					<a href="showValues.dsp?showPkg=%value showPkg%"><img src="images/previous.gif" alt="Back to values of package %value showPkg%"/></a>
					<a href="showValues.dsp?showPkg=%value showPkg%">Back to values of package %value showPkg%</a>
				</td>
			</tr>
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" class="tableView">
				   
						%rename wxConfigKey key -copy%
						%invoke wx.config.pub:getServicesWithConfig%
						%endinvoke wx.config.pub:getServicesWithConfig%

						%rename wxConfigKey key -copy%
						%invoke wx.config.pub:getServicesUsingKeyDetail%
						%endinvoke wx.config.pub:getServicesUsingKeyDetail%
						
						<tr>
							<td class="heading" colspan=5>
								Usage of Key
							</td>
						</tr>
						<tr>
							<td colspan=5>
								<b>%value key%</b>
							</td>
						</tr>
						<tr>
							<td style="border: none;">
								<img src="images/blank.gif" height=10 width=10>
							</td>
						</tr>
						
							<tr class="subheading2">
								<td>&nbsp;Package&nbsp;</td>
								<td>&nbsp;Service&nbsp;</td>
								<td>&nbsp;WxConfig Service&nbsp;</td>
								<td>&nbsp;Flow Path&nbsp;</td>
								<td>&nbsp;Ignore Global Values&nbsp;</td>
							</tr>
							<script>resetRows();</script>		 
						
						%ifvar serviceUsingKeyList%
							%loop serviceUsingKeyList%
								%rename ../showPkg pkgID -copy%  <!-- needed for inclusion of snippets/configFileWithLink.dsp -->
								<tr>
									<script>writeTD('row-l');</script>
										%value pkgName%
										%ifvar pkgID vequals(pkgName)%
										%else%
											<image src="images/dependency.gif"/>
										%endifvar%
									</td>
									<script>writeTD('row-l');</script>
										%value serviceName%
									</td>
									<script>writeTD('row-l')</script>
										%value getConfigServiceName%
									</td>
									<script>writeTD('row-l');</script>
										%loop getConfigDetails%
											%value flowPath% <br>
										%end%
									</td>
									<script>writeTD('row-l');swapRows();</script>
										%loop getConfigDetails%
											%ifvar ignoreGlobalValues%
												%value ignoreGlobalValues% <br>
											%else%
												&nbsp;<br>
											%endifvar%
										%end%
									</td>
								</tr>
							%endloop%
						%endifvar%
					</table>
				</td>
			</tr>
		</table>
	</body> 
</html> 
