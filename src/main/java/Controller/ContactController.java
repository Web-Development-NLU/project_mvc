package Controller;

import Model.Contact;
import Services.ContactService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

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
        String success = request.getParameter("success");
        if(Objects.equals(success, "mail")) request.setAttribute("success", "chúng tôi đã nhận được và phản hồi qua email của bạn");
        request.setAttribute("contact", this.contactService.findAll(Contact.class).get(0));

        request.getRequestDispatcher("/jsp/client/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
