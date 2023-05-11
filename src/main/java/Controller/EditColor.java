package Controller;

import DTO.AuthorizationData;
import DTO.UpdateColorDTO;
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

@WebServlet(name="EditColor",value = "/admin/editColor")
public class EditColor extends HttpServlet {
    String id;
    private ColorService colorService;
    private LoggerService loggerService;
    @Override
    public  void init() throws ServletException{
        super.init();
        colorService = new ColorService("color");
        loggerService=new LoggerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id=request.getParameter("id");
        String value=request.getParameter("value");
        Color color;
        if(id!=null){
             color=this.colorService.findById(id,Color.class);
        }else{
            color=new Color();
            color.setId(Integer.parseInt(value));
        }
        request.setAttribute("color",color);
        request.getRequestDispatcher("/jsp/admin/editColor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id=request.getParameter("id");
        String name=request.getParameter("name");
        String value=request.getParameter("value");
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        UpdateColorDTO updateColorDTO=new UpdateColorDTO(name,value);
        this.colorService.update(id,updateColorDTO);
        logger.setData("ACTION= EDIT , colorID= " + id);
        logger.setUserId(authorizationData.getId());
        logger.setStatus(200);
        logger.setMessage("EDIT_COLOR_SUCCESSFULLY");
        this.loggerService.create(logger);
        response.sendRedirect("/admin/color");

    }
}
