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
    <title>批量修改商品</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="<%= request.getContextPath()%>/plugin/layui/layui.all.js"></script>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/plugin/layui/css/layui.css">
</head>

<body>
<div style="margin-left: 250px">
    <form name="editItemsForm" class="layui-form" action="${pageContext.request.contextPath}/items/editQueryItems.action" method="post">
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
                <button class="layui-btn layui-btn-normal" type="button" id="editQuery">提交修改</button>
            </div>
            <div class="layui-input-inline">
                <button class="layui-btn" type="button" id="back">返回</button>
            </div>
        </div>

        <div style="width: 900px">
            <table class="layui-table" lay-size="sm">
                <thead>
                <th>商品名称</th>
                <th>商品价格</th>
                <th>商品详情</th>
                <th>生产日期</th>
                </thead>
                <tbody>
                <c:forEach items="${itemsList}" var="item" varStatus="status">
                    <tr>
                        <td class="layui-hide"><input type="text" name="itemsList[${status.index}].id" value="${item.id}"></td>
                        <td><input type="text" name="itemsList[${status.index}].name" value="${item.name}"/></td>
                        <td><input type="text" name="itemsList[${status.index}].price" value="${item.price}"/></td>
                        <td><input type="text" name="itemsList[${status.index}].detail" value="${item.detail}"/></td>
                        <td><input type="text" name="itemsList[${status.index}].createtime" value="<fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/> "/></td>
                        <td class="layui-hide"><input type="text" name="itemsList[${status.index}].pic" value="${item.pic}"/></td>
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

    var $=layui.$;
    $("#editQuery").on("click",function () {
        document.editItemsForm.action="${pageContext.request.contextPath}/items/editQueryItemsSubmit.action";
        document.editItemsForm.submit();
    });

    $("#back").on("click",function () {
        document.editItemsForm.action="${pageContext.request.contextPath}/items/queryItems.action";
        document.editItemsForm.submit();
    })
</script>
</body>
</html>
