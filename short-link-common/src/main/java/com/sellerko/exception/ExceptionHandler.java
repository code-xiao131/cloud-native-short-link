package com.sellerko.exception;

import com.sellerko.util.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Slf4j
public class BizExceptionHandler {
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Response handler(Exception e) {

        if (e instanceof BizException) {
            BizException bizException = (BizException) e;
            log.error("[业务异常]", e);
            return Response.build(bizException.getCode(), bizException.getMsg());
        } else {
            log.error("[系统异常]", e);
            return Response.buildFail("系统异常");
        }

    }
}
