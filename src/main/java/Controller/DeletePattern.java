package Controller;

import Model.Pattern;
import Services.PatternService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="deletePattern",value = "/admin/deletePattern")
public class DeletePattern extends HttpServlet {
    PatternService patternService;
    public void init() throws ServletException {
        super.init();
        patternService=new PatternService("pattern");
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
        boolean pattern=this.patternService.deletePattern(id);
        req.setAttribute(id,pattern);
        req.getRequestDispatcher("/admin/pattern").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/admin/deletePattern?id" + req.getParameter("id"));
    }
}
