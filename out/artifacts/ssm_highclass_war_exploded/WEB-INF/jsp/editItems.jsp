<%--
  Created by IntelliJ IDEA.
  User: 光玉
  Date: 2018/4/7
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%-- 注：在修改商品信息时，有可能输入的修改信息的字符串前后带有空格，
         需要编写配置去除前后空格的转换器TrimStringConverter --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>修改商品信息</title>
    <script type="text/javascript" src="<%= request.getContextPath()%>/plugin/layui/layui.all.js"></script>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/plugin/layui/css/layui.css">
</head>

<body>
<form name="editFoem" class="layui-form" action="${pageContext.request.contextPath}/items/editItemsSubmit.action" enctype="multipart/form-data" method="post">
    <input type="hidden" name="id" value="${itemCustom.id}">
    <div class="layui-form-item">
        <label class="layui-form-label">商品名称</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" name="name" value="${itemCustom.name}"/>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商品价格</label>
        <div class="layui-input-inline">
           <input class="layui-input" type="text" name="price" value="${itemCustom.price}"/>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商品图片</label>
        <div class="layui-input-inline">
            <c:if test="${itemCustom.pic != null}">
                <%-- 取绝对路径 --%>
                <img src="/img/${itemCustom.pic}" width="100" height="100"/><br/>
            </c:if>
            <input type="file" name="items_img">
            <%-- 不写上下面这一行的话就不能把已有的pic的值传回到后台中 --%>
            <%-- 如果不写，传回的itemCustom中pic的值会变为null --%>
            <input class="layui-hide" type="text" name="pic" value="${itemCustom.pic}"/>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">生产日期</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" name="createtime" value="<fmt:formatDate value="${itemCustom.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">商品详情</label>
        <div class="layui-input-block">
            <textarea class="layui-textarea" name="detail">${itemCustom.detail}</textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" type="submit">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            <button class="layui-btn layui-btn-normal" type="button" id="back">返回</button>
        </div>
    </div>
</form>

<script>
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });

    var $=layui.$;
    $("#back").on("click",function () {
        document.editFoem.action="${pageContext.request.contextPath}/items/queryItems.action";
        document.editFoem.submit();
    })
</script>

</body>
</html>
