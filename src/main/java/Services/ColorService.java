package Services;

import DTO.BaseDTO;
import Model.Color;
import Model.Pattern;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

import java.util.ArrayList;

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
    public boolean deleteColor(String id){
         Color color=this.findById(id,Color.class);
        if(color != null ){
            this.jdbi.useHandle(handle -> {
                handle.createUpdate("DELETE FROM " +this.tableName +
                        " WHERE id = ? ")
                        .bind(0,id).execute();
            });
        }
        return color !=null;
    }

    public ArrayList<Color> findColorByName(String name){
        String nameSearch = "%"+name+"%";
        return (ArrayList<Color>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * from " +this.tableName
            +" WHERE name like ?")
                    .bind(0,nameSearch)
                    .mapToBean(Color.class)
                    .list();
        });
    }
    public Color getColor(String name){
        try {
            return this.jdbi.withHandle(new HandleCallback<Color, Exception>() {
                public Color withHandle(Handle handle) throws Exception{
                    try {
                        return handle.createQuery(
                                        "SELECT * FROM " + tableName + " WHERE name = ?")
                                .bind(0, name)
                                .mapToBean(Color.class).first();
                    }catch (IllegalStateException exception) {
                        return null;
                    }

                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
