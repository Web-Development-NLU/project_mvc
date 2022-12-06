package Services;

import DTO.BaseDTO;
import Model.Category;

public class CategoryServices extends BaseService<Category> {
    public CategoryServices(String tableName){
        super(tableName);
    }
    @Override
    public String create(Category model) {
        return this.jdbi.withHandle(handle -> {
                       handle.createUpdate(
                    "INSERT INTO " + this.tableName + " (name,createAt) " +
                            "VALUES (:name, :createAt) "
            ).bindBean(model).execute();

            return model.getName();
        });
    }
    public boolean update(String id, BaseDTO model){
        Category category = this.findById(id, Category.class);

        if(category != null) {
            this.jdbi.useHandle(handle -> {
                handle.createUpdate("UPDATE " + this.tableName +
                                " SET  name = :name, " +
                                "updateAt = :updateAt, "+
                                " WHERE id = :id "
                ).bind("id", id).bindBean(model).execute();
            });
        }

        return category != null;
    }

}
