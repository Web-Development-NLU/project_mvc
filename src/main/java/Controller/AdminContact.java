package Controller;

import DTO.UpdateContactDTO;
import Model.Contact;
import Services.ContactService;
import org.jdbi.v3.core.statement.Update;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminContact", value = "/admin/contact")
public class AdminContact extends HttpServlet {

    private ContactService contactService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.contactService = new ContactService("contact");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("contact", this.contactService.findAll(Contact.class).get(0));

        request.getRequestDispatcher("/jsp/admin/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if(id == null) {
            response.sendRedirect("/admin");
            return;
        }

        UpdateContactDTO dto = new UpdateContactDTO(
                request.getParameter("email"),
                request.getParameter("phone"),
                request.getParameter("address")
        );

        try {
            this.contactService.update(id, dto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("/admin/contact");
    }
}
