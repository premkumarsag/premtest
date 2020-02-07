<html>
<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" content="-1">
  <link rel="stylesheet" TYPE="text/css" href="webMethods.css">
  <script src="webMethods.js"></script>
  
  
  <body onLoad="setNavigation('microservices.dsp', 'doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Microservices_ConfigurationVariables');">
   
    <table width="100%">
        <tr>
            <td class="breadcrumb" colspan="2"> Microservices &gt; Configuration Variables </td>
        </tr>
		
        <tr>
            <td colspan="2">
                <ul class="listitems">
					<li class="listitem">
						  <script>
							createForm("htmlform_generate_template", "microservices.dsp", "POST", "BODY");
							setFormProperty("htmlform_generate_template", "action", "generateTemplate");
						  </script>
						  <script>getURL("/invoke/wm.server.configurationvariables:getTemplate","javascript:document.htmlform_generate_template.submit();","Generate Configuration Variables Template");</script>					
					</li>

					<li class="listitem">
						  <script>
							createForm("htmlform_get_active_template", "microservices.dsp", "POST", "BODY");
							setFormProperty("htmlform_get_active_template", "action", "getActiveTemplate");
						  </script>
						  <script>getURL("/invoke/wm.server.configurationvariables:getAppliedTemplate","javascript:document.htmlform_generate_template.submit();","Get Active Configuration Variables Template");</script>					
					</li>
					
					<li class="listitem">
						<script>
							document.write('<a href="microservices-encrypt.dsp">Generate Encrypted Configuration Variable</a>');
						</script>
					</li>					
					
                </ul>
            </td>
        </tr>
    </table>
  </body>   
</head>