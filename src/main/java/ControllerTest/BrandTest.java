package ControllerTest;

import DTO.UpdateBrandDTO;
import Model.Brand;
import Services.BrandService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

    @WebServlet(name = "BrandTest", value = "/test/brand")
    public class BrandTest extends HttpServlet {
        private BrandService brandService;

        @Override
        public void init() throws ServletException {
            super.init();
            this.brandService = new BrandService("brand");
        }

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("/jsp/client/test/brand.jsp").forward(request, response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String action = request.getParameter("action");

            switch (action) {
                case "CREATE":
                    Brand model = new Brand(name);
                    this.brandService.create(model);
                    break;
                case "UPDATE":
                    UpdateBrandDTO dto = new UpdateBrandDTO(request.getParameter("name"));
                    this.brandService.update(id, dto);
                    break;
                case "DELETE":
                    this.brandService.delete(id, Brand.class);
                    break;

            }
        }
    }

