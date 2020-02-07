<html>
	<head>
		<title>Delete Configuration File</title> 
		%include snippets/htmlHeadDefaults.dsp%
	</head>

	<body onLoad="setNavigation('about.dsp', 'help.dsp');">
		%include snippets/headerUpdates.dsp%
		
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb" colspan=6>
					Delete File
				</td>
			</tr>
		</table>
		
		<table width="100%">
			%invoke wx.config.impl.ui:canFileBeDeleted%
				%ifvar success equals('true')%
				%else%
					%include /snippets/successAndMessage.dsp%
				%endifvar%
			%endinvoke wx.config.impl.ui:canFileBeDeleted%
			
			%invoke wx.config.impl.admin:getIncludeForConfigFile%
				%onerror%
					%include /snippets/error.dsp%
			%endinvoke wx.config.impl.admin:getIncludeForConfigFile%
			<tr>
				<td colspan=2>
					<ul>
						<li>
							%include snippets/linkBack.dsp%
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td><img src="images/blank.gif" height=10 width=10></td>
			</tr>
			<tr>
				<td>
					<table class="tableView" width="100%">
						<tr>
							<td class="heading" colspan=2>Delete File</td>
						</tr>
						<tr class="subheading2">
							<td>
								<br>
								<form method="post" action=
									%ifvar targetPage%
										"%value targetPage%"
									%else%
										"listFiles.dsp"
									%endifvar%
									target="_self">
									<input type="hidden" name="fileNameWithPath" value="%value /fileNameWithPath%">
									<input type="hidden" name="package" value="%value /package%"> <!-- Needed for wx.config.impl.ui:deleteCfgFile called from listFiles.dsp-->
									<input type="hidden" name="showPkg" value="%value /showPkg%"> <!-- Used by listFiles.dsp to only show packages from -->
									<input type="hidden" name="action" value="delete">
									%ifvar success equals('true')%
										<input type="submit" value="Delete File">
									%endifvar%
								</form>
							</td>
							<td style="text-align:left;">
								<b>%value fileNameWithPath%</b>
							</td>
						</tr>
						<tr>
							<script>writeTD('rowdata-l');</script>
								Package
							</td>
							<script>writeTD('row-l');swapRows();</script>
								%value package%
							</td>
						</tr>
						%ifvar includeKey%
							
							<tr>
								<script>writeTD('rowdata-l');</script>
									Include
								</td>
								<script>writeTD('row-l');swapRows();</script>
									%value includeKey% = %value includeValue%
									%ifvar isWildcardInclusion equals('true')%
										&nbsp;&nbsp;&nbsp;(included via wildcard, inclusion statement will not be touched)
									%endifvar%
								</td>
							</tr>
						%endifvar%
						<tr>
							<script>writeTD('rowdata-l');</script>
								Content
							</td>
							<script>writeTD('row-l');swapRows();</script>
								%ifvar isMissing equals('false')%
									%invoke wx.config.impl.util.file:getFile%
										%onerror%
											%include /snippets/error.dsp%
									%endinvoke wx.config.impl.util.file:getFile%
									<pre>%value fileContent%</pre>
								%else%
									<IMG SRC="images/dependency.gif" border="0" height=14 width=14 alt="File missing" title="File missing"> <b>File missing</b>
								%endifvar%
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
