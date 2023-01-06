package Controller;

import Model.Color;
import Services.ColorService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
        String id = request.getParameter("id");
        String page = request.getParameter("page");
        if(page == null || Integer.parseInt("page") < 1){
            page ="1";
        }

        ArrayList<Color> colors=this.colorService.findAll(Color.class);
        request.setAttribute("pagination", Integer.parseInt(page));
//        request.setAttribute("numPage", Math.ceil(Double.parseDouble(String.valueOf())));
        request.setAttribute("colors",colors);
        request.getRequestDispatcher("/jsp/admin/color.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/admin/color?id=" + request.getParameter("id") + "&page="+request.getParameter("page"));
    }
}
