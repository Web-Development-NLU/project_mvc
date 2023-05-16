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

@WebServlet(name = "CreateSlide", value = "/admin/createSlide")
public class CreateSlide extends HttpServlet {

    private SlideService slideService;
    private LoggerService loggerService;
    @Override
    public void init() throws ServletException {
        super.init();
        this.slideService = new SlideService("slide");
        this.loggerService=new LoggerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/admin/createSlide.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        Slide slide = new Slide(
                request.getParameter("title"),
                request.getParameter("subtitle"),
                request.getParameter("banner"),
                request.getParameter("action"),
                request.getParameter("redirect")
        );
        this.slideService.create(slide);
        logger.setStatus(400);
        logger.setMessage("CREATE_SLIDE_SUCCESSFULLY");
        logger.setUserId(authorizationData.getId());
        logger.setData("Action= CREATE" );
        this.loggerService.log(logger);
        response.sendRedirect("/admin/slide");
    }
}
