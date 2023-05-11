package Controller;

import DTO.AuthorizationData;
import DTO.UpdateSlideDTO;
import Model.Logger;
import Model.Slide;
import Services.LoggerService;
import Services.SlideService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditSlide", value = "/admin/editSlide")
public class EditSlide extends HttpServlet {

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
        String id = request.getParameter("id");

        if(id == null) {
            response.sendRedirect("/admin/slide");
            return;
        }

        request.setAttribute("slide", this.slideService.findById(id, Slide.class));

        request.getRequestDispatcher("/jsp/admin/editSlide.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        UpdateSlideDTO  slide = new UpdateSlideDTO(
                request.getParameter("title"),
                request.getParameter("subtitle"),
                request.getParameter("banner"),
                request.getParameter("action"),
                request.getParameter("redirect")
        );

        try {
            this.slideService.update(id, slide);
            logger.setStatus(400);
            logger.setMessage("EDIT_SLIDE_SUCCESSFULLY");
            logger.setUserId(authorizationData.getId());
            logger.setData("Action= EDIT, slideId= " + id);
            this.loggerService.log(logger);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/editSlide?id=" + id);
    }
}
