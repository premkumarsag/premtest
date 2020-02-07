
<table width="100%" class="tableView">
	<TR>
		<TD colspan=2 class="heading">Special Properties</TD>
	</tr>
	<tr class="subheading2">
		<td>Property</td>
		<td>Description</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.incl=include.cnf</td>
		<script>writeTD('row-l');;swapRows();</script>Include "include.cnf"</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.incl.inactive=clearTables.sql</td>
		<script>writeTD('row-l');;swapRows();</script>Show "clearTables.sql" in file list, so that it can easily be edited, but without
			trying to add its contents to the configuration in memory</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.excl=exclude.cnf</td>
		<script>writeTD('row-l');;swapRows();</script>Exclude "exclude.cnf" from automated inclusion as inactive file</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.env.ENV=environment.cnf</td>
		<script>writeTD('row-l');;swapRows();</script>Include "environment.cnf" if IntegrationServer is running on environment type ENV
			(the value of ENV is read from $WEBMETHODS_HOME/IntegrationServer/config/environment.cnf and can be changed in "Settings / Environment")</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.host.HOST=environment.cnf</td>
		<script>writeTD('row-l');;swapRows();</script>Include "environment.cnf" if IntegrationServer is running on machine HOST</td>
	</tr>

	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.hostPort.HOST_PRIMARY-PORT=environment.cnf</td>
		<script>writeTD('row-l');;swapRows();</script>Include "environment.cnf" if IntegrationServer is running on machine HOST and port PRIMARY-PORT</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.reloadStrategy={ON_CHANGE|NONE|MANAGED}</td>
		<script>writeTD('row-l');;swapRows();</script>Set reload strategy to check on file changes ("ON_CHANGE", default), never reload ("NONE"), 
			or explicitly trigger reload ("MANAGED"); the values are not case-sensitive and will be converted to upper-case internally.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.reloadInterval=30000</td>
		<script>writeTD('row-l');;swapRows();</script>Set reload intervall check to 30,000 milliseconds. Possible values are between 500 (use with care!)
			and 600,000 and invalid values will automatically be adjusted. Applicable only for the "ON_CHANGE" strategy.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.autoSetup.execute={true|false}</td>
		<script>writeTD('row-l');swapRows();</script>Turn automatic execution of auto-setup on or off for package. If set to "true", the auto-setup 
			will be executed PRIOR to loading the package by a custom PackageListener in a fixed order (in technical terms, the service
			<code>wx.config.pub.autoSetup:_all</code> will be executed). If a different order is needed, the execution must be done by a custom
			startup/shutdown service, which calls whatever required services in the <code>wx.config.pub.autoSetup</code> folder</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.dependency.update.skip.anyVersion={true|false}</td>
		<script>writeTD('row-l');swapRows();</script>Instruct WxConfig that it should NOT change an existing, not version-specific depedency. 
			So if package "A" already has a dependency to "WxConfig (*.*)" the latter will not be touched. The net result will be that package 
			"A" runs with all versions of WxConfig. Until v1.3 WxConfig created these non-version-specific dependencies. From v1.4 on, the
			dependency will match the current version of WxConfig. So WxConfig v1.4.x will create a dependency to "WxConfig (1.4)",
			and also, by default, update existing dependencies to this value.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.dependency.create.skip={true|false}</td>
		<script>writeTD('row-l');swapRows();</script>Instruct WxConfig that it should NOT create and/or update
			a dependency to itself altogether. A typical use-case would be that WxConfig serves as an editor to files 
			(e.g. SQL scripts), but does not provide any functionality other than that. So on systems that have WxConfig installed, 
			there is an added value, while the package with e.g. the SQL scripts does not get "tainted" by an automatically created 
			dependency to WxConfig; the latter would make it unusable on systems that do not have WxConfig.
		</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.encrypted.skipLogForMissingHandle=updatePassword</td>
		<script>writeTD('row-l');swapRows();</script>Instruct WxConfig to not log a missing encrypted value for the handle 
			defined by "[[encrypted:updatePassword]]". 
			Each handle needs to be specified separately. The list is specific to the package in which it is placed.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.interpolator.checkUnresolved.excludeFile=fileName</td>
		<script>writeTD('row-l');swapRows();</script>Instruct WxConfig to skip one or several files when checking for unresolved
		interpolators via the service wx.config.impl.admin:checkUnresolvedInterpolators The list is specific to the package in which 
		it is placed. The exclusion does not affect the display of files in the WxConfig web UI.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.encryptedValues.bulkImport.runOnPackageLoad={true|false}</td>
		<script>writeTD('row-l');swapRows();</script>Instruct WxConfig to activate the execution of bulk-import
		of encrypted values (same as during WxConfig startup) as part of the package loading. So when the property 
		is set to true in the package's wxconfig.cnf file (other files don't work), the directory defined by the 
		file location alias BULK_IMPORT_ENCRYPTED_VALUES will be scanned for files to import. The main use-case is
		deployment automation by a general-purpose configuration management tool (e.g. Chef, Puppet, Ansible, etc.).
		So when the respective file with encrypted values is created before the package installation, all values
		do already exist, when the package comes up, and can be used right from the start.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.encryptedValues.bulkImport.fileFilterWildcard=EncVal_MYPKG*.txt</td>
		<script>writeTD('row-l');swapRows();</script>This wildcard
		expression controls what files are being processed during package loading bulk-import of encrypted 
		values. It avoids picking up files that belong to 
		other packages and should be processed at a different time. If not specified, the default (WxConfigEncVal_*.txt) 
		will be used. During startup of WxConfig itself (as opposed to loading the config values for a package), 
		this value has no effect; in that situation the aforementioed default kicks in.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.autoSetup.ports.sleepMillis.startup=2000</td>
		<script>writeTD('row-l');swapRows();</script>Number of milliseconds to wait in the background before starting 
		the processing of port configurations on package startup. There is a global default value of 2000 milliseconds
		(same key in WxConfig/wxconfig.cnf) that can be changed per package. Setting the value to 0 (zero) disables the
		background wait and executes the configuration immediately.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>package.name</td>
		<script>writeTD('row-l');swapRows();</script>Name of the Integration Server package. Typical use-cases would be to use
			it for file-related things where the path contains the name of the current package.
			The value is set automatically
			upon loading the configuration of each package. If such a value is manually specified in the package's main
			config file (wxconfig.cnf), this manually set value is not touched (mostly it will be the same anyway).
			If the value is specified in another file, multiple instances (i.e. a list or array) will exist.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>package.version</td>
		<script>writeTD('row-l');swapRows();</script>Version of the Integration Server package (typically used for logging).</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>package.build</td>
		<script>writeTD('row-l');swapRows();</script>Version of the Integration Server package (typically used for logging).
		By default new packages do not define this value, in which case the configuration vallue will simply not exist.</td>
	</tr>
