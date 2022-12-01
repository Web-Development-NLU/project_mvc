package Services;

import DTO.BaseDTO;
import DTO.UpdateUserDTO;
import Model.User;

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
        Optional<User> user = this.findById(id, User.class);

        if(user.isPresent()) {
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

        return user.isPresent();
    }

}
