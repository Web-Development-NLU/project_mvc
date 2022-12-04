package Model;

import java.time.LocalDate;
import java.util.Date;

public class BaseModelUUID implements IModel{
    protected String id;
    protected LocalDate createdAt;
    protected LocalDate updatedAt;

    public BaseModelUUID() {
        this.createdAt = LocalDate.now();
    }

    @Override
    public void setUpdatedAt() {
        this.updatedAt = LocalDate.now();
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(LocalDate updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getId() {
        return id;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public LocalDate getUpdatedAt() {
        return updatedAt;
    }
}
