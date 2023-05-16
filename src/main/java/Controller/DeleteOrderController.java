package Controller;

import DTO.AuthorizationData;
import Model.Code;
import Model.Logger;
import Model.Order;
import Services.LoggerService;
import Services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteOrderController", value = "/admin/deleteOrder")
public class DeleteOrderController extends HttpServlet {
    private OrderService orderService;
    private LoggerService loggerService;
    @Override
    public void init() throws ServletException {
        super.init();
        this.orderService = new OrderService("orders");
        this.loggerService = new LoggerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
//        String action = request.getParameter("action");
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        this.orderService.delete(id, Order.class);
        logger.setData("Action= DELETE "+ ",orderId=" + id);
        logger.setStatus(200);
        logger.setMessage("DELETE_ORDER_SUCCESSFULLY");
        logger.setUserId(authorizationData.getId());
        this.loggerService.log(logger);
        response.sendRedirect("/admin/order");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
