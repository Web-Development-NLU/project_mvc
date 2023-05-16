package Controller;

import DTO.AuthorizationData;
import Model.*;
import Services.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

@WebServlet(name = "CreateProduct", value = "/admin/createProduct")
@MultipartConfig(
        fileSizeThreshold=1024*1024,
        maxFileSize=1024*1024*5,
        maxRequestSize=1024*1024*5*5
)
public class CreateProduct extends HttpServlet {

    private ColorService colorService;
    private CategoryServices categoryServices;
    private PatternService patternService;
    private ProductService productService;
    private LoggerService loggerService;
    @Override
    public void init() throws ServletException {
        super.init();
        this.colorService = new ColorService("color");
        this.categoryServices = new CategoryServices("category");
        this.patternService = new PatternService("pattern");
        this.productService = new ProductService("product");
        this.loggerService = new LoggerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("colors", this.colorService.findAll(Color.class));
        request.setAttribute("categories", this.categoryServices.findAll(Category.class));
        request.setAttribute("patterns", this.patternService.findAll(Pattern.class));

        request.getRequestDispatcher("/jsp/admin/createProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String[] colors = request.getParameterValues("color");
        String[] patterns = request.getParameterValues("pattern");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int category = Integer.parseInt(request.getParameter("category"));
        int size = Integer.parseInt(request.getParameter("size"));
        String material = request.getParameter("material");

        String thumbnail = request.getParameter("thumbnail");
        String shortDescription = request.getParameter("shortDescription");
        String description = request.getParameter("description");
        String dimension = request.getParameter("dimension");
        Product model = new Product(name, price, shortDescription, size, StatusProduct.AVAILABLE.ordinal(),description, dimension, material, thumbnail, category);
        String productId = this.productService.create(model);
        logger.setStatus(400);
        logger.setMessage("CREATE_PRODUCT_SUCCESSFULLY");
        logger.setUserId(authorizationData.getId());
        logger.setData("Action= CREATE" );
        this.loggerService.log(logger);

        if(colors != null) {
            for(String color : colors) {
                this.productService.linkToColor(productId, Integer.parseInt(color));
            }
        }
        if(patterns != null) {
            for(String pattern : patterns) {
                this.productService.linkToPattern(productId, Integer.parseInt(pattern));
            }
        }

        response.sendRedirect("/admin/editProduct?id=" + productId);
    }
}
