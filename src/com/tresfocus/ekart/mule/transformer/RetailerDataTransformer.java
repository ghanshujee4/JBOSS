package com.tresfocus.ekart.mule.transformer;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.log4j.Logger;
import org.mule.api.MuleMessage;
import org.mule.api.transformer.TransformerException;
import org.mule.transformer.AbstractMessageTransformer;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.bean.MyCsvToBean;
import com.tresfocus.ekart.bean.RetailerDataBean;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.ColumnPositionMappingStrategy;

public class RetailerDataTransformer extends AbstractMessageTransformer {
    static final Logger log = Logger.getLogger(RetailerDataTransformer.class);
    /** The default separator to use if none is supplied to the constructor. */
    public static final char DEFAULT_SEPARATOR = ',';

    /**
     * The default quote character to use if none is supplied to the
     * constructor.
     */
    public static final char DEFAULT_QUOTE_CHARACTER = '"';
    
    /**
     * The default line to start reading.
     */
    public static final int DEFAULT_SKIP_LINES = 1;

	@Override
	public Object transformMessage(MuleMessage message, String outputEncoding)
			throws TransformerException {
        log.debug("IDocToWCTransformer: transform");

        try {
            return doTransform(message, outputEncoding);
        } catch (Exception e) {
        	e.printStackTrace();
            log.info("Error creating the message: " + e.getMessage());
        }
        return null;
    }

    public Object doTransform(MuleMessage message, String outputEncoding)
            throws Exception {
    	String incomingFileName = message.getInboundProperty("originalFilename");
    	RetailSnapshotDataMgr retDataMgr = new RetailSnapshotDataMgr();
    	InputStream iStream = message.getPayload(InputStream.class);
    	
    	String fileNameWithoutExt = incomingFileName.substring(0, incomingFileName.lastIndexOf("."));
    	StringTokenizer tokens = new StringTokenizer(fileNameWithoutExt, "_");
    	String orgName = tokens.nextToken();
    	String categoryType = tokens.nextToken();
    	//int retailerOrgId = 3;
    	//String businessType = "GROCERY";

    	ColumnPositionMappingStrategy<RetailerDataBean> strat = new ColumnPositionMappingStrategy<RetailerDataBean>();
    	strat.setType(RetailerDataBean.class);
    	
    	if(categoryType.equalsIgnoreCase(IConstants.GROCERY_BT))
    		strat.setColumnMapping(RetailerDataBean.getColumnListForGrocery());
    	else if(categoryType.equalsIgnoreCase(IConstants.PHARMACY_BT))
    		strat.setColumnMapping(RetailerDataBean.getColumnListForPharmacy());
    	else if(categoryType.equalsIgnoreCase(IConstants.BABYSHOP_BT))
    		strat.setColumnMapping(RetailerDataBean.getColumnListForBabyShop());
   	
    	CSVReader csvReader = new CSVReader(new InputStreamReader(iStream), DEFAULT_SEPARATOR, DEFAULT_QUOTE_CHARACTER, DEFAULT_SKIP_LINES);
    	MyCsvToBean<RetailerDataBean> csv = new MyCsvToBean<RetailerDataBean>();
    	List<RetailerDataBean> dataList = csv.parse(strat, csvReader);
        
    	String returnMessage = "Succesfully Processed";
        
    	retDataMgr.populateRetailData(orgName, categoryType, dataList);
        return returnMessage; 
     }

}
