@echo off
rem  ###########################################################################
rem                                                                            #
rem  apigw-upgrade-backup.bat                                                  #
rem                                                                            #
rem  This script is designed to work with Java VM's that conform to the        #
rem  command-line conventions of Sun Microsystems (TM) Java Development Kit    #
rem  or Java Runtime Environment.                                              #
rem                                                                            #
rem  ###########################################################################

SET CURR_DIR=%~dp0

IF "%JRE_HOME%" == "" (
    set JAVA_EXE="%CURR_DIR%\..\..\..\..\..\..\..\jvm\jvm\jre\bin\java"
) ELSE (
    SET JAVA_EXE="%JRE_HOME%\bin\java"
)

SET CLASSPATH=""
SET CLASSPATH=%CURR_DIR%..\..\code\jars\apigateway-utility.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%..\..\code\jars\apigateway-core.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%..\..\code\jars\ant-1.8.2.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%..\..\code\jars\ant-launcher-1.8.2.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%..\..\code\jars\static\commons-lang3-3.0.1.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%..\..\code\jars\static\snakeyaml-1.15.0.jar;%CLASSPATH%
SET CLASSPATH=%CURR_DIR%..\lib\log4j-1.2.17.jar;%CLASSPATH%

%JAVA_EXE% com.softwareag.apigateway.utility.command.backup.instance.BackupApiGatewayForUpgrade %*
