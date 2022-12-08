package ControllerTest;

import DTO.UpdateUserDTO;
import Model.User;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserTest", value = "/test/user")
public class UserTest extends HttpServlet {

    private UserService userService;
    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/client/test/user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String action = request.getParameter("action");

        switch (action) {
            case "CREATE":
                User model = new User(email, password, 0, 0);
                this.userService.create(model);
                break;
            case "UPDATE":
                UpdateUserDTO dto = new UpdateUserDTO(
                        request.getParameter("firstName"),
                        request.getParameter("lastName"),
                        request.getParameter("phone"),
                        request.getParameter("country"),
                        request.getParameter("city"),
                        request.getParameter("district"),
                        request.getParameter("address")
                );

                this.userService.update(id, dto);
                break;
            case "DELETE":
                this.userService.delete(id, User.class);
                break;
        }

    }
}
