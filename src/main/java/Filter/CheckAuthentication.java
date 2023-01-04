package Filter;

import DTO.AuthorizationData;
import Model.StatusAccount;
import Model.User;
import Services.AuthenticationService;
import Services.UserService;
import com.mailjet.client.errors.MailjetException;
import com.mailjet.client.errors.MailjetSocketTimeoutException;
import org.apache.commons.lang3.RandomStringUtils;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "CheckAuthentication", urlPatterns = "/*")
public class CheckAuthentication implements Filter {

    private UserService userService;
    private AuthenticationService authenticationService;

    public void init(FilterConfig config) throws ServletException {
        this.userService = new UserService("users");
        this.authenticationService = new AuthenticationService();
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = ((HttpServletRequest) request).getSession(true);
        AuthorizationData data = (AuthorizationData) session.getAttribute("authorization");
        int cartNumber = (data == null) ? 0 : data.getCarts().size();
        User user = (data != null) ? userService.findById(data.getId() , User.class) : null;
        request.setAttribute("cartNumber", cartNumber);
        request.setAttribute("logged", user != null);
        request.setAttribute("user", user);
        if(httpRequest.getMethod().equalsIgnoreCase("GET")){

            if ((user != null) && (user.getStatus() == StatusAccount.DISABLE.ordinal())) {
                String rand = RandomStringUtils.randomAlphabetic(6);
                this.authenticationService.sendVerify(rand, user.getEmail());
                session.setAttribute("id", data.getId());
                session.setAttribute(user.getEmail(), rand);
                httpRequest.getRequestDispatcher("/jsp/client/verifyAccount.jsp").forward(request,response);
                return;
            }
        }

        chain.doFilter(request, response);
    }
}
