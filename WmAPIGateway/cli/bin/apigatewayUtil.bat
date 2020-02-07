@echo off
rem  ###########################################################################
rem                                                                            #
rem  apigatewayUtil.bat                                                        #
rem                                                                            #
rem  This script is designed to work with Java VM's that conform to the        #
rem  command-line conventions of Sun Microsystems (TM) Java Development Kit    #
rem  or Java Runtime Environment.                                              #
rem                                                                            #
rem  ###########################################################################



SET CURR_DIR=%~dp0


if "%1" == "-help" (goto usage)


IF "%JRE_HOME%" == "" (
    set JAVA_EXE="%CURR_DIR%\..\..\..\..\..\..\..\jvm\jvm\jre\bin\java"
) ELSE (
    SET JAVA_EXE="%JRE_HOME%\bin\java"
)




SET CLASSPATH=""
SET CLASSPATH=%CURR_DIR%..\..\code\jars\apigateway-runtime.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%..\..\code\jars\apigateway-runtime-base.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%..\..\code\jars\apigateway-runtime-provider.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%..\..\code\jars\apigateway-is.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%..\..\code\jars\apigateway-core.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%..\..\code\jars\apigateway-utility.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%..\..\code\jars\static\apigateway-api.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%\..\..\..\..\..\..\..\common\lib\ext\jackson-databind.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%\..\..\..\..\..\..\..\common\lib\ext\jackson-annotations.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%\..\..\..\..\..\..\..\common\lib\ext\jackson-core.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%\..\..\..\..\..\..\..\common\lib\ext\jackson-dataformat-yaml.jar;%CLASSPATH%

FOR /R %CURR_DIR%\..\lib %%a in (*.jar) DO CALL :AddToPath %%a

%JAVA_EXE%  -Dcom.softwareag.install.root=%CURR_DIR%\..\..\..\..\..\..\..\   com.softwareag.apigateway.utility.initializer.APIGatewayUtilityStartup  %*
GOTO :EOF






:usage
echo  Usage: apigatewayUtil.bat [COMMANDS AND OPTIONS]
echo  COMMANDS LIST::
echo  -------------------------------------------
echo  configure manageRepo    Command to configure repository
echo     options
echo        -tenant           Specify tenant name (optional)
echo        -file             File path to read repository details (optional)
echo  delete  manageRepo      Command to delete repository
echo     options
echo        -tenant           Specify tenant name (optional)
echo  list manageRepo         Command to list all repositories
echo  create backup           Command to create backup
echo     options
echo        -tenant           Specify tenant name (optional)
echo        -name             Specify backup file name  (optional)
echo        -include          Specify one of the following backup type in case of partial backup: 1."analytics" to backup runtime data  2."assets" to backup assets.(optional) Example partial backup -include assets   
                       
echo  list backup             Command to list backup files in repository
echo     options
echo        -tenant           Specify tenant name  (optional)
echo  delete backup           Command to delete the backup file
echo     options              
echo        -tenant           Specify tenant name  (optional)
echo        -name             Specify backup file name
echo  restore backup          Command to restore the backup file
echo     options
echo        -tenant           Specify tenant name (optional)
echo        -name             Specify backup file name
echo        -sync             Select true to make process synchronous, else select false to make it asynchronous. The default value is true. (optional)
echo  status backup           Command to get the status of the backup file
echo     options           
echo        -tenant           Specify tenant name (optional)
echo        -name             Specify backup file name
echo  configure fs_path  -path c://sample//APIGATEWAY  Command to update Elasticsearch File system path 
echo     options
echo        -path             File system location
goto :EOF

:AddToPath
SET CLASSPATH=%1;%CLASSPATH%
goto :EOF
