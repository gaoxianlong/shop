package com.stk.entity;

import java.util.Date;

//销售记录
public class Order {
    private int oid;
    private String ocode;
    private int num;
    private Double oprice;
    private Date saledate;
    private CodeItem codeItem;

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getOcode() {
        return ocode;
    }

    public void setOcode(String ocode) {
        this.ocode = ocode;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public Double getOprice() {
        return oprice;
    }

    public void setOprice(Double oprice) {
        this.oprice = oprice;
    }

    public Date getSaledate() {
        return saledate;
    }

    public void setSaledate(Date saledate) {
        this.saledate = saledate;
    }

    public CodeItem getCodeItem() {
        return codeItem;
    }
    public void setCodeItem(CodeItem codeItem) {
        this.codeItem = codeItem;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oid=" + oid +
                ", ocode='" + ocode + '\'' +
                ", num=" + num +
                ", oprice=" + oprice +
                ", saledate=" + saledate +
                ", codeItem=" + codeItem +
                '}';
    }
}
