package com.sellerko.exception;

import com.sellerko.enums.BizEnum;
import lombok.Data;

@Data
public class BizException extends RuntimeException {
    private static final long serialVersionUID = 2473492080134971047L;
    private int code;

    private String msg;

    public BizException(Integer code, String message) {
        super(message);
        this.code = code;
        this.msg = message;
    }


    public BizException(BizEnum bizCodeEnum) {
        super(bizCodeEnum.getMessage());
        this.code = bizCodeEnum.getCode();
        this.msg = bizCodeEnum.getMessage();
    }
}
