package Model;

import java.sql.Timestamp;

public class User extends BaseModelUUID {
    private String firstName;
    private String lastName;
    private String phone;
    private String email;
    private String password;
    private String country;
    private String city;
    private String district;
    private String address;
    private int status;
    private int type;
    private int isGoogle = 0;
    private int isWrong = 0;
    private Timestamp timeCurrent;
    private String ward;
    public User() {
    }

    public User(String email, String password, int status, int type) {
        super();
        this.email = email;
        this.password = password;
        this.status = status;
        this.type = type; // 0, 1, 2
    }

    public User(String email, int status, int type, int isGoogle) {
        super();
        this.email = email;
        this.status = status;
        this.type = type; // 0, 1, 2
        this.isGoogle = isGoogle;
    }

    public User(String email, int status, int isWrong) {
        this.email = email;
        this.status = status;
        this.isWrong = isWrong;
    }
    public User(String email, Timestamp timeCurrent) {
        this.email = email;
        this.timeCurrent = timeCurrent;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public User(Timestamp timeCurrent) {
        this.timeCurrent = timeCurrent;
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

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
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

    public int getStatus() {
        return status;
    }

    public int getType() {
        return type;
    }

    public int getIsGoogle() {
        return isGoogle;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setIsGoogle(int isGoogle) {
        this.isGoogle = isGoogle;
    }

    public int getIsWrong() {
        return isWrong;
    }

    public Timestamp getTimeCurrent() {
        return timeCurrent;
    }

    public void setTimeCurrent(Timestamp timeCurrent) {
        this.timeCurrent = timeCurrent;
    }

    public void setIsWrong(int isWrong) {
        this.isWrong = isWrong;
    }

    @Override
    public String toString() {
        return "User{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", country='" + country + '\'' +
                ", city='" + city + '\'' +
                ", district='" + district + '\'' +
                ", address='" + address + '\'' +
                ", status=" + status +
                ", type=" + type +
                ", isGoogle=" + isGoogle +
                ", isWrong=" + isWrong +
                ", timeCurrent=" + timeCurrent +
                ", ward='" + ward + '\'' +
                '}';
    }
}
