package com.stk.Interface;

import com.stk.entity.*;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import java.util.ArrayList;
import java.util.List;
@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface CodeItemInterface {
    public String login(String userName);
    public String saveedit(CodeItem codeItem);
    //删除单条物品信息
    public boolean delprobysingle(Integer id);
    //修改单条物品信息
    public boolean upprobysingle(CodeItem codeItem);
    //根据商品id查询单条物品信息
    public CodeItem selprobysingle(Integer id);
    //查询所有物品信息
    public ArrayList<CodeItem> selprobytotal();
    //根据条形码查询单条物品信息
    public CodeItem selprobycode(String code);
    //根据条形码查询单条物品的库存
    public ProNum selpronumbycode(String code);
    //入库减少库存并增加销售信息
    public void deladsale(List<Rf> list);
    //添加重复商品
    public String addprorepeat(String code);
    //查询所有销售记录
    public ArrayList<Order> seltotalorder();
    //按照日期筛选查询销售订单
    public ArrayList<Order> selorderbydate(SelDates date);
}
