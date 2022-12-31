package Controller;

import Model.Category;
import Model.Color;
import Model.Pattern;
import Model.Product;
import Services.CategoryServices;
import Services.ColorService;
import Services.PatternService;
import Services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ProductsController", value = "/products")
public class ProductsController extends HttpServlet {
    private ProductService productService;
    private CategoryServices categoryServices;
    private PatternService patternService;
    private ColorService colorService;
    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService("product");
        this.categoryServices = new CategoryServices("category");
        this.patternService = new PatternService("pattern");
        this.colorService = new ColorService("color");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Product> products = this.productService.findAll(Product.class);
        double priceMax = Double.MIN_VALUE;
        double priceMin = Double.MAX_VALUE;

        for(Product product : products) {
            if(product.getPrice() >= priceMax) {
                priceMax = product.getPrice();
            }

            if(product.getPrice() < priceMin) {
                priceMin = product.getPrice();
            }
        }

        String category = request.getParameter("category");
        String pattern = request.getParameter("pattern");
        String color = request.getParameter("color");
        String maxFilter = request.getParameter("price-max");
        String minFilter = request.getParameter("price-min");

        request.setAttribute("products", products);
        request.setAttribute("categories", this.categoryServices.findAll(Category.class));
        request.setAttribute("patterns", this.patternService.findAll(Pattern.class));
        request.setAttribute("colors", this.colorService.findAll(Color.class));
        request.setAttribute("priceMax", priceMax);
        request.setAttribute("priceMin", priceMin);
        request.getRequestDispatcher("jsp/client/products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
