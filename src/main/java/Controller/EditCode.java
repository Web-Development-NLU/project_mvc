package Controller;

import DTO.UpdateCodeDTO;
import Model.Code;
import Services.CodeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditCode", value = "/admin/editCode")
public class EditCode extends HttpServlet {
    private CodeService codeService;

    @Override
    public void init() throws ServletException {
        super.init();
        codeService = new CodeService("code");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String value = request.getParameter("value");
        Code code;
        if(id != null){
            code = this.codeService.findById(id, Code.class);
        }else{
            code = this.codeService.findByCode(value);
        }
        request.setAttribute("code",code);
        request.getRequestDispatcher("/jsp/admin/editCode.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String value = request.getParameter("value");
        String productId = request.getParameter("productId");
        int categoryId = 0;
        try {
            categoryId = Integer.parseInt(request.getParameter("categoryId"));
        }catch (Exception e){
            categoryId = 0;
        }
        if(categoryId != 0 && productId != "") return;
        UpdateCodeDTO dto = new UpdateCodeDTO(value,categoryId, productId);
        this.codeService.update(id, dto);
        response.sendRedirect("/admin/code");
    }
}
