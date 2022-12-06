package Controller;

import DTO.UpdateUserDTO;
import Model.User;
import Services.AuthenticationService;
import Services.UserService;
import at.favre.lib.crypto.bcrypt.BCrypt;
import org.apache.commons.lang3.RandomStringUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "VerifyForgotPassword", value = "/verifyForgotPassword")
public class VerifyForgotPassword extends HttpServlet {

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
        request.getRequestDispatcher("/jsp/client/verifyForgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String id = (String) session.getAttribute("id");
        String action = request.getParameter("action");
        User user = this.userService.findById(id, User.class);

        switch (action){
            case "resend":
            {
                String rand = RandomStringUtils.randomAlphabetic(6);
                this.authenticationService.sendVerify(rand, user.getEmail());
                session.setAttribute("id", id);
                session.setAttribute(user.getEmail(), rand);
                response.sendRedirect("/verifyForgotPassword");
            }break;
            case "verify":
            {
                String code = request.getParameter("code");
                String verify = (String) session.getAttribute(user.getEmail());
                String newPassword = request.getParameter("password");

                if(!Objects.equals(code, verify)) {
                    request.setAttribute("error", "Mã xác minh sai hãy nhập lại!!");
                    request.getRequestDispatcher("/jsp/client/verifyForgotPassword.jsp").forward(request, response);
                }else {
                    this.userService.resetPassword(user.getId(), newPassword);
                    session.removeAttribute("id");
                    session.removeAttribute(user.getEmail());
                    response.sendRedirect("/CompleteForgotPassword");
                }
            }break;
        }
    }
}
