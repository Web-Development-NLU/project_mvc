package Controller;

import Model.User;
import Services.AuthenticationService;
import Services.UserService;
import org.apache.commons.lang3.RandomStringUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "ForgotPasswordController", value = "/forgotPassword")
public class ForgotPasswordController extends HttpServlet {

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
        request.getRequestDispatcher("/jsp/client/forgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        User user = this.userService.findByEmail(email);
        Timestamp timeSendOTP=new Timestamp(System.currentTimeMillis());
        if(user == null) {
            request.setAttribute("errorForgot", "Email của bạn chưa được sử dụng để đăng ký hãy nhập lại");
            request.getRequestDispatcher("/jsp/client/forgotPassword.jsp").forward(request, response);
        }else {
            HttpSession session = request.getSession(true);
            String rand = RandomStringUtils.randomAlphabetic(6);
            this.authenticationService.sendVerify(rand, user.getEmail());
            this.userService.updateTimeout(user.getId(),timeSendOTP);
            session.setAttribute("id", user.getId());
            session.setAttribute(user.getEmail(), rand);
            response.sendRedirect("/verifyForgotPassword");
        }
    }
}
