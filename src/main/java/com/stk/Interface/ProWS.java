package com.stk.Interface;

import com.stk.entity.CodeItem;

import javax.jws.WebMethod;
import javax.jws.WebService;
import java.util.ArrayList;

@WebService
public interface ProWS {
    @WebMethod
    public ArrayList<CodeItem> getPro();
}
