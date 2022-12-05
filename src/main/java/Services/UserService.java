package Services;

import DTO.BaseDTO;
import Model.User;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

public class UserService extends BaseService<User>{
    public UserService(String tableName) {
        super(tableName);
    }

    @Override
    public String create(User model) {
        return this.jdbi.withHandle(handle -> {
            String id = handle.createQuery("SELECT UUID()").mapTo(String.class).first();
            model.setId(id);
            handle.createUpdate(
                    "INSERT INTO " + this.tableName + " (id, email, password, status, type, createdAt) " +
                            "VALUES (:id, :email, :password, :status, :type, :createdAt)"
            ).bindBean(model).execute();

            return id;
        });
    }

    @Override
    public boolean update(String id, BaseDTO model){
        User user = this.findById(id, User.class);

        if(user != null) {
            this.jdbi.useHandle(handle -> {

                handle.createUpdate("UPDATE " + this.tableName +
                        " SET firstName = :firstName, " +
                        "lastName = :lastName, " +
                        "phone = :phone, " +
                        "country = :country, " +
                        "city = :city, " +
                        "district = :district, " +
                        "address = :address, " +
                        "status = :status" + " WHERE id = :id "
                ).bind("id", id).bindBean(model).execute();
            });
        }

        return user != null;
    }

    public User findByEmail(String email) {
        try {
            return this.jdbi.withHandle(new HandleCallback<User, Exception>() {
                public User withHandle(Handle handle) throws Exception{
                    try {
                        return handle.createQuery(
                                        "SELECT * FROM " + tableName + " WHERE email = ?")
                                .bind(0, email)
                                .mapToBean(User.class).first();
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
