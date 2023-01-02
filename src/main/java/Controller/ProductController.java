package Controller;

import Model.Product;
import Services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {

    private ProductService productService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService("product");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");

        if(id == null || id.isEmpty()) {
            response.sendRedirect("/products");
            return;
        }

        Product product = productService.findById(id, Product.class);

        if(product == null) {
            response.sendRedirect("/products");
            return;
        }
        request.setAttribute("product", product);
        request.setAttribute("patterns", this.productService.getPatterns(id));
        request.setAttribute("colors", this.productService.getColors(id));

        request.getRequestDispatcher("/jsp/client/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
