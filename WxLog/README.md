*WxLog* is a fast and efficient custom logging package for Integration Server. 

WxLog is implemented using [logback](http://logback.qos.ch/) and thus inherits its capabilities and flexible configuration. WxLog services are small wrappers around existing logback methods. The primary additional function provided is that rather than using java class name as the logger name, the NS service name (of the service invoking the log service) is used.


com.softwareag.wx.log.ServiceAppender
=====================================

`com.softwareag.wx.log.ServiceAppender` is a logback appender that invokes an integration server service for each log event. See [Configuration Examples](#WxLog/wx.log.services:configure/configuration-examples) for information on how to configure and use this appender.


<div id=wx.log.services:configure/configuration-examples></div>


Configuration
=============

WxLog uses logback for configuration. Documentation for logback configuration is here: http://logback.qos.ch/manual/configuration.html

Below are a few configuration examples.

Appender Patterns:

    <pattern>HI %d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n</pattern>
    <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} %3([%.-1level]) %3(123) %-30(%X{pkg}/%X{svc_short}:) trackingID: %X{trackingID} %msg%n</pattern>

MDC Values:

    %X{mdc-name}

Console Appender:

    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
      <encoder>
        <pattern>HI %d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n</pattern>
      </encoder>
    </appender>

File Appender

    <appender name="FILE" class="ch.qos.logback.core.FileAppender">
      <file>logs/xwmlog.log</file>
      <append>true</append>
        <encoder>
        <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} %3([%.-1level]) %3(123) %-30(%X{pkg}/%X{svc_short}:) trackingID: %X{trackingID} %msg%n</pattern>
      </encoder>
    </appender>

Service Appender:

    <appender name="DB" class="com.softwareag.wx.log.ServiceAppender">
      <service>pub.flow:tracePipeline</service>
      <user>Administrator</user>
    </appender>

Set Package log level:

    <logger name="WxLog" level="TRACE" />

Set Folder log level:

    <logger name="WxLog.wx.log" level="TRACE" />

Set Service log level:

    <logger name="WxLog.wx.log.services.log" level="TRACE" />

Root Logger:

    <root level="ERROR">
      <appender-ref ref="STDOUT"/> 
      <appender-ref ref="FILE"/>
    </root>

Send a logger to a different appender:

    <logger name="WxLog.wx.log" level="TRACE" >
      <appender-ref ref="FILE2"/>
    </logger>