</TABLE>
			
<table width="100%" class="tableView">
	<TR>
		<TD colspan=2 class="heading">File Locations</TD>
	</tr>
	<tr class="subheading2">
		<td>Property</td>
		<td>Description</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.incl={ALIAS=TEMP}include.cnf</td>
		<script>writeTD('row-l');;swapRows();</script>Include "include.cnf" that is sitting in the location defined by 
			the file location alias TEMP. See menu "Settings / File Location Aliases" for more details.
			This approach is generally recommended over the use of paths, because it is a cleaner mechanism
			to abstract system specifics away from the package content.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.env.DEV={PATH=c:/tmp}include.cnf</td>
		<script>writeTD('row-l');;swapRows();</script>Include "include.cnf" from the directory "c:/tmp". This option
			should only be used in combination with a conditional include (environment type or host name).
			Otherwise there is a high risk that the included file is not available on all systems.
			In general, the use of location aliases should be strongly considered instead of using paths.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.incl={ALIAS*=TEMP}erp01-*.cnf</td>
		<script>writeTD('row-l');;swapRows();</script>Include all files matching "erp01-*.cnf" (normal file wildcard 
		resolution applies) that are sitting in the location defined by the file location alias TEMP. 
		The asterisk after "ALIAS" implies that the inclusion is rescan-enabled. So whenever the service
		"wx.config.impl.reload:rescanForAdd" is executed, files that have been added since the initial loading
		will be picked up and added. Files that have been removed from the file system will NOT be removed
		from WxConfig but show up as missing.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.env.DEV={PATH*=c:/tmp}erp01-*.cnf</td>
		<script>writeTD('row-l');;swapRows();</script>Include all files matching "erp01-*.cnf" (normal file wildcard 
		resolution applies) from the directory "c:/tmp". Otherwise the behavior is the same as for "ALIAS*".</td>
	</tr>
			
	<TR>
		<TD colspan=2>Notes
			<ul class="listitemsplain">
				<li>Filenames may contain the usual wildcards (*, ?), which can be used for all inclusion options.</li>
				<li>Paths (full and relative) are supported for config files when using the "{PATH=...}" directive; details depend on underlying OS.</li>
				<li>For clusters, files can be stored once in a central location and be referenced from all cluster nodes using an absolute path. 
					This ensures consistent values within the limits of the reload interval. Prior to an update it should be considered to
					reduce the reload interval and revert back later.</li>
			</TD>
	</tr>
