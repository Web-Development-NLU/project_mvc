package Controller;

import DTO.AuthorizationData;
import DTO.UpdateUserDTO;
import Model.StatusAccount;
import Model.User;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminSetting", value = "/admin/setting")
public class AdminSetting extends HttpServlet {

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
        String errorChangePass = request.getParameter("errorChangePass");
        if(errorChangePass != null) {
            request.setAttribute("errorChangePass", "Mật khẩu cũ không chính xác");
        }

        String success = (request.getParameter("success") == null) ? "" : request.getParameter("success");
        if(success.equals("changePass")) {
            request.setAttribute("success", "Thay đổi mật khẩu thành công");
        }else if(success.equals("changeInfo")){
            request.setAttribute("success", "Cập nhật thông tin thành công");
        }

        User user = this.userService.findById(data.getId(), User.class);
        request.setAttribute("user", user);

        request.getRequestDispatcher("/jsp/admin/adminSetting.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        AuthorizationData data = (AuthorizationData) session.getAttribute("adminLogin");
        UpdateUserDTO dto = new UpdateUserDTO(
                request.getParameter("firstName"),
                request.getParameter("lastName"),
                request.getParameter("phone"),
                request.getParameter("country"),
                request.getParameter("city"),
                request.getParameter("district"),
                request.getParameter("address")
        );
        dto.setStatus(StatusAccount.ACTIVE.ordinal());

        this.userService.update(data.getId(), dto);

        response.sendRedirect("/admin/setting?success=changeInfo");
    }
}
