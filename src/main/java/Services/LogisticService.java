package Services;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LogisticService {
    public String loginLogistic(String email, String password, String endpoint) throws IOException {
        Map<String, String> values = new HashMap<>();
        values.put("email", email);
        values.put("password", password);
        String data = formPostRequest(endpoint, "", false, values);

        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(data);
        String accessToken = jsonNode.get("access_token").asText();
        return accessToken;
    }

    public static void signupLogistic(String email, String password, String name, String passwordConfirm, String endpoint) throws IOException {
        // Determine the API endpoint]
        Map<String, String> values = new HashMap<>();
        values.put("email", email);
        values.put("password", password);
        values.put("password_confirm", passwordConfirm);
        values.put("name", name);
        String data = formPostRequest(endpoint, "", false, values);
    }

    public static void getAllProvinces(String endpoint, String token) throws IOException {
        String data = formGetRequest(endpoint, token, true);
    }

    public static void getDistrictByProvince(String provinceId, String endpoint, String token) throws IOException {
        // Determine the API endpoint
        String endpointUrl = endpoint + "?provinceID=" + provinceId;
        String data = formGetRequest(endpointUrl, token, true);

    }

    public static void getWardByDistrict(String districtId, String endpoint, String token) throws IOException {
        // Determine the API endpoint
        String endpointUrl = endpoint + "?districtID=" + districtId;
        String data = formGetRequest(endpointUrl, token, true);

    }

    public String getEstimateTimeDeliveryOrRegisterDelivery(String fromDistrictId, String fromWardId, String toDistrictId, String toWardId, int height, int length, int width, int weight, String endpoint, String token, int type) throws IOException {
        // Determine the API endpoint
        Map<String, String> values = new HashMap<>();
        values.put("from_district_id", fromDistrictId);
        values.put("from_ward_id", fromWardId);
        values.put("to_district_id", toDistrictId);
        values.put("to_ward_id", toWardId);
        values.put("height", String.valueOf(height));
        values.put("length", String.valueOf(length));
        values.put("width", String.valueOf(width));
        values.put("weight", String.valueOf(weight));
        String data = formPostRequest(endpoint, token, true, values);
        if (type == 1) {
            JsonObject jsonObject = new Gson().fromJson(data, JsonObject.class);
            String id = jsonObject.getAsJsonObject("Transport").get("id").getAsString();
            return id;
        }
        JsonObject jsonObject = new Gson().fromJson(data, JsonObject.class);
        JsonArray dataArray = jsonObject.getAsJsonArray("data");
        JsonObject dataObject = dataArray.get(0).getAsJsonObject();
        long timestamp = dataObject.get("timestamp").getAsLong();
        return String.valueOf(timestamp);
    }

    public static void getAllGoodsRegistered(String endpoint, String token) throws IOException {
        // Determine the API endpoint
        String data = formGetRequest(endpoint, token, true);
    }

    public static void getGoodsById(String goodsId, String endpoint, String token) throws IOException {
        Map<String, String> values = new HashMap<String, String>();
        values.put("id", goodsId);
        String data = formPostRequest(endpoint, token, true, values);
    }

    public static String formGetRequest(String endpoint, String token, boolean isNeedToken) throws IOException {
        // Determine the API endpoint
        String endpointUrl = "http://140.238.54.136/api" + endpoint;

        // Create an HttpClient object
        HttpClient httpClient = HttpClientBuilder.create().build();

        // Create a GET request object
        HttpGet getRequest = new HttpGet(endpointUrl);

        // Set any headers that are required
        if (isNeedToken) getRequest.setHeader("Authorization", "Bearer " + token);

        // Execute the request and get the response
        HttpResponse apiResponse = httpClient.execute(getRequest);

        // Get the response body as a string
        String responseString = EntityUtils.toString(apiResponse.getEntity());

        // Convert the response string to a Java object using Gson

        return responseString;

    }

    public static String formPostRequest(String endpoint, String token, boolean isNeedToken, Map<String, String> values) throws IOException {
        String endpointUrl = "http://140.238.54.136/api" + endpoint;

        // Create an HttpClient object
        HttpClient httpClient = HttpClientBuilder.create().build();

        // Create a GET request object
        HttpPost postRequest = new HttpPost(endpointUrl);

        // Set the request body
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        values.forEach((key, value) -> {
            params.add(new BasicNameValuePair(key, value));
        });
        postRequest.setEntity(new UrlEncodedFormEntity(params));

        // Set any headers that are required
        if (isNeedToken) postRequest.setHeader("Authorization", "Bearer " + token);

        // Execute the request and get the response
        HttpResponse apiResponse = httpClient.execute(postRequest);

        // Get the response body as a string
        String responseString = EntityUtils.toString(apiResponse.getEntity());

        // Convert the response string to a Java object using Gson

        return responseString;
    }


    public static void main(String[] args) throws IOException {
        String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTQwLjIzOC41NC4xMzYvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODI3NjI5MDQsImV4cCI6MTY4Mjc2MzUwNCwibmJmIjoxNjgyNzYyOTA0LCJqdGkiOiJUZDVlQ2tHb245R2tKTE9vIiwic3ViIjoiNTdiM2M0NjI5YTM1NDY1OGE0ZDM2ZDhjYjQ0N2FmMWQiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.6zmu7Oh2poQddEykMmaBo_ITd4qKNr-Q7O1j5iMNxu4";
//        new LogisticService().loginLogistic("thanh@1234", "123456", "/auth/login");
//        LogisticService.signupLogistic("thanh@1234", "123456","thanh","123456","/auth/login");
//        LogisticService.getDistrictByProvince("269", "/district", token);
//        LogisticService.getWardByDistrict("2264", "/ward",token);
//        new LogisticService().getEstimateTimeDeliveryOrRegisterDelivery("2264", "90816", "2270", "231013", 100, 100, 100, 100, "/leadTime", token, 0);
//        LogisticService.getAllGoodsRegistered("/allTransports", token);
//        new LogisticService().getGoodsById("7b45e06f665940bfbf5f175861200955", "/getInfoTransport", token);
    }

}
