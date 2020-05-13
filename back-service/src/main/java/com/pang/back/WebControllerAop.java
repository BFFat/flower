package com.pang.back;

import com.alibaba.dubbo.config.annotation.Reference;
import com.pang.back.Model.Operation;
import com.pang.back.service.OperationService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

@Aspect
@Component
public class WebControllerAop {
    @Reference
    private OperationService operationService;

    private Logger logger = LoggerFactory.getLogger(WebControllerAop.class);

    /**
     * 定义切入点，切入点为com.example.fileupload.controller下的所有函数
     */
    @Pointcut("execution(public * com.pang.back.Controller.*.*(..)) && !execution(public * com.pang.back.Controller.PublicController.login())")

    /*
     * 定义连接点
     */
    public void webLog() {
    }

    /**
     * 前置通知：在连接点之前执行的通知
     *
     * @param joinPoint
     * @throws Throwable
     */
    @Before("webLog()")
    public void doBefore(JoinPoint joinPoint) throws Throwable {
        // 接收到请求，记录请求内容
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        //检测当前登录用户
        SecurityContext context = SecurityContextHolder.getContext();
        String username = ((User) (context.getAuthentication().getPrincipal())).getUsername();
        System.out.println(username);

        // 记录下请求内容
        logger.info("记录Controller日志");
        logger.info("staffID：" + username);
        logger.info("URL : " + request.getRequestURL().toString());
        logger.info("HTTP_METHOD : " + request.getMethod());
        logger.info("IP : " + request.getRemoteAddr());
        logger.info("CLASS_METHOD : " + joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
        logger.info("ARGS : " + Arrays.toString(joinPoint.getArgs()));
        System.out.println("员工号" + username);
        System.out.println("请求URL：" + request.getRequestURL().toString());
        System.out.println("请求方法：" + request.getMethod());
        System.out.println("IP：" + request.getRemoteAddr());
        System.out.println("方法名：" + joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
        System.out.println("类型：" + joinPoint.getSignature().getName());
        System.out.println("参数值：" + Arrays.toString(joinPoint.getArgs()));
        Operation operation = new Operation();
        operation.setOperatorID(Integer.parseInt(username));
        operation.setOperationUrl(joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
        operation.setOperationMethod(request.getMethod());
        operation.setOperationType(joinPoint.getSignature().getName());
        operation.setOperationIP(request.getRemoteAddr());
        operationService.addOperation(operation);
    }

    // 后置最终通知（目标方法只要执行完了就会执行后置通知方法）
    @After("webLog()")
    public void doAfterAdvice(JoinPoint joinPoint){
        logger.info("后置通知执行了!!!!");
    }

    // 后置返回通知
    @AfterReturning(returning = "ret", pointcut = "webLog()")
    public void doAfterReturning(JoinPoint joinPoint, Object ret) throws Throwable {
        // 处理完请求，返回内容
        System.out.println("方法返回值：" + ret);
        logger.info("RESPONSE : " + ret);
    }

    // 后置异常通知
    @AfterThrowing(pointcut = "webLog()",throwing = "exception")
    public void doAfterThrowingAdvice(JoinPoint joinPoint,Throwable exception){
        //目标方法名：
        logger.info(joinPoint.getSignature().getName());
        if(exception instanceof NullPointerException){
            logger.info("发生了空指针异常!!!!!");
        }
    }

    // 环绕通知
    @Around("webLog()")
    public Object doAroundAdvice(ProceedingJoinPoint proceedingJoinPoint){
        logger.info("环绕通知的目标方法名："+proceedingJoinPoint.getSignature().getName());
        try {
            Object obj = proceedingJoinPoint.proceed();
            return obj;
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        return null;
    }
}