package Controller;

import DTO.FilterProduct;
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
import java.text.DecimalFormat;
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

        HttpSession session = request.getSession(true);
        String category = request.getParameter("category");
        if(session.getAttribute("filter") == null || category != null) {
            session.setAttribute("filter", new FilterProduct());
        }

        FilterProduct filter = (FilterProduct) session.getAttribute("filter");


        if(category != null) filter.category = category;
        String pattern = request.getParameter("pattern");
        if(pattern != null) filter.pattern = pattern;
        String color = request.getParameter("color");
        if(color != null) filter.color = color;
        String maxFilter = request.getParameter("price-max");
        if(maxFilter != null) filter.maxFilter = maxFilter;
        String minFilter = request.getParameter("price-min");
        if(minFilter != null) filter.minFilter = minFilter;

        if(category == null && pattern == null && color == null && maxFilter == null && minFilter == null) {
            filter = new FilterProduct();
            session.setAttribute("filter", filter);
        }

        ArrayList<Product> products = this.productService.queryByBuilder(filter);
        double priceMax = Double.MIN_VALUE;
        double priceMin = Double.MAX_VALUE;
        if(products.isEmpty()) {
            priceMax = 0;
            priceMin = 0;
        }
        for(Product product : products) {
            if(product.getPrice() >= priceMax) {
                priceMax = product.getPrice();
            }

            if(product.getPrice() < priceMin) {
                priceMin = product.getPrice();
            }
        }
        ArrayList<Product> productResult = new ArrayList<>();
        String page = request.getParameter("page");
        int intPage;
        try {
            intPage = Integer.parseInt(page);
        }catch (Exception e){
            intPage = 0;
        }
        Double numPage = Math.ceil(Double.parseDouble(String.valueOf(products.size())) / 20);
        if(page == null || intPage < 1) {
            page = "1";
        }
        if(Integer.parseInt(page) > numPage.intValue()) page = ""+ numPage.intValue();
        int index =1;
        if(products.size() > 0) {
            index = (Integer.parseInt(page) - 1) * 20;
        }
        for(int i = index; i < (index + 20); i++ ){
            if(i >= products.size()){
                break;
            }
            productResult.add(products.get(i));
        }
        request.setAttribute("filterCat", (filter.category == null) ? null :  this.categoryServices.findById(filter.category, Category.class));
        request.setAttribute("filterColor", (filter.color == null) ? null : this.colorService.findById(filter.color, Color.class));
        request.setAttribute("filterPattern", (filter.pattern == null) ? null : this.patternService.findById(filter.pattern, Pattern.class));
        request.setAttribute("filterPrice", ((filter.minFilter == null) || (filter.maxFilter == null)) ?
                null: DecimalFormat.getInstance().format(Double.parseDouble(filter.minFilter)) + " - " + DecimalFormat.getInstance().format(Double.parseDouble(filter.maxFilter)));
//        request.setAttribute("products", products);
        request.setAttribute("products", productResult);
        request.setAttribute("categories", this.categoryServices.findAll(Category.class));
        request.setAttribute("patterns", this.patternService.findAll(Pattern.class));
        request.setAttribute("colors", this.colorService.findAll(Color.class));
        request.setAttribute("priceMax", priceMax);
        request.setAttribute("priceMin", priceMin);
        request.setAttribute("pagination", Integer.parseInt(page));
        request.setAttribute("numPage", numPage);
        request.getRequestDispatcher("jsp/client/products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}