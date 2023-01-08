package Controller;

import Model.Category;
import Services.CategoryServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminCategory", value = "/admin/category")
public class AdminCategory extends HttpServlet {
    private CategoryServices categoryServices;

    @Override
    public void init() throws ServletException {
        super.init();
        this.categoryServices = new CategoryServices("category");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String infoSearch = request.getParameter("infoSearch");
        ArrayList<Category> categories;
        if(infoSearch != null && !infoSearch.equals("null")){
            request.setAttribute("infoSearch", infoSearch);
            categories = this.categoryServices.findCategoriesByName(infoSearch);
        }else{
            categories = this.categoryServices.findAll(Category.class);
        }
        ArrayList<Category> categoryResult = new ArrayList<>();
        String page = request.getParameter("page");
        int intPage;
        try {
            intPage = Integer.parseInt(page);
        }catch (Exception e){
            intPage = 0;
        }
        Double numPage = Math.ceil(Double.parseDouble(String.valueOf(categories.size())) / 10);
        if(numPage < 1) numPage = 1.0;
        if(page == null || intPage < 1) {
            page = "1";
        }
        if(Integer.parseInt(page) > numPage.intValue()) page = ""+ numPage.intValue();
        int index = (Integer.parseInt(page) - 1) * 10;
        for(int i = index; i < (index + 10); i++ ){
            if(i >= categories.size()){
                break;
            }
            categoryResult.add(categories.get(i));
        }
        request.setAttribute("pagination", Integer.parseInt(page));
        request.setAttribute("numPage", numPage);
        request.setAttribute("categories", categoryResult);
        request.getRequestDispatcher("/jsp/admin/category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/admin/category?page=" + request.getParameter("page")+"&infoSearch="+request.getParameter("infoSearch"));
    }
}
