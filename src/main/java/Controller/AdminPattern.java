package Controller;

import Model.Color;
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
        String pattern=request.getParameter("pattern");
        ArrayList<Pattern> patterns = this.patternService.findAll(Pattern.class);
        if(pattern !=null){
            patterns=this.patternService.findPatternByName(pattern);
        }
        ArrayList<Pattern> patternResult = new ArrayList<>();
        String page = request.getParameter("page");

        Double numPage = Math.ceil(Double.parseDouble(String.valueOf(patterns.size())) / 10);
        if(page == null || Integer.parseInt(page) < 1) {
            page = "1";
        }
        if(Integer.parseInt(page) > numPage.intValue()) page = ""+ numPage.intValue();
        int index = (Integer.parseInt(page) - 1) * 10;
        for(int i = index; i < (index + 10); i++ ){
            if(i >= patterns.size()){
                break;
            }
            patternResult.add(patterns.get(i));
        }
        request.setAttribute("pagination", Integer.parseInt(page));
        request.setAttribute("numPage", numPage);
        request.setAttribute("patterns", patternResult);
        request.getRequestDispatcher("/jsp/admin/pattern.jsp").forward(request, response);
    }

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pattern=request.getParameter("pattern");
        String paramPattern="";
        if(pattern !=null){
            paramPattern="&pattern="+pattern;
        }
        response.sendRedirect("/admin/pattern?page="+request.getParameter("page")+paramPattern);

    }
}
