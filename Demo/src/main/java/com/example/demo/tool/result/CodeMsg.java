package com.example.demo.tool.result;

public class CodeMsg {


        private int code;
        private String msg;

        public static CodeMsg SERVER_ERROR = new CodeMsg(500100, "服务端异常");
        public static CodeMsg NOT_LOGIN = new CodeMsg(400, "用户异常");
        public static CodeMsg DATA_ERROR=new CodeMsg(401,"数据异常");

        private CodeMsg(int code, String msg) {
            this.code = code;
            this.msg = msg;
        }

        public int getCode() {
            return code;
        }

        public String getMsg() {
            return msg;
        }

}

