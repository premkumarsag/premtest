<html>

  <!-- Copyright (c) 2012, Software AG  All Rights Reserved. -->

	<head>
		%include snippets/htmlHeadDefaults.dsp%
		%invoke wx.config.impl.environment:getDetailsForUI%
		%endinvoke%

		<style>
			.environment
				{
				color: %value color%;
				background-color: %value backgroundColor%;
				font-weight: bold;
				font-size: %value fontSize%;
				padding: 0px 0px 0px 20px;
				line-height: 40px; 
				}
			.adminAbout
				{
				color: %value color%;
				background-color: %value backgroundColor%;
				text-align: right;
				font-size: 8pt;
				}
			.adminAbout:link {color:%value color%}
			.adminAbout:visited {color:%value color%}
			.adminAbout:active {color:%value color%}
			.adminAbout:hover{color:%value color%}
		</style>
	</head>

	<body class="menu" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
		<table border=0 cellspacing=0 cellpadding=0 height=100% width=100%>
			
			<tr>
				<td nowrap class="toptitle" style="text-indent: 15px;" width="100%">
					WxConfig
				</td>
				<td class="toptitle">
					<IMG src="%include snippets/logo.dsp%" border=0 height=25/>
					
				</td>
			</tr>
			<tr>
				<td  class="environment">
					%value environmentTypeName%
					%ifvar noCssFound equals('true')%
						<span class="adminAbout">(No config for colors found, using fallback)</span>
					%endifvar%
					%ifvar commentText%
						<span class="adminAbout">
						%ifvar commentUrl%
							<a href="%value commentUrl%" class="adminAbout" target="body">%value commentText%</a>
						%else%
							%value commentText%
						%endifvar%
						</span>
					%endifvar%
				</td>
				<td nowrap class="adminAbout" style="padding-right:10px">
					<a target='top' href='/WmRoot' class="adminAbout">Administration</a> |
					<a target='body' href='about.dsp' class="adminAbout">About</a>
				</td>
			</tr>
					
		</table>
	</body>
</html>
