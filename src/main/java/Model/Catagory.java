package Model;

public class Catagory extends BaseModel {
    private String name;
   public Catagory(String name){
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


    public String toString() {
        return "Catagory{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}

