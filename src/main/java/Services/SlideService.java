package Services;

import DTO.BaseDTO;
import Model.Color;
import Model.Slide;

public class SlideService extends BaseService<Slide> {
    public SlideService(String tableName) {
        super(tableName);
    }

    @Override
    public String create(Slide model) {
        return this.jdbi.withHandle(handle -> {
            handle.createUpdate("INSERT INTO " + this.tableName + " (title, subtitle, banner, action, redirect, createdAt) VALUES " +
                    "(:title, :subtitle, :banner, :action, :redirect, :createdAt)").bindBean(model).execute();
            return model.getTitle();
        });
    }

    @Override
    public boolean update(String id, BaseDTO model) throws Exception {
        Slide slide = this.findById(id, Slide.class);
        if(slide != null) {
            this.jdbi.useHandle(handle -> {

                handle.createUpdate("UPDATE " + this.tableName +
                        " SET title = :title, " +
                        "subtitle = :subtitle, " +
                        "updatedAt = :updatedAt, " +
                        "banner = :banner, " +
                        "action = :action, " +
                        "redirect = :redirect " +
                        " WHERE id = :id "
                ).bind("id", id).bindBean(model).execute();
            });
        }
        return slide != null;
    }
}
