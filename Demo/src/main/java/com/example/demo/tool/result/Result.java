package com.example.demo.tool.result;

public class Result<T> {


        private int code;
        private String msg;
        private T data;

    public Result() {

    }

    public static <T> Result<T> success(T data){
            return new Result<T>(data);
        }

        public static <T> Result<T> error(CodeMsg codeMsg){
            return new  Result<T>(codeMsg);
        }
    public static Result error(String message){
        return new Result(message);
    }

        private Result(T data) {
            this.code = 0;
            this.msg = "success";
            this.data = data;
        }

        private Result(CodeMsg codeMsg) {
            if(codeMsg == null) {
                return;
            }
            this.code = codeMsg.getCode();
            this.msg = codeMsg.getMsg();
        }

    public static void success() {
    }

    public int getCode() {
            return code;
        }
        public String getMsg() {
            return msg;
        }
        public T getData() {
            return data;
        }


}
