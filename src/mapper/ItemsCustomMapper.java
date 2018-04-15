package mapper;

import java.util.List;
import po.ItemCustom;
import po.ItemsQueryVo;

public interface ItemsCustomMapper {
    // 商品查询列表
    public List<ItemCustom> findItemsList(ItemsQueryVo itemsQueryVo) throws Exception;
    // 获取商品总记录数
    public Long countItems(ItemsQueryVo itemsQueryVo)throws Exception;
}
