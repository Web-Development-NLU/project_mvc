package Filter;

import Model.Logger;
import Model.User;
import Services.LoggerService;
import org.apache.commons.lang3.RandomStringUtils;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "LoggerFilter", urlPatterns = "/*")
public class LoggerFilter implements Filter {
    private LoggerService loggerService;
    public void init(FilterConfig config) throws ServletException {
        this.loggerService = new LoggerService();
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(request, response);
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String method = httpRequest.getMethod();
        if(!method.equalsIgnoreCase("GET")) {
            String requestUrl = httpRequest.getRequestURI().toString();
            String agent = httpRequest.getHeader("USER-AGENT");
            User user = (User) httpRequest.getAttribute("user");
            Logger logger = new Logger(method, requestUrl, (user != null) ? user.getId() : null, agent);
            this.loggerService.create(logger);
            System.out.println("[ " + logger.getId() + " ] " + method + "-" + requestUrl + " - " + agent + ((user != null) ? " - " + user.getId() : ""));
        }
    }
}
