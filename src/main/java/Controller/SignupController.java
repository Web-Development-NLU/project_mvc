package Controller;

import Model.MailContent;
import Model.User;
import Services.AuthenticationService;
import Services.MailService;
import Services.UserService;
import at.favre.lib.crypto.bcrypt.BCrypt;
import org.apache.commons.lang3.RandomStringUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
@WebServlet(name = "SignupController", value = "/signup")
public class SignupController extends HttpServlet {

    private UserService userService;
    private AuthenticationService authenticationService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
        this.authenticationService = new AuthenticationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        try {
            if(this.userService.findByEmail(request.getParameter("email")) != null){
                request.setAttribute ("error", "Email của bạn đã được sử dụng");
                request.setAttribute("email", request.getParameter("email"));
                request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
            }else {
                String email = request.getParameter("email");
                String password = BCrypt.withDefaults().hashToString(8, request.getParameter("password").toCharArray());
                User model = new User(email, password, 0, 0);

                String id = this.userService.create(model);
                String rand = RandomStringUtils.randomAlphabetic(6);

                this.authenticationService.sendVerify(rand, email);

                session.setAttribute("id", id);
                session.setAttribute(email, rand);
                response.sendRedirect("/verify");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
