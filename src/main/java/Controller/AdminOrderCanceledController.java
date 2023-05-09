package Controller;

import Model.Order;
import Services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminOrderCanceledController", value = "/admin/AdminOrderCanceledController")
public class AdminOrderCanceledController extends HttpServlet {
    private OrderService orderService;
    @Override
    public void init() throws ServletException {
        super.init();
        this.orderService = new OrderService("orders");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String infoSearch = request.getParameter("infoSearch");
        ArrayList<Order> orders;
        if(infoSearch != null && !infoSearch.equals("null")){
            orders = this.orderService.findOrders(infoSearch, 3);
        }else{
            orders = this.orderService.findOrdersCanceled();
        }
        ArrayList<Order> orderResult = new ArrayList<>();
        String page = request.getParameter("page");
        int intPage;
        try {
            intPage = Integer.parseInt(page);
        }catch (Exception e){
            intPage = 0;
        }
        Double numPage = Math.ceil(Double.parseDouble(String.valueOf(orders.size())) / 10);
        if(numPage < 1) numPage = 1.0;
        if(page == null || intPage < 1) {
            page = "1";
        }
        if(Integer.parseInt(page) > numPage.intValue()) page = ""+ numPage.intValue();
        int index =1;
        if(orders.size() > 0) {
            index = (Integer.parseInt(page) - 1) * 10;
        }
        for(int i = index; i < (index + 10); i++ ){
            if(i >= orders.size()){
                break;
            }
            orderResult.add(orders.get(i));
        }
        request.setAttribute("pagination", Integer.parseInt(page));
        request.setAttribute("orders", orderResult);
        request.setAttribute("numPage", numPage);
        request.setAttribute("pagePostpaid", true);
        request.setAttribute("pagePrepayment", false);
        request.getRequestDispatcher("/jsp/admin/order.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
