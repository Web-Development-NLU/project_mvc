package Controller;

import DTO.AuthorizationData;
import DTO.UpdateCategoryDTO;
import Model.Category;
import Model.Code;
import Model.Logger;
import Services.CategoryServices;
import Services.LoggerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditCategory", value = "/admin/editCategory")
public class EditCategory extends HttpServlet {
    String id;
    private CategoryServices categoryServices = new CategoryServices("category");
    private LoggerService loggerService=new LoggerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id = request.getParameter("id");
        boolean delete = Boolean.parseBoolean(request.getParameter("delete"));
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        if(delete) {
            this.categoryServices.delete(id, Category.class);
            logger.setData("Action= DELETE" + ",categoryId=" + id);
            logger.setStatus(200);
            logger.setMessage("DELETE_CATEGORY_SUCCESSFULLY");
            logger.setUserId(authorizationData.getId());
            this.loggerService.log(logger);
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
        String action = request.getParameter("action");
        Category category = this.categoryServices.findByName(name);
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        if(category != null){
            boolean nameExists = true;
            response.sendRedirect("/admin/editCategory?id="+id+"&name="+name+"&nameExists="+nameExists);
            return;
        }
        UpdateCategoryDTO updateDTO = new UpdateCategoryDTO(name);
        this.categoryServices.update(id, updateDTO);
        logger.setData("Action= "+ action + ",categoryId=" + id);
        logger.setStatus(200);
        logger.setMessage("EDIT_CATEGORY_SUCCESSFULLY");
        logger.setUserId(authorizationData.getId());
        this.loggerService.log(logger);
        response.sendRedirect("/admin/category");
    }
}
