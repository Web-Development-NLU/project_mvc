package Controller;
import DTO.AuthorizationData;
import Model.StatusAccount;
import Model.TypeAccount;
import Model.User;
import Services.UserService;
import at.favre.lib.crypto.bcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginAdminController", value = "/dashboard")
public class LoginAdminController extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();

        this.userService = new UserService("users");
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

        User user = this.userService.findByEmail(email);

        if((user == null) || !((user.getType() >= TypeAccount.ADMIN.ordinal()) && BCrypt.verifyer().verify(password.toCharArray(), user.getPassword()).verified)){
            response.sendRedirect("/dashboard?error=error&email=" + email);
            return;
        }

        HttpSession session = request.getSession(true);
        AuthorizationData data = new AuthorizationData(user.getId(), user.getType());
        session.setAttribute("adminLogin", data);

        response.sendRedirect("/admin");
    }
}

