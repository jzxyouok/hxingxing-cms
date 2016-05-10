// <!-- 提交数据带上下拉选中项的文本 -->
function takeSelectedTxt(selector,data) {
    var selects = ['name','category', 'topic1', 'topic2', 'topic3','salary','salary', 'salaryUnit', 'site']
    $(selector).find('select').each(function(index, el) {
        var self = $(this);
        var thisName = selects[index];
        var thisTxt = self.find("option:selected").text();
        data[thisName] = thisTxt;
    });
    return data;
}

$(function() {
    jsGrid.locale("zh");
    $.getJSON(operaController+'/tagsData', function(tagsData) {
        tagsData.jobType.unshift({id:0,name:""});
        tagsData.jobCategory.unshift({id:0,name:""});
        tagsData.jobTopic.unshift({id:0,name:""});
        tagsData.jobSalary.unshift({id:0,name:""});
        tagsData.jobSalaryUnit.unshift({id:0,name:""});
        tagsData.city.unshift({id:0,name:""});

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
                    item = takeSelectedTxt('.jsgrid-insert-row',item);
                    if(activeBtn){
                        var data = JSON.parse(activeBtn.attr('data-comment'));
                        console.log(data);
                    }
                    item._token=_token;
                    item.uid= data ? data.uid:0;
                    console.log(item);
                    var name = data? data.name:'';
                    var cotact = {name:name};
                    item.contact = cotact ;///*****跑错
                    item.pubStatus=0;
                    //console.log(item);
                    $.post(operaController,item,function(result){
                        $("#unpub").jsGrid("search");
                        //console.log(result);
                        return result;
                    });
                },
                updateItem: function(item) {
                    item = takeSelectedTxt('.jsgrid-edit-row',item);
                    if(activeBtn){
                        var data = JSON.parse(activeBtn.attr('data-comment'));
                        console.log(data);
                    }
                    item._token=_token;
                    item.uid= data ? data.uid:0;
                    item.pubStatus=0;
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
                           pubWant();
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
                        /*return '<a href="#" status-table="unpub" data-comment="" data-toggle="modal" data-target="#pageModal" class="btn btn-default btn-sm openModal" ><i class="icon fa fa-edit"></i></a>';*/
                    },
                    itemTemplate: function(_, item) {
                        return '<a href="#" status-table="unpub" jobWantId="'+item.id+'" data-title="'+item.name+'" data-comment='+(item.contact?JSON.stringify((item.contact)):"[]")+' data-toggle="modal" data-target="#pageModal" class="btn btn-default btn-sm openModal" >'+(item.contact?item.contact.name:'<i class="icon fa fa-edit"></i>')+'</a>';
                    },
                    align: "center",width: 40,sorting: false
                },
                /*{ name: "name", title: "剧名", type: "text", width: 50, validate:{ message: "不能为空或者已经存在", validator: function(value, item) {
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
                }}},*/
                { name: "nameC", title: "职位", type: "select", width: 30, items: tagsData.jobType, valueField: "id", textField: "name" },
                { name: "categoryC", title: "类型", type: "select", width: 30, items: tagsData.jobCategory, valueField: "id", textField: "name" },
                { name:"topicC1",title:"题材1",type:"select",items: tagsData.jobTopic,valueField:"id",textField:"name", width: 30},
                { name:"topicC2",title:"题材2",type:"select",items: tagsData.jobTopic,valueField:"id",textField:"name", width: 30},
                { name:"topicC3",title:"题材3",type:"select",items: tagsData.jobTopic,valueField:"id",textField:"name", width: 30},
                { name:"salaryC",title:"薪资",type:"select",items: tagsData.jobSalary,valueField:"id",textField:"name", width: 30},
                { name:"salaryUnitC",title:"薪资单位",type:"select",items: tagsData.jobSalaryUnit,valueField:"id",textField:"name", width: 30},
//                { name: "provinceC", title: "省", type: "text", width: 30,align: "center" },
                { name: "siteC", title: "期望地点", type:"select", items: tagsData.city,valueField:"id",textField:"name", width: 30},
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

    });
    function setIcheck() {
        $('.table-operation').iCheck({
            checkboxClass: 'icheckbox_flat-blue',
            radioClass: 'iradio_flat-blue'
        });
    }
    var pubWant = function() {
        var selectedItems = [];
        $('.table-operation').each(function(index, el) {
            if ($(this).parent('[class*="icheckbox"]').hasClass("checked")) {
                selectedItems.push($(this).data('id'));
            }
        });
        console.log(selectedItems)
        if(!selectedItems.length){
            alert('请选择名片！');
            return;
        }
        if(!confirm("确定发布这些名片吗?"))
            return;

        $.ajax({
            type: "POST",
            url: operaController+'/pubWant/'+selectedItems,
            data: {_token:_token}
        }).done(function() {
            $("#unpub").jsGrid("search");
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