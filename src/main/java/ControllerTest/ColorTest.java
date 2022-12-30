package ControllerTest;

import DTO.UpdateColorDTO;
import DTO.UpdateUserDTO;
import Model.Color;
import Model.User;
import Services.ColorService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ColorTest", value = "/test/color")
public class ColorTest extends HttpServlet {

    private ColorService colorService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.colorService = new ColorService("color");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/test/color.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String value = request.getParameter("value");
        String action = request.getParameter("action");
        switch (action){
            case "CREATE":
                Color model = new Color(name, value);
                this.colorService.create(model);
                break;
            case "UPDATE":
                UpdateColorDTO dto = new UpdateColorDTO(name,value);
                this.colorService.update(id,dto);
                break;
            case "DELETE":
                this.colorService.delete(id, Color.class);
                break;
        }
    }
}
