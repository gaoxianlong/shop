package com.stk.elasticsearch;

import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;

import org.elasticsearch.common.transport.TransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;

import java.net.InetAddress;
import java.net.UnknownHostException;


public class ElasticCon {
    private  static String host="10.65.37.137";
    private  static int port=9300;
    public static void main(String[] args) throws UnknownHostException {
    //    TransportClient client = new PreBuiltTransportClient(Settings.EMPTY)
   //             .addTransportAddress(new InetSockeTransportAddress(new InetAddress.getByName(ElasticCon.host),ElasticCon.port));
        TransportClient client =null;
        client = new PreBuiltTransportClient(Settings.EMPTY).
                addTransportAddress(new TransportAddress(InetAddress.getByName(ElasticCon.host),ElasticCon.port));
        System.out.println(client);
        client.close();





    }
}
