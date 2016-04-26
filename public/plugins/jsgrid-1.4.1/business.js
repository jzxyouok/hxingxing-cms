function writeObj(obj){ 
 var description = ""; 
 for(var i in obj){ 
  var property=obj[i]; 
  description+=i+" = "+property+"\n"; 
 } 
 console.log(description); 
} 
$(function() {
    jsGrid.locale("zh");
    $.getJSON(operaController+'/tagsData', function(tagsData) {
        tagsData.jobCategory.unshift({id:0,name:""});
        tagsData.jobTopic.unshift({id:0,name:""});
        tagsData.jumuStart.unshift({id:0,name:""});
        tagsData.jumuRunTime.unshift({id:0,name:""});

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
                    var uid= $('#uid').val();
                    item._token=_token;
                    uid = uid>0?uid:0;
                    item.uid=uid;
                    item.pubStatus=0;
                    $.post(operaController,item,function(result){
                        return result;
                    });
                },
                updateItem: function(item) {
                    console.log(item);
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
                    return $("<button>").attr({"type":"button","class":"btn btn-primary btn-sm"}).text('发布')
                        .on("click", function () {
                            pubOpera();
                        });
                    },
                    filterTemplate: function() {
                        // return $("<button>").attr({"type":"button","class":"btn btn-default btn-sm checkbox-toggle"}).html("<i class='fa fa-square-o' title='全选/反全选'></i>");
                    },
                    itemTemplate: function(_, item) {
                        return $("<input>").attr({"type":"checkbox","class":"table-operation hide","data-id":item.id});
                    },
                    align: "center",width: 30,sorting: false
                },
                {headerTemplate: function() {return '联系人';},
                    insertTemplate: function() {
                        return '<a href="#" status-table="unpub" data-comment="" data-toggle="modal" data-target="#pageModal" class="btn btn-default btn-sm openModal" ><i class="icon fa fa-edit"></i></a>';
                    },
                    itemTemplate: function(_, item) {
                        return '<a href="#" status-table="unpub" data-title='+item.name+' data-comment='+(item.contact?JSON.stringify((item.contact)):"")+' data-toggle="modal" data-target="#pageModal" class="btn btn-default btn-sm openModal" >'+(item.contact?item.contact.name:'')+'</a>';
                    },
                    align: "center",width: 40,sorting: false
                },
                { name: "name", title: "剧名", type: "text", width: 50, validate:{ message: "不能为空或者已经存在", validator: function(value, item) {
                        var result;
                        if (value=='') {
                            result = false;
                        }else{
                            $.ajax({
                                type: "POST",
                                url : operaController+'/checkOpera',
                                data: {name:value,id:item.id},
                                async:false,
                                success : function(data){
                                    result = data;
                                }
                            });
                        }
                        return result;
                    }}},
                { name: "invest", title: "总投资", type: "text", width: 30 },
                { name: "categoryC", title: "类型", type: "select", width: 30, items: tagsData.jobCategory, valueField: "id", textField: "name" },
                { name:"topicC1",title:"题材",type:"select",items: tagsData.jobTopic,valueField:"id",textField:"name", width: 30},
                { name: "site", title: "地点", type: "text", width: 30 },
                { name:"startTimeC",title:"开机时间",type:"select",items: tagsData.jumuStart,valueField:"id",textField:"name", width: 30},
                { name:"periodC",title:"拍摄周期",type:"select",items: tagsData.jumuRunTime,valueField:"id",textField:"name", width: 30},
                { name: "runTime", title: "片长", type: "text", width: 30 },
                { name: "outline", title: "剧目介绍", type: "textarea", width: 140,height:1 },
                { name: "producer", title: "制片方", type: "text", width: 30 },
                { name: "creator", title: "主创", type: "text", width: 30 },
                { name: "platform", title: "播放平台", type: "text", width: 30 },
                // {headerTemplate: function() {return '封面';},
                //     itemTemplate: function(_, item) {
                //         return '<img src="'+item.cover+'" style="height: 35px;width: 35px">';
                //     },width: 40,sorting: false,
                // },
                { type: "control", editButton: false,deleteButton:manageRole }
            ],
            onDataLoaded: function(args) {
                setIcheck();
            },
            onRefreshed: function(args) {
                setIcheck();
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
                {headerTemplate: function() {return '联系人';},
                    itemTemplate: function(_, item) {
                        return '<a href="#" status-table="unpub" data-title='+item.name+' data-comment='+(item.contact?JSON.stringify((item.contact)):"")+' data-toggle="modal" data-target="#pageModal" class="btn btn-default btn-sm openModal">'+(item.contact?item.contact.name:'')+'</a>';
                    },
                    align: "center",width: 40,sorting: false
                },
                { name: "name", title: "剧名", type: "text", width: 50 },
                { name: "invest", title: "总投资", type: "text", width: 30 },
                { name:"categoryC",title:"类型",type:"select",items: tagsData.jobCategory,valueField:"id",textField:"name", width: 30},
                { name:"topicC1",title:"题材",type:"select",items: tagsData.jobTopic,valueField:"id",textField:"name", width: 30},
                { name: "site", title: "地点", type: "text", width: 30 },
                { name:"startTimeC",title:"开机时间",type:"select",items: tagsData.jumuStart,valueField:"id",textField:"name", width: 30},
                { name:"periodC",title:"拍摄周期",type:"select",items: tagsData.jumuRunTime,valueField:"id",textField:"name", width: 30},
                { name: "runTime", title: "片长", type: "text", width: 30 },
                { name: "outline", title: "剧目介绍", type: "textarea", width: 140,row:3 },
                { name: "producer", title: "制片方", type: "text", width: 30 },
                { name: "creator", title: "主创", type: "text", width: 30 },
                { name: "platform", title: "播放平台", type: "text", width: 30 },
                /*{headerTemplate: function() {return '封面';},
                    itemTemplate: function(_, item) {
                        return item.cover?'<img src="'+item.cover+'" style="height: 35px;width: 35px">':'';
                    },width: 40,sorting: false,
                },*/
                { type: "control", editButton: false,deleteButton:manageRole,modeSwitchButton: false}
            ],
            onDataLoaded: function(args) {
                $('.dropdown-toggle').dropdownHover().dropdown();
            }
        });
    });
    function setIcheck() {
        $('.table-operation').iCheck({
          checkboxClass: 'icheckbox_flat-blue',
          radioClass: 'iradio_flat-blue'
        });
    }
    var pubOpera = function() {
        var selectedItems = [];
        $('.table-operation').each(function(index, el) {
            if ($(this).parent('[class*="icheckbox"]').hasClass("checked")) {
                selectedItems.push($(this).data('id'));
            }
        });
        console.log(selectedItems)
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
            $("#unpub").jsGrid("search");
            $("#pubed").jsGrid("search");
        });
    };

    $('#pushBtn').click(function(event) {
        var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        var mobileFinal = $('input[name="mobileFinal"]:checked').val();
        mobile = $('#'+mobileFinal+'Mobile');
        if(!myreg.test(mobile.val())) { 
            alert('请输入有效的手机号码！'); 
            mobile.select();
            return false; 
        }
        
        var self = $(this);
        var msgBox = self.next();
        if (confirm('确定发送吗？')) {
          statusTable = self.attr('status-table');
          pushType = $('input[name="pushType"]:checked').val();
          uid = $('#uid').val();
          // content = $('#msgTpl').val()+$('#msgInput').val();
          content = $('#msgInput').val();
          console.log({pushType:pushType,uid:uid,mobile:mobile.val(),content:'123'})
          if (uid>0) {
            $.ajax({
                type: "post",
                url: operaController+'/pushMsg',
                data: {pushType:pushType,uid:uid,mobile:mobile.val(),content:content},
                beforeSend: function( xhr ) {
                    self.prop('disabled', true);
                    msgBox.text('发送中...').removeClass('alert-success').removeClass('alert-warning').addClass('alert-info').show();
                },
                error: function( xhr ) {
                    msgBox.text('发送失败').removeClass('alert-success').removeClass('alert-info').addClass('alert-warning').show();
                },
                complete: function( xhr ) {
                    self.prop('disabled', false);
                }
            }).done(function(data) {
                msgBox.text('已发送！').removeClass('alert-warning').removeClass('alert-info').addClass('alert-success').show();
            });
          }
        }
    })
});