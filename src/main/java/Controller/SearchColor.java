package Controller;

import DTO.UpdateColorDTO;
import Model.Color;
import Services.ColorService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;

public class SearchColor extends HttpServlet {
    ColorService colorService;
    public void init() throws ServletException {
        super.init();
        this.colorService=new ColorService("color");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException, ServletException {
        String txtSearch=request.getParameter("txt");
        ArrayList<Color> list=this.colorService.getColorByName(txtSearch);
        request.setAttribute("listC",list);
        request.getRequestDispatcher("admin/color").forward(request,response);

    }
}
