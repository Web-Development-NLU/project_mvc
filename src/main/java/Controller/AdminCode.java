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
        ArrayList<Code> codeResult = new ArrayList<>();
        String page = request.getParameter("page");
        int intPage;
        try {
            intPage = Integer.parseInt(page);
        }catch (Exception e){
            intPage = 0;
        }
        Double numPage = Math.ceil(Double.parseDouble(String.valueOf(codes.size())) / 10);
        if(numPage < 1) numPage = 1.0;
        if(page == null || intPage < 1) {
            page = "1";
        }
        if(Integer.parseInt(page) > numPage.intValue()) page = ""+ numPage.intValue();
        int index = (Integer.parseInt(page) - 1) * 10;
        for(int i = index; i < (index + 10); i++ ){
            if(i >= codes.size()){
                break;
            }
            codeResult.add(codes.get(i));
        }
        request.setAttribute("pagination", Integer.parseInt(page));
        request.setAttribute("codes", codeResult);
        request.setAttribute("numPage", numPage);
        request.getRequestDispatcher("/jsp/admin/code.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/admin/code?page=" + request.getParameter("page"));
    }
}
