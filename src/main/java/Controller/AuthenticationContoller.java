package Controller;

import DTO.AuthorizationData;
import Model.User;
import Services.UserService;
import at.favre.lib.crypto.bcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

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
        request.getRequestDispatcher("jsp/client/authentication.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = userService.findByEmail(email);
        HttpSession session = request.getSession(true);
        try {
            if((user != null) && BCrypt.verifyer().verify(password.toCharArray(), user.getPassword()).verified){

                session.setAttribute("authorization", new AuthorizationData(user.getId(), user.getType()));
                response.sendRedirect("/");
            }else {
                request.setAttribute("errorLogin", "Email hoặc Mật khẩu của bạn bị sai");
                request.setAttribute("emailLogin", email);
                request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
