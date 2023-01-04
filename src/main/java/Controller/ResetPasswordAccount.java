package Controller;

import DTO.AuthorizationData;
import Model.MailContent;
import Model.TypeAccount;
import Model.User;
import Services.MailService;
import Services.UserService;
import com.mailjet.client.errors.MailjetException;
import com.mailjet.client.errors.MailjetSocketTimeoutException;
import org.apache.commons.lang3.RandomStringUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ResetPasswordAccount", value = "/admin/account/resetPass")
public class ResetPasswordAccount extends HttpServlet {
    private UserService userService;
    private MailService mailService;
    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
        this.mailService = new MailService();
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
        String password = RandomStringUtils.randomAlphabetic(8);

        if(userId == null) {
            response.sendRedirect("/admin/account?type=admin");
            return;
        }
        User user = this.userService.findById(userId, User.class);
        if(user == null) {
            response.sendRedirect("/admin/account?type=admin");
            return;
        }
        this.userService.resetPassword(userId, password);
        try {
            this.mailService.send(user.getEmail(), new MailContent("Đặt lại mật khẩu", "email: " + user.getEmail() + "\n password: " + password));
        } catch (MailjetSocketTimeoutException e) {
            throw new RuntimeException(e);
        } catch (MailjetException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/account?type=admin");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
