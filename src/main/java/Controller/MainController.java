package Controller;

import DTO.FilterProduct;
import Model.Product;
import Services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("")
public class MainController extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService("product");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Product> products = this.productService.queryByBuilder(new FilterProduct());
        ArrayList<Product> productsResult = new ArrayList<>();
        int end = (products.size() < 8) ? products.size() : 8;
        for(int i = 0; i < end; i++) {
            productsResult.add(products.get(i));
        }

        request.setAttribute("products", productsResult);
        request.getRequestDispatcher("/jsp/client/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
