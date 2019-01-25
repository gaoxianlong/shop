package com.stk.entity;

import java.util.Date;
//入库
public class Rf {
    private int oid;
    private String ocode;
    private int num;
    private Double oprice;
    private Date saledate;

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

    @Override
    public String toString() {
        return "Rf{" +
                "oid=" + oid +
                ", ocode='" + ocode + '\'' +
                ", num=" + num +
                ", oprice=" + oprice +
                ", saledate=" + saledate +
                '}';
    }
}
