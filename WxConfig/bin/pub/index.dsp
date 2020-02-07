%invoke wx.config.impl.ui:getConfigValuesForUI%
	%onerror%
		%include snippets/error.dsp%
%endinvoke%

%invoke wx.config.impl.ui:mainMenu%

<HTML>
   <TITLE>WxConfig - %value $host%</TITLE>
   <!-- MASTER FRAMESET -->
   <FRAMESET  rows="70,*"  border="0"  framespacing="0"  spacing="0" frameborder="0">
   		<FRAME  src="top.dsp"  marginwidth="0"  marginheight="0"  border="0"  name="topmenu" scrolling="auto" noresize>
   		<FRAMESET  cols="190,*"  border="0"  framespacing="0"  spacing="0" frameborder="0">
   			<FRAME  src="%ifvar ui/isNewFormat equals('true')%menu-new.dsp%else%menu.dsp%endifvar%"  marginwidth="0"  marginheight="0"  name="menu" scrolling="yes" noresize>
<!--   			<FRAMESET  rows="400,*"  border="0"  framespacing="0"  spacing="0" frameborder="0"> -->
   				<FRAME src="listPackages.dsp"  marginwidth="0"  marginheight="0" name="body">
<!--   				<FRAME src=""  marginwidth="0"  marginheight="0" name="details">
   			</FRAMESET> -->
   		</FRAMESET>
   </FRAMESET>
   <!-- END of FRAMESET -->
   <NOFRAMES>
   <BODY>
	<BLOCKQUOTE>
      <H4>
      Your browser does not support frames.  Support for frames is required to use the webMethods Integration Server interface.
      </H4>
    </BLOCKQUOTE>
   </BODY>
   </NOFRAMES>
</HTML>

%onerror%

<html>
	<head>
		<title>Access Denied</title>
	</head>
  <body>
   	Access Denied.
   	<br>
   	<br>
      Services necessary to show the Integration Server Administrator are currently unavailable on this 
      port.  This is most likely due to port security restrictions.
   	<br>
   	<br>
      If this is the only port available to access the Integration Server, contact webMethods Support.
   </body>
</html>

%endinvoke%