package com.softwareag.wx.log;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.UnsynchronizedAppenderBase;
import com.wm.app.b2b.server.*;
import com.wm.data.*;
import com.wm.lang.ns.NSName;
import java.util.ArrayList;
import java.util.Map;

public class ServiceAppender extends UnsynchronizedAppenderBase
{
    private String name;
    private String service;
    private String user;

    public String getName()
    {
        return name;
    }

    public void setName(String paramString)
    {
        name = paramString;
    }

    public void setService(String paramString)
    {
        service = paramString;
    }

    public void setUser(String paramString)
    {
        user = paramString;
    }

    public ServiceAppender()
    {
    }

    public void start()
    {
        super.start();
    }

    public void append(ILoggingEvent event)
    {
        IData document = null;
        NSName serviceNSName = NSName.create(service);
        InvokeState localInvokeState = new InvokeState();
        InvokeState.setSessionUser(UserManager.getUser(user));
        try
        {
            document = IDataFactory.create();
            IDataCursor documentCursor = document.getCursor();
            IDataUtil.put(documentCursor, "level", event.getLevel().toString());
            IDataUtil.put(documentCursor, "logger", event.getLoggerName());
            //IDataUtil.put(documentCursor, "message", event.getMessage());
            IDataUtil.put(documentCursor, "message", event.getFormattedMessage());
            IDataUtil.put(documentCursor, "thread", event.getThreadName());
            IDataUtil.put(documentCursor, "timestamp", event.getTimeStamp());
            ArrayList mdcKeyList = new ArrayList(event.getMDCPropertyMap().keySet());
            ArrayList mdcValueList = new ArrayList(event.getMDCPropertyMap().values());
            IData mdcList = IDataFactory.create();
            for(int i = 0; i < mdcValueList.size(); i++)
            {
                IDataCursor mdcCursor = mdcList.getCursor();
                IDataUtil.put(mdcCursor, (String)mdcKeyList.get(i), mdcValueList.get(i));
                mdcCursor.destroy();
            }

            IDataUtil.put(documentCursor, "mdc", mdcList);
            documentCursor.destroy();

            IData pipeline = IDataFactory.create();
            IDataCursor pipelineCursor = pipeline.getCursor();
            IDataUtil.put(pipelineCursor, "event", document);
            pipelineCursor.destroy();
            Service.doInvoke(serviceNSName, pipeline);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public void append(Object obj)
    {
        append((ILoggingEvent)obj);
    }

}

