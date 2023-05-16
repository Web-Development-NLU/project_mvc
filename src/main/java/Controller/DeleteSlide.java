package Controller;

import DTO.AuthorizationData;
import Model.Logger;
import Model.Slide;
import Services.LoggerService;
import Services.SlideService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteSlide", value = "/admin/deleteSlide")
public class DeleteSlide extends HttpServlet {
    private SlideService slideService;
    private LoggerService loggerService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.slideService = new SlideService("slide");
        this.loggerService = new LoggerService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        if(id == null) {
            response.sendRedirect("/admin/slide");
            return;
        }

        this.slideService.delete(id, Slide.class);
        logger.setStatus(400);
        logger.setMessage("DELETE_SLIDE_SUCCESSFULLY");
        logger.setUserId(authorizationData.getId());
        logger.setData("Action= DELETE, slideId= " + id);
        this.loggerService.log(logger);
        response.sendRedirect("/admin/slide");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
