package Controller;

import DTO.AuthorizationData;
import Model.Category;
import Model.Logger;
import Services.CategoryServices;
import Services.LoggerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CreateCategory", value = "/admin/createCategory")
public class CreateCategory extends HttpServlet {
    private CategoryServices categoryServices = new CategoryServices("category");
    private LoggerService loggerService= new LoggerService();;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean nameExists = Boolean.parseBoolean(request.getParameter("nameExists"));
        String name = request.getParameter("name");
        if(nameExists != true){
            request.getRequestDispatcher("/jsp/admin/createCategory.jsp").forward(request,response);
        }else{
            request.setAttribute("nameExists",nameExists);
            request.setAttribute("name",name);
            request.getRequestDispatcher("/jsp/admin/createCategory.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String action = request.getParameter("action");
        Category categoryExists = this.categoryServices.findByName(name);
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        if(categoryExists != null){
            boolean nameExists = true;
            response.sendRedirect("/admin/createCategory?&name="+name+"&nameExists="+nameExists);
            return;
        }
        Category category = new Category(name);
        String categoryName = this.categoryServices.create(category);
        Category id = this.categoryServices.findByName(categoryName);
        logger.setData("Action= "+ action + ",categoryId=" + id.getId());
        logger.setStatus(200);
        logger.setMessage("CREATE_CATEGORY_SUCCESSFULLY");
        logger.setUserId(authorizationData.getId());
        this.loggerService.log(logger);
        response.sendRedirect("/admin/category");
    }
}
