package DTO;
import Model.Pattern;
import java.time.LocalDate;

public class UpdatePatternDTO implements BaseDTO {
    private String name;
    protected LocalDate updatedAt;

    public UpdatePatternDTO(String name) {
        this.name = name;

    }
    public UpdatePatternDTO(Pattern model) {
        this.name = model.getName();
        this.updatedAt = LocalDate.now();
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDate updatedAt) {
        this.updatedAt = updatedAt;
    }


}
