package Controller;

import Model.Order;
import Services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SearchOrder", value = "/searchOrder")
public class SearchOrder extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.orderService = new OrderService("orders");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("id");
        boolean orderEmpty = false;
        Order order = null;
        if(orderId != null){
            order = this.orderService.findById(request.getParameter("id"), Order.class);
            if(order == null) orderEmpty = true;
        }
        request.setAttribute("order", order);
        request.setAttribute("orderEmpty", orderEmpty);
        request.getRequestDispatcher("/jsp/client/searchOrder.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/searchOrder?id="+request.getParameter("search_order").trim());
    }
}
