package com.tresfocus.ekart.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.spring.service.OrderLinesManager;
import com.tresfocus.ekart.spring.service.OrderLinesManagerImpl;

/**
 * Servlet implementation class OrdersDataServlet
 */
@WebServlet("/retailer/OrderLinesDataServlet")
public class OrderLinesDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderLinesDataServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Integer action = Utility.getParameterValue(request, "action", Integer.class);
		Integer orderId = Utility.getParameterValue(request, "orderId", Integer.class);
		Integer orderLineId = Utility.getParameterValue(request, "orderLineId", Integer.class);
		Integer packaged = Utility.getParameterValue(request, "value", Integer.class);
		Integer version = Utility.getParameterValue(request, "version", Integer.class);
		
		switch(action){
			case 1:
				OrderLinesManager ordLineMgr = new OrderLinesManagerImpl();
				User loggedInUser = Utility.getUserFromSession(request.getSession());
				
				try {
					OrderLines ordLine = ordLineMgr.getByKey(orderLineId, loggedInUser);
					if(version != ordLine.getObjectVersionNumber())
						throw new Exception("Record has been updated. Please refresh the page.");
					
					ordLine.setPackaged(packaged);
					ordLineMgr.upsert(ordLine, loggedInUser);
				} catch (Exception e) {
					e.printStackTrace();
					throw new ServletException(e);
				}
				response.setContentType("plain/text");
				response.getOutputStream().print(packaged);
				break;
				
			default:printOrderLinesData(request.getSession(), response, orderId);
					break;
		}

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

	private void printOrderLinesData(HttpSession session, HttpServletResponse response, int orderId) throws IOException, ServletException{
		OrderLinesManager ordLineCtrl = new OrderLinesManagerImpl();		
		User loggedInUser = Utility.getUserFromSession(session);
		JSONObject aaJsonObject = new JSONObject();

		try {
			List<OrderLines> orderLinesList = ordLineCtrl.findByOrderLinesByOrderId(orderId, loggedInUser);	
			JSONArray jArray = new JSONArray();
			for (OrderLines ordLine : orderLinesList) {
				JSONObject jObject = new JSONObject();
				
				jObject.put("id", ordLine.getId());
				jObject.put("version", ordLine.getObjectVersionNumber());
				jObject.put("orderId", ordLine.getOrders().getId());
				jObject.put("productId", ordLine.getProduct().getId());
				jObject.put("category", ordLine.getProduct().getCategory().getName());
				jObject.put("productName", ordLine.getProduct().getName());
				jObject.put("quantity", ordLine.getQuantity());
				jObject.put("packaged", ordLine.getPackaged());
				jObject.put("price", ordLine.getPrice());
				jObject.put("discount", ordLine.getDiscount());
				jObject.put("total", (ordLine.getQuantity() * ordLine.getPrice()));

				jArray.put(jObject);
			}

			response.setContentType("application/json");
			aaJsonObject.put("aaData", jArray);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new ServletException(e);
		}
		
		response.getOutputStream().print(aaJsonObject.toString());
	}
}
