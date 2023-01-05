package Controller;

import Model.User;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminProfileAccount", value = "/admin/profileAccount")
public class AdminProfileAccount extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("user");
        if(id == null) {
            response.sendRedirect("/admin");
            return;
        }
        User user = this.userService.findById(id, User.class);
        if(user == null) {
            response.sendRedirect("/admin");
            return;
        }
        request.setAttribute("user", user);
        request.getRequestDispatcher("/jsp/admin/accountProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
