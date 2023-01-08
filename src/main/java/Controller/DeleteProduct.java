package Controller;

import Model.Product;
import Services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteProduct", value = "/admin/deleteProduct")
public class DeleteProduct extends HttpServlet {

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

        if(id == null) {
            response.sendRedirect("/admin");
            return;
        }

        this.productService.delete(id, Product.class);

        String idParam = (categoryId == null) ? "" : "?id=" + categoryId;

        response.sendRedirect("/admin/products" + idParam);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
