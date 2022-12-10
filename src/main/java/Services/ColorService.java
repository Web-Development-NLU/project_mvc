package Services;

import DTO.BaseDTO;
import Model.Color;
import Model.User;

public class ColorService extends BaseService<Color>{

    public ColorService(String tableName) {
        super(tableName);
    }

    @Override
    public String create(Color model) {
        return this.jdbi.withHandle(handle -> {
            handle.createUpdate("INSERT INTO " + this.tableName + " (name, value, createdAt) "
            + "VALUES ( :name, :value, :createdAt)").bindBean(model).execute();
            return model.getName();
        });
    }

    @Override
    public boolean update(String id, BaseDTO model) {
        Color color = this.findById(id, Color.class);
        if(color != null) {
            this.jdbi.useHandle(handle -> {

                handle.createUpdate("UPDATE " + this.tableName +
                        " SET name = :name, " +
                        "value = :value, " +
                        "updatedAt = :updatedAt " +
                        " WHERE id = :id "
                ).bind("id", id).bindBean(model).execute();
            });
        }
        return color != null;
    }
}
