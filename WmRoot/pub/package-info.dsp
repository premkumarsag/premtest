<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" content="-1">
    <link rel="stylesheet" type="text/css" href="webMethods.css">
  </head>

  <SCRIPT SRC="webMethods.js"></SCRIPT>
    %ifvar showServices%
      <BODY onLoad="setNavigation('package-list.dsp', 'doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_BrowseSvcsScrn');">
    %else%
      <BODY onLoad="setNavigation('package-list.dsp', 'doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_PkgDescScrn');">
    %endif%

    %invoke wm.server.packages.adminui:packageInfo%	 
      %ifvar showServices%
        <table width=100%>
          <tr>
            <td class="breadcrumb" colspan=2>
               Packages &gt;
               Management &gt;
                    %value package encode(html)% &gt;
               Services</td>
          </tr>
          <tr>
            <td colspan=2>
              <ul class="listitems">
			    <script>
				createForm("htmlform_package_info", "package-info.dsp", "POST", "BODY");
				setFormProperty("htmlform_package_info", "package", "%value package encode(url)%");
				</script>
                <li>
				<script>getURL("package-info.dsp?package=%value package encode(url)%", "javascript:document.htmlform_package_info.submit();", "Return to properties for %value package encode(html)%");</script>
				
				</li>
              </ul>
            </td>
          </tr>
          <tr>
            <td>
              <table class="tableView">
              <tr>
                <td class="heading">Services</td>
              </tr>

              %ifvar services%
                %loop services%
				  <tr>
				  <script>
				  createForm("htmlform_service_info_%value $index%", "service-info.dsp", "POST", "BODY");
				  setFormProperty("htmlform_service_info_%value $index%", "service", "%value%");
				  </script>
                    <td class="field">
					
					<script>
						if(is_csrf_guard_enabled && needToInsertToken) {
							document.write('<a href="javascript:document.htmlform_service_info_%value $index%.submit();"><img src="icons/file.png" alt="Service Name %value encode(url)%" border=0></a>');
						} else {
							document.write('<a href="service-info.dsp?service=%value encode(url)%"><img src="icons/file.png" alt="Service Name %value encode(url)%" border=0></a>');
						}
					</script>
					&nbsp;
					<script>
						if(is_csrf_guard_enabled && needToInsertToken) {
							document.write('<a href="javascript:document.htmlform_service_info_%value $index%.submit();">%value encode(html)%</a>');
						} else {
							document.write('<a href="service-info.dsp?service=%value encode(url)%">%value encode(html)%</a>');
						}
					</script>
					</nobr></td>
                  </tr>
                %endloop%
              %else%
                <tr>
                  <td class="field">No services in %value package encode(html)%</td>
                </tr>
              %endif%
            </table>
          </td>
        </tr>

      %else%
        <table width=100%>
          <tr>
            <td class="breadcrumb" colspan=2>
               Packages &gt;
               Management &gt;
                    %value package encode(html)%
            </td>
          </tr>
          <tr>
            <td colspan=2>
              <ul class="listitems">
			    <script>
				createForm("htmlform_package_list", "package-list.dsp", "POST", "BODY");
				createForm("htmlform_package_info_11", "package-info.dsp", "POST", "BODY");
				setFormProperty("htmlform_package_info_11", "package", "%value package%");
				setFormProperty("htmlform_package_info_11", "showServices", "true");
				</script>
                <li>
				<script>getURL("package-list.dsp", "javascript:document.htmlform_package_list.submit();", "Return to Packages Management");</script>
				</li>
                <li>
				<script>getURL("package-info.dsp?package=%value package%&showServices=true", "javascript:document.htmlform_package_info_11.submit();", "Browse services in %value package%");</script>
				
				</li>
              </ul>
            </td>
          </tr>
          <tr>
            <td>
            <table class="tableView">
            <tr>
              <td class="heading" colspan=2>Package Information</td>
            </tr>
            <tr>
                <script>writeTD("row");</script>
                Package Name</TD>
                <script>writeTD("rowdata-l");</script>
                    %value package encode(html)%</TD>
                <script>swapRows();</script>
            </tr>
            <tr>
               <script>writeTD("row");</script>Version</td>
               <script>writeTD("rowdata-l");</script>%value version%&nbsp;</td>
               <script>swapRows();</script>
            </tr>
            <tr>
               <script>writeTD("row");</script>Build</td>
               <script>writeTD("rowdata-l");</script>%value build%&nbsp;</td>
               <script>swapRows();</script>
            </tr>
            <tr>
               <script>writeTD("row");</script>Minimum Version of JVM</td>
               <script>writeTD("rowdata-l");</script>%value jvm_version encode(html)%&nbsp;</td>
               <script>swapRows();</script>
            </tr>

            <tr>
               <script>writeTD("row");</script>Package List ACL</TD>
               <script>writeTD("rowdata-l");</script>%value listACL encode(html)%&nbsp;</td>
               <script>swapRows();</script>
            </tr>
            <tr>
               <script>writeTD("row");</script>Patches Included</td>
               <script>writeTD("rowdata-l");</script>%value patch_nums encode(html)%&nbsp;</td>
               <script>swapRows();</script>
            </tr>

            <tr>
               <script>writeTD("row");</script>Description</TD>
               <script>writeTD("rowdata-l");</script>%value description encode(html)%&nbsp;</td>
               <script>swapRows();</script>
            </tr>
            <tr>
               <script>writeTD("row");</script>Publisher</td>
               <script>writeTD("rowdata-l");</script>%value publisher encode(html)%&nbsp;</td>
               <script>swapRows();</script>
            </tr>
            <tr>
               <script>writeTD("row");</script>Created on</td>
               <script>writeTD("rowdata-l");</script>%value time encode(html)%&nbsp;</td>
               <script>swapRows();</script>
            </tr>

            %ifvar pkgkey%
            <tr>
               <script>writeTD("row");</script>License Key</td>
               <script>writeTD("rowdata-l");</script>%value pkgkey encode(html)%&nbsp;</td>
                <script>swapRows();</script>
            </tr>
            <tr>
               <script>writeTD("row");</script>Key expiration</td>
               <script>writeTD("rowdata-l");</script>%value pkgkeyexp encode(html)%&nbsp;</td>
                <script>swapRows();</script>
            </tr> %endif%
            <tr>
               <script>writeTD("row");</script>Elements Loaded</td>
               <script>writeTD("rowdata-l");</script> %value loadok encode(html)%  
               %ifvar loadok equals('0')%  %else% %endif%  
               %ifvar loadwarning equals('0')%  
               %else% 
                    %ifvar loadwarning equals('1')%  
                        &nbsp;(%value loadwarning encode(html)% warning)
                    %else%
                        &nbsp;(%value loadwarning encode(html)% warnings)
                    %endif%  
                %endif%  
               </td>
                <script>swapRows();</script>
            </tr>
            <tr>
               <script>writeTD("row");</script>Elements Not Loaded</td>
               <script>writeTD("rowdata-l");</script>%value loaderr%&nbsp;</td>
                <script>swapRows();</script>
            </tr>
            <tr>
               <script>writeTD("row");</script>Startup Services</td>
               <script>writeTD("rowdata-l");</script> %ifvar startupServices%
               %loop startupServices%
			      <script>
				  createForm("htmlform_service_info_%value $index%", "service-info.dsp", "POST", "BODY");
				  setFormProperty("htmlform_service_info_%value $index%", "service", "%value%");
				  </script>
				  <script>
						if(is_csrf_guard_enabled && needToInsertToken) {
							document.write('<A HREF="javascript:document.htmlform_service_info_%value $index%.submit();">%value encode(html)%</A>');
						} else {
							document.write('<A HREF="service-info.dsp?service=%value encode(url)%">%value encode(html)%</A>');
						}
					</script>
                   %loopsep ',<BR>'% %endloop%  %else%  None  %endif%  </td>
                <script>swapRows();</script>
            </tr>
            <tr>
               <script>writeTD("row");</script>Shutdown Services</td>
               <script>writeTD("rowdata-l");</script> %ifvar shutdownServices%
               %loop shutdownServices%
			      <script>
				  createForm("htmlform_service_info_shutdown_%value $index%", "service-info.dsp", "POST", "BODY");
				  setFormProperty("htmlform_service_info_shutdown_%value $index%", "service", "%value%");
				  </script>
				  <script>
						if(is_csrf_guard_enabled && needToInsertToken) {
							document.write('<A HREF="javascript:document.htmlform_service_info_shutdown_%value $index%.submit();">%value encode(html)%</A>');
						} else {
							document.write('<A HREF="service-info.dsp?service=%value encode(url)%">%value encode(html)%</A>');
						}
					</script>
                  %loopsep ',<BR>'% %endloop%  %else%  None  %endif%  </td>
                <script>swapRows();</script>
            </tr>
            <tr>
               <script>writeTD("row");</script>Replication Services</td>
               <script>writeTD("rowdata-l");</script> %ifvar replicationServices%
               %loop replicationServices%
			      <script>
				  createForm("htmlform_service_info_4_%value $index%", "service-info.dsp", "POST", "BODY");
				  setFormProperty("htmlform_service_info_4_%value $index%", "service", "%value encode(url)%");
				  </script>
				  <script>
						if(is_csrf_guard_enabled && needToInsertToken) {
							document.write('<A HREF="javascript:document.htmlform_service_info_4_%value $index%.submit();">%value encode(html)%</A>');
						} else {
							document.write('<A HREF="service-info.dsp?service=%value encode(url)%">%value encode(html)%</A>');
						}
					</script>
                   %loopsep ',<BR>'% %endloop%  %else%  None  %endif%  </td>
                <script>swapRows();</script>
            </tr>
            <tr>
               <script>writeTD("row");</script>Packages on which this
                  package depends </td>
               <script>writeTD("rowdata-l");</script>
               %ifvar successors%  %loop successors% %value encode(html)% %loopsep ',<BR>'% %endloop% %else%  None %endif% </td>
                <script>swapRows();</script>
            </tr>
            <tr>
               <script>writeTD("row");</script>Packages that depend on
                  this package</td>
               <script>writeTD("rowdata-l");</script>
               %ifvar predecessors% %loop predecessors% %value encode(html)% %loopsep ', <BR>'% %endloop% %else% None %endif%
                <script>swapRows();</script>
               </tr>
               <tr>
                  <script>writeTD("row");</script>Subscribers</td>
                  <script>writeTD("rowdata-l");</script>
                  %ifvar subscribers%  %loop subscribers% %value encode(html)% %loopsep ',<BR>'% %endloop%  %else%  None  %endif%  </td>
                <script>swapRows();</script>
               </tr>
               </TABLE>
               <BR>


                <script>resetRows();</script>
               <TABLE class="tableView" width=100%>
                  <tr>
                     <td colspan="2" class="heading">Load Errors</td>
                  </tr>
               %ifvar notLoaded%
                  <tr>
                     <td class="oddcol-l">Name</td>
                     <td class="oddcol-l">Reason</td>
                  </tr>
                  %loop notLoaded%
                  <tr>
                     <script>writeTD("rowdata-l");</script>%value itemname encode(html)%</td>
                     <script>writeTD("rowdata-l");</script>%value reason encode(html)%</td>
                     </tr>
                    <script>swapRows();</script>
                  %endloop%
                %else%
                <tr><td class="oddcol-l" colspan="2">No errors</td></tr>
               %endif%
               </TABLE>


               <BR>
                <script>resetRows();</script>
               <TABLE class="tableView" width=100% ID=warnings>
                  <tr>
                     <td colspan="2" class="heading">Load Warnings</td>
                  </tr>
               %ifvar loadedWithWarning%
                  <tr>
                     <td class="oddcol-l">Name</td>
                     <td class="oddcol-l">Reason</td>
                  </tr>
                  %loop loadedWithWarning%
                  <tr>
                     <script>writeTD("rowdata-l");</script>%value itemname encode(html)%</td>
                     <script>writeTD("rowdata-l");</script>%value reason encode(html)%</td>
                     </tr>
                    <script>swapRows();</script>
                  %endloop%
              %else%
                    <tr><td class="oddcol-l" colspan="2">No Warnings</td></tr>
               %endif%
               </TABLE>


               <BR>
                <script>resetRows();</script>
            <table class="tableView" width=100%>
                <tr>
                    <td colspan="5" class="heading">Patch History</td>
                </tr>
            %ifvar patchlist%
                <tr>
                    <td class="oddcol-l">Name</td>
                    <td class="oddcol-l">Version</td>
                    <td class="oddcol-l">Created on</td>
                    <td class="oddcol-l">Description</td>
                    <td class="oddcol-l">Publisher</td>
                </tr>

                <script>resetRows();</script>
                %loop patchlist%
                <tr>
                    <script>writeTD("rowdata-l");</script>%value name encode(html)%</td>
                    <script>writeTD("rowdata-l");</script>%value version encode(html)%</td>
                    <script>writeTD("rowdata-l");</script>%value time encode(html)%</td>
                    <script>writeTD("rowdata-l");</script>%value description encode(html)%</td>
                    <script>writeTD("rowdata-l");</script>%value publisher encode(html)%</td>
                    <script>swapRows();</script>
                </tr>
                %endloop%
              %else%
                    <tr><td class="oddcol-l" colspan="5">No Patches</td></tr>
            %endif%
            </table>

               %endinvoke%
            </td>
         </tr>
      %endif%
    </TABLE>
  </BODY>
</HTML>
