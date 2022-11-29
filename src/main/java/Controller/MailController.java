package Controller;

import Model.MailContent;
import Services.MailService;
import com.mailjet.client.errors.MailjetException;
import com.mailjet.client.errors.MailjetSocketTimeoutException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MailController", value = "/mail")
public class MailController extends HttpServlet {
    private MailService mailService;
    @Override
    public void init() throws ServletException {
        super.init();
        this.mailService = new MailService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/client/test/mail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            String emailAddress = request.getParameter("email");
            this.mailService.send(emailAddress, new MailContent("Hello 23234", "Test"));
        }catch (MailjetSocketTimeoutException e) {
            System.out.println(e.getMessage());
            throw new RuntimeException(e);

        } catch (MailjetException e) {
            System.out.println(e.getMessage());
            throw new RuntimeException(e);
        }

    }
}
