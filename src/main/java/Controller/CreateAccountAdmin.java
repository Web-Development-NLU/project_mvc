package Controller;

import DTO.AuthorizationData;
import Model.*;
import Services.LoggerService;
import Services.MailService;
import Services.UserService;
import at.favre.lib.crypto.bcrypt.BCrypt;
import com.mailjet.client.errors.MailjetException;
import com.mailjet.client.errors.MailjetSocketTimeoutException;
import org.apache.commons.lang3.RandomStringUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CreateAccountAdmin", value = "/admin/account/createAdmin")
public class CreateAccountAdmin extends HttpServlet {

    private UserService userService;
    private MailService mailService;
    private LoggerService loggerService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
        this.mailService = new MailService();
        this.loggerService=new LoggerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String error = request.getParameter("error") ;
        String email = request.getParameter("email");

        HttpSession session = request.getSession(true);
        AuthorizationData data = (AuthorizationData) session.getAttribute("adminLogin");
        if(data.getType() != TypeAccount.ROOT_ADMIN.ordinal()){
            response.sendRedirect("/admin");
            return;
        }

        if(error != null){
            request.setAttribute("error", "Email đã được sử dụng");
        }
        if(email != null) {
            request.setAttribute("email", email);
        }

        request.getRequestDispatcher("/jsp/admin/createAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        User user = this.userService.findByEmail(email);
        HttpSession session = request.getSession(true);
        AuthorizationData data = (AuthorizationData) session.getAttribute("adminLogin");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        if(data.getType() != TypeAccount.ROOT_ADMIN.ordinal()){
            response.sendRedirect("/admin");
            return;
        }

        if(user != null){
            response.sendRedirect("/admin/account/createAdmin?error=error&email=" + email);
            return;
        }

        String password = RandomStringUtils.randomAlphanumeric(8);

        User model = new User(email, BCrypt.withDefaults().hashToString(8, password.toCharArray()), StatusAccount.ACTIVE.ordinal(), TypeAccount.ADMIN.ordinal());

        this.userService.create(model);

        logger.setUserId(data.getId());
        logger.setMessage("CREATE_ADMIN_SUCCESSFULLY");
        logger.setStatus(400);
        logger.setData("Email= " + email);
        this.loggerService.log(logger);
        MailContent mailContent = new MailContent("Tài khoản admin", "email: " + email + "\n password: " + password);
        try {
            this.mailService.send(email,mailContent);
        } catch (MailjetSocketTimeoutException e) {
            throw new RuntimeException(e);
        } catch (MailjetException e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("/admin/account?type=admin");

    }
}
