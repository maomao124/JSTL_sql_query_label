<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_sql_query_label
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/8
  Time(创建时间)： 19:25
  Description(描述)：
  JSTL <sql:query> 标签用来执行 SQL SELECT 语句，查询数据库中的数据。
JSP <sql:query> 标签的语法如下：
<sql:query var="varname" [dataSource="dataSource"] [maxRows="maxRows"] [scope="page|session|request|application"] sql="sqlQuery" [startRow="startRow"]
其中：
[ ]：[ ]中的内容为可选项；
var：代表 SQL 查询的结果；
dataSource：连接的数据源；
maxRows：设置最多可存放的记录条数；
scope：设定参数 var 的有效范围，默认为 page；
sql：查询的 SQL 语句；
startRow：开始查询的行数。
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--
var：代表数据源的变量；
driver：注册的 JDBC 驱动；mysql8.0:com.mysql.jdbc.Driver
url://地址:端口号/数据库名
user：连接数据库时使用的用户名；
password：连接数据库时使用的密码；
dataSource：已经存在的数据源；
scope：设定参数 var 的有效范围，默认为 page
--%>
<sql:setDataSource var="student" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/student"
                   user="root" password="20010713"/>

<%--
var：代表SQL查询的结果；
dataSource：连接的数据源；
maxRows：设置最多可存放的记录条数；
scope：设定参数 var 的有效范围，默认为 page；
sql：查询的 SQL 语句；
startRow：开始查询的行数。
--%>
<sql:query var="result" dataSource="${student}">
    SELECT * FROM information;
</sql:query>


<table border="1">
    <tr>
        <th>no</th>
        <th>name</th>
        <th>sex</th>
        <th>age</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.no}"/></td>
            <td><c:out value="${row.name}"/></td>
            <td><c:out value="${row.sex}"/></td>
            <td><c:out value="${row.age}"/></td>
        </tr>
    </c:forEach>
</table>
<br/>
按年龄降序：
<%--
var：代表SQL查询的结果；
dataSource：连接的数据源；
maxRows：设置最多可存放的记录条数；
scope：设定参数 var 的有效范围，默认为 page；
sql：查询的 SQL 语句；
startRow：开始查询的行数。
--%>
<sql:query var="result" dataSource="${student}">
    SELECT * FROM information order by age desc;
</sql:query>

<table border="1">
    <tr>
        <th>no</th>
        <th>name</th>
        <th>sex</th>
        <th>age</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.no}"/></td>
            <td><c:out value="${row.name}"/></td>
            <td><c:out value="${row.sex}"/></td>
            <td><c:out value="${row.age}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
