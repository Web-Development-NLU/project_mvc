package Controller;

import Model.Category;
import Model.Color;
import Model.Pattern;
import Model.Product;
import Services.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditProduct", value = "/admin/editProduct")
public class EditProduct extends HttpServlet {
    private ProductService productService;
    private ColorService colorService;
    private PatternService patternService;
    private CategoryServices categoryServices;
    private UploadService uploadService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService("product");
        this.colorService = new ColorService("color");
        this.categoryServices = new CategoryServices("category");
        this.patternService = new PatternService("pattern");
        this.uploadService = new UploadService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if(id == null) {
            response.sendRedirect("admin/orders");
            return;
        }
        request.setAttribute("product", this.productService.findById(id, Product.class));
        request.setAttribute("colors", this.colorService.findAll(Color.class));
        request.setAttribute("patterns", this.patternService.findAll(Pattern.class));
        request.setAttribute("categories", this.categoryServices.findAll(Category.class));
        request.getRequestDispatcher("/jsp/admin/editProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
