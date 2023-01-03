package Model;

public class Pattern extends BaseModel{
    private String name;
    public Pattern(){

    }

    public Pattern(String name){
        super();
        this.name =name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object obj) {
        return this.id == ((Pattern) obj).getId();
    }
}
