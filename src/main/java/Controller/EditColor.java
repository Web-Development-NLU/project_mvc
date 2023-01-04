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

@WebServlet(name="EditColor",value = "/admin/editColor")
public class EditColor extends HttpServlet {
    String id;
    private ColorService colorService;
    @Override
    public  void init() throws ServletException{
        super.init();
        colorService = new ColorService("color");
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
        UpdateColorDTO updateColorDTO=new UpdateColorDTO(name,value);
        this.colorService.update(id,updateColorDTO);
        response.sendRedirect("/admin/color");

    }
}
