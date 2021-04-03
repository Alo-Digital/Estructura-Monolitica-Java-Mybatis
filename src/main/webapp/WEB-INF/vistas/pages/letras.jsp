<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="js/bootstrap-table.min.js"></script>
<table id="table" data-toggle="table" data-pagination="true" data-height="460" data-data-type="text"
    data-url="index/data1">
    <thead>
        <tr>
            <th data-field="id">ID</th>
            <th data-field="name">Name</th>
            <th data-field="price">Price</th>
        </tr>
    </thead>
</table>
 
<script>
    function responseHandler(res) {
        return JSON.parse(res)
    }

</script>