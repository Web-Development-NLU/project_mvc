package Filter;

import Model.Category;
import Services.CategoryServices;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebFilter(filterName = "DataForAdmin", urlPatterns = "/admin/*")
public class DataForAdmin implements Filter {

    private CategoryServices categoryServices;
    public void init(FilterConfig config) throws ServletException {
        this.categoryServices = new CategoryServices("category");
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        request.setAttribute("categoriesMenu", this.categoryServices.findAll(Category.class));
        chain.doFilter(request, response);
    }
}
