package com.stk.impl;

import com.stk.Interface.ProWS;
import com.stk.entity.CodeItem;

import javax.jws.WebService;
import java.util.ArrayList;
@WebService
public class ProWsImp implements ProWS {
    @Override
    public ArrayList<CodeItem> getPro() {
        return null;
    }
}
