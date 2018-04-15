package controller.converter;

import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConverter implements Converter<String,Date>{
    @Override
    public Date convert(String source){
        // 转换 "yyyy-MM-dd HH:mm:ss"为Date格式
        try{
            //参数绑定成功则返回转换后的日期
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(source);
        }catch(Exception e){
            e.printStackTrace();
        }
        //否则返回空
        return null;
    }
}
