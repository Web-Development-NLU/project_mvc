package Controller;

import Model.About;
import Model.Contact;
import Services.AboutService;
import Services.ContactService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AboutController", value = "/about")
public class AboutController extends HttpServlet {
    private AboutService aboutService;
    @Override
    public void init() throws ServletException {
        super.init();
        this.aboutService = new AboutService("about");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("about", this.aboutService.findAll(About.class).get(0));
        request.getRequestDispatcher("/jsp/client/about.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
