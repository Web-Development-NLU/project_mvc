package Controller;

import Model.Pattern;
import Services.PatternService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="SearchPattern",value = "/admin/searchPattern")
public class SearchPattern extends HttpServlet {
    PatternService patternService;
    public void init() throws ServletException {
        super.init();
        this.patternService=new PatternService("pattern");
    }
     public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String txtSearch=request.getParameter("pattern");
        System.out.println(txtSearch);
         ArrayList<Pattern> list=patternService.findPatternByName(txtSearch);
         System.out.println(list);
         request.setAttribute("patterns",list);
         request.getRequestDispatcher("/jsp/admin/pattern.jsp").forward(request,response);


     }
     @Override
    protected  void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        response.sendRedirect("/admin/searchPattern?pattern="+ request.getParameter("pattern"));
     }
}
