package com.stk.junit;

import com.stk.entity.Order;
import com.stk.entity.User;
import com.stk.service.CodeItemServiceimpl;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.ArrayList;

public class TSruku extends TestJunit {
    @Resource
    private CodeItemServiceimpl odeItemService;

    @Test
   // @Transactional
    //@Rollback(false)
    public void TS(){

       ArrayList<Order> or= odeItemService.seltotalorder();
       for(Order o:or){
          System.out.println(o.toString());
       }
    }
    @Test

    public void Login(){
        User u=new User();
//        String as= MD5.md5("123","gao");
//        u.setUserName("jack");
//        u.setPasswd(as);
        u.setUserName("marry");
        u.setPasswd("234");

        String password=odeItemService.login(u.getUserName());


    }
}
