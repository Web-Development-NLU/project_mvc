package Controller;

import DTO.AuthorizationData;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangePasswordAdmin", value = "/admin/changePassword")
public class ChangePasswordAdmin extends HttpServlet {

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
        AuthorizationData data = (AuthorizationData) session.getAttribute("adminLogin");

        if(!this.userService.changePassword(data.getId(), request.getParameter("oldPassword"), request.getParameter("newPassword"))){
            response.sendRedirect("/admin/setting?errorChangePass=error");
            return;
        }

        response.sendRedirect("/admin/setting");

    }
}
