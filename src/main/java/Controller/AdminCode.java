package Controller;

import Model.Code;
import Services.CodeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminCode", value = "/admin/code")
public class AdminCode extends HttpServlet {
    private CodeService codeService = new CodeService("code");
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Code> codes = this.codeService.findAll(Code.class);
        request.setAttribute("codes", codes);
        request.getRequestDispatcher("/jsp/admin/code.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
