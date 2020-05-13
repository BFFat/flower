package com.pang.back.Model;

import java.io.Serializable;

public class Result<T> implements Serializable {
    /**
     * 返回信息
     */
    private String msg = null;

    /**
     * 数据是否正常请求
     */
    private boolean success = false;

    /**
     * 具体返回的数据
     */
    private T detail = null;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public boolean getSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public T getDetail() {
        return detail;
    }

    public void setDetail(T detail) {
        this.detail = detail;
    }
}
