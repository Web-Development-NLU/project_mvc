package Controller;

import Model.About;
import Model.Order;
import Model.Product;
import Model.Statistics;
import Services.ProductService;
import Services.StatisticsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;

@WebServlet(name = "StatisticsController", value = "/StatisticsController")
public class StatisticsController extends HttpServlet {
    private StatisticsService statisticsService;
    private ProductService productService;

    public void init() throws ServletException {
        super.init();
        this.productService=new ProductService("product");
        this.statisticsService=new StatisticsService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int year = Integer.parseInt(request.getParameter("year"));
        ArrayList<Product> products=productService.getProductTop3();
        request.setAttribute("products",products);
        request.setAttribute("statistics", this.statisticsService.getStatistics());
        ArrayList<String> o=statisticsService.getMonth(year);
        request.setAttribute("o",o);
        ArrayList<Integer> statistics=statisticsService.getTotalSalesByMonth(year);
        request.setAttribute("statisticsmonth",statistics);
        ArrayList<Integer> orderByMonth=statisticsService.getTotalOrderByMonth(year);
        request.setAttribute("orderByMonth",orderByMonth);
        ArrayList<Integer> listYear=statisticsService.getYear();
        request.setAttribute("listYear",listYear);
        this.statisticsService.update();
        request.getRequestDispatcher("/jsp/admin/home.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
