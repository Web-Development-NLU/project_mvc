package Controller;

import Model.Contact;
import Services.ContactService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ContactController", value = "/contact")
public class ContactController extends HttpServlet {
    private ContactService contactService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.contactService = new ContactService("contact");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("contact", this.contactService.findAll(Contact.class).get(0));

        request.getRequestDispatcher("/jsp/client/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
