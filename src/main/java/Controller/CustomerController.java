package Controller;

import Model.InfoCustomer;
import Model.MailContent;
import Services.CustomerService;
import Services.MailService;
import com.mailjet.client.errors.MailjetException;
import com.mailjet.client.errors.MailjetSocketTimeoutException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CustomerController", value = "/customer")
public class CustomerController extends HttpServlet {

    private CustomerService customerService;
    private MailService mailService;
    @Override
    public void init() throws ServletException {
        super.init();
        this.customerService = new CustomerService("customer");
        this.mailService = new MailService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        String email =  request.getParameter("email");

        if(page == null) page = "";
        InfoCustomer model = new InfoCustomer(
                request.getParameter("name"),email
               ,
                request.getParameter("message")
        );
        if(email==null || email=="") {
     String res=
             "Please fill your emails";
     response.sendRedirect("/" + page + "?error="+res);

            return;
        }
        this.customerService.create(model);
        MailContent mailContent = new MailContent("FURNITURE THIẾT KẾ NỘI THẤT",
                "Chào " + request.getParameter("name") + " chúng tôi đã nhận dược câu hỏi của bạn chúng tôi sẽ sớm liên hệ bạn");
        try {
            mailService.send(request.getParameter("email"), mailContent);
        } catch (MailjetSocketTimeoutException e) {
            throw new RuntimeException(e);
        } catch (MailjetException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/" + page + "?success=mail");
    }
}
