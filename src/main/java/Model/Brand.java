package Model;

public class Brand extends BaseModel{
        private String name;
        public Brand(){

        }

        public Brand(String name){
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

}
