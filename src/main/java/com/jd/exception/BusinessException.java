package com.jd.exception;
/**
 * @author Long
 */
public class BusinessException extends RuntimeException {
    public BusinessException() {
        super();
    }
    //异常处理
    public BusinessException(String message) {
        super(message);
    }
}
