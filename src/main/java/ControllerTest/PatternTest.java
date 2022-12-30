package ControllerTest;

import DTO.UpdatePatternDTO;
import Model.Pattern;
import Services.PatternService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

    @WebServlet(name = "PatternTest", value = "/test/pattern")
    public class PatternTest extends HttpServlet {
        private PatternService patternService;

        @Override
        public void init() throws ServletException {
            super.init();
            this.patternService = new PatternService("pattern");
        }

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("/jsp/test/pattern.jsp").forward(request, response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String action = request.getParameter("action");

            switch (action) {
                case "CREATE":
                    Pattern model = new Pattern(name);
                    this.patternService.create(model);
                    break;
                case "UPDATE":
                    UpdatePatternDTO dto = new UpdatePatternDTO(request.getParameter("name"));

                    this.patternService.update(id, dto);
                    break;
                case "DELETE":
                    this.patternService.delete(id, Pattern.class);
                    break;

            }
        }
}
