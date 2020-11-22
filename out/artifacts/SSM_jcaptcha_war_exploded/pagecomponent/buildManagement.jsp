<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script>
    var search_type_storage = "none";

    $(function () {
        optionAction();
    })

    /**
     * 下拉选项框
     */
    function optionAction() {
        $(".dropOption").click(function () {
            var type = $(this).text();
            $("#search_input").val("");
            if (type == "所有") {
                $("#search_input_type").attr("readOnly", "true");
                search_type_storage = "searchAll";
            } else if (type == "教学楼ID") {
                $("#search_input_type").removeAttr("readOnly");
                search_type_storage = "searchByBuildID";
            } else if (type == "教学楼名称") {
                $("#search_input_type").removeAttr("readOnly");
                search_type_storage = "searchByBuildName";
            } else if (type = "教学楼类型") {
                $("#search_input_type").removeAttr("readOnly");
                search_type_storage = "searchByBuildKind";
            } else {
                $("#search_input_type").removeAttr("readOnly");
            }

            $("#search_type").text(type);
            $("#search_input_type").attr("placeholder", type);
        })
    }


    /**
     * 显示搜索后的信息
     * @param list
     */
    function afterSearchShow() {
        var buildingName = $('#building_name').val();
        $.ajax({
            url: 'findBuildings.do',
            data: {
                searchInfo: buildingName,
                searchBuildType: search_type_storage
            },
            success: function (list) {
                var html = "";
                $("#buildingList tbody").html("");
                for (var i = 0; i < list.length; i++) {
                    html = "<tr>"
                        + "<td style=\"display: none\">" + list[i].buildId + "</td>"
                        + "<td>" + list[i].buildName + "</td>"
                        + "<td>" + list[i].buildKind + "</td>"
                        + "<td>" + list[i].buildAddress + "</td>"
                        + "<td>" + list[i].buildClassroomNum + "</td>"
                        + "<td>" + list[i].longitude + "</td>"
                        + "<td>" + list[i].latitude + "</td>"
                        + "<td>" + list[i].buildMessage + "</td>"
                        + "<td>" + '<a href="#" onclick="deleteBuild(\'' + list[i].buildId + '\')">删除</a>'
                        + "    "
                        + '<a href="#" onclick="showUpdateInputAlert(' +
                        '\'' + list[i].buildId + '\',' +
                        '\'' + list[i].buildName + '\',' +
                        '\'' + list[i].buildKind + '\',' +
                        '\'' + list[i].buildAddress + '\',' +
                        '\'' + list[i].buildClassroomNum + '\',' +
                        '\'' + list[i].longitude + '\',' +
                        '\'' + list[i].latitude + '\',' +
                        '\'' + list[i].buildMessage + '\')">修改</a>' + "</td>"
                        + "</tr>";
                    $("#buildingList tbody").append(html);
                }
            },
            error: function (response) {
            }
        })
    }

    /**
     * 删除建筑数据
     *
     * @param buildId 建筑的ID
     * @returns {boolean}
     */
    function deleteBuild(buildId) {
        var msg = "您真的确定要删除吗？\n\n请确认！";
        if (confirm(msg) == true) {
            $.ajax({
                url: 'deleteBuild.do',
                data: {
                    buildId: buildId
                },
                success: function (flag) {
                    if (flag == "success") {
                        // 删除成功刷新界面显示
                        afterSearchShow();
                    }
                }
            });
        } else {
            return false;
        }
    }


    /**
     * 插入建筑信息
     */
    function insertBuildMessage() {
        var buildId = $('#insert_buildId').val();
        var buildName = $('#insert_buildName').val();
        var longitude = $('#insert_longitude').val();
        var latitude = $('#insert_latitude').val();
        var buildAddress = $('#insert_buildAddress').val();
        var buildClassroomNum = $('#insert_classroomNum').val();
        var buildMessage = $('#insert_buildInfo').val();
        var buildKind = $('#insert_buildKind').val();
        $.ajax({
            url: 'insertBuilding.do',
            data: {
                buildId: buildId,
                buildName: buildName,
                buildKind: buildKind,
                buildAddress: buildAddress,
                longitude: longitude,
                latitude: latitude,
                buildClassroomNum: buildClassroomNum,
                buildMessage: buildMessage
            },
            success: function (list) {
                $('#add_modal').modal("hide");
                confirm(list);
                cleanBuildInput();
                afterSearchShow();
            },
            error: function () {

            }
        })
    }

    /**
     * 显示更新信息框
     */
    function showUpdateInputAlert(buildId, buildName, buildKind, buildAddress, buildClassroomNum, longitude, latitude, buildMessage) {
        alert(buildId + buildName + buildKind + buildAddress + longitude + latitude + buildMessage);
        $('#update_modal').modal("show");

        $('#update_buildId').val(buildId);
        // $('#insert_buildId_div').modal("hide")
        $('#update_buildName').val(buildName);
        $('#update_buildKind').val(buildKind);
        $('#update_longitude').val(longitude);
        $('#update_latitude').val(latitude);
        $('#update_buildAddress').val(buildAddress);
        $('#update_classroomNum').val(buildClassroomNum);
        $('#update_buildInfo').val(buildMessage);
    }

    /**
     * 修改建筑信息
     */
    function updateBuildMessage() {

        var buildId = $('#update_buildId').val();
        // $('#insert_buildId_div').modal("hide")
        var buildName = $('#update_buildName').val();
        var buildKind = $('#update_buildKind').val();
        var longitude = $('#update_longitude').val();
        var latitude = $('#update_latitude').val();
        var buildAddress = $('#update_buildAddress').val();
        var buildClassroomNum = $('#update_classroomNum').val();
        var buildMessage = $('#update_buildInfo').val();
        $.ajax({
            url: 'updateBuilding.do',
            data: {
                buildId: buildId,
                buildName: buildName,
                buildKind: buildKind,
                buildAddress: buildAddress,
                longitude: longitude,
                latitude: latitude,
                buildClassroomNum: buildClassroomNum,
                buildMessage: buildMessage
            },
            success: function (list) {
                alert(list);
                $('#update_modal').modal("hide");
                afterSearchShow();
            }

        });
    }


    $('#add_storage').click(function () {
        $('#add_modal').modal("show");
    });


    // 操作结果提示模态框
    function infoModal(type, msg) {
        $('#info_success').removeClass("hide");
        $('#info_error').removeClass("hide");
        if (type == "success") {
            $('#info_error').addClass("hide");
        } else if (type == "error") {
            $('#info_success').addClass("hide");
        }
        $('#info_content').text(msg);
        $('#info_modal').modal("show");
    }

    /**
     * 清空插入控件的值
     */
    function cleanBuildInput() {
        $('#insert_buildId').val("");
        $('#insert_buildName').val("");
        $('#insert_buildKind').val("");
        $('#insert_longitude').val("");
        $('#insert_latitude').val("");
        $('#insert_buildAddress').val("");
        $('#insert_classroomNum').val("");
        $('#insert_buildInfo').val("");
    }
