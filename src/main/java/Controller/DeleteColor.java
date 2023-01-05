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

@WebServlet(name="Delete",value="/admin/delete")
public class DeleteColor extends HttpServlet {
    private ColorService colorService;
    @Override
    public void init() throws ServletException{
        super.init();
        colorService=new ColorService("color");
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
        Color color=this.colorService.findById(id,Color.class);
        req.setAttribute("color",color);
        req.getRequestDispatcher("/jsp/admin/delete.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        this.colorService.delete(id);
        response.sendRedirect("/admin/color");
    }
}
