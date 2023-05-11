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

@WebServlet(name="deletePattern",value = "/admin/deletePattern")
public class DeletePattern extends HttpServlet {
    PatternService patternService;
    LoggerService loggerService;
    public void init() throws ServletException {
        super.init();
        patternService=new PatternService("pattern");
        loggerService=new LoggerService();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
        boolean pattern=this.patternService.deletePattern(id);
        req.setAttribute(id,pattern);
        HttpSession session = req.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                req.getMethod(),
                req.getRequestURI(),
                null,
                req.getHeader("USER-AGENT")
        );
        logger.setData("Action= DELETE" + ",patternId=" + id);
        logger.setStatus(200);
        logger.setMessage("DELETE_PATERN_SUCCESSFULLY");
        logger.setUserId(authorizationData.getId());
        this.loggerService.log(logger);
        req.getRequestDispatcher("/admin/pattern").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/admin/deletePattern?id" + req.getParameter("id"));
    }
}
