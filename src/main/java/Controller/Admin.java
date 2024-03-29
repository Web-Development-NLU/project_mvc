package Controller;

import Model.Product;
import Model.Statistics;
import Services.ProductService;
import Services.StatisticsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

@WebServlet(name = "Admin", value = "/admin")
public class Admin extends HttpServlet {
    private ProductService productService;
    private StatisticsService statisticsService;


    @Override
    public void init() throws ServletException {
        super.init();
        this.productService=new ProductService("product");
        this.statisticsService=new StatisticsService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Product> products=productService.getProductTop3();
        request.setAttribute("products",products);
        request.setAttribute("statistics", this.statisticsService.getStatistics());
        ArrayList<String> o=statisticsService.getMonth(LocalDate.now().getYear());
        request.setAttribute("o",o);
        ArrayList<Integer> statistics=statisticsService.getTotalSalesByMonth(LocalDate.now().getYear());
        request.setAttribute("statisticsmonth",statistics);
        ArrayList<Integer> orderByMonth=statisticsService.getTotalOrderByMonth(LocalDate.now().getYear());
        request.setAttribute("orderByMonth",orderByMonth);
        ArrayList<Integer> listYear=statisticsService.getYear();
        request.setAttribute("listYear",listYear);
//                  ArrayList<Order> oo=this.statisticsService.getTotalSalesByMonth();
//        HttpSession session=request.getSession(true);
//        session.setAttribute("o",o);
        this.statisticsService.update();
        request.getRequestDispatcher("/jsp/admin/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
