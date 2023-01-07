package Model;

public class About extends BaseModel{
    private String intro;
    private String mission;
    private String ourValue;

    public About(String intro, String mission, String ourValue) {
        this.intro = intro;
        this.mission = mission;
        this.ourValue = ourValue;
    }
    public About(){}

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getMission() {
        return mission;
    }

    public void setMission(String mission) {
        this.mission = mission;
    }

    public String getOurValue() {
        return ourValue;
    }

    public void setOurValue(String ourValue) {
        this.ourValue = ourValue;
    }

    @Override
    public String toString() {
        return "About{" +
                "intro='" + intro + '\'' +
                ", mission='" + mission + '\'' +
                ", ourValue='" + ourValue + '\'' +
                '}';
    }
}
