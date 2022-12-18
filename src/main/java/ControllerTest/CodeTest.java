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
        String sCategoryId = request.getParameter("categoryId");
        int categoryId;
        try {
            categoryId = Integer.parseInt(sCategoryId);
        }catch (Exception e){
            categoryId = 0;
        }
        String productId = request.getParameter("productId").trim().equals("") ? null : request.getParameter("productId");
        String action = request.getParameter("action");
        switch (action){
            case "CREATE":
                Code model = new Code(value,categoryId,productId);
                this.codeService.create(model);
                break;
            case "UPDATE":
                UpdateCodeDTO dto = new UpdateCodeDTO(value,categoryId, productId);
                this.codeService.update(id, dto);
                break;
            case "DELETE":
                this.codeService.delete(id, Code.class);
                break;
        }
    }
}
