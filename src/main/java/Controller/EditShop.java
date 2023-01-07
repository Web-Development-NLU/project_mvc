package Controller;

import DTO.UpdateShopDTO;
import Model.Shop;
import Services.ShopService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditShop", value = "/admin/editShop")
public class EditShop extends HttpServlet {

    private ShopService shopService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.shopService = new ShopService("shop");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        if(type == null) {
            response.sendRedirect("/admin");
            return;
        }
        if(id == null) {
            response.sendRedirect("/admin/shop?type=" + type);
            return;
        }

        request.setAttribute("shop", this.shopService.findById(id, Shop.class));
        request.getRequestDispatcher("/jsp/admin/editShop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        if(type == null) {
            response.sendRedirect("/admin");
            return;
        }
        if(id == null) {
            response.sendRedirect("/admin/shop?type=" + type);
            return;
        }

        UpdateShopDTO model = new UpdateShopDTO(
                request.getParameter("name"),
                request.getParameter("image"),
                request.getParameter("redirect")
        );

        try {
            this.shopService.update(id, model);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/editShop?id=" + id + "&type=" + type);
    }
}
