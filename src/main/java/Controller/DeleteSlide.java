package Controller;

import Model.Slide;
import Services.SlideService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteSlide", value = "/admin/deleteSlide")
public class DeleteSlide extends HttpServlet {
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

        this.slideService.delete(id, Slide.class);

        response.sendRedirect("/admin/slide");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
