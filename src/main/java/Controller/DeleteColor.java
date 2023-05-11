package Controller;

import DTO.AuthorizationData;
import Model.Logger;
import Services.ColorService;
import Services.LoggerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name="Delete",value="/admin/delete")
public class DeleteColor extends HttpServlet {
    private ColorService colorService;
    private LoggerService loggerService;
    @Override
    public void init() throws ServletException{
        super.init();
        colorService=new ColorService("color");
        loggerService=new LoggerService();
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
       boolean colors= this.colorService.deleteColor(id);
       req.setAttribute("colors",colors);
        HttpSession session = req.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                req.getMethod(),
                req.getRequestURI(),
                null,
                req.getHeader("USER-AGENT")
        );
        logger.setData("Action= DELETE" + ",colorId=" + id);
        logger.setStatus(200);
        logger.setMessage("DELETE_COLOR_SUCCESSFULLY");
        logger.setUserId(authorizationData.getId());
        this.loggerService.log(logger);
        req.getRequestDispatcher("/admin/color").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/admin/delete?id="+request.getParameter("id"));
    }
}
