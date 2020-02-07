%ifvar actionMode equals('SAVE')%    
	<table width=100%>
	%ifvar myVersionsActivated equals('true')%
			<!-- MyVersions Plugin is active, create via MyVersion plugin -->
			%invoke wx.config.plugins.myversion.impl.ui:createConfigFile%
				%ifvar errorMessage%
					%ifvar error equals('true')%
						<tr>
							<td class="error">%value errorMessage%</td>
						</tr>
					%else%
						<tr>
							<td class="success">%value errorMessage%</td>
						</tr>
					%endifvar%
				%else%
					<script>parent.menu.treeRefreshButton.click();</script>
				%endifvar%
				
				%ifvar messages%
					%ifvar success equals('true')%
						<table width=100%>
							<tr>
								<td class="success">
								%loop messages% 
									%value messages% <br>
								%endloop%</td>
							</tr>
						</table>
					%else%
						<table width=100%>
							<tr>
								<td class="error">%loop messages% 
									%value messages% <br>
								%endloop%</td>
							</tr>
						</table>
					%endifvar%
				%else%
					<script>parent.menu.treeRefreshButton.click();</script>
				%endifvar%  
				
					%onerror%
						%include snippets/error.dsp%
			%endinvoke%
	%else%	 <!-- MyVersions Plugin is not active, continue with default -->
		%invoke wx.config.impl.ui:createConfigFile%
			%ifvar errorMessage%
				%ifvar error equals('true')%
					<tr>
						<td class="error">%value errorMessage%</td>
					</tr>
				%else%
					<tr>
						<td class="success">%value errorMessage%</td>
					</tr>
				%endifvar%
			%else%
				<script>parent.menu.treeRefreshButton.click();</script>
			%endifvar%
				%onerror%
					%include snippets/error.dsp%
		%endinvoke%
	%endinvoke%	 <!-- End MyVersions Plugin - ifvar --->	
		%invoke wx.config.impl.ui:reloadPackageCfg%
		%endinvoke wx.config.impl.ui:reloadPackageCfg%
		<tr>
			<td class="info">
				<ul>
					<li>
						<a href="viewFile.dsp?fileNameWithPath=%value fileNameWithPath encode(url)%
								&package=%value pkgID%">
							View
						</a> 
						or
						<a href="editFile.dsp?fileNameWithPath=%value fileNameWithPath encode(url)%
							&package=%value pkgID%
							%ifvar targetPage%
								&targetPage=%value targetPage%
							%endifvar%
							%ifvar calledFromAutoSetup%
								&calledFromAutoSetup=%value calledFromAutoSetup%
							%endifvar%
						">edit</a> new file</li>
					<li><a href="listFiles.dsp?showPkg=%value package%">Show files from package %value package%</a> </li>
				</ul>
			</td>
		</tr>
	</table>
%endifvar%