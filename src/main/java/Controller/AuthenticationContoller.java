package Controller;

import DTO.AuthorizationData;
import DTO.CartDTO;
import Model.User;
import Services.UserService;
import at.favre.lib.crypto.bcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AuthenticationContoller", value = "/login")
public class AuthenticationContoller extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("jsp/client/authentication.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if (email.isEmpty() || password.isEmpty()) {
            request.setAttribute("errorLogin", "Email và mật khẩu không được bỏ trống");
            request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
            return;
        }
        User user = userService.findByEmail(email);
        HttpSession session = request.getSession(true);
        boolean isPasswordValid = (user != null && user.getPassword() != null) ? BCrypt.verifyer().verify(password.toCharArray(), user.getPassword()).verified : false;
        System.out.print("user" + user);
        try {
            if ((user != null) && isPasswordValid && (user.getIsGoogle() == 0)&& user.getIsWrong() <5) {
                ArrayList<CartDTO> carts = (ArrayList<CartDTO>) this.userService.getCart(user.getId());
                AuthorizationData data = new AuthorizationData(user.getId(), user.getType());
                data.setCarts(carts);
                session.setAttribute("authorization", data);
                response.sendRedirect("/");
            } else if (user != null && user.getIsWrong() >= 5) {
                request.setAttribute("errorLogin", "Tài khoản của bạn đã bị khóa, Vui lòng chọn quên mật khẩu để lấy lại");
                request.setAttribute("emailLogin", email);
                request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
            } else if ((user != null) && !isPasswordValid && (user.getIsGoogle() == 0)) {
                System.out.print("Run");
                userService.updateIsWrong(user.getId(), user.getIsWrong() + 1);
                request.setAttribute("errorLogin", "Email hoặc Mật khẩu của bạn bị sai");
                request.setAttribute("emailLogin", email);
                request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
            } else {
                request.setAttribute("errorLogin", "Email hoặc Mật khẩu của bạn bị sai");
                request.setAttribute("emailLogin", email);
                request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
