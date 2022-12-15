package ControllerTest;

import DTO.UpdateCodeDTO;
import DTO.UpdateColorDTO;
import Model.Code;
import Model.Color;
import Services.CodeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CodeTest", value = "/test/code")
public class CodeTest extends HttpServlet {

    private CodeService codeService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.codeService = new CodeService("code");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/client/test/code.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String value = request.getParameter("value");
        String categoryId = request.getParameter("categoryId");
        String productId = request.getParameter("productId");
        String action = request.getParameter("action");
        switch (action){
            case "CREATE":
                Code model = new Code();
                String tempValue = model.createValue();
                while(this.codeService.findByCode(tempValue) != null){
                    tempValue = model.createValue();
                }
                model.setCategoryId(Integer.parseInt(categoryId));
                model.setProductId(productId);
                model.setValue(tempValue);
                this.codeService.create(model);
                break;
            case "UPDATE":
                UpdateCodeDTO dto = new UpdateCodeDTO(value,Integer.parseInt(categoryId), productId);
                this.codeService.update(id, dto);
                break;
            case "DELETE":
                this.codeService.delete(id, Code.class);
                break;
        }
    }
}
