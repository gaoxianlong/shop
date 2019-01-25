package cryptographyUtil;

import org.apache.shiro.crypto.hash.Md5Hash;

public class MD5 {
    public static String md5(String str,String salt){
       return new Md5Hash(str,salt).toString();
    }
    public static void main(String[] args) {

        String as= MD5.md5("123","gao");
        System.out.println(as);
    }
}
