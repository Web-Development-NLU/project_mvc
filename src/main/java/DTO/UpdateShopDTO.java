package DTO;

import java.time.LocalDate;

public class UpdateShopDTO implements BaseDTO{
    private String name;
    private String image;
    private String redirect;
    private LocalDate updatedAt;

    public UpdateShopDTO(String name, String image, String redirect) {
        this.name = name;
        this.image = image;
        this.redirect = redirect;
        this.updatedAt = LocalDate.now();
    }

    public String getName() {
        return name;
    }

    public String getImage() {
        return image;
    }

    public String getRedirect() {
        return redirect;
    }

    public LocalDate getUpdatedAt() {
        return updatedAt;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setRedirect(String redirect) {
        this.redirect = redirect;
    }

    public void setUpdatedAt(LocalDate updatedAt) {
        this.updatedAt = updatedAt;
    }
}