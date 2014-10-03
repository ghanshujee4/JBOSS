package com.tresfocus.ekart.spring.service;

import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.bean.RetailerDataBean;
import com.tresfocus.ekart.hibernate.entity.Category;
import com.tresfocus.ekart.hibernate.entity.MeasuringUnit;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.Product;
import com.tresfocus.ekart.hibernate.entity.RetailerSnapshot;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.model.CategoryDAO;
import com.tresfocus.ekart.hibernate.model.MeasuringUnitDAO;
import com.tresfocus.ekart.hibernate.model.OrganizationDAO;
import com.tresfocus.ekart.hibernate.model.ProductDAO;
import com.tresfocus.ekart.hibernate.model.RetailerSnapshotDAO;

@Service
public class RetailSnapshotManagerImpl implements RetailSnapshotManager {
	private static final Logger logger = Logger.getLogger(RetailSnapshotManagerImpl.class);
	
	@Autowired
	private OrganizationDAO orgDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private MeasuringUnitDAO mUnitDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private RetailerSnapshotDAO snapshotDAO;
	
	
	@Override
	@Transactional
	public void populateRetailData(int retailerOrgId, List<RetailerDataBean> dataList) throws Exception {
		/*
		User muleDaemon = Utility.getUserByName(IConstants.MULE_DAEMON_USER);
    	Organization retailerOrg = orgDAO.getByKey(retailerOrgId);

		for(RetailerDataBean row : dataList){
        	Category category = new Category();
        	category.setName(row.getCategory());
        	
        	List<Category> catList = categoryDAO.findByCriteria(category);
        	if(catList == null || catList.isEmpty())
        		categoryDAO.upsert(category, muleDaemon);
        	else
        		category = catList.get(0);
        	
        	MeasuringUnit msrUnit = new MeasuringUnit();
        	msrUnit.setName(row.getSalesMeasuringUnit());
        	
        	List<MeasuringUnit> mUnitList = mUnitDAO.findByCriteria(msrUnit);
        	if(mUnitList == null || mUnitList.isEmpty())
        		mUnitDAO.upsert(msrUnit, muleDaemon);
        	else
        		msrUnit = mUnitList.get(0);
			
        	//Product product = new Product(msrUnit, category, row.getItemName(), row.getUniqueItemName(), row.getBarcode(), row.getSearchCode(), row.getIsActive()?1:0);
        	Product product = new Product(category, row.getItemName(), row.getUniqueItemName(), row.getBarcode(), row.getSearchCode(), row.getIsActive()?1:0);
        	List<Product> productList = productDAO.findByCriteria(product);
        	if(productList == null || productList.isEmpty()){
        		//msrUnit.getProducts().add(product);
        		category.getProducts().add(product);
        		productDAO.upsert(product, muleDaemon);
        	}else{
        		product = productList.get(0);
        	}
        	
        	RetailerSnapshot snapshot = new RetailerSnapshot();
        	snapshot.setProduct(product);
        	snapshot.setOrganization(retailerOrg);
        	snapshot.setSalePrice(row.getSalesPrice());
        	
        	if(row.getPurchasePrice() != null)
        		snapshot.setPurchasedPrice(row.getPurchasePrice());
        	if(row.getSalesTaxPercent() != null)
        		snapshot.setSalesTax(row.getSalesTaxPercent());
        	if(row.getMRP() != null)
        		snapshot.setMrp(row.getMRP());
        	if(row.getPurchaseTaxPercent() != null)
        		snapshot.setPurchasedTaxPercent(row.getPurchaseTaxPercent());
        	
        	product.getRetailerSnapshots().add(snapshot);
        	retailerOrg.getRetailerSnapshots().add(snapshot);
        	snapshotDAO.upsert(snapshot, muleDaemon, retailerOrg);
        	logger.debug("RetailerSnapshot data insert: " + snapshot);
    	}
    	*/
	}

	@Override
	@Transactional
	public List<RetailerSnapshot> getRetailerSnapshot(Integer orgaId, Integer categoryName) {
		return snapshotDAO.findByCriteria(orgaId, categoryName);
	}
}
