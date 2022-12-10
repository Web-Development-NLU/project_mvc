package Services;

import DTO.BaseDTO;
import DTO.CartDTO;
import Model.User;
import at.favre.lib.crypto.bcrypt.BCrypt;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

import java.time.LocalDate;
import java.util.List;

public class UserService extends BaseService<User>{
    public UserService(String tableName) {
        super(tableName);
    }

    public void resetPassword(String id, String password) {
        String hashPassword = BCrypt.withDefaults().hashToString(8, password.toCharArray());

        this.jdbi.useHandle(handle -> handle.createUpdate(
                "UPDATE " + this.tableName +
                        " SET password = :password," +
                        " updatedAt = :updatedAt" +
                        " WHERE id = :id "
                ).bind("id", id)
                .bind("updatedAt", LocalDate.now())
                .bind("password", hashPassword).execute());
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

    public List<CartDTO> getCart(String idUser) {
        return this.jdbi.withHandle(handle -> handle.createQuery(
                "SELECT c.amount, c.idProduct as id, p.name, p.price, p.categoryId " +
                        "FROM cart as c " +
                        "RIGHT JOIN product as p ON p.id = c.idProduct " +
                        "WHERE c.idUser = :idUser"
        ).bind("idUser", idUser).mapToBean(CartDTO.class).list());
    }

    public void setCart(String idUser, String idProduct, int amount) {
        int oldAmount = 0;
        try{
            oldAmount = this.jdbi.withHandle(handle -> handle.createQuery(
                            "SELECT amount FROM cart WHERE idUser = :idUser AND idProduct = :idProduct"
                    ).bind("idUser", idUser).bind("idProduct", idProduct)
                    .mapTo(Integer.class).first());
        }catch (IllegalArgumentException exception) {
            oldAmount = 0;
        }

        if(oldAmount != 0) {
            this.updateCart(idUser, idProduct, amount + oldAmount);
        }else {
            this.createCart(idUser, idProduct);
        }
    }
    private void createCart(String idUser, String idProduct) {
        this.jdbi.useHandle(handle -> {
            handle.createUpdate(
                    "INSERT INTO cart (idUser, idProduct, createdAt, amount) " +
                            "VALUES (:idUser, :idProduct, :createdAt, :amount)")
                    .bind("idUser", idUser)
                    .bind("idProduct", idProduct)
                    .bind("createdAt", LocalDate.now())
                    .bind("amount", 1)
                    .execute();
        });
    }
    public void updateCart(String idUser, String idProduct, int amount) {
        this.jdbi.useHandle(handle -> {
            handle.createUpdate(
                    "UPDATE cart " +
                            "SET amount = :amount, " +
                            "updatedAt = :updatedAt " +
                            "WHERE idUser = :idUser AND " +
                            "idProduct = :idProduct" )
                    .bind("idUser", idUser)
                    .bind("idProduct", idProduct)
                    .bind("updatedAt", LocalDate.now())
                    .bind("amount", amount)
                    .execute();
        });
    }

    public void deleteCart(String idUser, String idProduct) {
        this.jdbi.useHandle(handle -> {
            handle.createUpdate("DELETE FROM cart WHERE idUser = :idUser AND idProduct = :idProduct")
                    .bind("idUser", idUser)
                    .bind("idProduct", idProduct)
                    .execute();
        });
    }
}
