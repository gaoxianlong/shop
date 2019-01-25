package com.stk.dao;


import com.stk.entity.*;

import java.util.ArrayList;
import java.util.List;

public interface CodeItemDao {
    //登陆
    public String login(String userName);
    //添加商品
    public void saveedit(CodeItem codeItem);
    //根据 id 删除商品
    public boolean delprobysingle(Integer id);
    //根据 id 修改商品信息
    public boolean upprobysingle(CodeItem codeItem);
    //根据 id 查询单个商品信息
    public CodeItem selprobysingle(Integer id);
    //查询所有商品信息
	public ArrayList<CodeItem> selprobytotal();
   // 根据条形码查询单条物品信息
    public CodeItem selprobycode(String code);
    // 根据条形码查询单条物品的库存
    public ProNum selpronumbycode(String code);
    //入库并减少对应库存
    public boolean rfdel(List<Rf> list);
    //添加销售记录
    public boolean addsalerd(List<Rf> list);
    //添加重复商品
    public void addprorepeat(String code);
    //查询所有销售记录
    public ArrayList<Order> seltotalorder();
    //按照日期筛选查询销售订单
    public ArrayList<Order> selorderbydate(SelDates date);
}
