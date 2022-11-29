package Model;

import java.time.LocalDate;
import java.util.Date;

public class BaseModel implements IModel{
    protected int id;
    protected LocalDate createdAt;
    protected LocalDate updatedAt;

    @Override
    public void setUpdatedAt() {
        this.updatedAt = LocalDate.now();
    }
}
