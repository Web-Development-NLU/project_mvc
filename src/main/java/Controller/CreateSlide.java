package Controller;

import Model.Slide;
import Services.SlideService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CreateSlide", value = "/admin/createSlide")
public class CreateSlide extends HttpServlet {

    private SlideService slideService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.slideService = new SlideService("slide");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/admin/createSlide.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Slide slide = new Slide(
                request.getParameter("title"),
                request.getParameter("subtitle"),
                request.getParameter("banner"),
                request.getParameter("action"),
                request.getParameter("redirect")
        );

        this.slideService.create(slide);
        response.sendRedirect("/admin/slide");
    }
}
