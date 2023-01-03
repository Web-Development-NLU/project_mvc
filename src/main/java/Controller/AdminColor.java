package Controller;

import Model.Color;
import Services.ColorService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminColor", value = "/admin/color")
public class AdminColor extends HttpServlet {
    private ColorService colorService;

    @Override
    public void init() throws ServletException{
        super.init();
        this.colorService=new ColorService("color");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Color> colors=this.colorService.findAll(Color.class);
        request.setAttribute("colors",colors);
        request.getRequestDispatcher("/jsp/admin/color.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
