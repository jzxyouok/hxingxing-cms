function popContactData(name,uname,mobile,company,position) {
    $('#modalTitle').text(name);
    $('#contactName').val(uname);
    $('#contactMobile').val(mobile);
    $('#contactCompany').val(company);
    $('#contactPosition').val(position);
    $('#myModal').modal('');
}
$(function() {
    jsGrid.locale("zh");
    $.getJSON(operaController+'/tagsData', function(tagsData) {
        tagsData.jobCategory.unshift({id:0,name:""});
        tagsData.jobTopic.unshift({id:0,name:""});
        tagsData.startTime.unshift({id:0,name:""});
        tagsData.shootPeriod.unshift({id:0,name:""});

        $("#unpub").jsGrid({
            height: "650px",
            width: "100%",
            filtering: true,
            inserting: true,
            editing: true,
            sorting: true,
            paging: true,
            autoload: true,
            pageSize: 15,
            pageButtonCount: 5,
            pagerContainer: "#unpubPager",
            deleteConfirm: "确定删除吗?",
            controller: {
                loadData: function(filter) {
                    return $.getJSON(operaController+'/indexData/0',filter);
                },
                insertItem: function(item) {
                    item._token=_token;
                    item.pubStatus=0;
                    $.post(operaController,item,function(result){
                        return result;
                    });
                },
                updateItem: function(item) {
                    item._token=_token;
                    return $.ajax({
                        type: "PUT",
                        url: operaController+'/'+item.id,
                        data: item
                    });
                },
                deleteItem: function(item) {
                    item._method='delete';
                    item._token=_token;
                    return $.ajax({
                        type: "POST",
                        url: operaController+'/'+item.id,
                        data: item
                    });
                }
            },
            fields: [
                {headerTemplate: function() {
                    return $("<button>").attr({"type":"button","class":"btn btn-default btn-sm checkbox-toggle"}).html("<i class='fa fa-square-o' title='全选/反全选'></i>");
                    /*return $("<button>").attr({"type":"button","class":"btn btn-default btn-sm"}).html("<i class='fa fa-trash-o' title='删除'></i>")
                            .on("click", function () {
                                deleteSelectedItems();
                            });*/
                    },
                    filterTemplate: function() {
                        // return $("<button>").attr({"type":"button","class":"btn btn-default btn-sm checkbox-toggle"}).html("<i class='fa fa-square-o' title='全选/反全选'></i>");
                    },
                    itemTemplate: function(_, item) {
                        return $("<input>").attr({"type":"checkbox","class":"table-operation","data-id":item.id});
                    },
                    align: "center",width: 40,sorting: false,
                },
                {headerTemplate: function() {
                    return '操作';
                    },
                    itemTemplate: function(_, item) {
                        return '<div class="btn-group">'+
                          '<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'+(item.contact?item.contact.name:'')+' <span class="caret"></span>'+
                          '</button>'+
                          '<ul class="dropdown-menu">'+
                            '<li><a href="#" data-title="'+(item.contact?item.contact.name:'')+'" data-comment="'+(item.contact?JSON.stringify(item.contact):"")+'" data-toggle="modal" data-target="#pageModal" class="openModal"><i class="fa fa-user"></i> 编辑</a></li>'+
                            '<li role="separator" class="divider"></li>'+
                            '<li><a href="#"><i class="fa fa-comment-o"></i> 短信</a></li>'+
                            '<li><a href="#"><i class="fa fa-comments"></i> 推送</a></li>'+
                          '</ul></div>';
                    },
                    align: "center",width: 40,sorting: false,
                },
                { name: "name", title: "剧名", type: "text", width: 50, validate: "required" },
                { name: "invest", title: "总投资", type: "text", width: 50 },
                { name: "categoryC", title: "类型", type: "select", width: 50, items: tagsData.jobCategory, valueField: "id", textField: "name" },
                { name:"topicC1",title:"题材",type:"select",items: tagsData.jobTopic,valueField:"id",textField:"name", width: 50},
                { name: "site", title: "地点", type: "text", width: 50 },
                { name:"startTimeC",title:"开机时间",type:"select",items: tagsData.startTime,valueField:"id",textField:"name", width: 50},
                { name:"periodC",title:"拍摄周期",type:"select",items: tagsData.shootPeriod,valueField:"id",textField:"name", width: 50},
                { name: "runTime", title: "片长", type: "text", width: 50 },
                { name: "outline", title: "剧目介绍", type: "text", width: 50 },
                { name: "producer", title: "制片方", type: "text", width: 50 },
                { name: "creator", title: "主创", type: "text", width: 50 },
                { name: "platform", title: "播放平台", type: "text", width: 50 },
                // {headerTemplate: function() {return '封面';},
                //     itemTemplate: function(_, item) {
                //         return '<img src="'+item.cover+'" style="height: 35px;width: 35px">';
                //     },width: 40,sorting: false,
                // },
                { type: "control", editButton: false }
            ],
            onDataLoaded: function(args) {
                $('.dropdown-toggle').dropdownHover().dropdown();

                /*$('.table-operation').iCheck({
                    checkboxClass: 'icheckbox_flat-blue',
                    radioClass: 'iradio_flat-blue'
                });
                $('.table-operation').on('ifChecked', function(){
                    selectItem($(this).data('id'));
                });
                $('.table-operation').on('ifUnchecked', function(){
                    unselectItem($(this).data('id'));
                });*/

                $(".table-operation").change(function(){
                    // console.log(34)
                    if($(this).is(':checked')){
                        selectItem($(this).data('id'));
                    }else{
                        unselectItem($(this).data('id'));
                    }
                })
                //Enable check and uncheck all functionality
                $(".checkbox-toggle").click(function () {
                    var clicks = $(this).data('clicks');
                    if (clicks) {
                      //Uncheck all checkboxes
                      // $(".table-operation").iCheck("uncheck");
                      $(".table-operation").prop('checked', true)
                      // $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
                    } else {
                      //Check all checkboxes
                      // $(".table-operation").iCheck("check");
                      $(".table-operation").prop('checked', false)
                      // $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
                    }
                    $(this).data("clicks", !clicks);
                });

                $('.openModal').click(function () {
                  rowIndex = $('#unpub .jsgrid-table tbody .jsgrid-edit-row').index($(this).closest('.jsgrid-edit-row'));
                  console.log(rowIndex)
                  var commentData = $.parseJSON($(this).data('comment'));
                  // newsId = $(this).data('newsid');

                    var artTitle = $(this).data('title');
                    $('#modalTitle').text(artTitle);
                    $('#contactName').val(commentData.name);
                    $('#contactMobile').val(commentData.mobile);
                    $('#contactCompany').val(commentData.company);
                    $('#contactPosition').val(commentData.position);
                    $('#myModal').modal('');
                })
            }
        });
        $("#pubed").jsGrid({
            height: "650px",
            width: "100%",
            filtering: true,
            editing: true,
            sorting: true,
            paging: true,
            autoload: true,
            pageSize: 15,
            pageButtonCount: 5,
            pagerContainer: "#pubedPager",
            controller: {
                loadData: function(filter) {
                    return $.getJSON(operaController+'/indexData/1',filter);
                },
                updateItem: function(item) {
                    item._token=_token;
                    return $.ajax({
                        type: "PUT",
                        url: operaController+'/'+item.id,
                        data: item
                    });
                },
                deleteItem: function(item) {
                    item._method='delete';
                    item._token=_token;
                    return $.ajax({
                        type: "POST",
                        url: operaController+'/'+item.id,
                        data: item
                    });
                }
            },
            fields: [
                {headerTemplate: function() {
                    return '联系人';
                    },
                    itemTemplate: function(_, item) {
                        return $("<button>").attr({"type":"button","title":item.contact?item.contact.name:'',"class":"btn btn-default btn-sm",'data-target':'#contactModal','data-toggle':'modal'}).html(item.contact?item.contact.name:'')
                        .on("click", function () {
                            popContactData(item.name,item.contact.name,item.contact.mobile,item.contact.company,item.contact.position);
                        });
                    },
                    align: "center",width: 40,sorting: false,
                },
                {headerTemplate: function() {
                    return '推送';
                    },
                    itemTemplate: function(_, item) {
                        return '<div class="btn-group">'+
                          '<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">推送 <span class="caret"></span>'+
                          '</button>'+
                          '<ul class="dropdown-menu">'+
                            '<li><a href="#">短信</a></li>'+
                            '<li role="separator" class="divider"></li>'+
                            '<li><a href="#">推送</a></li>'+
                          '</ul></div>';
                    },
                    align: "center",width: 40,sorting: false,
                },
                { name: "name", title: "剧名", type: "text", width: 50 },
                { name: "invest", title: "总投资", type: "text", width: 50 },
                { name:"categoryC",title:"类型",type:"select",items: tagsData.jobCategory,valueField:"id",textField:"name", width: 50},
                { name:"topicC1",title:"题材",type:"select",items: tagsData.jobTopic,valueField:"id",textField:"name", width: 50},
                { name: "site", title: "地点", type: "text", width: 50 },
                { name:"startTimeC",title:"开机时间",type:"select",items: tagsData.startTime,valueField:"id",textField:"name", width: 50},
                { name:"periodC",title:"拍摄周期",type:"select",items: tagsData.shootPeriod,valueField:"id",textField:"name", width: 50},
                { name: "runTime", title: "片长", type: "text", width: 50 },
                { name: "outline", title: "剧目介绍", type: "text", width: 50 },
                { name: "producer", title: "制片方", type: "text", width: 50 },
                { name: "creator", title: "主创", type: "text", width: 50 },
                { name: "platform", title: "播放平台", type: "text", width: 50 },
                /*{headerTemplate: function() {return '封面';},
                    itemTemplate: function(_, item) {
                        return item.cover?'<img src="'+item.cover+'" style="height: 35px;width: 35px">':'';
                    },width: 40,sorting: false,
                },*/
                { type: "control", editButton: false,modeSwitchButton: false}
            ],
            onDataLoaded: function(args) {
                $('.dropdown-toggle').dropdownHover().dropdown();
            }
        });
    });
    var selectedItems = [];
 
    var selectItem = function(item) {
        selectedItems.push(item);
    };
 
    var unselectItem = function(item) {
        selectedItems = $.grep(selectedItems, function(i) {
            return i !== item;
        });
    };
 
    var deleteSelectedItems = function() {
        if(!selectedItems.length || !confirm("确定删除吗?"))
            return;
 
        $.ajax({
            type: "POST",
            url: operaController+'/'+selectedItems,
            data: {_method:'delete',_token:_token}
        }).done(function() {
            $.each(selectedItems, function(_, item) {
                $("#unpub").jsGrid("deleteItem", item);
            });
            selectedItems = [];
        });
    };
    $('#pubOpera').click(function(event) {
        // console.log(selectedItems)
        if(!selectedItems.length){
            alert('请选择剧目！');
            return;
        }
        if(!confirm("确定发布这些项目吗?"))
            return;
 
        $.ajax({
            type: "POST",
            url: operaController+'/pubOpera/'+selectedItems,
            data: {_token:_token}
        }).done(function() {
            location.reload();
        });
    });
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        if ($(e.target).attr('href')=='#tab_1') {
            $('#pubOpera').show();
        }else{
            $('#pubOpera').hide();
        }
    });
});