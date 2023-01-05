package Controller;

import DTO.UpdateColorDTO;
import Model.Color;
import Services.ColorService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;

@WebServlet(name = "search",value = "/admin/SearchColor")
public class SearchColor extends HttpServlet {
    ColorService colorService;
    public void init() throws ServletException {
        super.init();
        this.colorService=new ColorService("color");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException, ServletException {
        String txtSearch=request.getParameter("color");
        ArrayList<Color> list=colorService.findColorByName(txtSearch);
        request.setAttribute("colors",list);
        request.getRequestDispatcher("/jsp/admin/color.jsp").forward(request,response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/admin/SearchColor?color="+ request.getParameter("color"));
    }
}
