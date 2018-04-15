package controller.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HandlerInterceptorTest1 implements HandlerInterceptor{
    // 重写HandlerInterceptor里的三个方法

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        // preHanle方法是在进入handler之前进行拦截
        // 通常用于用户登录认证拦截，用户权限拦截

        System.out.println("HandlerInterceptorTest1....preHandle");

        //返回false表示进行拦截，true则表示不拦截，继续执行handler
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        // postHandle方法是在进入handler之后，返回ModelAndView之前进行拦截
        // 可以在这里边放置一些公共的数据或视图资源

        System.out.println("HandlerInterceptorTest1....postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        // afterCompletion方法在执行完handler之后执行
        // 做系统统一异常处理，进行方法执行性能监控，在prehandler中设置一个时间点，在afterCompletion设置一个时间点，两个时间点的差就是执行时长
        // 实现系统统一日志记录

        System.out.println("HandlerInterceptorTest1....afterCompletion");
    }
}
