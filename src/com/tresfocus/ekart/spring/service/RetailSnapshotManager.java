package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.bean.RetailerDataBean;
import com.tresfocus.ekart.hibernate.entity.RetailerSnapshot;

public interface RetailSnapshotManager {
	public void populateRetailData(int retailerOrgId, List<RetailerDataBean> dataList) throws Exception;
	public List<RetailerSnapshot> getRetailerSnapshot(Integer orgaId, Integer categoryName);
}
