package Controller;

import DTO.AuthorizationData;
import DTO.UpdateUserDTO;
import Model.Cart;
import Model.MailContent;
import Model.StatusAccount;
import Model.User;
import Services.AuthenticationService;
import Services.MailService;
import Services.UserService;
import com.mailjet.client.errors.MailjetException;
import com.mailjet.client.errors.MailjetSocketTimeoutException;
import org.apache.commons.lang3.RandomStringUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "VerifyController", value = "/verify")
public class VerifyController extends HttpServlet {

    private UserService userService;
    private AuthenticationService authenticationService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
        this.authenticationService = new AuthenticationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String id = (String) session.getAttribute("id");
        if (id == null) {
            response.sendRedirect("/");
            return;
        }
        request.getRequestDispatcher("/jsp/client/verifyAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String id = (String) session.getAttribute("id");
        String action = request.getParameter("action");
        User user = this.userService.findById(id, User.class);

        switch (action) {
            case "resend": {
                String rand = RandomStringUtils.randomAlphabetic(6);
                this.authenticationService.sendVerify(rand, user.getEmail());
                session.setAttribute("id", id);
                session.setAttribute(user.getEmail(), rand);
                response.sendRedirect("/verify");
            }
            break;
            case "verify": {
                String code = request.getParameter("code");
                String verify = (String) session.getAttribute(user.getEmail());
//                AuthorizationData authorizationData = (session.getAttribute("authorization") == null)
//                        ? new AuthorizationData() : (AuthorizationData) session.getAttribute("authorization");
                if (!Objects.equals(code, verify)) {
                    request.setAttribute("error", "Mã xác minh sai hãy nhập lại!!");
                    request.getRequestDispatcher("/jsp/client/verifyAccount.jsp").forward(request, response);
                } else {
//                    Cart cart = new Cart(
//                            authorizationData.getId(),
//                            product.getId(),
//                            pattern,
//                            color,
//                            amount,
//                            image
//                    );
//
                    user.setStatus(StatusAccount.ACTIVE.ordinal());
                    UpdateUserDTO dto = new UpdateUserDTO(user);
                    this.userService.update(id, dto);

                    session.removeAttribute("id");
                    session.removeAttribute(user.getEmail());

                    session.setAttribute("authorization", new AuthorizationData(id, user.getType()));
                    response.sendRedirect("/");
                }
            }
            break;
        }

    }
}
