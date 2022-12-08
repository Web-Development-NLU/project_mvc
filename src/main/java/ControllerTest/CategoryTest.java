package ControllerTest;

import DTO.UpdateCategoryDTO;
import Model.Category;
import Model.User;
import Services.CategoryServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CategoryTest", value = "/test/category")
public class CategoryTest extends HttpServlet {
    private CategoryServices categoryService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.categoryService = new CategoryServices("category");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/client/test/category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String action = request.getParameter("action");

        switch (action) {
            case "CREATE":
                Category model = new Category(name);
                this.categoryService.create(model);
                break;
            case "UPDATE":
                UpdateCategoryDTO dto = new UpdateCategoryDTO(request.getParameter("name"));

                this.categoryService.update(id, dto);
                break;
            case "DELETE":
                this.categoryService.delete(id, Category.class);
                break;

        }
    }
}
