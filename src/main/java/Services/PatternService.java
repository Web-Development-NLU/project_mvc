package Services;

import DTO.BaseDTO;
import Model.Pattern;


public class PatternService extends BaseService<Pattern> {
    public PatternService(String tableName){
        super(tableName);
    }
    @Override
    public String create(Pattern model) {
        return this.jdbi.withHandle(handle -> {
            handle.createUpdate(
                    "INSERT INTO " + this.tableName + " (name,createdAt) " +
                            "VALUES (:name, :createdAt) "
            ).bindBean(model).execute();

            return model.getName();
        });
    }
    public boolean update(String id, BaseDTO model){
        Pattern pattern = this.findById(id, Pattern.class);

        if(pattern != null) {
            this.jdbi.useHandle(handle -> {
                handle.createUpdate("UPDATE " + this.tableName +
                        " SET  name = :name, " +
                        "updatedAt = :updatedAt "+
                        " WHERE id = :id "
                ).bind("id", id).bindBean(model).execute();
            });
        }

        return pattern != null;
    }

}
