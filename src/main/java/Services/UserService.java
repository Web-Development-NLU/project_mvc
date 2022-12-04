package Services;

import DTO.BaseDTO;
import DTO.UpdateUserDTO;
import Model.User;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

import java.util.Optional;

public class UserService extends BaseService<User>{
    public UserService(String tableName) {
        super(tableName);
    }

    @Override
    public void create(User model) {
        this.jdbi.useHandle(handle -> {
            handle.createUpdate(
                    "INSERT INTO " + this.tableName + " (id, email, password, isGuess, status, type, createdAt) " +
                            "VALUES (UUID(), :email, :password, :isGuess, :status, :type, :createdAt)"
            ).bindBean(model).execute();
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
                        "address = :address" + " WHERE id = :id"
                ).bind("id", id).bindBean(model).execute();
            });
        }

        return user != null;
    }

    public boolean checkEmailExists(String email) throws Exception {
        String data = this.jdbi.withHandle(new HandleCallback<String, Exception>() {
            public String withHandle(Handle handle) throws Exception{
                try {
                    return handle.createQuery(
                                    "SELECT email FROM " + tableName + " WHERE email = ?")
                            .bind(0, email)
                            .mapTo(String.class).first();
                }catch (IllegalStateException exception) {
                    return null;
                }

            }
        });

        return data != null;
    }

}
