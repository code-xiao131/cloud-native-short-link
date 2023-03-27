package com.sellerko.util;

import com.sellerko.enums.BizEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Response {
    private static final String SUCCESS = "success";
    private Integer code;
    private Object model;
    private String msg;

    public static Response buildSuccess() {
        return new Response(200, null, SUCCESS);
    }

    public static Response build(int code, String msg) {
        return new Response(code, null, msg);
    }

    public Response buildSuccess(Object data) {
        return new Response(500, data, SUCCESS);
    }

    public static Response buildSuccess(BizEnum bizEnum) {
        return new Response(bizEnum.getCode(), null, bizEnum.getMessage());
    }

    public static Response buildFail(BizEnum bizEnum) {
        return new Response(bizEnum.getCode(), null, bizEnum.getMessage());
    }

    public static Response buildFail(String msg) {
        return new Response(500, null, msg);
    }


}
