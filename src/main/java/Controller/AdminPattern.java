package Controller;

import Model.Pattern;
import Services.ColorService;
import Services.PatternService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminPattern", value = "/admin/pattern")
public class AdminPattern extends HttpServlet {
    private PatternService patternService;
    @Override
    public void init() throws ServletException{
        super.init();
        this.patternService=new PatternService("pattern");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Pattern> patterns=this.patternService.findAll(Pattern.class);
        request.setAttribute("patterns",patterns);
        request.getRequestDispatcher("/jsp/admin/pattern.jsp").forward(request, response);
    }

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
