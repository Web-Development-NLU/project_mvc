package Controller;

import Model.StatusOrder;
import Services.OrderService;
import Services.ProductOrderService;
import Services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CancelOrderController", value = "/CancelOrderController")
public class CancelOrderController extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        super.init();
        orderService = new OrderService("orders");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String action = request.getParameter("action");

        switch (action) {
            case "cancel": {
                this.orderService.updateStatusOrder(id, StatusOrder.CANCELED.ordinal());
                response.sendRedirect("/orderDetail?id=" + id);
                return;
            }
            default:
                response.sendRedirect("/orderDetail?id=" + id);
        }
    }

}
