package Model;

import org.apache.commons.lang3.RandomStringUtils;

import java.time.LocalDateTime;

public class Logger {
    private String id;
    private String method;
    private String request;
    private String userId;
    private String agent;
    private String data;
    private int status;
    private String message;
    private LocalDateTime createdAt;

    public Logger(String method, String request, String userId, String agent) {
        this.id = RandomStringUtils.randomAlphanumeric(10);
        this.method = method;
        this.request = request;
        this.userId = userId;
        this.agent = agent;
        this.createdAt = LocalDateTime.now();
    }

    public String getData() {
        return data;
    }

    public int getStatus() {
        return status;
    }

    public String getMessage() {
        return message;
    }

    public String getId() {
        return id;
    }

    public String getMethod() {
        return method;
    }

    public String getRequest() {
        return request;
    }

    public String getUserId() {
        return userId;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public void setRequest(String request) {
        this.request = request;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getAgent() {
        return agent;
    }

    public void setAgent(String agent) {
        this.agent = agent;
    }

    public void setData(String data) {
        this.data = data;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
