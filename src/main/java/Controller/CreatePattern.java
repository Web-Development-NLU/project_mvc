package Controller;

import DTO.AuthorizationData;
import Model.Logger;
import Model.Pattern;
import Services.LoggerService;
import Services.PatternService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name="createPattern",value = "/admin/createPattern")
public class CreatePattern extends HttpServlet {
    private PatternService patternService;
    private LoggerService loggerService;
    public void init() throws ServletException{
        super.init();
        this.patternService=new PatternService("pattern");
        this.loggerService=new LoggerService();
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
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        Pattern id=this.patternService.getPatternID(name);
        logger.setData("Action= CREATE " + ",patternId=" + id.getId());
        logger.setStatus(200);
        logger.setMessage("CREATE_PATTERN_SUCCESSFULLY");
        logger.setUserId(authorizationData.getId());
        this.loggerService.log(logger);
        response.sendRedirect("/admin/pattern?id"+ patternId);

    }
}
