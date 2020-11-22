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
            } else if (type == "教室ID ") {
                $("#search_input_type").removeAttr("readOnly");
                search_type_storage = "searchByClassroomId";
            } else if (type == "日期") {
                $("#search_input_type").removeAttr("readOnly");
                search_type_storage = "searchByClassDate";
            } else if (type = "课时") {
                $("#search_input_type").removeAttr("readOnly");
                search_type_storage = "searchByClassTime";
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
        var searchInfo = $('#search_info').val();
        $.ajax({
            url: 'findClass.do',
            data: {
                searchInfo: searchInfo,
                searchClassType: search_type_storage
            },
            success: function (list) {
                var html = "";
                $("#buildingList tbody").html("");
                for (var i = 0; i < list.length; i++) {
                    html = "<tr>"
                        + "<td style=\"display: none\">" + list[i].classId + "</td>"
                        + "<td>" + list[i].classroomId + "</td>"
                        + "<td>" + list[i].courseId + "</td>"
                        + "<td>" + list[i].courseName + "</td>"
                        + "<td>" + list[i].classDate + "</td>"
                        + "<td>" + list[i].classTime + "</td>"
                        + "<td>" + list[i].teacherName + "</td>"
                        + "<td>" + '<a href="#" onclick="deleteClass(\'' + list[i].classId + '\')">删除</a>'
                        + "  "
                        + '<a href="#" onclick="showUpdateInputAlert(' +
                        '\'' + list[i].classId + '\',' +
                        '\'' + list[i].classroomId + '\',' +
                        '\'' + list[i].courseId + '\',' +
                        '\'' + list[i].courseName + '\',' +
                        '\'' + list[i].classDate + '\',' +
                        '\'' + list[i].classTime + '\',' +
                        '\'' + list[i].teacherName + '\')">修改</a>' + "</td>"
                        + "</tr>";
                    $("#buildingList tbody").append(html);
                }
            },
            error: function (response) {
            }
        })
    }

    /**
     * 删除课时数据
     *
     * @param classId 课时的ID
     * @returns {boolean}
     */
    function deleteClass(classId) {
        var msg = "您真的确定要删除吗？\n\n请确认！";
        if (confirm(msg) == true) {
            $.ajax({
                url: 'deleteClass.do',
                data: {
                    classId: classId
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
     * 插入课时信息
     */
    function insertBuildMessage() {
        var classId = $('#insert_classId').val();
        var classroomId = $('#insert_classroomId').val();
        var classDate = $('#insert_classDate').val();
        var classTime = $('#insert_classTime').val();
        var courseId = $('#insert_courseId').val();
        var courseName = $('#insert_teacherName').val();
        var teacherName = $('#insert_classroomNum').val();

        $.ajax({
            url: 'insertClass.do',
            data: {
                classId: classId,
                classroomId: classroomId,
                courseId: courseId,
                courseName: courseName,
                classDate: classDate,
                classTime: classTime,
                teacherName: teacherName
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
    function showUpdateInputAlert(classId, classroomId, courseId, courseName, classDate, classTime, teacherName) {
        alert(classId + classroomId + courseId + courseName + classDate + classTime + teacherName);
        $('#update_modal').modal("show");

        $('#update_classId').val(classId);
        // $('#insert_classId_div').modal("hide")
        $('#update_classroomId').val(classroomId);
        $('#update_courseId').val(courseId);
        $('#update_classDate').val(courseName);
        $('#update_classTime').val(classDate);
        $('#update_courseName').val(classTime);
        $('#update_teacherName').val(teacherName);
    }

    /**
     * 修改课时信息
     */
    function updateBuildMessage() {

        var classId = $('#update_classId').val();
        // $('#insert_classId_div').modal("hide")
        var classroomId = $('#update_classroomId').val();
        var courseId = $('#update_courseId').val();
        var classDate = $('#update_classDate').val();
        var classTime = $('#update_classTime').val();
        var courseName = $('#update_courseName').val();
        var teacherName = $('#update_teacherName').val();
        $.ajax({
            url: 'updateClass.do',
            data: {
                classId: classId,
                classroomId: classroomId,
                courseId: courseId,
                courseName: courseName,
                classDate: classDate,
                classTime: classTime,
                teacherName: teacherName
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
        $('#insert_classId').val("");
        $('#insert_classroomId').val("");
        $('#insert_courseId').val("");
        $('#insert_courseName').val("");
        $('#insert_classDate').val("");
        $('#insert_classTime').val("");
        $('#insert_teacherName').val("");

    }
</script>

<!-- 主界面显示 -->
<div class="panel panel-default">
    <ol class="breadcrumb">
        <li>课时管理</li>
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
                        <li><a href="javascript:void(0)" class="dropOption">教室ID</a></li>
                        <li><a href="javascript:void(0)" class="dropOption">日期</a></li>
                        <li><a href="javascript:void(0)" class="dropOption">课时</a></li>
                        <li><a href="javascript:void(0)" class="dropOption">所有</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9 col-sm-9">
                <div>
                    <div class="col-md-3 col-sm-3">
                        <input id="search_info" type="text" class="form-control"
                               placeholder="N8106/20200401/12">
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
                <table id="buildingList" class="table table-striped table-hover" >
                    <thead>
                    <tr>
                        <th style="display: none">课时号</th>
                        <th>教室编号</th>
                        <th>课程号</th>
                        <th>课程名称</th>
                        <th>课时日期</th>
                        <th>课时节次</th>
                        <th>任课老师</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- 添加课程信息模态框 -->
<div id="add_modal" class="modal fade" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="add_build_able">添加课时记录</h4>
            </div>
            <div class="modal-body">
                <!-- 添加库存信息模态框的内容 -->
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-8 col-sm-8">
                        <form class="form-horizontal" role="form" id="add_build_form"
                              style="margin-top: 25px">
                            <div class="form-group" id="insert_ClassId_div">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课时编号：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_classId"
                                           name="insert_classId" placeholder="如：200401NX0896">
                                </div>
                            </div>
                            <div class="form-group" id="insert_classroomId_div">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>教室编号：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_classroomId"
                                           name="insert_classId" placeholder="如：N8103">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课程号：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_courseId"
                                           name="insert_courseId" placeholder="如：NX10032">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课程名称：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_courseName"
                                           name="insert_courseName" placeholder="如：农业基础">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课时日期：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_classDate"
                                           name="insert_classDate" placeholder="如：20200401">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课时节次：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_classTime"
                                           name="insert_classDate" placeholder="如：12">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>任课老师：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_teacherName"
                                           name="insert_classTime" placeholder="如：张三">
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

<!-- 更新课时信息模态框 -->
<div id="update_modal" class="modal fade" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="update_build_able">更新课时记录</h4>
            </div>
            <div class="modal-body">
                <!-- 添加库存信息模态框的内容 -->
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-8 col-sm-8">
                        <form class="form-horizontal" role="form" id="update_build_form"
                              style="margin-top: 25px">
                            <div class="form-group" id="">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课程编号：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_classId"
                                           name="update_classId" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>教室编号：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_classroomId"
                                           name="update_classroomId" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课程号：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_courseId"
                                           name="update_courseId" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课程名称：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_courseName"
                                           name="update_courseName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课时日期：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_classDate"
                                           name="update_classDate" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课时节次：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_classTime"
                                           name="update_classTime" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>任课老师：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_teacherName"
                                           name="update_teacherName" placeholder="">
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
