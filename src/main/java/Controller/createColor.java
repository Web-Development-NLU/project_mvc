package Controller;

import Model.Color;
import Services.ColorService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "createColor",value = "/admin/createColor")
public class createColor extends HttpServlet {
    private ColorService colorService;
    public void init() throws ServletException{
        super.init();
        this.colorService=new ColorService("color");
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

        response.sendRedirect("/admin/color?id"+colorId);
    }
}
