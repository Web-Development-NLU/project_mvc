package DTO;

import ControllerTest.ColorTest;
import Model.Color;

import java.time.LocalDate;

public class UpdateColorDTO implements BaseDTO{
    private String name;
    private String value;

    private LocalDate updatedAt;

    public UpdateColorDTO(String name, String value) {
        this.name = name;
        this.value = value;
        this.updatedAt = LocalDate.now();
    }
    public UpdateColorDTO(Color model){
        this.name = model.getName();
        this.value = model.getValue();
        this.updatedAt = LocalDate.now();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public LocalDate getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDate updatedAt) {
        this.updatedAt = updatedAt;
    }
}
