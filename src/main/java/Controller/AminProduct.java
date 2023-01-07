package Controller;

import DTO.FilterProduct;
import Model.Category;
import Model.Product;
import Services.CategoryServices;
import Services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;

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
        String page = request.getParameter("page");
        String search = request.getParameter("search");
        if(page == null || Integer.parseInt(page) < 1) {
            page = "1";
        }

        FilterProduct filter = new FilterProduct();
        filter.category = id;
        ArrayList<Product> allProduct;
        ArrayList<Product> productsResult = new ArrayList<>();
        if(search != null) {
            request.setAttribute("search", search);
            allProduct = productService.searchByNameAndCategory(search, id);
        }else {
            allProduct = productService.queryByBuilder(filter);
        }
        int numpage = (int) Math.ceil(Double.parseDouble(String.valueOf(allProduct.size())) / 10);
        if(Integer.parseInt(page) > numpage) {
            page = numpage + "";
        }
        int index = (Integer.parseInt(page) - 1) * 10;
        for(int i = index; i < (index + 10); i++ ){
            if(i >= allProduct.size()){
                break;
            }
            productsResult.add(allProduct.get(i));
        }

        filter.category = id;
        request.setAttribute("category", categoryServices.findById(id, Category.class));
        request.setAttribute("products", productsResult);
        request.setAttribute("pagination", Integer.parseInt(page));
        request.setAttribute("numPage", numpage);
        request.getRequestDispatcher("/jsp/admin/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = (request.getParameter("id") == null) ? "" : "id=" + request.getParameter("id") + "&";
        String searchParam = (request.getParameter("search") == null) ? "" : "search=" + request.getParameter("search") + "&";
        String pageParam = (request.getParameter("page") == null) ? "" : "page=" + request.getParameter("page");
        response.sendRedirect("/admin/products?" + idParam + searchParam + pageParam);
    }
}
