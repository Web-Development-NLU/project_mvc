package Controller;

import Model.Category;
import Services.CategoryServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminCategory", value = "/admin/category")
public class AdminCategory extends HttpServlet {
    private CategoryServices categoryServices;

    @Override
    public void init() throws ServletException {
        super.init();
        this.categoryServices = new CategoryServices("category");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Category> categories = this.categoryServices.findAll(Category.class);
        ArrayList<Category> categoryResult = new ArrayList<>();
        String page = request.getParameter("page");
        Double numPage = Math.ceil(Double.parseDouble(String.valueOf(categories.size())) / 10);
        if(page == null || Integer.parseInt(page) < 1) {
            page = "1";
        }
        if(Integer.parseInt(page) > numPage.intValue()) page = ""+ numPage.intValue();
        int index = (Integer.parseInt(page) - 1) * 10;
        for(int i = index; i < (index + 10); i++ ){
            if(i >= categories.size()){
                break;
            }
            categoryResult.add(categories.get(i));
        }
        request.setAttribute("pagination", Integer.parseInt(page));
        request.setAttribute("numPage", numPage);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/jsp/admin/category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/admin/code?page=" + request.getParameter("page"));
    }
}
