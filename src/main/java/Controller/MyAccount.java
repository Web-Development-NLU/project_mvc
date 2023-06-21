package Controller;

import DTO.AuthorizationData;
import DTO.UpdateUserDTO;
import Model.StatusAccount;
import Services.LogisticService;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MyAccount", value = "/myAccount")
public class MyAccount extends HttpServlet {
    private UserService userService;
    private LogisticService logisticService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
        this.logisticService = new LogisticService();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean logged = (boolean) request.getAttribute("logged");
        if (!logged) {
            response.sendRedirect("/");
        } else {
            boolean errorChangePass = request.getParameter("errorChangePass") != null;
            if (errorChangePass) {
                request.setAttribute("errorChangePass", "Mật khẩu cũ không chính xác");
            }

            String success = (request.getParameter("success") == null) ? "" : request.getParameter("success");
            if (success.equals("changePass")) {
                request.setAttribute("success", "Thay đổi mật khẩu thành công");
            } else if (success.equals("changeInfo")) {
                request.setAttribute("success", "Cập nhật thông tin thành công");
            }
            String token = this.logisticService.loginLogistic("thai123@gmail.com", "123456", "/auth/login");
//        session.setAttribute("token", token);

            request.getRequestDispatcher("/jsp/client/myAccount.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        if (!((boolean) request.getAttribute("logged"))) {
            response.sendRedirect("/login");
            return;
        }
        AuthorizationData data = (AuthorizationData) session.getAttribute("authorization");
        UpdateUserDTO dto = new UpdateUserDTO(
                request.getParameter("firstName"),
                request.getParameter("lastName"),
                request.getParameter("phone"),
                request.getParameter("country"),
                request.getParameter("city"),
                request.getParameter("district"),
                request.getParameter("ward"),
                request.getParameter("address")
        );
        dto.setStatus(StatusAccount.ACTIVE.ordinal());

        this.userService.update(data.getId(), dto);

        response.sendRedirect("/myAccount?success=changeInfo");
    }
}
