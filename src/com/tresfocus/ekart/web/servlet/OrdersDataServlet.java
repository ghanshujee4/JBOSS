package com.tresfocus.ekart.web.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.Orders;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.spring.service.LookupTypeManager;
import com.tresfocus.ekart.spring.service.LookupTypeManagerImpl;
import com.tresfocus.ekart.spring.service.OrdersManager;
import com.tresfocus.ekart.spring.service.OrdersManagerImpl;

/**
 * Servlet implementation class OrdersDataServlet
 */
@WebServlet("/retailer/OrdersDataServlet")
public class OrdersDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrdersDataServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String osb = request.getParameter("osb");
		JSONObject aaJsonObject = new JSONObject();

		OrdersManager ordMgr = new OrdersManagerImpl();
		User loggedInUser = Utility.getUserFromSession(request.getSession());
		LookupTypeManager lookupMgr = new LookupTypeManagerImpl();

		try {
			Map<String, String> lookupTypes = lookupMgr.getLookupsByType(IConstants.LOOKUP_TYPE_ORDER_STATUS);
			List<Orders> ordList = ordMgr.getOrderByStatus(osb, loggedInUser);
			JSONArray jArray = new JSONArray();
			
			for (Orders ordr : ordList) {
				JSONObject jObject = new JSONObject();
				jObject.put("id", ordr.getId());
				jObject.put("name", ordr.getAddressByBillingAddressId().getFirstName()
						+ " "
						+ ordr.getAddressByBillingAddressId().getLastName());
				jObject.put("address", Utility.getAddress(ordr.getAddressByBillingAddressId()));
				jObject.put("deliverytime", ordr.getExpectedDeliveryTime());
				jObject.put("amount", ordr.getItemValue());
				jObject.put("status", lookupTypes.get(ordr.getStatus()));

				jArray.put(jObject);
			}

			response.setContentType("application/json");
			aaJsonObject.put("aaData", jArray);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		
		response.getOutputStream().print(aaJsonObject.toString());
		response.flushBuffer();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
