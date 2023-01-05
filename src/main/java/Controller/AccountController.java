package Controller;

import DTO.AuthorizationData;
import Model.TypeAccount;
import Model.User;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AccountController", value = "/admin/account")
public class AccountController extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        if((type == null)){
            response.sendRedirect("/admin");
            return;
        }
        ArrayList<User> users;
        if(type.equals("admin")){
            HttpSession session = request.getSession(true);
            AuthorizationData data = (AuthorizationData) session.getAttribute("adminLogin");

            if(data.getType() != TypeAccount.ROOT_ADMIN.ordinal()){
                response.sendRedirect("/admin");
                return;
            }
            users = this.userService.findUser(TypeAccount.ADMIN);
            request.setAttribute("admin", true);

        }else {
            users = this.userService.findUser(TypeAccount.USER);
            request.setAttribute("admin", false);
        }

        request.setAttribute("users", users);
        request.getRequestDispatcher("/jsp/admin/account.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