</TABLE>
			
<table width="100%" class="tableView">
	<TR>
		<TD colspan=3 class="heading">File Inclusion Directives</TD>
	</tr>
	<tr class="subheading2">
		<td>Inclusion</td>
		<td>Description</td>
		<td>Aplies To</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.incl=[dateTime=2012-11-27_07:50:00;2012-11-27_07:51:00]include.cnf</td>
		<script>writeTD('row-l');</script>Include "include.cnf" for the defined timeframe. If current date/time is 
			before the start, a scheduler entry will be created. Also, a scheduler entry will be created for the date/time 
			of deactivation. THIS FEATURE IS EXPERIMENTAL !</td>
		<script>writeTD('row-l');</script>For all inclusions</td>
		<script>swapRows();</script>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.incl=[OS={windows|linux|unix}]include.cnf</td>
		<script>writeTD('row-l');</script>Include "include.cnf" if the operating system matches the host running IS.
			The OS name is not case-sensitive. THIS FEATURE IS EXPERIMENTAL !</td>
		<script>writeTD('row-l');</script>For all inclusions</td>
		<script>swapRows();</script>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.incl=[wmVersion=8.2]include.cnf</td>
		<script>writeTD('row-l');</script>Include "include.cnf" if the version matches that of the running IS.
			It is evaluated from least to most specifc; i.e. you can specify "8" or "8.2" or "8.2.2". 
			THIS FEATURE IS EXPERIMENTAL !</td>
		<script>writeTD('row-l');</script>For all inclusions</td>
		<script>swapRows();</script>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.incl=[globalValues=true]include.cnf</td>
		<script>writeTD('row-l');</script>Include "include.cnf" as global values. 
			%include snippets/infoGlobalValues.dsp%
			THIS FEATURE IS EXPERIMENTAL !</td>
		<script>writeTD('row-l');</script>For all inclusions</td>
		<script>swapRows();</script>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>wx.config.env.CI=[overrideDefaults=true]ci.cnf</td>
		<script>writeTD('row-l');</script>Include "ci.cnf" and replace existing values
			with the same keys that were loaded into memory before. The typical use-case for
			this directive is to override global defaults with other values for particular
			environment types or hosts. Without this directive, the values from these specific
			files would be added to those already in memory, thus building a list.</td>
		<script>writeTD('row-l');</script>For environment, host, or host/port inclusions</td>
		<script>swapRows();</script>
	</tr>
</TABLE>
			
<table width="100%" class="tableView">
	<TR>
		<TD colspan=2 class="heading">Variable Interpolation</TD>
	</tr>
	<tr class="subheading2">
		<td>Property</td>
		<td>Description</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>someKey=Value is ${otherKey}</td>
		<script>writeTD('row-l');;swapRows();</script>Use value from other key</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>someKey=${pkg:SamplePackage;otherKey}</td>
		<script>writeTD('row-l');;swapRows();</script>Use value from otherKey that is defined in package "SamplePackage"</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>someKey=${env:ENVIRONMENT_VARIABLE}</td>
		<script>writeTD('row-l');;swapRows();</script>Pull in value from OS environment variable</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>someKey=${file:fileNameWithPath}</td>
		<script>writeTD('row-l');;swapRows();</script>Pull in contents of file using the JVM's default encoding. 
			Other encodings can be specified with <code>someKey=${file:fileNameWithPath;encoding}</code>.
			Changes of <code>fileNameWithPath</code> are picked up automatically since the file is re-read
			each time the key gets queried. Hence this may have a severe impact on performance and is not
			recommended for high-volume scenarios.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>someKey=${service:serviceName;input1=value1;input2=value2}</td>
		<script>writeTD('row-l');;swapRows();</script>Pull in result from service execution (output string with name "result").
			See <code>wx.config.pub.samples.scenario_02_variableInterpolation:d_serviceInvocation</code> for an example.</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>someKey=${sys:JVM_SYSTEM_PROPERTY}</td>
		<script>writeTD('row-l');;swapRows();</script>Pull in value from JVM system property (see examples in next section)</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>someKey=${date:[FORMAT]}</td>
		<script>writeTD('row-l');;swapRows();</script>Pull in current date/time. If format is is left empty, the value from 
			<code>wx.config.dateInterpolator.defaultFormat</code> is taken. The format is the same as for 
			<a href="http://docs.oracle.com/javase/6/docs/api/java/text/SimpleDateFormat.html">java.text.SimpleDateFormat</a></td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>someKey=${const:&lt;full&nbsp;qualified&nbsp;class&nbsp;name&gt;.&lt;field&nbsp;name&gt;}</td>
		<script>writeTD('row-l');;swapRows();</script>Pull in value from Java class</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>someKey=[[encrypted:KEY_FOR_ENCRYPTED_VALUE]]</td>
		<script>writeTD('row-l');;swapRows();</script>Maintain actual value in Integration Server's encrypted password store (aka PassMan).
			The value of KEY_FOR_ENCRYPTED_VALUE must NOT contain a semicolon, which is reserved for internal handling of secure
			cross-package interpolation. Explicit use of a semicolon will lead to WxConfig not being able to resolve values.<br>
			<br>
			It is possible to assign a description to each encrypted value. This is provided as a simple property, 
			following the convention "encryped.value.desc.KEY_FOR_ENCRYPTED_VALUE=My description on host ${sys:wxConfig.hostname}".
			The example also shows that of course variable interpolation can be used within descriptions. The typical use-case
			will be to provide context to operations people that need to enter e.g. the password of a central database server.
			In such a case the details like database instance, user, etc. could simply be sourced from the environment-specific
			properties that already exist to manage connections etc.</td>
	</tr>
