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
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/jsp/admin/category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
