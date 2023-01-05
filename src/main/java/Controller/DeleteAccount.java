package Controller;

import DTO.AuthorizationData;
import Model.TypeAccount;
import Model.User;
import Services.MailService;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteAccount", value = "/admin/deleteAccount")
public class DeleteAccount extends HttpServlet {
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
        String type = request.getParameter("type");
        User user = this.userService.findById(userId, User.class);
        if(user == null) {
            response.sendRedirect("/admin/account?type=" + type);
            return;
        }

        this.userService.delete(userId, User.class);

        response.sendRedirect("/admin/account?type=" + type);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
