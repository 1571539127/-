var unit_tag_dialog_modify_or_add_view = function(){
    //初始化弹窗列表事件
    var init_unit_tag_dialog_modify_or_add_view = function(){
    	$(".modal-backdrop").css("z-index",0);
        var categoryParentId = sessionStorage.getItem("unit_tag_Manager_categoryParentId"); 
        var unit_tag_Manager_labelid = sessionStorage.getItem("unit_tag_Manager_labelid"); 
        var categoryName = sessionStorage.getItem("unit_tag_Manager_categoryName"); 
        var unit_tag_flag = sessionStorage.getItem("unit_tag_flag"); 
            var userdata = {
                labelId:unit_tag_Manager_labelid, 
              }
            $(".add_parent_name").val(categoryName);
            debugger;
            if(unit_tag_flag=="update"){
                $(".add_tag_name").val(categoryName);
                $(".add_tag_describe").val(categoryName);
                $(".unit_tag_Manager_parent_tag_hidden_class").css("display","none");
            }
            else if(unit_tag_flag=="first"){
                $(".unit_tag_Manager_parent_tag_hidden_class").css("display","none");
            }
        
                     
            
      
    }
    return {
        init:[init_unit_tag_dialog_modify_or_add_view()]
    }
}()