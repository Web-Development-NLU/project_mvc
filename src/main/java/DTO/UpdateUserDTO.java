package DTO;

import Model.User;

import java.time.LocalDate;

public class UpdateUserDTO implements BaseDTO{
    private String firstName;
    private String lastName;
    private String phone;
    private String country;
    private String city;
    private String district;
    private String address;
    private LocalDate updatedAt;
    private int status;
    public UpdateUserDTO(String firstName, String lastName, String phone, String country, String city, String district, String address) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.country = country;
        this.city = city;
        this.district = district;
        this.address = address;
        this.status = 0;
        this.updatedAt = LocalDate.now();
    }

    public  UpdateUserDTO(User model) {
        this.firstName = model.getFirstName();
        this.lastName = model.getLastName();
        this.phone = model.getPhone();
        this.country = model.getCountry();
        this.city = model.getCity();
        this.district = model.getDistrict();
        this.address = model.getAddress();
        this.status = model.getStatus();
        this.updatedAt = LocalDate.now();
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPhone() {
        return phone;
    }

    public String getCountry() {
        return country;
    }

    public String getCity() {
        return city;
    }

    public String getDistrict() {
        return district;
    }

    public String getAddress() {
        return address;
    }

    public LocalDate getUpdatedAt() {
        return updatedAt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
