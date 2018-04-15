package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import po.ItemCustom;

/**
 * json交互的控制器
 */

@Controller
public class JsonTestController {

    /**
     *
     * @param itemCustom（@RequestBody 请求json）(商品信息）
     * @return itemCustom （@ResponseBody 返回json）（商品信息）
     */
    @RequestMapping(value="/requestJson",method = {RequestMethod.POST})
    public @ResponseBody ItemCustom requestJson(@RequestBody ItemCustom itemCustom) throws Exception{
        // 由于请求的是json串，需要使用@RequestBody将json串转换为java对象
        // 由于需要向客户端返回json数据，需要用@ResponseBody将java对象转换为json串
        return itemCustom;
    }


    @RequestMapping("/responseJson")
    public @ResponseBody ItemCustom responseJson(ItemCustom itemCustom) throws Exception{
        // 请求的是key/value，不需要@RequestBody
        // 使用@ResponseBody返回json数据
        return itemCustom;
    }
}
