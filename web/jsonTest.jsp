<%--
  Created by IntelliJ IDEA.
  User: 光玉
  Date: 2018/4/13
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>json转换测试</title>
    <script type="text/javascript" src="<%= request.getContextPath()%>/plugin/layui/layui.all.js"></script>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/plugin/layui/css/layui.css">
    <%--<script type="text/javascript" src="<%= request.getContextPath()%>/plugin/jquery/jquery.js"></script>--%>
</head>
<body>
    <button class="layui-btn" type="button" id="requestJson">请求json</button>
    <button class="layui-btn layui-btn-normal" type="button" id="responseJson">请求key/value</button>

    <script>
        var $=layui.$;

        // 请求是json串，返回的也是json串
        $("#requestJson").on("click",function () {
            $.ajax({
                type:'post',
                url:'${pageContext.request.contextPath}/requestJson.action',    //设置请求的url
                contentType:'application/json;charset=utf-8',   //将请求类型设置为json格式
                data:'{"name":"天堂伞", "price":"45"}',
                success:function (data) {   //返回json
                    alert(data.name);
                }
            })
        });

        //请求key/value，返回json串
        $("#responseJson").on("click",function () {
            // 请求是json串，返回的也是json串
            $.ajax({
                type:'post',
                url:'${pageContext.request.contextPath}/responseJson.action',    //设置请求的url
                // contentType:'application/json;charset=utf-8',   //默认即为传输key/value格式的数据，不需要设置
                data:'name=毕业花束&price=79',  //key/value类型数据
                success:function (data) {   //返回json
                    alert(data.name);
                }
            })
        })
    </script>
</body>
</html>
