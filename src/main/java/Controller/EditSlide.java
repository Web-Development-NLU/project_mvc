package Controller;

import DTO.UpdateSlideDTO;
import Model.Slide;
import Services.SlideService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditSlide", value = "/admin/editSlide")
public class EditSlide extends HttpServlet {

    private SlideService slideService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.slideService = new SlideService("slide");
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
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/editSlide?id=" + id);
    }
}
