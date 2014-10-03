package com.tresfocus.ekart.mule.transformer;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.jboss.logging.Logger;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.bean.RetailerDataBean;
import com.tresfocus.ekart.hibernate.entity.Brands;
import com.tresfocus.ekart.hibernate.entity.Category;
import com.tresfocus.ekart.hibernate.entity.CategoryType;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.Product;
import com.tresfocus.ekart.hibernate.entity.RetailerSnapshot;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.model.BrandsDAOImpl;
import com.tresfocus.ekart.hibernate.model.CategoryDAOImpl;
import com.tresfocus.ekart.hibernate.model.CategoryTypeDAOImpl;
import com.tresfocus.ekart.hibernate.model.MeasuringUnitDAOImpl;
import com.tresfocus.ekart.hibernate.model.OrganizationDAOImpl;
import com.tresfocus.ekart.hibernate.model.ProductDAOImpl;
import com.tresfocus.ekart.hibernate.model.RetailerSnapshotDAOImpl;
import com.tresfocus.ekart.hibernate.model.UserDAOImpl;

public class RetailSnapshotDataMgr{
	private static final Logger logger = Logger.getLogger(RetailSnapshotDataMgr.class);
	private static final String configFile = "hibernate.cfg.mule.xml";
	
	private OrganizationDAOImpl orgDAO = new OrganizationDAOImpl();
	private CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
	private CategoryTypeDAOImpl catTypeDAO = new CategoryTypeDAOImpl();
	private MeasuringUnitDAOImpl mUnitDAO = new MeasuringUnitDAOImpl();
	private ProductDAOImpl productDAO = new ProductDAOImpl();
	private RetailerSnapshotDAOImpl snapshotDAO = new RetailerSnapshotDAOImpl();
	private UserDAOImpl userDAO = new UserDAOImpl();
	private BrandsDAOImpl brandsDAO = new BrandsDAOImpl();
	
	private SessionFactory getHibernateSessionFactory() {
        Configuration configuration = new Configuration();
        configuration.configure(configFile);
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        
        return sessionFactory;
    }
	
	private void doInit(SessionFactory sessionFactory){
		orgDAO.setSessionFactory(sessionFactory);
		categoryDAO.setSessionFactory(sessionFactory);
		catTypeDAO.setSessionFactory(sessionFactory);
		mUnitDAO.setSessionFactory(sessionFactory);
		productDAO.setSessionFactory(sessionFactory);
		snapshotDAO.setSessionFactory(sessionFactory);
		userDAO.setSessionFactory(sessionFactory);
		brandsDAO.setSessionFactory(sessionFactory);
	}
	
	public void populateRetailData(String retailerOrgName, String categoryType, List<RetailerDataBean> dataList) throws Exception {
		SessionFactory sessionFactory = getHibernateSessionFactory();
//        Session sessionObj = sessionFactory.openSession();    
    	Transaction trx = sessionFactory.getCurrentSession().beginTransaction();
    	
		doInit(sessionFactory);
		User muleDaemon = userDAO.getUserByUserName(IConstants.MULE_DAEMON_USER);
    	
    	
    	try{
    		Organization retailerOrg = new Organization();
        	retailerOrg.setName(retailerOrgName);
        	List<Organization> orgList = orgDAO.findByCriteria(retailerOrg);
        	if(orgList == null || orgList.isEmpty())
        		throw new Exception("Organization with name: " + retailerOrgName + " not found.");
        	
        	retailerOrg = orgList.get(0);

    		CategoryType catType = new CategoryType();
    		catType.setName(categoryType);
        	List<CategoryType> catTypeList = catTypeDAO.findByCriteria(catType);
        	if(catTypeList == null || catTypeList.isEmpty())
        		throw new Exception("CategoryType with name: " + categoryType + " not found.");
        	
        	catType = catTypeList.get(0);

        	for(RetailerDataBean row : dataList){
	        	Category productCat = null;
	        	Category category = new Category();
	        	category.setName(row.getCategory());
	        	category.setCategoryType(catType);
	        	
	        	List<Category> catList = categoryDAO.findByCriteria(category);
	        	if(catList == null || catList.isEmpty())
	        		categoryDAO.upsert(category, muleDaemon);
	        	else
	        		category = catList.get(0);
	        	
	        	productCat = category;
	        	
	        	if(row.getSubcategory() != null){
		        	Category subCategory = new Category();
		        	subCategory.setName(row.getSubcategory());
		        	
		        	List<Category> subcatList = categoryDAO.findByCriteria(subCategory);
		        	if(subcatList == null || subcatList.isEmpty())
		        		categoryDAO.upsert(subCategory, muleDaemon);
		        	else
		        		subCategory = subcatList.get(0);
		        	
		        	productCat = subCategory;
	        	}
	        	
	        	Product product = new Product(row.getProductName(), row.getManufacturer(), productCat, row.getGender(), row.getAge());
	        	List<Product> productList = productDAO.findByCriteria(product);
	        	if(productList == null || productList.isEmpty()){
	        		//msrUnit.getProducts().add(product);
	        		//category.getProducts().add(product);
	        		productDAO.upsert(product, muleDaemon);
	        	}else{
	        		product = productList.get(0);
	        	}
	        	
	        	Brands brand = null;
	        	if(row.getBrandName() != null){
	        		brand = new Brands();
		        	brand.setName(row.getBrandName());
		        	
		        	List<Brands> brandList = brandsDAO.findByCriteria(brand);
		        	if(brandList == null || brandList.isEmpty())
		        		brandsDAO.upsert(brand, muleDaemon);
		        	else
		        		brand = brandList.get(0);
		        	
	        	}
	        	
	        	RetailerSnapshot snapshot = new RetailerSnapshot();
	        	snapshot.setProduct(product);
	        	snapshot.setOrganization(retailerOrg);
	        	
	        	if(row.getSalePrice() != null)
	        		snapshot.setSalePrice(row.getSalePrice());	        	
	        	if(row.getPackSize() != null)
	        		snapshot.setPackSize(row.getPackSize());
	        	if(row.getMrp() != null)
	        		snapshot.setMrp(row.getMrp());
	        	if(row.getMrp() != null)
	        		snapshot.setMrp(row.getMrp());
	        	if(row.getBundlePrice() != null)
	        		snapshot.setBundlePrice(row.getBundlePrice());
	        	if(row.getQuantity() != null)
	        		snapshot.setQuantity(row.getQuantity());
	        	if(row.getNewPrice() != null)
	        		snapshot.setNewPrice(row.getNewPrice());
	        	if(row.getComposition() != null)
	        		snapshot.setComposition(row.getComposition());
	        	if(row.getDiscount() != null)
	        		snapshot.setDiscount(row.getDiscount());
	        	if(row.getOffer() != null)
	        		snapshot.setOffer(row.getOffer());

	        	product.getRetailerSnapshots().add(snapshot);
	        	retailerOrg.getRetailerSnapshots().add(snapshot);
	        	if(brand != null){
	        		snapshot.setBrand(brand);
	        		brand.getRetailerSnapshots().add(snapshot);
	        	}
	        	snapshotDAO.upsert(snapshot, muleDaemon, retailerOrg);
	        	logger.debug("RetailerSnapshot data insert: " + snapshot);
	    	}
			
			trx.commit();
    	}catch(Exception e){
        	logger.debug("Error inserting RetailerSnapshot data: " + Utility.stackTraceToString(e));
    		trx.rollback();
    		throw e;
    	}
	}
}
