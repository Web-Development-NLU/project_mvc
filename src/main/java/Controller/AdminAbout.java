package Controller;

import DTO.UpdateAboutDTO;
import DTO.UpdateContactDTO;
import Model.About;
import Model.Contact;
import Services.AboutService;
import Services.ContactService;
import org.jdbi.v3.core.statement.Update;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminAbout", value = "/admin/about")
public class AdminAbout extends HttpServlet {

    private AboutService aboutService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.aboutService=new AboutService("about");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("about",this.aboutService.findAll(About.class).get(0));
        request.getRequestDispatcher("/jsp/admin/about.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idAbout");

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
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("/admin/about");
    }
}