</script>

<!-- 主界面显示 -->
<div class="panel panel-default">
    <ol class="breadcrumb">
        <li>教学楼信息管理</li>
    </ol>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-1  col-sm-2">
                <div class="btn-group">
                    <button class="btn btn-default dropdown-toggle"
                            data-toggle="dropdown">
                        <span id="search_type">查询方式</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="javascript:void(0)" class="dropOption">教学楼ID</a></li>
                        <li><a href="javascript:void(0)" class="dropOption">教学楼名称</a></li>
                        <li><a href="javascript:void(0)" class="dropOption">教学楼类型</a></li>
                        <li><a href="javascript:void(0)" class="dropOption">所有</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9 col-sm-9">
                <div>
                    <div class="col-md-3 col-sm-3">
                        <input id="building_name" type="text" class="form-control"
                               placeholder="教学楼ID">
                    </div>

                    <div class="col-md-3 col-sm-4">
                        <select class="form-control" id="search_input_repository">
                        </select>
                    </div>
                    <div class="col-md-2 col-sm-2">
                        <button id="search_button" class="btn btn-success" onclick="afterSearchShow()">
                            <span class="glyphicon glyphicon-search"></span> <span>查询</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" style="margin-top: 25px">
            <div class="col-md-5">
                <button class="btn btn-sm btn-default" id="add_storage">
                    <span class="glyphicon glyphicon-plus"></span> <span>添加信息</span>
                </button>
                <button class="btn btn-sm btn-default" id="import_storage">
                    <span class="glyphicon glyphicon-import"></span> <span>导入</span>
                </button>
                <button class="btn btn-sm btn-default" id="export_storage">
                    <span class="glyphicon glyphicon-export"></span> <span>导出</span>
                </button>
            </div>
            <div class="col-md-5"></div>
        </div>

        <div class="row" style="margin-top: 15px">
            <div class="col-md-12">
                <table id="buildingList" class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th style="display: none">编号</th>
                        <th>教学楼名称</th>
                        <th>类型</th>
                        <th>地址</th>
                        <th>教室量</th>
                        <th>经度</th>
                        <th>纬度</th>
                        <th width="500px">简介</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- 添加建筑信息模态框 -->
