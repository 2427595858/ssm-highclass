<%--
  Created by IntelliJ IDEA.
  User: 光玉
  Date: 2018/4/10
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<html>
<head>
    <title>添加商品</title>
    <script type="text/javascript" src="<%= request.getContextPath()%>/plugin/layui/layui.all.js"></script>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/plugin/layui/css/layui.css">
</head>

<!-- 由于在前端itemsList.jsp使用弹出层将表单传入，
    提交按钮也绑定到弹出层的“添加”按钮，这里便不编写“提交”按钮 -->
<body style="background-color: #7e6c75">
<form id="formSubmit" class="layui-form" action="${pageContext.request.contextPath}/items/addItemsSubmit.action" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">商品名称</label>
        <div class="layui-input-block">
            <input class="layui-input" type="text" name="name" placeholder="必须填写此字段"/>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商品价格</label>
        <div class="layui-input-block">
            <input class="layui-input" type="text" name="price" placeholder="必须填写此字段"/>
        </div>
    </div>

    <%--<div class="layui-form-item">
        <label class="layui-form-label">商品图片</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" name="pic"/>
        </div>
    </div>--%>

    <div class="layui-form-item">
        <label class="layui-form-label">生产日期</label>
        <div class="layui-input-block">
            <input class="layui-input" type="text" name="createtime" placeholder="必填，格式为yyyy-MM-dd HH:mm:ss"/>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">商品详情</label>
        <div class="layui-input-block">
            <textarea class="layui-textarea" name="detail"></textarea>
        </div>
    </div>

    <%--<div class="layui-form-item">--%>
        <%--<div class="layui-input-block">--%>
            <%--<button class="layui-btn" type="submit">提交</button>--%>
            <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
        <%--</div>--%>
    <%--</div>--%>
</form>

<script>
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });
</script>

</body>
</html>

