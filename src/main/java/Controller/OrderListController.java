package Controller;

import DTO.OrderDTO;
import Model.Order;
import Services.OrderService;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
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
        boolean logged = (boolean) request.getAttribute("logged");
        if(!logged) {
            response.sendRedirect("/");
        }else {
            ArrayList<Order> orders = this.orderService.findAll(Order.class);
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/jsp/client/orderList.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
