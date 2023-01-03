package Controller;
import Model.Category;
import Model.Code;
import Model.Product;
import Services.CategoryServices;
import Services.CodeService;
import Services.ProductService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CreateCode", value = "/admin/createCode")
public class CreateCode extends HttpServlet {
    private CodeService codeService;
    private CategoryServices categoryServices;
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.codeService = new CodeService("code");
        this.categoryServices = new CategoryServices("category");
        this.productService = new ProductService("product");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String value = request.getParameter("value");
        String productId = request.getParameter("productId");
        boolean errorInput = Boolean.parseBoolean(request.getParameter("errorInput"));
        boolean errorCategoryId = Boolean.valueOf(request.getParameter("errorCategoryId"));
        boolean errorProductId = Boolean.valueOf(request.getParameter("errorProductId"));
        boolean errorValueCode = Boolean.parseBoolean(request.getParameter("errorValueCode"));
        int categoryId = 0;
        try {
            categoryId = Integer.parseInt(request.getParameter("categoryId"));
        } catch (Exception e) {
            categoryId = 0;
        }
        Code code = new Code(value);
        code.setProductId(productId);
        code.setCategoryId(categoryId);
        request.setAttribute("code", code);
        request.setAttribute("errorInput", errorInput);
        request.setAttribute("errorCategoryId", errorCategoryId);
        request.setAttribute("errorProductId", errorProductId);
        request.setAttribute("errorValueCode",errorValueCode);
        request.getRequestDispatcher("/jsp/admin/createCode.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Boolean errorValueCode = false, errorInput = false, errorCategoryId = false, errorProductId = false;
        String value = request.getParameter("value");
        String productId = request.getParameter("productId");
        int categoryId = 0;
        try {
            categoryId = Integer.parseInt(request.getParameter("categoryId"));
        } catch (Exception e) {
            categoryId = 0;
        }
        Code model = new Code(value);
        errorValueCode = checkValueCodeNotExist(value);
        errorCategoryId = checkCategoryIdNotExists(categoryId);
        errorProductId = checkProductIdNotExists(productId);
        if ((categoryId != 0 && !productId.trim().equals("")) || (categoryId == 0 && productId.trim().equals(""))) {
            errorInput = true;
        }
        if (errorInput || errorCategoryId || errorProductId || errorValueCode) {
            response.sendRedirect("/admin/createCode?value=" + model.getValue() + "&productId=" + productId + "&categoryId=" + categoryId + "&errorProductId=" + errorProductId + "&errorInput=" + errorInput + "&errorCategoryId=" + errorCategoryId+"&errorValueCode="+errorValueCode);
            return;
        }
        if (categoryId != 0) {
            model.setCategoryId(categoryId);
        } else {
            model.setProductId(productId);
        }
        String codeId = this.codeService.create(model);
        if (codeId != null) {
            response.sendRedirect("/admin/editCode?id=" + codeId);
        } else {
            response.sendRedirect("/admin/createCode?value=" + model.getValue() + "&productId=" + model.getProductId() + "&categoryId=" + model.getCategoryId());
        }
    }

    private Boolean checkValueCodeNotExist(String value) {
        Code code = this.codeService.findByCode(value);
        if (code != null) {
            return true;
        } else {
            return false;
        }
    }

    private Boolean checkProductIdNotExists(String productId) {
        boolean result = false;
        if (!productId.trim().equals("")) {
            Product product = this.productService.findById(productId, Product.class);
            if (product == null) {
                result = true;
            } else {
                result = false;
            }
        }
        return result;
    }

    private Boolean checkCategoryIdNotExists(int categoryId) {
        boolean result = false;
        if (categoryId != 0) {
            Category category = this.categoryServices.findById("" + categoryId, Category.class);
            if (category == null) {
                result = true;
            } else {
                result = false;
            }
        }
        return result;
    }
}
