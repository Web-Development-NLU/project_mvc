package Services;

import DTO.BaseDTO;
import Model.Category;
import Model.Code;
import Model.Order;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

import java.util.ArrayList;

public class CategoryServices extends BaseService<Category> {
    public CategoryServices(String tableName){
        super(tableName);
    }
    @Override
    public String create(Category model) {
        return this.jdbi.withHandle(handle -> {
                       handle.createUpdate(
                    "INSERT INTO " + this.tableName + " (name,createdAt) " +
                            "VALUES (:name, :createdAt) "
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
                                "updatedAt = :updatedAt "+
                                " WHERE id = :id "
                ).bind("id", id).bindBean(model).execute();
            });
        }

        return category != null;
    }
    public Category findByName(String name){
        try {
            return this.jdbi.withHandle(new HandleCallback<Category, Exception>() {
                public Category withHandle(Handle handle) throws Exception{
                    try {
                        return handle.createQuery(
                                        "SELECT * FROM " + tableName + " WHERE name = ?")
                                .bind(0, name)
                                .mapToBean(Category.class).first();
                    }catch (IllegalStateException exception) {
                        return null;
                    }

                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Category> findCategoriesByName(String name){
        String detailSearch = "%"+name+"%";
        return (ArrayList<Category>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM " + this.tableName + " WHERE name like ?").bind(0,detailSearch).mapToBean(Category.class).list();
        });
    }

}
