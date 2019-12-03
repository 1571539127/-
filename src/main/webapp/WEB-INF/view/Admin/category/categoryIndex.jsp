<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<rapid:override name="header-style">

<style type="text/css">
    .layui-table-cell {
        height: auto !important;
        white-space: normal;
    }
</style>
</rapid:override>

<rapid:override name="content">

<!-- <div id="demo" class="demo-tree demo-tree-box" style="width: 500px; height: 300px; overflow: scroll;"></div> -->
<div><button  onclick="unit_system_tags_function.add_level_one_system_tags()" class="btn btn-info  set_tbn_padding_5px_tag_manager" >新增一级目录</button></div>
 <div id="unit_tag_Manager_tableMain">
                            <ul id="unit_tag_Manager_dataTree" class="ztree" style="width:100%;height:100%">
                            </ul>
                        </div>
</rapid:override>

<rapid:override name="footer-script">
  <script type="text/javascript" src="/view/js/BE_unit_tag_view_msg.js"></script>
<script>

// layui.use(['tree', 'util'], function(){
// 	  $ = layui.$;var tree = layui.tree;
// 	   var nodes="";
// 	   $.ajax({
// 		  url:"/category/search",
// 		  type:"POST",
// 		  datatype:"json",
// 		  async:false,
// 		  contentType: "application/x-www-form-urlencoded; charset=utf-8",
// 		  success:function(result){
// 			  console.log(result);
// 			  var result=JSON.parse(result);
// 			  console.log(result);
// 			  if(result.success){
// 			      var list = result?JSON.parse(result.data):null;
// 			      if (list!=null) {
// 			         nodes=list;
// 			      }
// 			  }
// 		 }
// 	   });
// 	   tree.render({//tree.render() 方法指定一个元素，便可快速创建一个 tree 实例
// 		  elem: '#demo', //传入元素选择器
// 		  showCheckbox: true,  //是否显示复选框
// 		  data:nodes,//获取节点数据
// 		  id: 'id',//定义索引 
// 	      edit: ['add', 'update', 'del'] //操作节点的图标
// 	     ,click: function(obj){
// 	    	 debugger
// 	       layer.msg(JSON.stringify(obj.data));
// 	     }
// 	   });
	
// });
</script>
</rapid:override>
<%@ include file="../public/framework.jsp" %>