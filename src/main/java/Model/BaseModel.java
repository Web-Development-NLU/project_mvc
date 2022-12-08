package Model;

import java.time.LocalDate;
import java.util.Date;

public class BaseModel implements IModel{
    protected int id;
    protected LocalDate createdAt;
    protected LocalDate updatedAt;

    public BaseModel() {
        this.createdAt = LocalDate.now();
    }

    public int getId() {
        return id;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public LocalDate getUpdatedAt() {
        return updatedAt;
    }

    @Override
    public void setUpdatedAt() {
        this.updatedAt = LocalDate.now();
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(LocalDate updatedAt) {
        this.updatedAt = updatedAt;
    }
}
