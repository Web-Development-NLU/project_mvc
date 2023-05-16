package Controller;

import DTO.AuthorizationData;
import DTO.UpdateAboutDTO;
import DTO.UpdateContactDTO;
import Model.About;
import Model.Contact;
import Model.Logger;
import Services.AboutService;
import Services.ContactService;
import Services.LoggerService;
import org.jdbi.v3.core.statement.Update;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminContact", value = "/admin/contact")
public class AdminContact extends HttpServlet {

    private ContactService contactService;
    private LoggerService loggerService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.contactService = new ContactService("contact");
        this.loggerService = new LoggerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("contact", this.contactService.findAll(Contact.class).get(0));
            request.getRequestDispatcher("/jsp/admin/contact.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String idAbout=request.getParameter("idAbout");
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        if(id ==null & idAbout ==null){
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
                logger.setStatus(400);
                logger.setMessage("EDIT_CONTACT_SUCCESSFULLY");
                logger.setUserId(authorizationData.getId());
                logger.setData("Action= EDIT , contactId= " +id );
                this.loggerService.log(logger);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }


        response.sendRedirect("/admin/contact");
    }

}
