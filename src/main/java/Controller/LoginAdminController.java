package Controller;
import DTO.AuthorizationData;
import Model.Logger;
import Model.StatusAccount;
import Model.TypeAccount;
import Model.User;
import Services.LoggerService;
import Services.UserService;
import at.favre.lib.crypto.bcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginAdminController", value = "/dashboard")
public class LoginAdminController extends HttpServlet {

    private UserService userService;
    private LoggerService loggerService;

    @Override
    public void init() throws ServletException {
        super.init();

        this.userService = new UserService("users");
        this.loggerService = new LoggerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String error = request.getParameter("error");
        String email = request.getParameter("email");
        if(error != null) {
            request.setAttribute("error", "Tài khoản hoặc mật khẩu bị sai");
        }
        if(email != null) {
            request.setAttribute("email", email);
        }

        request.getRequestDispatcher("/jsp/admin/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        User user = this.userService.findByEmail(email);

        if((user == null) || !((user.getType() >= TypeAccount.ADMIN.ordinal()) && BCrypt.verifyer().verify(password.toCharArray(), user.getPassword()).verified)){
            logger.setMessage("NO_ADMIN_OR_EMAIL_OR_PASSWORD_INVALID");
            logger.setStatus(400);
            logger.setData("Email= " + email);
            this.loggerService.log(logger);
            response.sendRedirect("/dashboard?error=error&email=" + email);
            return;
        }

        HttpSession session = request.getSession(true);
        AuthorizationData data = new AuthorizationData(user.getId(), user.getType());
        session.setAttribute("adminLogin", data);

        response.sendRedirect("/admin");
        logger.setStatus(200);
        logger.setMessage("ADMIN_SUCCESSFULLY");
        logger.setUserId(user.getId());
        logger.setData("Email= " + user.getEmail());
        this.loggerService.log(logger);
    }
}