</TABLE>
			
<table width="100%" class="tableView">
	<TR>
		<TD colspan=2 class="heading">System Properties</TD>
	</tr>
	<tr class="subheading2">
		<td>Property</td>
		<td>Description</td>
	</tr>				
	<tr>
		<script>writeTD('rowdata-l');</script>${sys:wxConfig.hostname}</td>
		<script>writeTD('row-l');;swapRows();</script>Current machine's hostname</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>${sys:wxConfig.licenseFileDir}</td>
		<script>writeTD('row-l');;swapRows();</script>Current machine's directory for WxConfig's license file</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>${sys:com.softwareag.install.root}</td>
		<script>writeTD('row-l');;swapRows();</script>Main installation dir (default: c:\SoftwareAG or /opt/softwareag)</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>${sys:watt.server.homeDir}</td>
		<script>writeTD('row-l');;swapRows();</script>Integration Server's installation dir</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>${sys:watt.server.port}</td>
		<script>writeTD('row-l');;swapRows();</script>Integration Server's primary port</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>${sys:watt.server.diagnostic.port}</td>
		<script>writeTD('row-l');;swapRows();</script>Integration Server's diagnostic port</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>${sys:watt.server.threadPool}</td>
		<script>writeTD('row-l');;swapRows();</script>Integration Server's thread pool size</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>${sys:os.name}</td>
		<script>writeTD('row-l');;swapRows();</script>Name of operating system</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>${sys:file.separator}</td>
		<script>writeTD('row-l');;swapRows();</script>File separator ("/" or "\")</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>${sys:line.separator}</td>
		<script>writeTD('row-l');;swapRows();</script>Line separator (e.g. CR+LF or LF)</td>
	</tr>
	<TR>
		<TD colspan=2>
			More information: 
			<a href="http://commons.apache.org/configuration/userguide/howto_basicfeatures.html#Variable_Interpolation" target="_blank">
					http://commons.apache.org/configuration/userguide/howto_basicfeatures.html#Variable_Interpolation
			</a>
		</TD>
	</tr>
</TABLE>
			
<table width="100%" class="tableView">
	<TR>
		<TD colspan=2 class="heading">Special Characters and Escaping</TD>
	</tr>
	<tr class="subheading2">
		<td>Character</td>
		<td>Description</td>
	</tr>				
	<tr>
		<script>writeTD('rowdata-l');</script>List Separator (,)</td>
		<script>writeTD('row-l');;swapRows();</script>Prepend with backslash (\,) to have it interpreted as normal comma</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>Backslash</td>
		<script>writeTD('row-l');;swapRows();</script>Use double-backslash</td>
	</tr>
	<tr>
		<script>writeTD('rowdata-l');</script>More Details</td>
		<script>writeTD('row-l');;swapRows();</script></td>
	</tr>
	<TR>
		<TD colspan=2>
			More information: 
			<a href="https://commons.apache.org/configuration/userguide/howto_properties.html#Special_Characters_and_Escaping" target="_blank">
				https://commons.apache.org/configuration/userguide/howto_properties.html#Special_Characters_and_Escaping
			</a>
		</TD>
	</tr>
</TABLE>
