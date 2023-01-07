package Controller;

import Model.Slide;
import Services.SlideService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminSlide", value = "/admin/slide")
public class AdminSlide extends HttpServlet {
    private SlideService slideService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.slideService = new SlideService("slide");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("slides", this.slideService.findAll(Slide.class));
        request.getRequestDispatcher("/jsp/admin/slide.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
