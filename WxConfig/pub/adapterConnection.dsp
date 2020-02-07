<html> 

	
  <!-- Copyright (c) 2017, Software AG  All Rights Reserved. -->

	<head>
		<title>Extract Adapter Connection for Auto-Setup</title>
		%include snippets/htmlHeadDefaults.dsp%
	</head> 

	<body>
		%include snippets/headerUpdates.dsp%
		%include snippets/htmlHeadAce.dsp%
		
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb" colspan=6>
					Auto Setup &gt; Extract Adapter Connection
				</td>
			</tr>
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
		</table>

		<form method="post" action="adapterConnection.dsp" target="_self"> 
			<input type="hidden" name="editMode" value="NEW">           
			<input type="hidden" name="actionMode" value="EXTRACT">        
	   
			<table width="100%" class="tableView">
				<tr>
					<td class="heading" colspan=2>Specify Connection Node</td>
				</tr>
				<tr>
					<script>writeTD('row');</script>
						Connection Node
					</td>
					<script>writeTD('rowdata-l');writeInputFieldWithId("connection-node", "connectionAlias", "%value connectionAlias%", 70, "%value /editMode%");</script>
						(Connection Node with full Namespace)
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<td class="action" colspan="2">
						<input type="submit" value="Start">
					</td>
				</tr>   
			</table>
		</form>
	 
		%ifvar actionMode equals('EXTRACT')%
			%invoke wx.config.impl.autoSetup.adapter.connection:createXmlForCfgFile%
				%onerror%
					%include snippets/error.dsp%
			%endinvoke%
			<table width="100%" class="tableView">
				<tr>
					<td class="heading" colspan=2>Connection Node Details</td>
				</tr>
				<tr class="subheading2">
					<td>
						You can now copy-paste the XML content below into an auto-setup file
						for further use.
					</td>
				</tr>
				
				<tr>
					<script>writeTD('evenrow-l');</script>
						<pre id="editor">%value adapterConnectionXml%</pre>
					</td>
					<script>swapRows();</script>
			  </tr>
			</table>
			%else%
				
						This dialogue allows you to specify an adapter connection node 
						(with full namespace), which you want to extract in a format that 
						can used for auto-setup configuration values. Once you press "Next",
						all available values will be shown as XML that can be used for
						auto-setup via copy-paste.
				
			%endifvar%
				
		<script>document.getElementById("connection-node").focus();</script>
	</body> 
</html> 
