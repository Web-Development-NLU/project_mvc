package Controller;

import DTO.UpdateProductDTO;
import Model.*;
import Services.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

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

        ArrayList<Pattern> patterns = this.patternService.findAll(Pattern.class);
        ArrayList<Pattern> patternOfProduct = this.productService.getPatterns(id);
        for(int i = 0; i < patternOfProduct.size(); i++) {
            if(patterns.contains(patternOfProduct.get(i))) {
                patterns.remove(patternOfProduct.get(i));
            }
        }

        ArrayList<Color> colors = this.colorService.findAll(Color.class);
        ArrayList<Color> colorOfProduct = this.productService.getColors(id);
        for(int i = 0; i < colorOfProduct.size(); i++) {
            if(colors.contains(colorOfProduct.get(i))) {
                colors.remove(colorOfProduct.get(i));
            }
        }
        request.setAttribute("product", this.productService.findById(id, Product.class));
        request.setAttribute("patternOfProduct", patternOfProduct);
        request.setAttribute("colorOfProduct", colorOfProduct);
        request.setAttribute("colors", colors);
        request.setAttribute("patterns", patterns);
        request.setAttribute("categories", this.categoryServices.findAll(Category.class));
        request.getRequestDispatcher("/jsp/admin/editProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String[] colors = request.getParameterValues("color");
        String[] patterns = request.getParameterValues("pattern");

        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int category = Integer.parseInt(request.getParameter("category"));
        int size = Integer.parseInt(request.getParameter("size"));
        String material = request.getParameter("material");
        String thumbnail = request.getParameter("thumbnail");
        String shortDescription = request.getParameter("shortDescription");
        String description = request.getParameter("description");
        String dimension = request.getParameter("dimension");
        UpdateProductDTO model = new UpdateProductDTO(name, price, shortDescription, size, StatusProduct.AVAILABLE.ordinal(),description, dimension, material, thumbnail, category);
        this.productService.update(id, model);


        if(colors != null) {
            this.productService.deleteColor(id);
            for(String color : colors)  {
                this.productService.linkToColor(id, Integer.parseInt(color));
            }
        }
        if(patterns != null) {
            this.productService.deletePattern(id);
            for(String pattern : patterns) {
                this.productService.linkToPattern(id, Integer.parseInt(pattern));
            }
        }

        response.sendRedirect("/admin/editProduct?id=" + id);
    }
}
