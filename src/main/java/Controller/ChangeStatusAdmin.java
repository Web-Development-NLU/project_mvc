package Controller;

import DTO.AuthorizationData;
import Model.TypeAccount;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangeStatusAdmin", value = "/admin/changeStatus")
public class ChangeStatusAdmin extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        AuthorizationData data = (AuthorizationData) session.getAttribute("adminLogin");

        if(data.getType() != TypeAccount.ROOT_ADMIN.ordinal()){
            response.sendRedirect("/admin");
            return;
        }

        String userId = request.getParameter("user");

        if(!this.userService.changeStatusAdmin(userId)) {
            response.sendRedirect("/admin/account?type=admin");
            return;
        }

        response.sendRedirect("/admin/account?type=admin");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
