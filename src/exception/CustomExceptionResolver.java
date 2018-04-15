package exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomExceptionResolver implements HandlerExceptionResolver{

    // 全局异常处理类
    // Exception e就是系统抛出的异常
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {

        CustomException customException=null;
        String message=null;
        ///如果是系统自定义异常，则直接取出异常
        if(e instanceof CustomException){
            customException=(CustomException)e;
        }
        else{   //否则抛出“未知错误”
            customException=new CustomException("未知错误55555");
        }
        message=customException.getMessage();

        //将错误信息传到显示错误信息的页面
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("message",message);
        modelAndView.setViewName("errorPage");

        return modelAndView;
    }
}
