package Services;

import DTO.BaseDTO;
import Model.Color;
import Model.Contact;

public class ContactService extends BaseService<Contact>{
    public ContactService(String tableName) {
        super(tableName);
    }

    @Override
    protected String create(Contact model) {
        return null;
    }

    @Override
    public boolean update(String id, BaseDTO model) throws Exception {
        Contact color = this.findById(id, Contact.class);
        if(color != null) {
            this.jdbi.useHandle(handle -> {

                handle.createUpdate("UPDATE " + this.tableName +
                        " SET email = :email, " +
                        "phone = :phone, " +
                        "address = :address " +
                        " WHERE id = :id "
                ).bind("id", id).bindBean(model).execute();
            });
        }
        return color != null;
    }
}
