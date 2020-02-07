<HTML>
	<HEAD>
		<title>Info FAQ</title>
		%include snippets/htmlHeadDefaults.dsp%
	</HEAD>

	
	<BODY>
		%include snippets/headerUpdates.dsp%
	
	<TABLE WIDTH="100%">
		<TR>
			<TD class="breadcrumb" colspan="4">
				Info &gt; FAQ
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
			<td class="heading" colspan=2>FAQ</td>
		</tr>
		<tr class="subheading2">
			<td>Topic</td>
			<td>Content</td>
		</tr>
		<tr>
			<script>writeTD('row');</script>
				Global Values
			</td>
			<script>writeTD('row-l');</script>
				Global values refers to values that are defined once and can be used from 
				several or all packages. The rational for this is the DRY principle
				(DRY = dont repeat yourself). In contrast
				"normal" values are used only from the package in which they are kept.
				<p>
				This can be achieved with WxConfig in different ways:
				<ul class="listitemsplain">
					<li> Mark the contents of a file as "Global Values".
						%include snippets/infoGlobalValues.dsp%</li>
						
					<li> Another way is the use of the cross-package interpolator that
						has the syntax <code>localKey=${pkg:GlobalValuesPackage;globalKey}</code></li>
						
					<li> By having a package dedicated
						for those global values. Those values can then be retrieved from
						other packages just like normal ones, only the optional parameter
						"wxConfigPkgName" needs to be specified. Also, all packages using
						values from this global package need to define a package dependency
						on the global package. This ensures that the existence of the
						global package is checked at run-time.
					
					<li> It is theoretically possible to achieve the same behavior 
						by including files across package boundaries. This is,
						however, strongly discouraged, as it will create hidden
						dependencies that are difficult to troubleshoot.
				</ul>
			</td>
			<script>swapRows();</script>
		</tr>
		
		<tr>
			<script>writeTD('row');</script>
				Clusters
			</td>
			<script>writeTD('row-l');</script>
				The use of WxConfig in a clustered setup is supported in the
				following ways.
				<ul class="listitemsplain">
					<li>By default config files are, together with the rest
						of the package, deployed to all cluster nodes
						by webMethods Deployer.</li>
					<li>Updates to config files can easily be done with a
						separate Deployer job that only contains those
						files instead of the entire packages.</li>
					<li>Alternatively it is possible to place config files
						into a shared storage location (e.g. NAS) and
						include them from there. Absolute and relative
						paths are possible for all include statements.</li>
					<li>In both scenarios there may be short periods when
						the values might be inconsistent across cluster nodes.
						If that is a concern, please get in touch with 
						Software AG Global Consulting Services for a
						solution that takes the specific requirements into account.
						</li>
				</ul>
			</td>
			<script>swapRows();</script>
		</tr>
		
		
  	</TABLE>
</BODY>


%endbundle%
