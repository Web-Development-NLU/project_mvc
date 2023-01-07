package Services;

import DTO.BaseDTO;
import Model.About;
import Model.Color;

public class AboutService extends BaseService<About>{
    public AboutService(String tableName){
        super(tableName);
    }
    @Override
    protected String create(About model){
        return null;
    }
    @Override
    public boolean update(String id, BaseDTO model) throws Exception{
        About about=this.findById(id,About.class);
        if(about !=null){
            this.jdbi.useHandle(handle -> {
                handle.createUpdate("UPDATE " +this.tableName +
                        " SET intro=:intro," +
                        "mission =: mission," +
                        "ourValue =:ourValue"+
                        " WHERE id:=id")
                        .bind("id",id).bindBean(model).execute();
            });
        }
        return about !=null;
    }
}
