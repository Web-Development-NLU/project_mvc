package Controller;

import Model.*;
import Services.AuthenticationService;
import Services.MailService;
import Services.UserService;
import Utils.Utils;
import at.favre.lib.crypto.bcrypt.BCrypt;
import org.apache.commons.lang3.RandomStringUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

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
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            if (email.isEmpty() || password.isEmpty()) {
                request.setAttribute("error", "Email và mật khẩu không được bỏ trống");
                request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
            }
            else if (this.userService.findAllUserEmail(email) != null) {
                request.setAttribute("error", "Email của bạn đã được sử dụng");
                request.setAttribute("email", request.getParameter("email"));
                request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
            }
            else if (!new Utils().handleCheckPasswordIsValid(password)) {
                request.setAttribute("error", "Mật khẩu ít nhất 6 kí tự và có ít nhất 1 chữ cái in hoa và chứ số");

                request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
            }
            else {
                Timestamp timeCurrent=new Timestamp(System.currentTimeMillis());
                String passwordHash = BCrypt.withDefaults().hashToString(8, password.toCharArray());
                User model = new User(email, passwordHash, StatusAccount.DISABLE.ordinal(), TypeAccount.USER.ordinal());
                String id = this.userService.create(model);
                String rand = RandomStringUtils.randomAlphabetic(6);

                this.authenticationService.sendVerify(rand, email);
                this.userService.updateTimeout(id,timeCurrent);
                session.setAttribute("id", id);
                session.setAttribute(email, rand);

                response.sendRedirect(request.getContextPath() + "/verify");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