<div id="add_modal" class="modal fade" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="add_build_able">添加建筑记录</h4>
            </div>
            <div class="modal-body">
                <!-- 添加库存信息模态框的内容 -->
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-8 col-sm-8">
                        <form class="form-horizontal" role="form" id="add_build_form"
                              style="margin-top: 25px">
                            <div class="form-group" id="insert_buildId_div">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>编号：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_buildId"
                                           name="insert_buildId" placeholder="BXJX008">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>名称：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_buildName"
                                           name="storage_repositoryID" placeholder="八号教学楼">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>类型：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_buildKind"
                                           name="storage_number" placeholder="教学楼/学院楼">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>地址：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_buildAddress"
                                           name="storage_repositoryID" placeholder="北校中心区域">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>经度：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_longitude"
                                           name="insert_longitude" placeholder="108.080794">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>纬度：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_latitude"
                                           name="insert_latitude" placeholder="34.291847">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>教室量：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_classroomNum"
                                           name="insert_classroomNum" placeholder="如：200">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>补充信息：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_buildInfo"
                                           name="insert_buildInfo" height="200px">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-1 col-sm-1"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>取消</span>
                </button>
                <button class="btn btn-success" type="button" id="add_modal_submit" onclick="insertBuildMessage()">
                    <span>提交</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 更新建筑信息模态框 -->
<div id="update_modal" class="modal fade" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="update_build_able">更新建筑记录</h4>
            </div>
            <div class="modal-body">
                <!-- 添加库存信息模态框的内容 -->
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-8 col-sm-8">
                        <form class="form-horizontal" role="form" id="update_build_form"
                              style="margin-top: 25px">
                            <div class="form-group" id="">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>编号：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_buildId"
                                           name="insert_buildId" placeholder="BXJX008">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>名称：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_buildName"
                                           name="storage_repositoryID" placeholder="八号教学楼">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>类型：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_buildKind"
                                           name="storage_number" placeholder="教学楼/学院楼">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>地址：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_buildAddress"
                                           name="storage_repositoryID" placeholder="北校中心区域">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>经度：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_longitude"
                                           name="insert_longitude" placeholder="108.080794">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>纬度：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_latitude"
                                           name="insert_latitude" placeholder="34.291847">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>教室量：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_classroomNum"
                                           name="insert_classroomNum" placeholder="如：200">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>补充信息：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_buildInfo"
                                           name="insert_buildInfo" height="200px">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-1 col-sm-1"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>取消</span>
                </button>
                <button class="btn btn-success" type="button" id="update_modal_submit" onclick="updateBuildMessage()">
                    <span>提交</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 提示消息模态框 -->
<div class="modal fade" id="info_modal" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="myModalLabel">信息</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-4 col-sm-4"></div>
                    <div class="col-md-4 col-sm-4">
                        <div id="info_success" class=" hide" style="text-align: center;">
                            <img src="media/icons/success-icon.png" alt=""
                                 style="width: 100px; height: 100px;">
                        </div>
                        <div id="info_error" style="text-align: center;">
                            <img src="media/icons/error-icon.png" alt=""
                                 style="width: 100px; height: 100px;">
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4"></div>
                </div>
                <div class="row" style="margin-top: 10px">
                    <div class="col-md-4 col-sm-4"></div>
                    <div class="col-md-4 col-sm-4" style="text-align: center;">
                        <h4 id="info_content"></h4>
                    </div>
                    <div class="col-md-4 col-sm-4"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>&nbsp;&nbsp;&nbsp;关闭&nbsp;&nbsp;&nbsp;</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 删除提示模态框 -->
<div class="modal fade" id="deleteWarning_modal" table-index="-1"
     role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="myModalLabel">警告</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-3 col-sm-3" style="text-align: center;">
                        <img src="media/icons/warning-icon.png" alt=""
                             style="width: 70px; height: 70px; margin-top: 20px;">
                    </div>
                    <div class="col-md-8 col-sm-8">
                        <h3>是否确认删除该条库存信息</h3>
                        <p>(注意：一旦删除该条库存信息，将不能恢复)</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>取消</span>
                </button>
                <button class="btn btn-danger" type="button" id="delete_confirm">
                    <span>确认删除</span>
                </button>
            </div>
        </div>
    </div>
</div>
