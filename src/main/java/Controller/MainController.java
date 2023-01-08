package Controller;

import DTO.FilterProduct;
import Model.Product;
import Model.Slide;
import Model.TypeShop;
import Services.ProductService;
import Services.ShopService;
import Services.SlideService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet("")
public class MainController extends HttpServlet {
    private ProductService productService;
    private SlideService slideService;
    private ShopService shopService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService("product");
        this.slideService = new SlideService("slide");
        this.shopService = new ShopService("shop");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Product> products = this.productService.queryByBuilder(new FilterProduct());
        ArrayList<Product> productsResult = new ArrayList<>();
        int end = (products.size() < 8) ? products.size() : 8;
        for(int i = 0; i < end; i++) {
            productsResult.add(products.get(i));
        }

        String success = request.getParameter("success");
        if(Objects.equals(success, "mail")) request.setAttribute("success", "chúng tôi đã nhận được và phản hồi qua email của bạn");

        request.setAttribute("smallShop", this.shopService.findByType(TypeShop.SMALL.ordinal()));
        request.setAttribute("largeShop", this.shopService.findByType(TypeShop.LARGE.ordinal()));
        request.setAttribute("slides", slideService.findAll(Slide.class));
        request.setAttribute("products", productsResult);
        request.getRequestDispatcher("/jsp/client/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
