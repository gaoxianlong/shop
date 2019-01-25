package com.stk.entity;
import java.util.Date;
//商品详情
public class CodeItem {
    private int id;
    private String name;
    private String code;
    private String picture;
    private double price;
    private int count;
    private double discount;
    private String description;
    private Date date;
    //消失时间
    private Date overdate;
    //商品状态（1，存在；0，消失）
    private int condition;

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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getOverdate() {
        return overdate;
    }

    public void setOverdate(Date overdate) {
        this.overdate = overdate;
    }

    public int getCondition() {
        return condition;
    }

    public void setCondition(int condition) {
        this.condition = condition;
    }

    @Override
    public String toString() {
        return "CodeItem{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", picture='" + picture + '\'' +
                ", price=" + price +
                ", count=" + count +
                ", discount=" + discount +
                ", description='" + description + '\'' +
                ", date=" + date +
                ", overdate=" + overdate +
                ", condition=" + condition +
                '}';
    }
}
