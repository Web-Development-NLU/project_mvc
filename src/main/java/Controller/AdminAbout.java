package Controller;

import DTO.AuthorizationData;
import DTO.UpdateAboutDTO;
import DTO.UpdateContactDTO;
import Model.About;
import Model.Contact;
import Model.Logger;
import Services.AboutService;
import Services.ContactService;
import Services.LoggerService;
import org.jdbi.v3.core.statement.Update;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminAbout", value = "/admin/about")
public class AdminAbout extends HttpServlet {

    private AboutService aboutService;
    private LoggerService loggerService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.aboutService=new AboutService("about");
        this.loggerService=new LoggerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("about",this.aboutService.findAll(About.class).get(0));
        request.getRequestDispatcher("/jsp/admin/about.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idAbout");
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        if(id == null) {
            response.sendRedirect("/admin");
            return;
        }

        UpdateAboutDTO dto = new UpdateAboutDTO(
                request.getParameter("intro"),
                request.getParameter("mission"),
                request.getParameter("ourValue")
        );

        try {
            this.aboutService.update(id, dto);
            logger.setStatus(400);
            logger.setMessage("EDIT_ABOUT_SUCCESSFULLY");
            logger.setUserId(authorizationData.getId());
            logger.setData("Action= EDIT , aboutId= " +id );
            this.loggerService.log(logger);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("/admin/about");
    }
}
