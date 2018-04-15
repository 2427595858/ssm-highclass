package controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import po.ItemCustom;
import po.ItemsQueryVo;
import service.ItemsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
//为了便于管理，添加根路径为/items
@RequestMapping("/items")
public class ItemsController {
    //注入service(通过service来调用数据库的数据）
    @Autowired
    private ItemsService itemsService;

    @RequestMapping("/queryItems")
    public ModelAndView queryItems(ItemsQueryVo itemsQueryVo) throws Exception{
        //形参上传入了ItemsQueryVo对象，并将形参传入service的findItemsList方法中
        List<ItemCustom> itemsList=itemsService.findItemsList(itemsQueryVo);

        // 获取商品总记录数
        // Long totalRecord=itemsService.countItems(itemsQueryVo);

        ModelAndView modelAndView=new ModelAndView();   //创建视图对象
        // 将items信息列表和总记录数totalRecord传到前端
        modelAndView.addObject("itemsList",itemsList);
        // modelAndView.addObject("totalRecord",totalRecord);

        modelAndView.setViewName("itemsList");  //指定用户访问的jsp页面地址，前缀和后缀已在前端控制器中配好
        return modelAndView;
    }

    @RequestMapping(value="/editItems",method = {RequestMethod.POST,RequestMethod.GET})
    public String editItems(Model model, Integer id) throws Exception{
        // 调用service通过id查找相应的商品信息
        // 这里需要进行绑定参数的设置
        ItemCustom itemCustom=itemsService.findItemsById(id);

        model.addAttribute("itemCustom",itemCustom);
        return "editItems";

    }

    @RequestMapping("/editItemsSubmit")
    public String editItemsSubmit(HttpServletRequest request, Integer id, ItemCustom itemCustom, MultipartFile items_img) throws Exception{
        //通过service返回修改后的页面
        //形参中传递了pojo类型参数（即itemCustom）

        // 如果图片不为空
        if(items_img!=null && items_img.getOriginalFilename()!=null && items_img.getOriginalFilename().length()>0){
            //图片上传物理路径
            String img_path="D:\\JavaWeb\\img\\";
            //获取图片原始名称
            String originalFilename=items_img.getOriginalFilename();

            //生成新的图片名称
            //为了避免文件名冲突，使用java的UUID随机生成字符串再加上原来图片后缀名构成新的名字
            String newFileName= UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
            //新图片
            File newFile=new File(img_path+newFileName);

            //将内存中的数据写入磁盘
            items_img.transferTo(newFile);
            //将新图片名称写到数据库中
            itemCustom.setPic(newFileName);
        }
        // 更新数据库数据
        itemsService.updateItems(id,itemCustom);

        //重定向到商品查询列表
        return "forward:queryItems.action";
    }

    // 批量删除商品
    @RequestMapping("/deleteItems")
    public String deleteItems(Integer[] item_id) throws Exception{
        // 传入参数类型为商品的id数组
        // 根据id批量删除商品
        for(int i=0;i<item_id.length;i++){
            itemsService.deleteItemsById(item_id[i]);
        }
        // 完成删除操作后重定向回显示页面
        return "forward:queryItems.action";
    }

    //跳转到添加商品的jsp页面
    @RequestMapping("/addItems")
    public String add() throws Exception{
        return "addItems";
    }

    // 提交添加商品请求
    @RequestMapping("/addItemsSubmit")
    public String addSuccess(ItemCustom itemCustom) throws Exception{
        //编写添加商品的功能
        itemsService.addItems(itemCustom);

        return "forward:queryItems.action";
    }

    // 跳转到批量修改商品页面
    @RequestMapping("/editQueryItems")
    public ModelAndView editQueryItems(ItemsQueryVo itemsQueryVo) throws Exception{

        List<ItemCustom> itemsList=itemsService.findItemsList(itemsQueryVo);

        ModelAndView modelAndView=new ModelAndView();   //创建视图对象
        modelAndView.addObject("itemsList",itemsList);

        modelAndView.setViewName("editQueryItems");  //指定用户访问的jsp页面地址，前缀和后缀已在前端控制器中配好
        return modelAndView;
    }

    //批量修改提交后
    @RequestMapping("/editQueryItemsSubmit")
    public String editQueryItemsSubmit(ItemsQueryVo itemsQueryVo) throws Exception{

        // 获取装有客户表的信息
        List<ItemCustom> editItemsList=itemsQueryVo.getItemsList();
        Integer editId;
        ItemCustom editItem;
        // 更新信息
        // 根据前端传过来的id修改相应内容
        for(int i=0;i<editItemsList.size();i++){
            editId=editItemsList.get(i).getId();
            editItem=editItemsList.get(i);
            itemsService.updateItems(editId,editItem);
        }
        return "forward:queryItems.action";
    }

    // RESTful格式编写
    // 根据id查询商品，输出为json串
    // 使用/itemsView/{id}将"{}"里的参数传到@PathVariable指定的名称中
    // 若有多个，如：/itemsView/{id}/{name} ,则在形参中再定义相同数量的@PathVariable
    @RequestMapping("/itemsView/{id}")
    public @ResponseBody ItemCustom itemsView(@PathVariable("id") Integer id) throws Exception{

        ItemCustom itemCustom=itemsService.findItemsById(id);
        return itemCustom;
    }
}
