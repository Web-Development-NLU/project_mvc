package Controller;

import DTO.AuthorizationData;
import DTO.OrderDTO;
import Model.Order;
import Services.OrderService;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

@WebServlet(name = "oderList", value = "/orderList")
public class OrderListController extends HttpServlet {

    private OrderService orderService;
    @Override
    public void init() throws ServletException {
        super.init();
        this.orderService = new OrderService("orders");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("authorization");
        boolean logged = (boolean) request.getAttribute("logged");
        String infoSearch = request.getParameter("infoSearch");
        if(!logged) {
            response.sendRedirect("/");
            return;
        }
        String userId = (String) authorizationData.getId();
        ArrayList<Order> orders = new ArrayList<>();
        if(infoSearch != null){
            Order order = this.orderService.findOrderUserById(userId, infoSearch);
            if(order != null){
                orders.add(order);
            }else{
                orders = this.orderService.findOrdersUserByDetail(userId, infoSearch);
            }
        }else{
            orders = this.orderService.findOrdersUser(userId);
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
        request.setAttribute("orders", orderResult);
        request.setAttribute("pagination", Integer.parseInt(page));
        request.setAttribute("numPage", numPage);
        request.setAttribute("infoSearch",infoSearch);
        request.getRequestDispatcher("/jsp/client/orderList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/orderList?infoSearch="+request.getParameter("search_order").trim()+"&page="+ request.getParameter("page"));
    }
}
