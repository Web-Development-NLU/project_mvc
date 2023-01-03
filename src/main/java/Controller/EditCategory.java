package Controller;

import DTO.UpdateCategoryDTO;
import Model.Category;
import Services.CategoryServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditCategory", value = "/admin/editCategory")
public class EditCategory extends HttpServlet {
    String id;
    private CategoryServices categoryServices = new CategoryServices("category");
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id = request.getParameter("id");
        Category categories = this.categoryServices.findById(id, Category.class);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/jsp/admin/editCategory.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        UpdateCategoryDTO updateDTO = new UpdateCategoryDTO(name);
        this.categoryServices.update(id, updateDTO);
        response.sendRedirect("/admin/category");
    }
}
