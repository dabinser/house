package com.example.demo.security.manage;

/**
 * ========================
 * Created with IntelliJ IDEA.
 * User：恒宇少年
 * Date：2017/12/26
 * Time：下午10:48
 * 码云：http://git.oschina.net/jnyqy
 * ========================
 */
public class NewUserNotFoundException
        extends RuntimeException

{

    public NewUserNotFoundException(String msg, Throwable t) {
        super(msg, t);
    }

    public NewUserNotFoundException(String msg) {
        super(msg);
    }
}
