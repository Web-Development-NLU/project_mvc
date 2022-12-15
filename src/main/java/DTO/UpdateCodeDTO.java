package DTO;

import Model.Code;

import java.time.LocalDate;

public class UpdateCodeDTO implements BaseDTO{
    private String value;
    private int categoryId;
    private String productId;
    private LocalDate updatedAt;

    public UpdateCodeDTO(String value, int categoryId, String productId) {
        this.value = value;
        this.categoryId = categoryId;
        this.productId = productId;
        this.updatedAt = LocalDate.now();
    }

    public UpdateCodeDTO(Code model){
        this.value = model.getValue();
        this.categoryId = model.getCategoryId();
        this.productId = model.getProductId();
        this.updatedAt = LocalDate.now();
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public LocalDate getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDate updatedAt) {
        this.updatedAt = updatedAt;
    }
}
