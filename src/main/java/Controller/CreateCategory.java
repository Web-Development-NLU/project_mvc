package Controller;

import Model.Category;
import Services.CategoryServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CreateCategory", value = "/admin/createCategory")
public class CreateCategory extends HttpServlet {
    private CategoryServices categoryServices = new CategoryServices("category");
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/admin/createCategory.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Category category = new Category(name);
        String categoryId = this.categoryServices.create(category);
        response.sendRedirect("/admin/category");
    }
}
