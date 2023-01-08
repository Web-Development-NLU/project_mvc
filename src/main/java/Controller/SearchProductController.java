package Controller;

import Model.Order;
import Model.Product;
import Services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "SearchProductController", value = "/searchProduct")
public class SearchProductController extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService("product");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Product> products;
        String infoSearch = request.getParameter("infoSearch");
        if (infoSearch != null && !infoSearch.equals("null")){
            request.setAttribute("infoSearch", infoSearch);
            products = this.productService.findByName(infoSearch);
        }else{
            products = this.productService.findAll(Product.class);
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
        if(numPage < 1) numPage = 1.0;
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
        request.setAttribute("pagination", Integer.parseInt(page));
        request.setAttribute("numPage", numPage);
        request.setAttribute("products",productResult);
        request.getRequestDispatcher("/jsp/client/searchProducts.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/searchProduct?infoSearch="+request.getParameter("infoSearch"));
    }
}
