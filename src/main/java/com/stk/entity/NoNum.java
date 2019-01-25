package com.stk.entity;

import java.util.ArrayList;
//库存不足
public class NoNum {
    private int id;
    private String flag;
    private ArrayList<String> lscode;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public ArrayList<String> getLscode() {
        return lscode;
    }

    public void setLscode(ArrayList<String> lscode) {
        this.lscode = lscode;
    }
}
