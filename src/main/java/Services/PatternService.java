package Services;

import DTO.BaseDTO;
import Model.Category;
import Model.Pattern;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

import java.util.ArrayList;


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
public ArrayList<Pattern> findPatternByName(String name){
        String nameSearch="%"+name+"%";
        return (ArrayList<Pattern>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM " + this.tableName +
                    " WHERE name like ? ")
                    .bind(0,nameSearch)
                    .mapToBean(Pattern.class)
                    .list();
        });
}
    public Pattern getPatternID(String name){
        try {
            return this.jdbi.withHandle(new HandleCallback<Pattern, Exception>() {
                public Pattern withHandle(Handle handle) throws Exception{
                    try {
                        return handle.createQuery(
                                        "SELECT * FROM " + tableName + " WHERE name = ?")
                                .bind(0, name)
                                .mapToBean(Pattern.class).first();
                    }catch (IllegalStateException exception) {
                        return null;
                    }

                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public boolean deletePattern(String id) {
        Pattern pattern=this.findById(id,Pattern.class);
        if(pattern !=null){
            this.jdbi.useHandle(handle -> {
                handle.createUpdate("DELETE FROM " +this.tableName +
                        " WHERE id = ? ")
                        .bind(0,id).execute();
            });
        }
        return pattern !=null;
    }
}
