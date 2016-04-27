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
        tagsData.jobType.unshift({id:0,name:""});
        tagsData.jobCategory.unshift({id:0,name:""});
        tagsData.jobTopic.unshift({id:0,name:""});
        tagsData.jobSalary.unshift({id:0,name:""});
        tagsData.jobSalaryUnit.unshift({id:0,name:""});

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
                {   headerTemplate: function() {
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
//                {headerTemplate: function() {return '联系人';},
//                    insertTemplate: function() {
//                        return '<a href="#" status-table="unpub" data-comment="" data-toggle="modal" data-target="#pageModal" class="btn btn-default btn-sm openModal" ><i class="icon fa fa-edit"></i></a>';
//                    },
//                    itemTemplate: function(_, item) {
//                        return '<a href="#" status-table="unpub" data-title='+item.name+' data-comment='+(item.contact?JSON.stringify((item.contact)):"")+' data-toggle="modal" data-target="#pageModal" class="btn btn-default btn-sm openModal" >'+(item.contact?item.contact.name:'<i class="icon fa fa-edit"></i>')+'</a>';
//                    },
//                    align: "center",width: 40,sorting: false
//                },
                { name: "nameC", title: "职位", type: "select", width: 30, items: tagsData.jobType, valueField: "id", textField: "name" },
                { name: "categoryC", title: "类型", type: "select", width: 30, items: tagsData.jobCategory, valueField: "id", textField: "name" },
                { name:"topicC1",title:"题材1",type:"select",width: 30,items: tagsData.jobTopic,valueField:"id",textField:"name" },
                { name:"topicC2",title:"题材2",type:"select",width: 30,items: tagsData.jobTopic,valueField:"id",textField:"name"},
                { name:"topicC3",title:"题材3",type:"select",width: 30,items: tagsData.jobTopic,valueField:"id",textField:"name"},
                { name:"salaryC",title:"薪资",type:"select",width: 30,items: tagsData.jobSalary,valueField:"id",textField:"name"},
                { name:"salaryUnitC",title:"薪资单位",type:"select",width: 30,items: tagsData.salaryUnitC,valueField:"id",textField:"name"}
            ],
            onDataLoaded: function(args) {
                //setIcheck();
            },
            onRefreshed: function(args) {
                //setIcheck();
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