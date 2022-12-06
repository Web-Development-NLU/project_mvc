package Services;

import DTO.BaseDTO;
import Model.Catagory;
import org.jdbi.v3.core.Jdbi;

public class CatagoryServices extends BaseService<Catagory> {
    public CatagoryServices(String tableName){
        super(tableName);
    }
    @Override
    public String create(Catagory model) {
        return this.jdbi.withHandle(handle -> {
                       handle.createUpdate(
                    "INSERT INTO " + this.tableName + " (name) " +
                            "VALUES (:name)"
            ).bindBean(model).execute();

            return model.getName();
        });
    }
    public boolean update(String id, BaseDTO model){
        Catagory catagory = this.findById(id, Catagory.class);

        if(catagory != null) {
            this.jdbi.useHandle(handle -> {
                handle.createUpdate("UPDATE " + this.tableName +
                                " SET idCa = :idCa, " +
                                "name = :name, " +
                                " WHERE id = :id "
                ).bind("id", id).bindBean(model).execute();
            });
        }

        return user != null;
    }

}
