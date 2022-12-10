package Model;

public class Color extends BaseModel{
    private String name;
    private String value;

    public Color(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public Color() {}

    public String getName() {
        return name;
    }

    public String getValue() {
        return value;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "Color{" +
                "name='" + name + '\'' +
                ", value='" + value + '\'' +
                '}';
    }
}
