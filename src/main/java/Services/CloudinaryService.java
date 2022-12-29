package Services;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import java.io.File;
import java.io.IOException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.Random;

public class CloudinaryService {
    private String cloudURL = "cloudinary://744643581115479:GYEy7XKZxxs9Z8ahv52Zl3m3CkM@thepersistentcreatio";
    private Cloudinary cloud;

    public CloudinaryService() {
        this.cloud = new Cloudinary(cloudURL);
        this.cloud.config.secure = true;
    }

    public String upload(File file, String folder) throws IOException {

        Map result = this.cloud.uploader().upload(file, ObjectUtils.asMap(
                "folder", "/projectFurniture/" + folder,
                "use_filename", true,
                "filename_override", file.getName()
        ));
        return result.get("url").toString();
    }
}
