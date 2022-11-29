package Model;

import java.time.LocalDate;

public class Admin extends BaseModelUUID{
    private String id;
    private String idUser;
    private String type;

    public Admin(String id, String idUser, String type) {
        this.id = id;
        this.idUser = idUser;
        this.type = type;
        this.createdAt = LocalDate.now();
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public void setType(String type) {
        this.type = type;
    }
}
