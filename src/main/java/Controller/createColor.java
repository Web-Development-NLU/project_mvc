package Controller;

import DTO.AuthorizationData;
import Model.Color;
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

@WebServlet(name = "createColor",value = "/admin/createColor")
public class createColor extends HttpServlet {
    private ColorService colorService;
    private LoggerService loggerService;
    public void init() throws ServletException{
        super.init();
        this.colorService=new ColorService("color");
        this.loggerService=new LoggerService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        request.getRequestDispatcher("/jsp/admin/createColor.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        String name=request.getParameter("name");
        String value=request.getParameter("value");
        Color color=new Color(name,value);
        String colorId=this.colorService.create(color);
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        int id=this.colorService.getColor(name).getId();
        logger.setData("Action= CREATE" + ",colorId=" + id);
        logger.setStatus(200);
        logger.setMessage("CREATE_COLOR_SUCCESSFULLY");
        logger.setUserId(authorizationData.getId());
        this.loggerService.log(logger);
        response.sendRedirect("/admin/color");
    }
}
