package Controller;

import Model.User;
import Services.UserService;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignupController", value = "/signup")
public class SignupController extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if(this.userService.checkEmailExists(request.getParameter("email"))){
                request.setAttribute ("error", "Email của bạn đã được sử dụng");
                request.setAttribute("email", request.getParameter("email"));
                request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
            }else {
                response.sendRedirect("/verify");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
