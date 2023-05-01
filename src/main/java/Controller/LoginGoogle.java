package Controller;

import DTO.AuthorizationData;
import DTO.CartDTO;
import Model.StatusAccount;
import Model.TypeAccount;
import Model.User;
import Services.AuthenticationService;
import Services.LogisticService;
import Services.UserService;
import org.apache.commons.lang3.RandomStringUtils;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;

@WebServlet(name = "LoginGoogle", value = "/loginGoogle")
public class LoginGoogle extends HttpServlet {
    private UserService userService;
    private AuthenticationService authenticationService;
    private LogisticService logisticService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
        this.authenticationService = new AuthenticationService();
        this.logisticService = new LogisticService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject data = this.parseCredential(request.getParameter("credential"));
        String email = data.getString("email");
        User user = this.userService.findAllUserEmail(email);
        HttpSession session = request.getSession(true);
        try {
            if (user == null) {
                if (!data.getBoolean("email_verified")) {
                    request.setAttribute("errorLogin", "Email không chính xác");
                    request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
                    return;
                }
                User model = new User(email, StatusAccount.DISABLE.ordinal(), TypeAccount.USER.ordinal(), 1);
                String id = this.userService.create(model);

                String rand = RandomStringUtils.randomAlphabetic(6);

                this.authenticationService.sendVerify(rand, email);

                session.setAttribute("id", id);
                session.setAttribute(email, rand);
                response.sendRedirect(request.getContextPath() + "/verify");
                return;
            }
            if (user.getIsGoogle() == 0) {
                request.setAttribute("errorLogin", "Email này là tài khoản hệ thống không thể đăng nhập bằng google");
                request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
                return;
            }

            ArrayList<CartDTO> carts = (ArrayList<CartDTO>) this.userService.getCart(user.getId());
            AuthorizationData dataAuth = new AuthorizationData(user.getId(), user.getType());
            dataAuth.setCarts(carts);
            session.setAttribute("authorization", dataAuth);
            String token = this.logisticService.loginLogistic("thanh@1234", "123456", "/auth/login");
            session.setAttribute("token", token);
            response.sendRedirect("/");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private JSONObject parseCredential(String credential) {
        String[] chunks = credential.split("\\.");
        Base64.Decoder decoder = Base64.getUrlDecoder();
        String payload = new String(decoder.decode(chunks[1]));
        return new JSONObject(payload);
    }
}
