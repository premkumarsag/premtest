package wx;

// -----( IS Java Code Template v1.2
// -----( CREATED: 2018-01-10 10:19:09 AST
// -----( ON-HOST: DBP1SITCL1N1.nichq.moi.gov

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.chrono.HijrahChronology;
import java.time.chrono.HijrahDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import com.softwareag.util.IDataMap;
import com.wm.app.b2b.server.ISRuntimeException;
import com.wm.app.b2b.server.ServerAPI;
import com.wm.lang.ns.NSName;
import com.wm.app.b2b.server.Session;
// --- <<IS-END-IMPORTS>> ---

public final class utils

{
	// ---( internal utility methods )---

	final static utils _instance = new utils();

	static utils _newInstance() { return new utils(); }

	static utils _cast(Object o) { return (utils)o; }

	// ---( server methods )---




	public static final void documentToPipeline (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(documentToPipeline)>> ---
		// @sigtype java 3.5
		// [i] record:0:required document
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
		
			// document
			IData	document = IDataUtil.getIData( pipelineCursor, "document" );
			if ( document != null){
				IDataCursor documentPipelineCursor = document.getCursor();
				while(documentPipelineCursor.next()){
					Object obj = documentPipelineCursor.getValue();
					if (obj == null)
				    {
				      continue;
				    }
				
				    if (obj instanceof String)
				    {
				    	
				      IDataUtil.put(pipelineCursor, documentPipelineCursor.getKey(), (String) obj); 
				    }
				    else if (obj instanceof IData)
				    {
				        IDataUtil.put(pipelineCursor, documentPipelineCursor.getKey(), (IData) obj);
				    }
				    else if (obj instanceof IData[])
				    {
				        IDataUtil.put(pipelineCursor, documentPipelineCursor.getKey(), (IData[]) obj);
				    }
				    else
				    {
				      IDataUtil.put(pipelineCursor, documentPipelineCursor.getKey(), obj);
				    }
					
				}
				documentPipelineCursor.destroy();
			}
		
			
			
			pipelineCursor.destroy();
			
			
		// --- <<IS-END>> ---

                
	}



	public static final void getConsumerId (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getConsumerId)>> ---
		// @sigtype java 3.5
		// [o] field:0:required consumer_id
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
		IDataUtil.put( pipelineCursor, "consumer_id",  Service.getUser().getName());
		pipelineCursor.destroy();
			
