<%--
  Created by IntelliJ IDEA.
  User: 光玉
  Date: 2018/4/3
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<head>
    <title>查询商品列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="<%= request.getContextPath()%>/plugin/layui/layui.all.js"></script>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/plugin/layui/css/layui.css">
</head>

<body class="layui-layout-body">
<!-- 顶部导航栏 -->
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">商品管理后台</div>
        <ul class="layui-nav layui-layout-right">
            <!-- 判断在session中是否保存着username，若存在，则显示出用户名
                 否则，显示“请登录” -->
            <c:if test="${username != null}">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                        ${username}
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/logout.action">退了</a>
                </li>
            </c:if>
            <c:if test="${username == null}">
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/login.jsp">请登录</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>
<div style="margin-left: 250px;margin-top:60px">
    <form name="itemsForm" class="layui-form" action="${pageContext.request.contextPath}/items/queryItems.action" method="post">
        <label class="layui-form-label">查询条件</label>
        <div class="layui-input-block">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="itemCustom.name" placeholder="请输入关键字">
            </div>
            <div class="layui-input-inline">
                <button class="layui-btn" type="submit" id="find">查询</button>
            </div>
            <div class="layui-input-inline">
                <button class="layui-btn layui-btn-normal" type="button" id="add">添加商品</button>
            </div>
            <div class="layui-input-inline">
                <button class="layui-btn layui-btn-danger" type="button" id="delete">批量删除</button>
            </div>
            <div class="layui-input-inline">
                <button class="layui-btn layui-btn-normal" type="button" id="editQuery">批量修改</button>
            </div>
            <div class="layui-input-inline">
                <button class="layui-btn layui-btn-primary">刷新</button>
            </div>
        </div>

        <div style="width: 900px">
            <table class="layui-table" lay-size="sm">
                <thead>
                <th>批量删除</th>
                <th>商品名称</th>
                <th>商品价格</th>
                <th>商品详情</th>
                <th>生产日期</th>
                <th>操作</th>
                </thead>
                <tbody>
                <c:forEach items="${itemsList}" var="item">
                    <tr>
                        <td><input type="checkbox" name="item_id" value="${item.id}"/> </td>
                        <td>${item.name}</td>
                        <td>${item.price}</td>
                        <td>${item.detail}</td>
                        <td><fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                        <td>
                            <a class="layui-btn layui-btn-sm" href="${pageContext.request.contextPath}/items/editItems.action?id=${item.id}">修改</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </form>
</div>

<script>
    //渲染form表单
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });

    //要使用弹出层layer以及使用jquery的$要使用下面这种方式
    layui.use('layer',function(){
        var layer=layui.layer;
        var $=layui.$;

        // 在弹出层显示添加商品表单
        $("#add").on("click",function(){
            layer.open({
                title:'添加商品',
                type:2,     //表示通过url传入页面
                area:['600px','400px'],
                content:['${pageContext.request.contextPath}/items/addItems.action'],
                skin:'layui-layer-lan',
                btn:['添加','取消'],

                yes: function(index,layero){
                    // 获取iframe中的form表单元素
                    var formSubmit=window.parent.document.getElementById('layui-layer-iframe1').contentWindow.document.getElementById("formSubmit");
                    // 提交form表单
                    formSubmit.submit();
                    layer.msg('操作成功',{
                        icon:1,
                        time:3000
                    });
                    // 提交表单后关闭弹出层窗口
                    layer.close();
                    // 刷新页面
                    location.reload();
                }
            })
        });

        //批量删除商品
        $("#delete").on("click",function () {
            // 因为必须传回一个item_id数组才能执行删除操作，所以要判断是否有复选框被选中
            // 有复选框被选中时
            if($("input[type='checkbox']").is(":checked")){
                layer.alert('确定要删除吗',{
                    icon:3,
                    btn:['确定','取消'],
                    yes:function(){
                        // 修改form表单的提交路径
                        document.itemsForm.action="${pageContext.request.contextPath}/items/deleteItems.action";
                        document.itemsForm.submit();
                        layer.msg('删除成功',{icon:1});
                    }
                });
            }
            // 若没有复选框被选中
            else{
                layer.msg('请至少勾选一个商品',{
                    icon:0,
                    time:3000
                });
            }
        });

        // 进入批量修改页面
        $("#editQuery").on("click",function () {
            document.itemsForm.action="${pageContext.request.contextPath}/items/editQueryItems.action";
            document.itemsForm.submit();
        })
    })
</script>
</body>
</html>
