package wx.audit;

// -----( IS Java Code Template v1.2
// -----( CREATED: 2017-01-28 21:24:34 IST
// -----( ON-HOST: MCSMUN01.eur.ad.sag

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import com.ibm.icu.text.SimpleDateFormat;
import com.softwareag.util.IDataMap;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
// --- <<IS-END-IMPORTS>> ---

public final class utils

{
	// ---( internal utility methods )---

	final static utils _instance = new utils();

	static utils _newInstance() { return new utils(); }

	static utils _cast(Object o) { return (utils)o; }

	// ---( server methods )---




	public static final void generateSearchCondition (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(generateSearchCondition)>> ---
		// @sigtype java 3.5
		// [i] field:0:optional service_id
		// [i] field:0:optional consumer_id
		// [i] field:0:optional search_field1
		// [i] field:0:optional search_field2
		// [i] field:0:optional transaction_id
		// [i] field:0:optional audit_type
		// [i] field:0:optional status
		// [i] field:0:optional date_from
		// [i] field:0:optional date_to
		// [i] field:0:required search_type {"AND","OR"}
		// [o] field:0:required search_condition
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	ServiceID = IDataUtil.getString( pipelineCursor, "service_id" );
			String	ConsumerID = IDataUtil.getString( pipelineCursor, "consumer_id" );
			String	SearchField1 = IDataUtil.getString( pipelineCursor, "search_field1" );
			String	SearchField2 = IDataUtil.getString( pipelineCursor, "search_field2" );
			String	TransactionID = IDataUtil.getString( pipelineCursor, "transaction_id" );
			String	Status = IDataUtil.getString( pipelineCursor, "status" );
			String	AuditType = IDataUtil.getString( pipelineCursor, "audit_type" );
			String	auditTimeStampFromDate = IDataUtil.getString( pipelineCursor, "date_from" );
			String	auditTimeStampToDate = IDataUtil.getString( pipelineCursor, "date_to" );
			String	search_type = IDataUtil.getString( pipelineCursor, "search_type" );
			HashMap<String,String> fields=new HashMap<String,String>();
			String search_condition=" ";
		pipelineCursor.destroy();
		if(ServiceID !=null && !ServiceID.equals(""))
		{
			fields.put("A.SERVICE_ID", ServiceID);
		 
		}
		
		
		if(ConsumerID !=null && !ConsumerID.equals(""))
		{
			fields.put("A.CONSUMER_ID", ConsumerID);
		 
		}
		
		if(SearchField1 !=null && !SearchField1.equals(""))
		{
			fields.put("A.SEARCH_FIELD1", SearchField1);
		 
		}
		if(SearchField2 !=null && !SearchField2.equals(""))
		{
			fields.put("A.SEARCH_FIELD2", SearchField2);
		 
		}
		if(TransactionID !=null &&  !TransactionID.equals(""))
		{
			fields.put("B.TRANSACTION_ID", TransactionID);
		 
		}
		if(Status !=null && !Status.equals(""))
		{
			fields.put("B.STATUS", Status);
		 
		}
		if(AuditType !=null && !AuditType.equals(""))
		{
			fields.put("B.AUDIT_TYPE", AuditType);
		 
		}
		if(auditTimeStampFromDate !=null && !auditTimeStampFromDate.equals(""))
		{
			//fields.put("AUDIT_TIMESTAMP", auditTimeStampFromDate);
			search_condition=search_condition+" B.AUDIT_TIMESTAMP BETWEEN '"+auditTimeStampFromDate+"' AND ";
			// query=query+" AUDIT_TIMESTAMP BETWEEN '"+auditTimeStampFromDate+"' AND ";
			if (auditTimeStampToDate !=null && !auditTimeStampToDate.equals("") )
			{
				if(fields.size()>0)
					search_condition=search_condition+"'"+auditTimeStampToDate+"' "+search_type;
				else
					search_condition=search_condition+"'"+auditTimeStampToDate+"'";
			}
			else 
			{
				SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");//dd/MM/yyyy
			    Date now = new Date();
			    String strDate = sdfDate.format(now);
			    //fields.put("auditTimeStampToDate", strDate);
			    if(fields.size()>0)
			    	search_condition=search_condition+"'"+strDate+"' "+search_type;//query=query+"'"+auditTimeStampToDate+"' "+searchCondition;
					else
						search_condition=search_condition+"'"+strDate+"' ";
			}
				 
		}
		if (auditTimeStampToDate !=null && !auditTimeStampToDate.equals("") )
		{
			if(auditTimeStampFromDate ==null || auditTimeStampFromDate.equals(""))
			{
				throw new ServiceException("auditTimeStampFromDate should be passed");  
			}
			 
		}
			
		if(fields.size()>0)
		{
			/*if(searchCondition !=null || !searchCondition.equals(""))
			{
				throw new ServiceException("searchCondition condition Value should not be empty or null");  
			}*/
			String[] columns=new String[fields.size()];
			columns=(String[]) fields.keySet().toArray(new String[0]);
			for(String column:columns)
			{
				if(column.equals(columns[fields.size()-1]))
				{
					search_condition=search_condition+" "+column+"='"+fields.get(column)+"'";
				}
				else
				{
					search_condition=search_condition+" "+column+"='"+fields.get(column)+"' "+ search_type;
				}
			}
		}
		
		// pipeline
		
		// pipeline
		
		IDataCursor outputPipelineCursor = pipeline.getCursor();
		
		// auditDataResponse
		
		IDataUtil.put(outputPipelineCursor, "search_condition", search_condition);
		
		outputPipelineCursor.destroy();
			
		// --- <<IS-END>> ---

                
	}



	public static final void getUniqueTransactionIDs (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getUniqueTransactionIDs)>> ---
		// @sigtype java 3.5
		// [i] record:1:required input_document
		// [i] - field:0:required TRANSACTION_ID
		// [o] field:0:required unique_transaction_ids
		// [o] field:0:required no_of_unique_transactions
		// pipeline
		
		IDataCursor pipelineCursor = pipeline.getCursor();
		
		
			// input_document
			IData[]	input_document = IDataUtil.getIDataArray( pipelineCursor, "input_document" );
			ArrayList <String> transaction_ids = new ArrayList<String>();
			String unique_transactions = "";
			if ( input_document != null)
			{
				for ( IData singleItem : input_document )
				{
					IDataCursor input_documentCursor = singleItem.getCursor();
					//System.out.println(IDs[i]);
					String id = IDataUtil.getString( input_documentCursor, "TRANSACTION_ID" );
					//System.out.println(IDs[i]);
					if(!transaction_ids.contains(id)){
						transaction_ids.add(id);
						unique_transactions+=","+"'"+id+"'";
					}
					input_documentCursor.destroy();
				}
				
				//unique_transactions = unique_transactions.substring(0,unique_transactions.length()-1);
			}	
			int no_of_unique_transactions = transaction_ids.size();
			if(no_of_unique_transactions>0){
				//IDataUtil.put(pipelineCursor, "unique_transactions_list",  transaction_ids.toArray(new String[no_of_unique_transactions]));
				IDataUtil.put(pipelineCursor, "unique_transaction_ids",  unique_transactions.substring(1));
			}
			IDataUtil.put(pipelineCursor, "no_of_unique_transactions", no_of_unique_transactions+"");
			pipelineCursor.destroy();
		// --- <<IS-END>> ---

                
	}
}

