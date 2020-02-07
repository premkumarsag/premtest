package com.softwareag.wx.log;

import wx.log.services;
import ch.qos.logback.classic.Level;
import org.slf4j.MDC;


/**
 * This class represents the public java API for WxLog
 */
public class WxLog {

  public static void log(String message) {
    log(null, message, null);
  }

  public static void log(String logger, String message) {
    log(logger, message, null);
  }

  public static void log(String message, Level level) {
    log(null, message, level);
  }

  public static void log(String logger, String message, Level level) {
    wx.log.services.logFromJava(logger, message, level);
  }

  public static class MDC {

    /**
     * Put a value into this thread's MDC
     *
     * Wrapper around MDC.put which clears the MDC if called
     * from a service thread which was just recycled from
     * the thread pool.
     */
    public static void put(String key, String value) {
      wx.log.services.conditionallyClearMDC();
      org.slf4j.MDC.put(key, value);
    }

    public static void clear() {
      org.slf4j.MDC.clear();
    }

    public static String get(String key) {
      wx.log.services.conditionallyClearMDC();
      return org.slf4j.MDC.get(key);
    }
  }
}

