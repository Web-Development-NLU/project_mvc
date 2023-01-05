package Controller;

import DTO.UpdateCodeDTO;
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

@WebServlet(name = "EditCode", value = "/admin/editCode")
public class EditCode extends HttpServlet {
    private CodeService codeService;
    private CategoryServices categoryServices;
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        super.init();
        codeService = new CodeService("code");
        this.categoryServices = new CategoryServices("category");
        this.productService = new ProductService("product");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        boolean delete = Boolean.parseBoolean(request.getParameter("delete"));
        if(delete) {
            this.codeService.delete(id, Code.class);
            response.sendRedirect("/admin/code");
            return;
        }
        String value = request.getParameter("value");
        String productId = request.getParameter("productId");
        Code code;
        int categoryId = 0;
        if(id != null){
            code = this.codeService.findById(id, Code.class);
        }else{
            code = new Code(value);
            code.setProductId(productId);
            try {
                categoryId = Integer.parseInt(request.getParameter("categoryId"));
            }catch (Exception e){
                categoryId = 0;
            }
            code.setCategoryId(categoryId);
        }
        boolean errorInput = Boolean.parseBoolean(request.getParameter("errorInput"));
        boolean errorCategoryId = Boolean.valueOf(request.getParameter("errorCategoryId"));
        boolean errorProductId = Boolean.valueOf(request.getParameter("errorProductId"));
        boolean errorValueCode = Boolean.parseBoolean(request.getParameter("errorValueCode"));
        request.setAttribute("code",code);
        request.setAttribute("errorInput",errorInput);
        request.setAttribute("errorCategoryId",errorCategoryId);
        request.setAttribute("errorProductId",errorProductId);
        request.setAttribute("errorValueCode",errorValueCode);
        request.getRequestDispatcher("/jsp/admin/editCode.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Boolean errorValueCode = false,errorInput= false,errorCategoryId = false, errorProductId = false;
        String value = request.getParameter("value");
        String productId = request.getParameter("productId");
        int categoryId = 0;
        try {
            categoryId = Integer.parseInt(request.getParameter("categoryId"));
        }catch (Exception e){
            categoryId = 0;
        }
        errorValueCode = checkValueCodeNotExist(id,value);
        errorCategoryId = checkCategoryIdNotExists(categoryId);
        errorProductId = checkProductIdNotExists(productId);
        if((categoryId != 0 && !productId.trim().equals("")) || (categoryId == 0 && productId.trim().equals(""))){
            errorInput = true;
        }
        if(errorInput || errorCategoryId || errorProductId || errorValueCode) {
            response.sendRedirect("/admin/editCode?id="+id+"&value="+value+"&productId="+productId+"&categoryId="+categoryId+"&errorProductId="+errorProductId+"&errorInput="+errorInput+"&errorCategoryId="+errorCategoryId+"&errorValueCode="+errorValueCode);
            return;
        }
        UpdateCodeDTO dto = new UpdateCodeDTO(value,categoryId, productId);
        this.codeService.update(id, dto);
        response.sendRedirect("/admin/code");
    }
    private Boolean checkProductIdNotExists(String productId) {
        boolean result = false;
        if(!productId.trim().equals("")){
            Product product = this.productService.findById(productId, Product.class);
            if(product == null) {
                result = true;
            }else{
                result = false;
            }
        }
        return result;
    }

    private Boolean checkCategoryIdNotExists(int categoryId) {
        boolean result = false;
        if(categoryId != 0){
            Category category = this.categoryServices.findById(""+categoryId, Category.class);
            if(category == null) {
                result = true;
            }else{
                result = false;
            }
        }
        return result;
    }
    private Boolean checkValueCodeNotExist(String id,String value) {
        Code code = this.codeService.findByCode(id,value);
        if (code != null) {
            return true;
        } else {
            return false;
        }
    }
}
