package DTO;

import Model.Category;

import java.time.LocalDate;

public class UpdateCategoryDTO implements BaseDTO {
    private String name;
    protected LocalDate updatedAt;

    public UpdateCategoryDTO(String name) {
        this.name = name;

    }
    public UpdateCategoryDTO(Category model) {
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
