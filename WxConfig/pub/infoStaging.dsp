<HTML>
	<HEAD>
		<title>Info Staging</title>
		%include snippets/htmlHeadDefaults.dsp%
	</HEAD>

	
	<BODY>
		%include snippets/headerUpdates.dsp%
	
	<TABLE WIDTH="100%">
		<TR>
			<TD class="breadcrumb" colspan="4">
				Info &gt; Staging
			</TD>
		</TR>
		<TR/>
		
		<TR>
			<TD><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
     		<TD colspan=2></TD>
		</tr>
	</table>
	<table class="tableView" width=100%>
		<tr>
			<td class="heading" colspan=2>Staging</td>
		</tr>
		<tr class="subheading2">
			<td>Topic</td>
			<td>Content</td>
		</tr>
		
		<tr>
			<script>writeTD('row');</script>
				Overview
			</td>
			<script>writeTD('row-l');</script>
				A very common requirement is to have configuration values that are specific to 
				an environment (DEV, TEST, PROD, etc.) and/or host. It is usually preferable, though, 
				to not bind the applicability to a host but a logical environment.
				<p>
				WxConfig can be used in two ways to achieve this goal.
				<ol>
					<li>Logic outside WxConfig (usually in build/deployment system):<br>
						Through a scripted aprroach it is ensured from the outside that the files
						WxConfig reads contain the values/content applicable to the current environment.
						In this approach WxConfig has no knowledge about the type of environment
						it is running on. This approach is recommended only if there are
						requirements that cannot be handled by WxConfig.</li>
					<li>Logic inside WxConfig:<br>
						There is a multitude of conditions (stage and others) supported so that at run-time 
						WxConfig reads in the correct files. Those conditions can also be combined with a 
						logical AND. The possible conditions are
						<ul class="listitemsplain">
							<li>Stage name (DEV, TEST, etc.)</li>
							<li>Host name</li>
							<li>Host name + primary port</li>
							<li>Operating system</li>
							<li>Date/timeframe</li>
							<li>webMethods version</li>
						</ul>
						</li>
				</ol>
			</td>
			<script>swapRows();</script>
		</tr>
		
		<tr>
			<script>writeTD('row');</script>
				Steps
			</td>
			<script>writeTD('row-l');</script>
				The approach is the following:
				<ul class="listitemsplain">
					<li>Think about which of your configuration values are 
						environment-specific and which not.</li>
					<li>The ones that apply to all environments go into the 
						package’s wxconfig.cnf file</li>
					<li>The others go into "dev.cnf" (this name is just a suggestion, 
						use whatever makes sense to you).</li>
					<li>Create a new config file "dev.cnf" and set its stage accordingly
						as per the following screenshot:<br>
						<img src="./images/screenshotCreateCfgFileEnvironment.png" />
						</li>
					<li>This will create the new file and add a line to the package's
						main config file (=wxconfig.cnf) to conditionally load it.</li>
					<li>Do the same for your other environments and adjust the 
						values in the files respectively.</li>
					<li>Configure each of the environments to its value using  
						the GUI (screenshot below) <br>
						<img src="./images/screenshotSetEnvironment.png" />
						</li>
				</ul>
			</td>
			<script>swapRows();</script>
		</tr>
		
		
  	</TABLE>
</BODY>
