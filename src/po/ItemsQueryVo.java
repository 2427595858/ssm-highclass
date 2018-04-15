package po;

import java.util.List;

/**
 * 编写商品的包装类ItemsQueryVo
 */
public class ItemsQueryVo {
    private Items items;
    private ItemCustom itemCustom;

    //批量修改商品的列表
    private List<ItemCustom> itemsList;

    public List<ItemCustom> getItemsList() {
        return itemsList;
    }

    public void setItemsList(List<ItemCustom> itemsList) {
        this.itemsList = itemsList;
    }

    public ItemCustom getItemCustom(){
        return itemCustom;
    }

    public void setItemCustom(ItemCustom itemCustom){
        this.itemCustom=itemCustom;
    }

}
