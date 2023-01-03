package Controller;

import Model.Pattern;
import Services.PatternService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="createPattern",value = "/admin/createPattern")
public class CreatePattern extends HttpServlet {
    private PatternService patternService;
    public void init() throws ServletException{
        super.init();
        this.patternService=new PatternService("pattern");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/admin/CreatePattern.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        String name=request.getParameter("name");
        Pattern pattern=new Pattern(name);
        String patternId=this.patternService.create(pattern);
        response.sendRedirect("/admin/pattern?id"+ patternId);

    }
}
