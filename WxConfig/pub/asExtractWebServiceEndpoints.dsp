<html> 
	<head>
		<title>Auto-Setup - Extract Web Service Endpoints</title>
		%include snippets/htmlHeadDefaults.dsp%
		
	</head> 
	<body>
		%include snippets/headerUpdates.dsp%
		%include snippets/htmlHeadAce.dsp%
		
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb">
					Auto Setup &gt; Extract Web Service Endpoints
				</td>
			</tr>
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
		</table>
			
		%ifvar actionMode equals('EXTRACT')%
			%invoke wx.config.impl.autoSetup.ws:extractEndpoints%
				%onerror%
					%include snippets/error.dsp%
			%endinvoke%
			<table width=100% class="tableView">
				<tr>
					<td class="heading" colspan=2>WS Endpoint Details</td>
				</tr>
				<tr class="subheading2">
					<td>
						You can now copy-paste the XML content below into an auto-setup file
						for further use.
					</td>
				</tr>
				<tr>
				 <script>writeTD('evenrow-l');</script>
						<pre id="editor">%value wsXml%</pre>
				 </td>
				 <script>swapRows();</script>
			  </tr>
			 </table>
		%else%
			<form name="saveForm" method="post" action="asExtractWebServiceEndpoints.dsp" target="_self"> 
			   <input type="hidden" name="editMode" value="NEW">
			   <input type="hidden" name="actionMode" value="EXTRACT">        
			   
				<table width="100%" class="tableView">
					%invoke wx.config.impl.autoSetup.ws:getAllEndpoints%
					%endinvoke%
				
					<tr>
						<td class="heading" colspan=5>Currently Defined Web Service Endpoints</td>
					</tr>
					<tr class="subheading2">
						<td class="oddcol" width="5%" tdclass="rowdata" sortable="false" type="CaseInsensitiveString" style="cursor: hand;">&nbsp;Select&nbsp;</td>
						<td class="oddcol" width="5%" tdclass="rowdata" sortable="false" type="CaseInsensitiveString" style="cursor: hand;">&nbsp;Alias&nbsp;</td>
						<td class="oddcol" width="5%" tdclass="rowdata" sortable="false" type="CaseInsensitiveString" style="cursor: hand;">Type</td>
						<td class="oddcol" width="5%" tdclass="rowdata" sortable="false" type="CaseInsensitiveString" style="cursor: hand;">Transport</td>
						<td class="oddcol-l" width="15%" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;" >&nbsp;Description&nbsp;</td>
					</tr>
					<script>resetRows();</script>		 
					%ifvar allEndpoints%
						%loop allEndpoints%
							<tr>
								<script>writeTD('rowdata');</script>
									<input type="checkbox" name="extractIndex" value="%value $index%">
								</td>
								<script>writeTD('row-l');</script>
										%value alias%
								</td>
								<script>writeTD('row-l');</script>
										%value type%
								</td>
								<script>writeTD('row-l');</script>
										%value transportType%
								</td>
								<script>writeTD('row-l');</script>
										%value description%
								</td>
								<script>swapRows();</script>
						%endloop%
					%else%
						<tr>
							<td class="oddrowdata" colspan=7>
								There are no endpoints defined.
							</td>
						</tr>
					%endifvar%
					<tr>
						<td class="action" colspan="7">
							<input type="submit" value="Extract Endpoints">
						</td>
					</tr>   
				</table>
			</form>
		%endifvar%
	</body> 
</html> 
