package Controller;

import DTO.AuthorizationData;
import Model.Logger;
import Model.Product;
import Services.LoggerService;
import Services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteProduct", value = "/admin/deleteProduct")
public class DeleteProduct extends HttpServlet {

    private ProductService productService;
    private LoggerService loggerService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService("product");
        this.loggerService = new LoggerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String categoryId = request.getParameter("category");
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        if(id == null) {
            response.sendRedirect("/admin");
            return;
        }

        this.productService.delete(id, Product.class);
        logger.setStatus(400);
        logger.setMessage("DELETE_PRODUCT_SUCCESSFULLY");
        logger.setUserId(authorizationData.getId());
        logger.setData("Action= DELETE, productId= " + id);
        this.loggerService.log(logger);
        String idParam = (categoryId == null) ? "" : "?id=" + categoryId;

        response.sendRedirect("/admin/products" + idParam);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
