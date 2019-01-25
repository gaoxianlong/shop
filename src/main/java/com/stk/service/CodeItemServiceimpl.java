package com.stk.service;

import com.stk.Interface.CodeItemInterface;
import com.stk.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.jws.WebService;
import java.util.ArrayList;
import java.util.List;

@WebService
@Service
public class CodeItemServiceimpl implements CodeItemInterface {
    @Autowired
    private com.stk.dao.CodeItemDao codeItemDao;

    //登陆
    public String login(String userName){

        return codeItemDao.login(userName);
    }
    //增加单条物品信息
    public String saveedit(CodeItem codeItem){
        try{
            codeItemDao.saveedit(codeItem);
            return "ok";
        }catch(Exception e){
            e.printStackTrace();
            return "false";
        }

    }
    //删除单条物品信息
    public boolean delprobysingle(Integer id){
        return codeItemDao.delprobysingle(id);
    }
    //修改单条物品信息
    public boolean upprobysingle(CodeItem codeItem){
        return codeItemDao.upprobysingle(codeItem);
    }
    //根据商品id查询单条物品信息
    public CodeItem selprobysingle(Integer id){
        return codeItemDao.selprobysingle(id);
    }
    //查询所有物品信息
    public ArrayList<CodeItem> selprobytotal(){
        return codeItemDao.selprobytotal();
    }
    //根据条形码查询单条物品信息
    public CodeItem selprobycode(String code){
        return codeItemDao.selprobycode(code);
    }
    //根据条形码查询单条物品的库存
    public ProNum selpronumbycode(String code){
        return codeItemDao.selpronumbycode(code);
    }
    //入库减少库存并增加销售信息
    @Transactional
    public void deladsale(List<Rf> list){
        try{
            codeItemDao.rfdel(list);
            codeItemDao.addsalerd(list);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException();
        }
    }
    //添加重复商品
    public String addprorepeat(String code){
        try{
            codeItemDao.addprorepeat(code);
            return "okrepeat";
        }catch (Exception e){
            return "false";
        }

    }

    //查询所有销售记录
    public ArrayList<Order> seltotalorder(){
        return codeItemDao.seltotalorder();
    }
    //按照日期筛选查询销售订单
    public ArrayList<Order> selorderbydate(SelDates date){
        return codeItemDao.selorderbydate(date);
    }
//    public boolean rfdel(List<Rf> list){
//        return codeItemDao.rfdel(list);
//    }
//
//    public boolean addsalerd(List<Rf> list){
//        return codeItemDao.addsalerd(list);
//    }
}
