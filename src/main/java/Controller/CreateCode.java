package Controller;

import Model.Code;
import Services.CodeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CreateCode", value = "/admin/createCode")
public class CreateCode extends HttpServlet {
    private CodeService codeService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.codeService = new CodeService("code");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String value = request.getParameter("value");
        String productId = request.getParameter("productId");
        int categoryId = 0;
        try {
            categoryId = Integer.parseInt(request.getParameter("categoryId"));
        }catch (Exception e){
            categoryId = 0;
        }
        Code code = new Code(value);
        code.setProductId(productId);
        code.setCategoryId(categoryId);
        request.setAttribute("code", code);
        request.getRequestDispatcher("/jsp/admin/createCode.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String value = request.getParameter("value");
        String productId = request.getParameter("productId");
        int categoryId = 0;
        try {
            categoryId = Integer.parseInt(request.getParameter("categoryId"));
        }catch (Exception e){
            categoryId = 0;
        }
        Code model = new Code(value);
        if(categoryId != 0 && productId != "") return;
        if(categoryId != 0){
            model.setCategoryId(categoryId);
        }else {
            model.setProductId(productId);
        }
        String code = this.codeService.create(model);
        if(code != null){
            response.sendRedirect("/admin/editCode?value=" + code);
        }else{
            response.sendRedirect("/admin/createCode?value="+model.getValue()+"&productId="+model.getProductId()+"&categoryId="+model.getCategoryId());
        }

    }
}
