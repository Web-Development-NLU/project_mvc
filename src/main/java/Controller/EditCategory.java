package Controller;

import DTO.UpdateCategoryDTO;
import Model.Category;
import Model.Code;
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
        boolean delete = Boolean.parseBoolean(request.getParameter("delete"));
        if(delete) {
            this.categoryServices.delete(id, Category.class);
            response.sendRedirect("/admin/category");
            return;
        }
        boolean nameExists = Boolean.parseBoolean(request.getParameter("nameExists"));
        String name = request.getParameter("name");
        if(nameExists != true){
            Category categories = this.categoryServices.findById(id, Category.class);
            request.setAttribute("categories", categories);
        }else{
            request.setAttribute("nameExists",nameExists);
            request.setAttribute("name",name);
        }
        request.getRequestDispatcher("/jsp/admin/editCategory.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Category category = this.categoryServices.findByName(name);
        if(category != null){
            boolean nameExists = true;
            response.sendRedirect("/admin/editCategory?id="+id+"&name="+name+"&nameExists="+nameExists);
            return;
        }
        UpdateCategoryDTO updateDTO = new UpdateCategoryDTO(name);
        this.categoryServices.update(id, updateDTO);
        response.sendRedirect("/admin/category");
    }
}
