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
        String color=request.getParameter("color");
        ArrayList<Color> colors = this.colorService.findAll(Color.class);
        if(color !=null){
            colors=this.colorService.findColorByName(color);
        }
        ArrayList<Color> colorResult = new ArrayList<>();
        String page = request.getParameter("page");

        Double numPage = Math.ceil(Double.parseDouble(String.valueOf(colors.size())) / 10);
        if(numPage<1) numPage= 1.0;
        if(page == null || Integer.parseInt(page) < 1) {
            page = "1";
        }
        if(Integer.parseInt(page) > numPage.intValue()) page = ""+ numPage.intValue();
        int index = (Integer.parseInt(page) - 1) * 10;
        for(int i = index; i < (index + 10); i++ ){
            if(i >= colors.size()){
                break;
            }
            colorResult.add(colors.get(i));
        }
        request.setAttribute("pagination", Integer.parseInt(page));
        request.setAttribute("numPage", numPage);
        request.setAttribute("colors", colorResult);
        request.getRequestDispatcher("/jsp/admin/color.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String color=request.getParameter("color");
        String paramColor="";
        if(color !=null){
            paramColor="&color="+color;
        }
        response.sendRedirect("/admin/color?page="+request.getParameter("page")+paramColor);
    }
}
