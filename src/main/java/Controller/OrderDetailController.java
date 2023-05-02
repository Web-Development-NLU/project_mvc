package Controller;

import DTO.ProductOrderDTO;
import Model.Order;
import Model.ProductOrder;
import Services.OrderService;
import Services.ProductOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="OrderDetailController", value="/orderDetail")
public class OrderDetailController extends HttpServlet {
    private OrderService orderService;
    private ProductOrderService productOrderService;
    @Override
    public void init() throws ServletException {
        super.init();
        this.orderService = new OrderService("orders");
        this.productOrderService = new ProductOrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if(id == null) {
            response.sendRedirect("/");
            return;
        }
        Order order = this.orderService.findById(id, Order.class);
        if(order == null) {
            response.sendRedirect("/");
            return;
        }
        request.setAttribute("order", order);
        ArrayList<ProductOrderDTO> productOrders = this.productOrderService.getByOrderId(id);
        request.setAttribute("productOrders", productOrders);
        request.getRequestDispatcher("/jsp/client/orderDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

}
