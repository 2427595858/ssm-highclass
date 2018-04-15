package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    // 登录
    @RequestMapping("/login")
    public String login(HttpSession httpSession,String username,String password){
        // 通过前台登录，将username保存到session中
        httpSession.setAttribute("username",username);

        // 重定向到商品查询页面
        return "redirect:items/queryItems.action";
    }

    // 退出
    @RequestMapping("/logout")
    public String logout(HttpSession httpSession){
        // 让session过期，清除里面保存的username信息
        httpSession.invalidate();

        // 重定向回商品查询页面
        return "redirect:login.action";
    }
}
