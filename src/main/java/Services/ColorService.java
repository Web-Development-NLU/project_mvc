package Services;

import DTO.BaseDTO;
import Model.Color;

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
    public boolean delete(String id){
        Color color=this.findById(id,Color.class);
        if(color != null ){
            this.jdbi.useHandle(handle -> {
                handle.createUpdate("DELETE FROM " +this.tableName +
                        " WHERE id=: id")
                        .bind("id",id).execute();
            });
        }
        return color !=null;
    }
    public void deleteColor(String id) {
        this.jdbi.useHandle(handle -> handle.createUpdate("DELETE FROM "+  this.tableName +
                " WHERE id=: id ")
                .bind("id", id).execute());
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

}
