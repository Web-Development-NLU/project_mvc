package Controller;

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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
       boolean colors= this.colorService.deleteColor(id);
       req.setAttribute("colors",colors);
        req.getRequestDispatcher("/admin/color").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/admin/delete?id="+request.getParameter("id"));
    }
}
