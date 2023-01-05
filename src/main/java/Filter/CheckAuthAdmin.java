package Filter;

import DTO.AuthorizationData;
import Model.TypeAccount;
import Model.User;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "CheckAuthAdmin", urlPatterns = "/admin/*")
public class CheckAuthAdmin implements Filter {
    private UserService userService;
    public void init(FilterConfig config) throws ServletException {
        this.userService = new UserService("users");
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(true);
        AuthorizationData data = (AuthorizationData) session.getAttribute("adminLogin");
        if((data == null) || (data.getType() < TypeAccount.ADMIN.ordinal())){
            res.sendRedirect("/dashboard");
            return;
        }

        User user = this.userService.findById(data.getId(), User.class);
        if(user == null){
            res.sendRedirect("/dashboard");
            return;
        }
        chain.doFilter(request, response);

    }
}
