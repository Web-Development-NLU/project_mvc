package Controller;

import DTO.AuthorizationData;
import DTO.UpdatePatternDTO;
import Model.Logger;
import Model.Pattern;
import Services.CategoryServices;
import Services.LoggerService;
import Services.PatternService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
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
    private LoggerService loggerService;
    @Override
    public void init() throws ServletException{
        super.init();
        patternService=new PatternService("pattern");
        loggerService=new LoggerService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         id=request.getParameter("id");
        String name=request.getParameter("name");
        Pattern pattern;
        if(id!=null) {
            pattern = this.patternService.findById(id, Pattern.class);
        }else{
            pattern=new Pattern();
            pattern.setId(Integer.parseInt(name));
        }
        request.setAttribute("pattern",pattern);
        request.getRequestDispatcher("/jsp/admin/editPattern.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id=request.getParameter("id");
        String name=request.getParameter("name");
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        UpdatePatternDTO updatePatternDTO=new UpdatePatternDTO(name);
        this.patternService.update(id,updatePatternDTO);
        logger.setData("Action= EDIT" + ",patternId=" + id);
        logger.setStatus(200);
        logger.setMessage("EDIT_PATERN_SUCCESSFULLY");
        logger.setUserId(authorizationData.getId());
        this.loggerService.log(logger);
        response.sendRedirect("/admin/pattern");
    }
}

