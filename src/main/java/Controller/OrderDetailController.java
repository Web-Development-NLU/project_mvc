package Controller;

import Model.Order;
import Services.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="OrderDetailController", value="/orderDetail")
public class OrderDetailController extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.orderService = new OrderService("orders");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if(id == null) {
            response.sendRedirect("/");
            return;
        }
        request.setAttribute("order", this.orderService.findById(id, Order.class));
        request.getRequestDispatcher("/jsp/client/orderDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

}