		// --- <<IS-END>> ---

                
	}



	public static final void getPackageConfigDir (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getPackageConfigDir)>> ---
		// @sigtype java 3.5
		// [i] field:0:required packageName
		// [o] field:0:required packageConfigDir
		
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	packageName = IDataUtil.getString( pipelineCursor, "packageName" );
		
		IDataUtil.put( pipelineCursor, "packageConfigDir", ServerAPI.getPackageConfigDir(packageName).getPath() );
		pipelineCursor.destroy();
		// --- <<IS-END>> ---

                
	}



	public static final void gregorianDateToHijriDate (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(gregorianDateToHijriDate)>> ---
		// @sigtype java 3.5
		// [i] field:0:optional gregorianDate
		// [i] field:0:required sourceFormat
		// [i] field:0:required targetFormat
		// [i] field:0:required useCurrentDate {"Y","N"}
		// [o] field:0:required hijriDate
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	gregorianDate = IDataUtil.getString( pipelineCursor, "gregorianDate" );
			String	sourceFormat = IDataUtil.getString( pipelineCursor, "sourceFormat" );
			String	targetFormat = IDataUtil.getString( pipelineCursor, "targetFormat" );
			String	useCurrentDate = IDataUtil.getString( pipelineCursor, "useCurrentDate" );
			
			SimpleDateFormat sourceFormatObj  = new SimpleDateFormat(sourceFormat);
			SimpleDateFormat tragetFormatObj  = new SimpleDateFormat(targetFormat);
			SimpleDateFormat defaultFormatObj = new SimpleDateFormat("yyyy-MM-dd");
		                
		                Date inDate = null;
			
			String inDateStr = gregorianDate; 
		
			try {
			       Date startDate = defaultFormatObj.parse("1883-10-31");
		                       if("Y".equalsIgnoreCase(useCurrentDate)){
			        inDate = new Date();
		               }else{
		                        inDate    = sourceFormatObj.parse(inDateStr);
		                       }
			       long difference = inDate.getTime() - startDate.getTime();
			       float daysBetween = (difference / (1000*60*60*24)) + 1;
				   int i = 0;
				   while( daysBetween > (29 + getValueOfHDateSequenceChar(getHDateSequence(),i))){  
						daysBetween = daysBetween - 29 - getValueOfHDateSequenceChar(getHDateSequence(),i);
						i = i +1;
				   }
				   Float fValue   = daysBetween;
		           Long lValue1   = fValue.longValue();
				   String sValue1 = String.format("%02d", lValue1); 
				   Integer iValue = (i % 12)+1;
				   Long lValue2   = iValue.longValue();
				   String sValue2 = String.format("%02d", lValue2);
				   Integer iValue2  =  (1301 + (i / 12));
				   Long lValue3   = iValue2.longValue();
				   String sValue3 = String.format("%d", lValue3);
				   String Hdate = sValue3 + "-" + sValue2 + "-" +sValue1; 
				
				  String islamyDate =  tragetFormatObj.format(defaultFormatObj.parse(Hdate));
				  IDataUtil.put( pipelineCursor, "hijriDate", islamyDate);  
		// pipeline
			}catch(Exception exception){
				IDataUtil.put( pipelineCursor, "exception", exception.getMessage() );
				}						
		pipelineCursor.destroy();	
			
		// --- <<IS-END>> ---

                
	}



	public static final void multiConcat (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(multiConcat)>> ---
		// @sigtype java 3.5
		// [i] field:1:required inStringArray
		// [o] field:0:required concatinatedString
		
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String[]	inStringArray = IDataUtil.getStringArray( pipelineCursor, "inStringArray" );
			String concatinatedString = "";
			for(String temp : inStringArray){
				if(temp==null){
					concatinatedString = concatinatedString + "";
				}else{
					concatinatedString = concatinatedString + temp;
				}
			}
		
		// pipeline
		IDataUtil.put( pipelineCursor, "concatinatedString", concatinatedString );
		pipelineCursor.destroy();
		// --- <<IS-END>> ---

                
	}



	public static final void spawnNewThread (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(spawnNewThread)>> ---
		// @sigtype java 3.5
		// [i] record:0:required servicePipeline
		// [i] field:0:required serviceName
		// [o] field:0:required thread_status
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
		
			// pipeline
		IData	servicePipeline = IDataUtil.getIData( pipelineCursor, "servicePipeline" );
		String	serviceName = IDataUtil.getString( pipelineCursor, "serviceName" );
		String thread_status = "FAILED";
		if ( servicePipeline != null)
		{
			Service.doThreadInvoke(NSName.create(serviceName), servicePipeline, 1000);
		}
		thread_status = "SUCEESS";
		IDataUtil.put( pipelineCursor, "thread_status", thread_status );
		pipelineCursor.destroy();
			
		// --- <<IS-END>> ---

                
	}

	// --- <<IS-START-SHARED>> ---
	public static long getValueOfHDateSequenceChar(String HDateSequence, int i){
		   
		   long longValue = 0;
		   if (HDateSequence.charAt(i) == '0'){
			   longValue = 0;
		   }
		   else{
			   longValue = 1;
		   }
		   return longValue;
	   }
	public static String getHDateSequence(){
		   //Create the Months data from 1301H to 1450H
		 String HDateSequence = "111010010011"; //Year 1301H      
		        HDateSequence = HDateSequence + "011101001001" ; //Year 1302H
		        HDateSequence = HDateSequence + "011101100100" ; //Year 1303H
		        HDateSequence = HDateSequence + "101101101010" ; //Year 1304H
		        HDateSequence = HDateSequence + "010101110101" ; //Year 1305H
		        HDateSequence = HDateSequence + "010010110110" ; //Year 1306H
		        HDateSequence = HDateSequence + "101001010110" ; //Year 1307H
		        HDateSequence = HDateSequence + "101101001010" ; //Year 1308H
		        HDateSequence = HDateSequence + "110110100100" ; //Year 1309H
		        HDateSequence = HDateSequence + "110111010010" ; //Year 1310H
		        HDateSequence = HDateSequence + "010111011001" ; //Year 1311H
		        HDateSequence = HDateSequence + "001011011100" ; //Year 1312H
		        HDateSequence = HDateSequence + "100101011101" ; //Year 1313H
		        HDateSequence = HDateSequence + "010010101101" ; //Year 1314H
		        HDateSequence = HDateSequence + "101001010101" ; //Year 1315H
		        HDateSequence = HDateSequence + "101101001010" ; //Year 1316H
		        HDateSequence = HDateSequence + "101101101001" ; //Year 1317H
		        HDateSequence = HDateSequence + "010101110100" ; //Year 1318H
		        HDateSequence = HDateSequence + "100101110110" ; //Year 1319H
		        HDateSequence = HDateSequence + "010010110111" ; //Year 1320H
		        HDateSequence = HDateSequence + "001001010111" ; //Year 1321H
		        HDateSequence = HDateSequence + "010100101011" ; //Year 1322H
		        HDateSequence = HDateSequence + "011010010101" ; //Year 1323H
		        HDateSequence = HDateSequence + "011011001010" ; //Year 1324H
		        HDateSequence = HDateSequence + "101011010101" ; //Year 1325H
		        HDateSequence = HDateSequence + "010101011011" ; //Year 1326H
		        HDateSequence = HDateSequence + "001001011101" ; //Year 1327H
		        HDateSequence = HDateSequence + "100100101101" ; //Year 1328H
		        HDateSequence = HDateSequence + "110010010101" ; //Year 1329H
		        HDateSequence = HDateSequence + "110101001010" ; //Year 1330H
		        HDateSequence = HDateSequence + "111010100101" ; //Year 1331H
		        HDateSequence = HDateSequence + "011011010010" ; //Year 1332H
		        HDateSequence = HDateSequence + "101011010101" ; //Year 1333H
		        HDateSequence = HDateSequence + "010101011010" ; //Year 1334H
		        HDateSequence = HDateSequence + "101010101011" ; //Year 1335H
		        HDateSequence = HDateSequence + "010101001011" ; //Year 1336H
		        HDateSequence = HDateSequence + "011010100101" ; //Year 1337H
		        HDateSequence = HDateSequence + "011101010010" ; //Year 1338H
		        HDateSequence = HDateSequence + "101110101001" ; //Year 1339H
		        HDateSequence = HDateSequence + "001101110100" ; //Year 1340H
		        HDateSequence = HDateSequence + "101010110110" ; //Year 1341H
		        HDateSequence = HDateSequence + "010101010110" ; //Year 1342H
		        HDateSequence = HDateSequence + "101010101010" ; //Year 1343H
		        HDateSequence = HDateSequence + "110101010010" ; //Year 1344H
		        HDateSequence = HDateSequence + "110110101001" ; //Year 1345H
		        HDateSequence = HDateSequence + "010111010100" ; //Year 1346H
		        HDateSequence = HDateSequence + "101011101010" ; //Year 1347H
		        HDateSequence = HDateSequence + "010011011101" ; //Year 1348H
		        HDateSequence = HDateSequence + "001001101110" ; //Year 1349H
		        HDateSequence = HDateSequence + "100100101110" ; //Year 1350H
		        HDateSequence = HDateSequence + "101010100110" ; //Year 1351H
		        HDateSequence = HDateSequence + "110101010100" ; //Year 1352H
		        HDateSequence = HDateSequence + "110110101010" ; //Year 1353H
		        HDateSequence = HDateSequence + "010110110101" ; //Year 1354H
		        HDateSequence = HDateSequence + "001010110110" ; //Year 1355H
		        HDateSequence = HDateSequence + "100100110111" ; //Year 1356H
		        HDateSequence = HDateSequence + "010010011011" ; //Year 1357H
		        HDateSequence = HDateSequence + "101001001011" ; //Year 1358H
		        HDateSequence = HDateSequence + "101100100101" ; //Year 1359H
		        HDateSequence = HDateSequence + "101101010100" ; //Year 1360H
		        HDateSequence = HDateSequence + "101101101010" ; //Year 1361H
		        HDateSequence = HDateSequence + "010101101101" ; //Year 1362H
		        HDateSequence = HDateSequence + "010010101101" ; //Year 1363H
		        HDateSequence = HDateSequence + "101001010101" ; //Year 1364H
		        HDateSequence = HDateSequence + "110100100101" ; //Year 1365H
		        HDateSequence = HDateSequence + "111010010010" ; //Year 1366H
		        HDateSequence = HDateSequence + "111011001001" ; //Year 1367H
		        HDateSequence = HDateSequence + "011011010100" ; //Year 1368H
		        HDateSequence = HDateSequence + "101011101010" ; //Year 1369H
		        HDateSequence = HDateSequence + "010101101011" ; //Year 1370H
		        HDateSequence = HDateSequence + "010010101011" ; //Year 1371H
		        HDateSequence = HDateSequence + "011010010101" ; //Year 1372H
		        HDateSequence = HDateSequence + "101101001001" ; //Year 1373H
		        HDateSequence = HDateSequence + "101110100100" ; //Year 1374H
		        HDateSequence = HDateSequence + "101110110010" ; //Year 1375H
		        HDateSequence = HDateSequence + "010110110101" ; //Year 1376H
		        HDateSequence = HDateSequence + "001010111010" ; //Year 1377H
		        HDateSequence = HDateSequence + "100101011011" ; //Year 1378H
		        HDateSequence = HDateSequence + "010010101011" ; //Year 1379H
		        HDateSequence = HDateSequence + "010101010101" ; //Year 1380H
		        HDateSequence = HDateSequence + "011010110010" ; //Year 1381H
		        HDateSequence = HDateSequence + "011011011001" ; //Year 1382H
		        HDateSequence = HDateSequence + "001011101100" ; //Year 1383H
		        HDateSequence = HDateSequence + "100101101110" ; //Year 1384H
		        HDateSequence = HDateSequence + "010010101110" ; //Year 1385H
		        HDateSequence = HDateSequence + "101001010110" ; //Year 1386H
		        HDateSequence = HDateSequence + "110100101010" ; //Year 1387H
		        HDateSequence = HDateSequence + "110101010101" ; //Year 1388H
		        HDateSequence = HDateSequence + "010110101010" ; //Year 1389H
		        HDateSequence = HDateSequence + "101010110101" ; //Year 1390H
		        HDateSequence = HDateSequence + "010010111011" ; //Year 1391H
		        HDateSequence = HDateSequence + "001001011011" ; //Year 1392H
		        HDateSequence = HDateSequence + "100100101011" ; //Year 1393H
		        HDateSequence = HDateSequence + "101010010101" ; //Year 1394H
		        HDateSequence = HDateSequence + "101101001010" ; //Year 1395H
		        HDateSequence = HDateSequence + "101110100101" ; //Year 1396H
		        HDateSequence = HDateSequence + "010110101010" ; //Year 1397H
		        HDateSequence = HDateSequence + "101010110101" ; //Year 1398H
		        HDateSequence = HDateSequence + "010101010110" ; //Year 1399H
		        HDateSequence = HDateSequence + "101010010110" ; //Year 1400H
		        HDateSequence = HDateSequence + "110101001010" ; //Year 1401H
		        HDateSequence = HDateSequence + "111010100101" ; //Year 1402H
		        HDateSequence = HDateSequence + "011101010010" ; //Year 1403H
		        HDateSequence = HDateSequence + "011011101001" ; //Year 1404H
		        HDateSequence = HDateSequence + "001101101010" ; //Year 1405H
		        HDateSequence = HDateSequence + "101010101101" ; //Year 1406H
		        HDateSequence = HDateSequence + "010101010101" ; //Year 1407H
		        HDateSequence = HDateSequence + "101010100101" ; //Year 1408H
		        HDateSequence = HDateSequence + "101101010010" ; //Year 1409H
		        HDateSequence = HDateSequence + "101110101001" ; //Year 1410H
		        HDateSequence = HDateSequence + "010110110100" ; //Year 1411H
		        HDateSequence = HDateSequence + "100110111010" ; //Year 1412H
		        HDateSequence = HDateSequence + "010011011011" ; //Year 1413H
		        HDateSequence = HDateSequence + "001001011101" ; //Year 1414H
		        HDateSequence = HDateSequence + "010100101101" ; //Year 1415H
		        HDateSequence = HDateSequence + "101010100101" ; //Year 1416H
		        HDateSequence = HDateSequence + "101011010100" ; //Year 1417H
		        HDateSequence = HDateSequence + "101011101010" ; //Year 1418H
		        HDateSequence = HDateSequence + "010101101101" ; //Year 1419H
		        HDateSequence = HDateSequence + "010010111101" ; //Year 1420H
		        HDateSequence = HDateSequence + "001000111101" ; //Year 1421H
		        HDateSequence = HDateSequence + "100100011101" ; //Year 1422H
		        HDateSequence = HDateSequence + "101010010101" ; //Year 1423H
		        HDateSequence = HDateSequence + "101101001010" ; //Year 1424H
		        HDateSequence = HDateSequence + "101101011010" ; //Year 1425H
		        HDateSequence = HDateSequence + "010101101101" ; //Year 1426H
		        HDateSequence = HDateSequence + "001010110110" ; //Year 1427H
		        HDateSequence = HDateSequence + "100100111011" ; //Year 1428H
		        HDateSequence = HDateSequence + "010010011011" ; //Year 1429H
		        HDateSequence = HDateSequence + "011001010101" ; //Year 1430H
		        HDateSequence = HDateSequence + "011010101001" ; //Year 1431H
		        HDateSequence = HDateSequence + "011101010100" ; //Year 1432H
		        HDateSequence = HDateSequence + "101101101010" ; //Year 1433H
		        HDateSequence = HDateSequence + "010101101100" ; //Year 1434H
		        HDateSequence = HDateSequence + "101010101101" ; //Year 1435H
		        HDateSequence = HDateSequence + "010101010101" ; //Year 1436H
		        HDateSequence = HDateSequence + "101100101001" ; //Year 1437H
		        HDateSequence = HDateSequence + "101110010010" ; //Year 1438H
		        HDateSequence = HDateSequence + "101110101001" ; //Year 1439H
		        HDateSequence = HDateSequence + "010111010100" ; //Year 1440H
		        HDateSequence = HDateSequence + "101011011010" ; //Year 1441H
		        HDateSequence = HDateSequence + "010101011010" ; //Year 1442H
		        HDateSequence = HDateSequence + "101010101011" ; //Year 1443H
		        HDateSequence = HDateSequence + "010110010101" ; //Year 1444H
		        HDateSequence = HDateSequence + "011101001001" ; //Year 1445H
		        HDateSequence = HDateSequence + "011101100100" ; //Year 1446H
		        HDateSequence = HDateSequence + "101110101010" ; //Year 1447H
		        HDateSequence = HDateSequence + "010110110101" ; //Year 1448H
		        HDateSequence = HDateSequence + "001010110110" ; //Year 1449H
		        HDateSequence = HDateSequence + "101001010110" ; //Year 1450H
		     return(HDateSequence);
		   }
		
	// --- <<IS-END-SHARED>> ---
}

