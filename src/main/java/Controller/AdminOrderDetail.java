package Controller;

import DTO.ProductOrderDTO;
import Model.Order;
import Model.Product;
import Services.OrderService;
import Services.ProductOrderService;
import Services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminOrderDetail", value = "/admin/adminOrderDetail")
public class AdminOrderDetail extends HttpServlet {
    private OrderService orderService;
    private ProductService productService;
    private ProductOrderService productOrderService;

    @Override
    public void init() throws ServletException {
        super.init();
        orderService = new OrderService("orders");
        this.productOrderService = new ProductOrderService();
        this.productService = new ProductService("product");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Order order = this.orderService.findById(id, Order.class);
        request.setAttribute("order", order);

        ArrayList<ProductOrderDTO> productOrders = this.productOrderService.getByOrderId(id);
        System.out.print(productOrders + "Ádsadasd");
        productOrders.forEach(productOrderDTO -> {
            request.setAttribute("product" + productOrderDTO.getProductId(), productService.findById(productOrderDTO.getProductId(), Product.class));
        });
        request.setAttribute("productOrders", productOrders);
        request.getRequestDispatcher("/jsp/admin/orderDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        String action = request.getParameter("action");

        switch (action) {
            case "next": {
                if (Integer.parseInt(status) < 2) {
                    this.orderService.updateStatusOrder(id, Integer.parseInt(status) + 1);
                    response.sendRedirect("/admin/adminOrderDetail?id=" + id);
                }
                return;
            }
            case "back": {
                if (Integer.parseInt(status) > 0) {
                    this.orderService.updateStatusOrder(id, Integer.parseInt(status) - 1);
                    response.sendRedirect("/admin/adminOrderDetail?id=" + id);
                }
                return;
            }
            case "cancel": {
                this.orderService.updateStatusOrder(id, 3);
                response.sendRedirect("/admin/adminOrderDetail?id=" + id);
                return;
            }
            default:
                response.sendRedirect("/admin/adminOrderDetail?id=" + id);
        }
    }
}

