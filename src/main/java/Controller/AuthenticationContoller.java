package Controller;

import DTO.AuthorizationData;
import DTO.CartDTO;
import Model.Logger;
import Model.User;
import Services.LoggerService;
import Services.LogisticService;
import Services.UserService;
import at.favre.lib.crypto.bcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AuthenticationController", value = "/login")
public class AuthenticationContoller extends HttpServlet {

    private UserService userService;
    private LoggerService loggerService;
    private LogisticService logisticService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
        this.loggerService = new LoggerService();
        this.logisticService = new LogisticService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("jsp/client/authentication.jsp").forward(request, response);
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
        logger.setData("Email=" + email);
        if (email.isEmpty() || password.isEmpty()) {
            request.setAttribute("errorLogin", "Email và mật khẩu không được bỏ trống");
            request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
            logger.setStatus(400);
            logger.setMessage("EMAIL_OR_PASSWORD_IS_EMPTY");
            this.loggerService.log(logger);
            return;
        }
        User user = userService.findByEmail(email);
        HttpSession session = request.getSession(true);
        boolean isPasswordValid = (user != null && user.getPassword() != null) ? BCrypt.verifyer().verify(password.toCharArray(), user.getPassword()).verified : false;
        try {
            if ((user != null) && isPasswordValid && (user.getIsGoogle() == 0) && user.getIsWrong() < 5) {
                ArrayList<CartDTO> carts = (ArrayList<CartDTO>) this.userService.getCart(user.getId());
                AuthorizationData data = new AuthorizationData(user.getId(), user.getType());
                data.setCarts(carts);
                session.setAttribute("authorization", data);
                // LOGGER
                logger.setStatus(200);
                logger.setMessage("SUCCESSFULLY");
                logger.setUserId(user.getId());
                this.loggerService.log(logger);
//                token
                String token = this.logisticService.loginLogistic("thai123@gmail.com", "123456", "/auth/login");
                session.setAttribute("token", token);
//                reset isWrong
                userService.updateIsWrong(user.getId(), 0);


                response.sendRedirect("/");
                return;
            } else if (user != null && user.getIsWrong() >= 5) {
                request.setAttribute("errorLogin", "Tài khoản của bạn đã bị khóa, Vui lòng chọn quên mật khẩu để lấy lại");
                request.setAttribute("emailLogin", email);
                request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
                // LOGGER
                logger.setStatus(403);
                logger.setMessage("ACCOUNT_IS_LOCKED");
                logger.setUserId(user.getId());
            } else if ((user != null) && !isPasswordValid && (user.getIsGoogle() == 0)) {
                userService.updateIsWrong(user.getId(), user.getIsWrong() + 1);
                request.setAttribute("errorLogin", "Email hoặc Mật khẩu của bạn bị sai");
                request.setAttribute("emailLogin", email);
                request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
                // LOGGER
                logger.setStatus(400);
                logger.setMessage("EMAIL_OR_PASSWORD_INVALID");
                logger.setUserId(user.getId());
            } else {
                request.setAttribute("errorLogin", "Email hoặc Mật khẩu của bạn bị sai");
                request.setAttribute("emailLogin", email);
                request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
                // LOGGER
                logger.setStatus(400);
                logger.setMessage("EMAIL_OR_PASSWORD_INVALID");
            }
            this.loggerService.log(logger);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
