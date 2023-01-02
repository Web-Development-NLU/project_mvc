package Controller;

import DTO.FilterProduct;
import Model.Category;
import Services.CategoryServices;
import Services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AminProduct", value = "/admin/products")
public class AminProduct extends HttpServlet {

    private ProductService productService;
    private CategoryServices categoryServices;
    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService("product");
        this.categoryServices = new CategoryServices("category");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if(id == null) {
            response.sendRedirect("/admin");
            return;
        }
        FilterProduct filter = new FilterProduct();
        filter.category = id;
        request.setAttribute("category", categoryServices.findById(id, Category.class));
        request.setAttribute("products", productService.queryByBuilder(filter));
        request.getRequestDispatcher("/jsp/admin/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
