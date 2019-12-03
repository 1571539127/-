<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>单位标签操作</title>

</head>

<body>

    <section class="">
            <div class="commonQueryPage">
                    <!-- 头部查询 -->
                             <!-- 列表信息展示 -->
                            <div class="box box-primary  ap_boxStyle">
                                <div class="box-body">
                                    <form action="" class="form-horizontal">
                                        <!--上级标签-->
                                        <div class="form-group unit_tag_Manager_parent_tag_hidden_class ">
                                            <label for="" class="col-sm-4 col-lg-2 control-label" >上级标签</label>
                                            <div class="col-sm-8 col-lg-10">
                                                <input type="text"  class="form-control add_parent_name">
                                            </div>
                                        </div>
                                        <!--当前标签-->
                                        <div class="form-group">
                                            <label for="" class="col-sm-4 col-lg-2 control-label" >标签名称</label>
                                            <div class="col-sm-8 col-lg-10">
                                                <input type="text" maxlength="30" placeholder="请输入标签名称"  class="form-control add_tag_name" " >
                                            </div>
                                        </div>
                                        
                                         <div class="form-group">
                                            <label for="" class="col-sm-4 col-lg-2 control-label" >标签描述</label>
                                            <div class="col-sm-8 col-lg-10">
                                                <input type="text" maxlength="30" placeholder="请输入标签描述"  class="form-control add_tag_describe" " >
                                            </div>
                                        </div>
                                    </form>
                                </div> 
                            </div>
                    

                    </div>

                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>
    <script src="/view/js/unit_tag_dialog_modify_or_add_view.js"></script>
    <script> 
    function changeValue(obj){
        $(obj).attr("value",$(obj).val());
    }
    function changeValue1(obj){
        $(obj).attr("value",$(obj).val());
    }
    </script>
 
</body>

</html>