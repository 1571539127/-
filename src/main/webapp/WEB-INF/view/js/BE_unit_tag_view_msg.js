var unit_system_tags_function = function(){
    //初始化table 
    
    var init_unit_system_tags_table = function(){

    }
    //添加一级标签
    var add_level_one_system_tags = function(){ 
       
        sessionStorage.setItem("unit_tag_flag","first");
        
         var dialog =  BootstrapDialog.show({
            size: BootstrapDialog.SIZE_WIDE,
            type:BootstrapDialog.TYPE_INFO,
            draggable: true,  //default false
            closable: true,   //default true
            closeByBackdrop: false, //不能通过点击其他部分关闭
            // message: $('<div></div>').load('demo/form.html')  //两种方式都可以用，下面那个更灵活一点
            //  size: BootstrapDialog.SIZE_NORMAL,
            message: function(dialog) {
                var $message = $('<div></div>');
                var pageToLoad = dialog.getData('pageToLoad');
                $message.load(pageToLoad);
                return $message;
            },
            data: {
                'pageToLoad': '/Admin/category/unit_tag_dialog_modify_or_add_view'
            },
            title: '新增标签信息',
            buttons:[{
                label: '确认',  
                title: '确认',
                cssClass: 'col-sm-offset-5 pull-left btn-success',
                action: function(dialogItself){
                  if($(".add_tag_name").val()!=""){
                    var userdata = {
                    	categoryParentId:"0",
                        categoryName:$(".add_tag_name").val(),
                        categoryDescribe:$(".add_tag_describe").val(),
                     }
                    
               	   $.ajax({
            		  url:"/add/category",
            		  type:"POST",
             		  datatype:"json",
             		  data:{"userdata":JSON.stringify(userdata)},
             		  async:false,
             		  contentType: "application/x-www-form-urlencoded; charset=utf-8",
             		  success:function(res){
             			  unit_tag_Manager_ztreetable("","");
             			 dialogItself.close();
             		  }
               	   });
                     
                  }
                },
            },
            {
                label: '取消',  
                title: '取消',
                cssClass: 'btn-fail pull-left ',
                action: function(dialogItself){
                	dialogItself.close();
                 
                },
            }
            ]
     }); 
    }
    //修改标签
    var modify_level_all_system_tags = function(labelid,categoryName,categoryDescribe){ 
       
        sessionStorage.setItem("unit_tag_Manager_labelid",labelid);
        sessionStorage.setItem("unit_tag_Manager_categoryName",categoryName);
        sessionStorage.setItem("unit_tag_Manager_categoryDescribe",categoryDescribe);
        sessionStorage.setItem("unit_tag_flag","update");
        
         var dialog =  BootstrapDialog.show({
            size: BootstrapDialog.SIZE_WIDE,
            type:BootstrapDialog.TYPE_INFO,
            draggable: true,  //default false
            closable: true,   //default true
            closeByBackdrop: false, //不能通过点击其他部分关闭
            // message: $('<div></div>').load('demo/form.html')  //两种方式都可以用，下面那个更灵活一点
            //  size: BootstrapDialog.SIZE_NORMAL,
            message: function(dialog) {
                var $message = $('<div></div>');
                var pageToLoad = dialog.getData('pageToLoad');
                $message.load(pageToLoad);
                return $message;
            },
            data: {
                'pageToLoad': '/Admin/category/unit_tag_dialog_modify_or_add_view'
            },
            title: '新增标签信息',
            buttons:[{
                label: '确认',  
                title: '确认',
                cssClass: 'col-sm-offset-5 pull-left btn-success',
                action: function(dialogItself){
                  if($(".add_tag_name").val()!=""){
                    var userdata = {
                    	categoryId:labelid,
                        categoryName:$(".add_tag_name").val(),
                        categoryDescribe:$(".add_tag_describe").val(),
                     }
                    $(".add_tag_name").val("");
                    $(".add_tag_describe").val("");
                    console.log("updateData"+userdata);
               	   $.ajax({
            		  url:"/update/category",
            		  type:"POST",
             		  datatype:"json",
             		  data:{"userdata":JSON.stringify(userdata)},
             		  async:false,
             		  contentType: "application/x-www-form-urlencoded; charset=utf-8",
             		  success:function(res){
             			  unit_tag_Manager_ztreetable("","");
             			 dialogItself.close();
             		  }
               	   });
                     
                  }
                },
            },
            {
                label: '取消',  
                title: '取消',
                cssClass: 'btn-fail pull-left ',
                action: function(dialogItself){
                	dialogItself.close();
                 
                },
            }
            ]
     }); 
    }
    //新增下级标签

    var add_lower_level_system_tags= function(labelid,categoryName,categoryDescribe){ 
       
        sessionStorage.setItem("unit_tag_Manager_labelid",labelid);
        sessionStorage.setItem("unit_tag_Manager_categoryName",categoryName);
        sessionStorage.setItem("unit_tag_Manager_categoryDescribe",categoryDescribe);
        sessionStorage.setItem("unit_tag_flag","add");
        
         var dialog =  BootstrapDialog.show({
            size: BootstrapDialog.SIZE_WIDE,
            type:BootstrapDialog.TYPE_INFO,
            draggable: true,  //default false
            closable: true,   //default true
            closeByBackdrop: false, //不能通过点击其他部分关闭
            // message: $('<div></div>').load('demo/form.html')  //两种方式都可以用，下面那个更灵活一点
            //  size: BootstrapDialog.SIZE_NORMAL,
            message: function(dialog) {
                var $message = $('<div></div>');
                var pageToLoad = dialog.getData('pageToLoad');
                $message.load(pageToLoad);
                return $message;
            },
            data: {
                'pageToLoad': '/Admin/category/unit_tag_dialog_modify_or_add_view'
            },
            title: '新增标签信息',
            buttons:[{
                label: '确认',  
                title: '确认',
                cssClass: 'col-sm-offset-5 pull-left btn-success',
                action: function(dialogItself){
                  if($(".add_tag_name").val()!=""){
                    var userdata = {
                    	categoryParentId:labelid,
                        categoryName:$(".add_tag_name").val(),
                        categoryDescribe:$(".add_tag_describe").val(),
                     }
                    
               	   $.ajax({
            		  url:"/add/category",
            		  type:"POST",
             		  datatype:"json",
             		  data:{"userdata":JSON.stringify(userdata)},
             		  async:false,
             		  contentType: "application/x-www-form-urlencoded; charset=utf-8",
             		  success:function(res){
             			  unit_tag_Manager_ztreetable("","");
             			 dialogItself.close();
             		  }
               	   });
                     
                  }
                },
            },
            {
                label: '取消',  
                title: '取消',
                cssClass: 'btn-fail pull-left ',
                action: function(dialogItself){
                	dialogItself.close();
                 
                },
            }
            ]
     }); 
    }
    //页面初始化的init 事件
//    var unit_tag_Manager_clearfun = function(){
//       $("#unit_tag_Manager_Rolename").val("");
//       $("#unit_tag_Manager_valid option:eq(0)").prop("selected", 'selected').trigger('change');
//     }

 


    var unit_tag_Manager_ztreetable = function (unit_tag_Manager_Rolename,unit_tag_Manager_valid) {

     	   $.ajax({
		  url:"/category/search",
		  type:"POST",
 		  datatype:"json",
 		  async:false,
 		  contentType: "application/x-www-form-urlencoded; charset=utf-8",
 		  success:function(result){
 			  console.log("aa"+result);
 			  var result=JSON.parse(result);
 			  console.log("bb"+result);
 			  if(result.success){
 			      var list = result?JSON.parse(result.data):null;
 			      unit_tag_Manager_queryHandler(list);
	                 expandAlltree_data_in_dialog_manager(true);

 			    var data={"success":true,"message":"操作成功","result":"0000","version":null,"data":"{\"labelcfgZTree\":[{\"labelFlag\":\"0\",\"highLabelId\":\"80b377d0-5ad3-4281-8b0d-c571d606ab4a\",\"labelId\":\"7210f427-d7b2-435d-b6af-efb3878ded1f\",\"operuserid\":\"kfadmin\",\"operusername\":\"\",\"labelOrder\":\"0\",\"operdate\":\"20190224 21:04:04\",\"labelType\":\"1\",\"createdate\":\"20181221 16:14:03\",\"labelDesc\":null,\"labelName\":\"12\",\"labelLevel\":\"2\"},{\"labelFlag\":\"0\",\"highLabelId\":\"7210f427-d7b2-435d-b6af-efb3878ded1f\",\"labelId\":\"2bdd7039-98e7-4ff1-a6f2-fe23f344afc0\",\"operuserid\":\"lucp\",\"operusername\":\"卢灿鹏\",\"labelOrder\":\"0\",\"operdate\":\"20190506 11:37:48\",\"labelType\":\"1\",\"createdate\":\"20181221 16:14:17\",\"labelDesc\":null,\"labelName\":\"121\",\"labelLevel\":\"3\"},{\"labelFlag\":\"0\",\"highLabelId\":\"0\",\"labelId\":\"f293dcf4-458d-488a-ba57-750d3783bd93\",\"operuserid\":\"kfadmin\",\"operusername\":\"\",\"labelOrder\":\"0\",\"operdate\":\"20190131 15:52:24\",\"labelType\":\"1\",\"createdate\":\"20181221 16:13:43\",\"labelDesc\":null,\"labelName\":\"2\",\"labelLevel\":\"1\"},{\"labelFlag\":\"0\",\"highLabelId\":\"f293dcf4-458d-488a-ba57-750d3783bd93\",\"labelId\":\"597cf5ae-046d-4fa4-bb21-f34c88c9ea2b\",\"operuserid\":\"kfadmin\",\"operusername\":\"\",\"labelOrder\":\"0\",\"operdate\":\"20190114 13:56:51\",\"labelType\":\"1\",\"createdate\":\"20190114 13:52:46\",\"labelDesc\":null,\"labelName\":\"21\",\"labelLevel\":\"2\"},{\"labelFlag\":\"0\",\"highLabelId\":\"f293dcf4-458d-488a-ba57-750d3783bd93\",\"labelId\":\"629730e9-5086-4e5f-870f-33306c685417\",\"operuserid\":\"kfadmin\",\"operusername\":\"\",\"labelOrder\":\"0\",\"operdate\":\"20190131 16:15:41\",\"labelType\":\"1\",\"createdate\":\"20181221 16:14:10\",\"labelDesc\":null,\"labelName\":\"21\",\"labelLevel\":\"2\"}]}","currdate":"20191124"};
 			    console.log("cc"+data);
 			   if (data.success) {
 	                //   var resultData = "";
 	                if (typeof (data.data) == "object") {
 	                    permissionsInfozTreedata = data.data.labelcfgZTree
 	                } else {
 	                    permissionsInfozTreedata = JSON.parse(data.data).labelcfgZTree
 	                }
 	            } 
 			  }
 		 }
 	   });
    }
    /**
     * 自定义DOM节点
     */
    var setting = {
        view: {
            showLine: false,
            addDiyDom: addDiyDom,
        },
        data: {
            simpleData: {
                enable: true,
                idKey: 'categoryId', // 设置哪个字段作为 id 的属性
                pIdKey: 'categoryParentId' // 设置哪个字段作为 pId 的属性
            },
            key: {
                name: 'categoryName' // 设置哪个字段作为标签文字进行显示
              }
        }
    };
    /**
     * 自定义DOM节点
     */
    function addDiyDom(treeId, treeNode) {
        // alert("789") 
        var spaceWidth = 15;
        var liObj = $("#" + treeNode.tId);
        var aObj = $("#" + treeNode.tId + "_a");
        var switchObj = $("#" + treeNode.tId + "_switch");
        var icoObj = $("#" + treeNode.tId + "_ico");
        var spanObj = $("#" + treeNode.tId + "_span");
        aObj.attr('title', ''); 
        aObj.append('<div class="divTd swich fnt" style="width:25%"></div>');
        var div = $(liObj).find('div').eq(0);
        //从默认的位置移除
        switchObj.remove();
        spanObj.remove();
        icoObj.remove();
        //在指定的div中添加
         div.append(switchObj);
        div.append(spanObj);
        //隐藏了层次的span
        var spaceStr = "<span style='height:1px;display: inline-block;width:" + (spaceWidth * treeNode.level) + "px'></span>";
        switchObj.before(spaceStr);
        //图标垂直居中
        icoObj.css("margin-top", "9px");
        switchObj.after(icoObj);
        var editStr = '';
         //宽度需要和表头保持一致
        editStr += '<div class="divTd" style="width:10%">' + treeNode.categoryDescribe + '</div>';//标签级别
        editStr += '<div class="divTd" style="width:15%">' + treeNode.categoryCreatetime + '</div>';//操作时间
        editStr += '<div class="divTd" style="width:20%">' + opt(treeNode) + '</div>';//操作
        console.log("treeNode"+treeNode);
        aObj.append(editStr);
    }
    //初始化列表
    function unit_tag_Manager_queryHandler(zTreeNodes) {
        // alert("456456")
        //初始化树
        $.fn.zTree.init($("#unit_tag_Manager_dataTree"), setting, zTreeNodes);
        //添加表头  
        var li_head = ' <li class="head"><a><div class="divTd" style="width:25% ; text-align:center;">标签名称</div><div class="divTd" style="width:10%">标签描述</div>' +
            '<div class="divTd" style="width:15%">创建时间</div><div class="divTd" style="width:20%">操作</div></a></li>';
        var rows = $("#unit_tag_Manager_dataTree").find('li');
        if (rows.length > 0) {
            rows.eq(0).before(li_head)
        } else {
            $("#unit_tag_Manager_dataTree").append(li_head);
            $("#unit_tag_Manager_dataTree").append('<li ><div style="text-align: center;line-height: 30px;" >无符合条件数据</div></li>')
        }
    }
    //操作列，修改  新增下级菜单
    function opt(treeNode) {
         var htmlStr = '';
         htmlStr+='<div class="col-sm-6"><button  onclick="unit_system_tags_function.add_lower_level_system_tags(\'' +treeNode.categoryId+'\',\'' +treeNode.categoryName+'\',\'' + treeNode.categoryDescribe +'\')" class="btn btn-info unit_tag_manager_diabled_class set_tbn_padding_5px_tag_manager" >新增下级</button></div>';
        htmlStr+='<div class="col-sm-6"><button  onclick="unit_system_tags_function.modify_level_all_system_tags(\'' +treeNode.categoryId+'\',\'' +treeNode.categoryName+'\',\'' + treeNode.categoryDescribe +'\')" class="btn btn-info unit_tag_manager_diabled_class set_tbn_padding_5px_tag_manager" >&nbsp;&nbsp;修&nbsp;改&nbsp;&nbsp;</button></div>';
        return htmlStr;
    }
var expandAlltree_data_in_dialog_manager = function(e){
    var treeObj = $.fn.zTree.getZTreeObj("unit_tag_Manager_dataTree");
        treeObj.expandAll(e);
}
//  var init_unit_manager_function = function(){
//       var unittype = sessiondata.userinfs.unittype;
//     if(unittype=="3" || unittype=="2"){
//        return "";
//    }else{
//         $(".unit_tag_manager_diabled_class").prop("disabled","disabled");
//        return "disabled";
//    }
//    
//  }
 
    return {
        // unit_tag_Manager_peoplefun: unit_tag_Manager_peoplefun,
        init: [unit_tag_Manager_ztreetable("","")],
        modify_level_all_system_tags:modify_level_all_system_tags,
        add_lower_level_system_tags:add_lower_level_system_tags,
        add_level_one_system_tags:add_level_one_system_tags,
//        unit_tag_Manager_clearfun:unit_tag_Manager_clearfun,
        expandAlltree_data_in_dialog_manager:expandAlltree_data_in_dialog_manager,
//        init_unit_manager_function:init_unit_manager_function
    }

}()