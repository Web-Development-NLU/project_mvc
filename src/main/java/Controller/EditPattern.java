package Controller;

import DTO.UpdatePatternDTO;
import Model.Pattern;
import Services.CategoryServices;
import Services.PatternService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import javax.servlet.ServletException;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;

@WebServlet(name="EditPattern",value = "/admin/editPattern")
public class EditPattern  extends HttpServlet {
    String id;
    private PatternService patternService;
    @Override
    public void init() throws ServletException{
        super.init();
        patternService=new PatternService("pattern");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         id=request.getParameter("id");
        String name=request.getParameter("name");
        Pattern pattern=this.patternService.findById(id,Pattern.class);
        request.setAttribute("pattern",pattern);
        request.getRequestDispatcher("/jsp/admin/editPattern.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id=request.getParameter("id");
        String name=request.getParameter("name");
        UpdatePatternDTO updatePatternDTO=new UpdatePatternDTO(name);
        this.patternService.update(id,updatePatternDTO);
    }
}

