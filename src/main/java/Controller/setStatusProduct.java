package Controller;

import Services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SetUnavailableProduct", value = "/admin/setStatusProduct")
public class setStatusProduct extends HttpServlet {

    private ProductService productService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService("product");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String categoryId = request.getParameter("category");
        String value = request.getParameter("value");
        if(id == null || categoryId == null || value == null) {
            response.sendRedirect("/admin");
            return;
        }

        this.productService.setStatus(id, Integer.parseInt(value));

        response.sendRedirect("/admin/products?id=" + categoryId);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
