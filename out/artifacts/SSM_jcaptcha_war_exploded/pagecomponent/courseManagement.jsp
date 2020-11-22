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
            } else if (type == "教师姓名") {
                $("#search_input_type").removeAttr("readOnly");
                search_type_storage = "searchByTeacherName";
            } else if (type == "学院") {
                $("#search_input_type").removeAttr("readOnly");
                search_type_storage = "searchByCollege";
            } else if (type = "授课地址") {
                $("#search_input_type").removeAttr("readOnly");
                search_type_storage = "searchByAddress";
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
            url: 'findCourse.do',
            data: {
                searchInfo: searchInfo,
				searchCourseType: search_type_storage
            },
            success: function (list) {
                var html = "";
                $("#buildingList tbody").html("");
                for (var i = 0; i < list.length; i++) {
                    html = "<tr>"
                        + "<td style=\"display: none\">" + list[i].courseId + "</td>"
                        + "<td>" + list[i].courseName + "</td>"
                        + "<td>" + list[i].courseTeacher + "</td>"
                        + "<td>" + list[i].courseCollege + "</td>"
                        + "<td>" + list[i].courseKind + "</td>"
                        + "<td>" + list[i].courseCredits + "</td>"
                        + "<td>" + list[i].courseAddress + "</td>"
                        + "<td>" + list[i].courseBook + "</td>"
                        + "<td>" + list[i].courseInfo + "</td>"
                        + "<td>" + '<a href="#" onclick="deleteCourse(\'' + list[i].classId + '\')">删除</a>'
                        + "  "
                        + '<a href="#" onclick="showUpdateInputAlert(' +
                        '\'' + list[i].courseId + '\',' +
                        '\'' + list[i].courseName + '\',' +
                        '\'' + list[i].courseTeacher + '\',' +
                        '\'' + list[i].courseCollege + '\',' +
                        '\'' + list[i].courseKind + '\',' +
                        '\'' + list[i].courseCredits + '\',' +
                        '\'' + list[i].courseAddress + '\',' +
                        '\'' + list[i].courseBook + '\',' +
                        '\'' + list[i].courseInfo + '\')">修改</a>' + "</td>"
                        + "</tr>";
                    $("#buildingList tbody").append(html);
                }
            },
            error: function (response) {
            }
        })
    }

    /**
     * 删除课程数据
     *
     * @param courseId 课程的ID
     * @returns {boolean}
     */
    function deleteCourse(courseId) {
        var msg = "您真的确定要删除吗？\n\n请确认！";
        if (confirm(msg) == true) {
            $.ajax({
                url: 'deleteCourse.do',
                data: {
                    courseId: courseId
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
     * 插入课程信息
     */
    function insertCourseMessage() {
        var courseId = $('#insert_courseId').val();
        var courseName = $('#insert_courseName').val();
        var courseTeacher = $('#insert_courseTeacher').val();
        var courseCollege = $('#insert_courseCollege').val();
        var courseKind = $('#insert_courseKind').val();
        var courseCredits = $('#insert_courseCredits').val();
        var courseAddress = $('#insert_courseAddress').val();
        var courseBook = $('#insert_courseBook').val();
        var courseInfo = $('#insert_courseInfo').val();

        $.ajax({
            url: 'insertCourse.do',
            data: {
                courseId: courseId,
                courseName: courseName,
                courseTeacher: courseTeacher,
                courseCollege: courseCollege,
                courseKind: courseKind,
                courseCredits: courseCredits,
                courseAddress: courseAddress,
                courseBook: courseBook,
                courseInfo: courseInfo
            },
            success: function (list) {
                $('#add_modal').modal("hide");
                confirm(list);
                cleanCourseInput();
                afterSearchShow();
            },
            error: function () {

            }
        })
    }

    /**
     * 显示更新信息框
     */
    function showUpdateInputAlert(courseId, courseName, courseTeacher, courseCollege, courseKind, courseCredits,
                                  courseAddress, courseBook, courseInfo) {
        alert(courseId + courseName + courseTeacher + courseCollege + courseKind + courseCredits +
            courseAddress + courseBook + courseInfo);
        $('#update_modal').modal("show");

        $('#update_courseId').val(courseId);
        // $('#insert_courseId_div').modal("hide");
        $('#update_courseName').val(courseName);
        $('#update_courseTeacher').val(courseTeacher);
        $('#update_courseCollege').val(courseCollege);
        $('#update_courseKind').val(courseKind);
        $('#update_courseCredits').val(courseCredits);
        $('#update_courseAddress').val(courseAddress);
        $('#update_courseBook').val(courseBook);
        $('#update_courseInfo').val(courseInfo);
    }

    /**
     * 修改课程信息
     */
    function updateCourseMessage() {

        var courseId = $('#update_courseId').val();
        // $('#insert_courseId_div').modal("hide")
        var courseName = $('#update_courseName').val();
        var courseTeacher = $('#update_courseTeacher').val();
        var courseCollege = $('#update_courseCollege').val();
        var courseKind = $('#update_courseKind').val();
        var courseCredits = $('#update_courseCredits').val();
        var courseAddress = $('#update_courseAddress').val();
        var courseBook = $('#update_courseBook').val();
        var courseInfo = $('#update_courseInfo').val();
        $.ajax({
            url: 'updateCourse.do',
            data: {
                courseId: courseId,
                courseName: courseName,
                courseTeacher: courseTeacher,
                courseCollege: courseCollege,
                courseKind: courseKind,
                courseCredits: courseCredits,
                courseAddress: courseAddress,
                courseBook: courseBook,
				courseInfo: courseInfo
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
    function cleanCourseInput() {
        $('#insert_courseId').val("");
        $('#insert_courseName').val("");
        $('#insert_courseTeacher').val("");
        $('#insert_courseCollege').val("");
        $('#insert_courseKind').val("");
        $('#insert_courseCredits').val("");
        $('#insert_courseAddress').val("");
		$('#insert_courseBook').val("");
		$('#insert_courseInfo').val("");
    }
</script>

<!-- 主界面显示 -->
<div class="panel panel-default">
    <ol class="breadcrumb">
        <li>课程管理</li>
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
                        <li><a href="javascript:void(0)" class="dropOption">授课地址</a></li>
                        <li><a href="javascript:void(0)" class="dropOption">学院</a></li>
                        <li><a href="javascript:void(0)" class="dropOption">教师姓名</a></li>
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
                <table id="buildingList" class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th style="display: none">课程编号</th>
                        <th>课程名称</th>
                        <th>任课教师</th>
                        <th>归属学院</th>
                        <th>课程属性</th>
                        <th>学分</th>
                        <th>授课地址</th>
                        <th>教材</th>
						<th>课程简介</th>
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
                <h4 class="modal-title" id="add_build_able">添加课程记录</h4>
            </div>
            <div class="modal-body">
                <!-- 添加库存信息模态框的内容 -->
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-8 col-sm-8">
                        <form class="form-horizontal" role="form" id="add_build_form"
                              style="margin-top: 25px">
                            <div class="form-group" id="insert_courseId_div">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课程编号：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_courseId"
                                           name="insert_courseId" placeholder="如：CKNX20021821">
                                </div>
                            </div>
                            <div class="form-group" id="insert_courseName_div">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课程名称：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_courseName"
                                           name="insert_courseId" placeholder="如：作物学">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>任课教师：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_courseTeacher"
                                           name="insert_courseTeacher" placeholder="如：张天泽">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>归属学院：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_courseCollege"
                                           name="insert_courseCollege" placeholder="如：农学院">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课程属性：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_courseKind"
                                           name="insert_courseKind" placeholder="如：选修/必修">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>学分：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_courseCredits"
                                           name="insert_courseCredits" placeholder="如：2.5">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>授课地址：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="insert_courseAddress"
                                           name="insert_courseAddress" placeholder="如：N8106">
                                </div>
                            </div>
							<div class="form-group">
								<label for="" class="control-label col-md-4 col-sm-4"> <span>教材：</span>
								</label>
								<div class="col-md-8 col-sm-8">
									<input type="text" class="form-control" id="insert_courseBook"
										   name="insert_courseBook" placeholder="如：《作物学基础》">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="control-label col-md-4 col-sm-4"> <span>课程简介：</span>
								</label>
								<div class="col-md-8 col-sm-8">
									<input type="text" class="form-control" id="insert_courseInfo"
										   name="insert_courseInfo" placeholder="如：学习作物的生长各个环节...">
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
                <button class="btn btn-success" type="button" id="add_modal_submit" onclick="insertCourseMessage()">
                    <span>提交</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 更新课程信息模态框 -->
<div id="update_modal" class="modal fade" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="update_build_able">更新课程记录</h4>
            </div>
            <div class="modal-body">
                <!-- 添加库存信息模态框的内容 -->
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-8 col-sm-8">
                        <form class="form-horizontal" role="form" id="update_build_form"
                              style="margin-top: 25px">
                            <div class="form-group" id="">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课程序号：</span>
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
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>任课老师：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_courseTeacher"
                                           name="update_courseTeacher" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>学分：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_courseCredits"
                                           name="update_courseCredits" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>归属学院：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_courseCollege"
                                           name="update_courseCollege" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课程属性：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_courseKind"
                                           name="update_courseKind" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>上课地点：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_courseAddress"
                                           name="update_courseAddress" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>教材：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_courseBook"
                                           name="update_courseBook" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>课程简介：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="update_courseInfo"
                                           name="update_courseInfo" placeholder="">
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
                <button class="btn btn-success" type="button" id="update_modal_submit" onclick="updateCourseMessage()">
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
