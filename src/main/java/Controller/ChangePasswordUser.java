package Controller;

import DTO.AuthorizationData;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangePasswordUser", value = "/changePasswordUser")
public class ChangePasswordUser extends HttpServlet {

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

        HttpSession session = request.getSession(true);

        if(!((boolean) request.getAttribute("logged"))) {
            response.sendRedirect("/login");
            return;
        }

        AuthorizationData data = (AuthorizationData) session.getAttribute("authorization");

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        if(!this.userService.changePassword(data.getId(), oldPassword, newPassword)){
            response.sendRedirect("/myAccount?errorChangePass=error");
            return;
        };

        response.sendRedirect("/myAccount?success=changePass");
    }
}
