package Controller;

import DTO.ProductOrderDTO;
import Model.Order;
import Model.Product;
import Model.StatusOrder;
import Services.OrderService;
import Services.ProductOrderService;
import Services.ProductService;
import Services.StatisticsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Calendar;

@WebServlet(name = "AdminOrderDetail", value = "/admin/adminOrderDetail")
public class AdminOrderDetail extends HttpServlet {
    private OrderService orderService;
    private ProductService productService;
    private ProductOrderService productOrderService;
    private StatisticsService statisticsService;

    @Override
    public void init() throws ServletException {
        super.init();
        orderService = new OrderService("orders");
        this.productOrderService = new ProductOrderService();
        this.productService = new ProductService("product");
        this.statisticsService= new StatisticsService();
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
                if (Integer.parseInt(status) < StatusOrder.DONE.ordinal()) {
                    this.orderService.updateStatusOrder(id, Integer.parseInt(status) + 1);
                    response.sendRedirect("/admin/adminOrderDetail?id=" + id);
                    int totalOrder=this.statisticsService.getOrder();
                    int totalOrderByDate= this.statisticsService.getTotalOrderByDate(LocalDate.now());
                    int totalSales= this.statisticsService.getSales();
                    int totalSalesByDate= this.statisticsService.getSalesByDate(LocalDate.now());
                    Timestamp createAt= new Timestamp(System.currentTimeMillis());
                    Statistics statistics=new Statistics(totalOrder,totalOrderByDate,totalSales,totalSalesByDate,createAt,null);
                    if(Integer.parseInt(status) <= 2) {
                        this.statisticsService.create(statistics);
                    }
                }
                return;
            }
//            case "back": {
//                if (Integer.parseInt(status) > StatusOrder.ORDERED.ordinal()) {
//                    this.orderService.updateStatusOrder(id, Integer.parseInt(status) - 1);
//                    response.sendRedirect("/admin/adminOrderDetail?id=" + id);
//                }
//                return;
//            }
            case "cancel": {
                if (Integer.parseInt(status) < StatusOrder.DONE.ordinal()) {
                    this.orderService.updateStatusOrder(id, StatusOrder.CANCELED.ordinal());
                    response.sendRedirect("/admin/adminOrderDetail?id=" + id);
                    return;
                }
            }
            default:

                response.sendRedirect("/admin/adminOrderDetail?id=" + id);


        }
    }

}

