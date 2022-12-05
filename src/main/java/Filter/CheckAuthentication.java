package Filter;

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
        String id = (String) session.getAttribute("authorization");
        User user = userService.findById(id, User.class);
        request.setAttribute("logged", user != null);
        if(httpRequest.getMethod().equalsIgnoreCase("GET")){

            if ((user != null) && (user.getStatus() == 0)) {
                String rand = RandomStringUtils.randomAlphabetic(6);
                this.authenticationService.sendVerify(rand, user.getEmail());
                session.setAttribute("id", id);
                session.setAttribute(user.getEmail(), rand);
                httpRequest.getRequestDispatcher("/jsp/client/verifyAccount.jsp").forward(request,response);
                return;
            }
        }

        chain.doFilter(request, response);
    }
}
