var mobileReg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;

// <!-- 提交数据带上下拉选中项的文本 -->
function takeSelectedTxt(selector,data) {
    var selects = ['category', 'topic1', 'topic2', 'topic3', 'site', 'startTime', 'period']
    $(selector).find('select').each(function(index, el) {
        var self = $(this);
        var thisName = selects[index];
        var thisTxt = self.find("option:selected").text();
        data[thisName] = thisTxt;
    });
    return data;
}

function renderJobForm(tagsData) {
    var jobFormHtml = '';
    var fieldArr = ['nameC','descrip','role','styleC1','styleC2','styleC3','height','age','weight','salaryC','salaryUnitC','roleDescrip'];
    var labelArr = ['职位名','角色说明','角色名','演艺风格1','演艺风格2','演艺风格3','身高','年龄','体重','薪资','薪资单位','岗位说明'];
    var tagsArr = ['jobType','','','jobStyle','jobStyle','jobStyle','jobHeight','jobAge','jobWeight','jobSalary','jobSalaryUnit',''];
    for (var i = 0; i < fieldArr.length; i++) {
        jobFormHtml += '<div class="form-group">'+
            '<label class="col-md-3 control-label">'+labelArr[i]+'</label><div class="col-md-8">';

        if($.inArray(fieldArr[i],['nameC','salaryC','salaryUnitC','styleC1','styleC2','styleC3','height','age','weight'])>=0){
            jobFormHtml += '<select name="'+fieldArr[i]+'" class="form-control">';
            var optionArray = tagsData[tagsArr[i]];
            //console.log(optionArray);
            if (optionArray!=undefined) {
                for(var j= 0;j < optionArray.length;j++){
                    jobFormHtml += '<option value="'+optionArray[j].id+'">'+optionArray[j].name+'</option>';
                }
            }
            jobFormHtml +='</select>';

        }else if($.inArray(fieldArr[i],['descrip','role'])>=0){
            jobFormHtml += '<input type="text" class="form-control" name="'+fieldArr[i]+'">';
        }else{
            jobFormHtml += '<textarea class="form-control" rows="2" name="'+fieldArr[i]+'"></textarea>';
        }
        jobFormHtml +='</div></div>';
    }
    $('#jobForm #elements').html(jobFormHtml);
}

$(function() {
    jsGrid.locale("zh");
    $.getJSON(operaController+'/tagsData', function(tagsData) {
        tagsData.jobCategory.unshift({id:0,name:""});
        tagsData.jobTopic.unshift({id:0,name:""});
        tagsData.jumuStart.unshift({id:0,name:""});
        tagsData.jumuRunTime.unshift({id:0,name:""});
        tagsData.city.unshift({id:0,name:""});
        tagsData.jobType.unshift({id:0,name:""});
        tagsData.jobSalary.unshift({id:0,name:""});
        tagsData.jobSalaryUnit.unshift({id:0,name:""});
        tagsData.jobStyle.unshift({id:0,name:""});
        tagsData.jobHeight.unshift({id:0,name:""});
        tagsData.jobAge.unshift({id:0,name:""});
        tagsData.jobWeight.unshift({id:0,name:""});

        renderJobForm(tagsData);

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
                    item.pubStatus=0;
                    item = takeSelectedTxt('.jsgrid-insert-row',item);
                    // console.log(item)
                    $.ajax({
                        type: "POST",
                        url: operaController,
                        data: item,
                        async:false,
                        success : function(result){
                            result = JSON.parse(result);
                            item.id = result.id;
                            return item;
                        }
                    });
                },
                updateItem: function(item) {
                    item._token=_token;
                    item = takeSelectedTxt('.jsgrid-edit-row',item);
                    console.log(item)
                    $.ajax({
                        type: "PUT",
                        url: operaController+'/'+item.id,
                        data: item,
                        async:false,
                        success : function(data1){
                            // console.log(data1);
                            if(data1.name != item.name){
                                alert('剧名已存在！');
                            }
                            result = data1;
                        }
                    });
                    return result;
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
                        return $("<input>").attr({"type":"checkbox","class":"table-operation hide tabOperaId","data-id":item.id});
                        //return '<input type="checkbox" class="table-operation hide tabOperaId" data-id="'+item.id+'"/>';

                    },
                    align: "center",width: 30,sorting: false
                },
                {headerTemplate: function() {return '联系人';},
                    insertTemplate: function(_, item) {
                       //return '<a href="#" status-table="unpub" data-comment="" data-toggle="modal" data-target="#pageModal" class="btn btn-default btn-sm openContact" ><i class="icon fa fa-edit"></i></a>';
                        //return '<a href="#" status-table="unpub" data-title='+item.name+' data-comment='+(item.contact?JSON.stringify((item.contact)):"")+' data-toggle="modal" data-target="#pageModal" class="btn btn-default btn-sm openContact" >'+(item.contact?item.contact.name:'<i class="icon fa fa-edit"></i>')+'</a>';

                    },
                    itemTemplate: function(_, item) {
                        return '<a href="#" status-table="unpub" data-title='+item.name+' data-comment='+(item.contact?JSON.stringify((item.contact)):"[]")+' data-toggle="modal" data-target="#pageModal" class="btn btn-default btn-sm openContact" >'+(item.contact?item.contact.name:'<i class="icon fa fa-edit"></i>')+'</a>';
                    },
                    align: "center",width: 40,sorting: false
                },
                { name: "name", title: "剧名", type: "text", width: 50/*, validate:{ message: "不能为空或者已经存在", validator: function(value, item) {
                        console.log(value,item);
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
                    }}*/},
                { name: "invest", title: "总投资", type: "number", width: 30 },
                { name: "categoryC", title: "类型", type: "select", width: 50, items: tagsData.jobCategory, valueField: "id", textField: "name" },
                { name:"topicC1",title:"题材1",type:"select",items: tagsData.jobTopic,valueField:"id",textField:"name", width: 50},
                { name:"topicC2",title:"题材2",type:"select",items: tagsData.jobTopic,valueField:"id",textField:"name", width: 50},
                { name:"topicC3",title:"题材3",type:"select",items: tagsData.jobTopic,valueField:"id",textField:"name", width: 50},
                { name: "siteC", title: "地点", type:"select",class:"chosen-select",items: tagsData.city,valueField:"id",textField:"name", width: 50},
                { name:"startTimeC",title:"开机时间",type:"select",items: tagsData.jumuStart,valueField:"id",textField:"name", width: 50},
                { name:"periodC",title:"拍摄周期",type:"select",items: tagsData.jumuRunTime,valueField:"id",textField:"name", width: 50},
                { name: "runTime", title: "片长", type: "text", width: 30 },
                { name: "outline", title: "剧目介绍", type: "textarea", width: 140,height:1 },
                { name: "producer", title: "制片方", type: "text", width: 40 },
                { name: "creator", title: "主创", type: "text", width: 40 },
                { name: "platform", title: "播放平台", type: "text", width: 40 },
                // {headerTemplate: function() {return '封面';},
                //     itemTemplate: function(_, item) {
                //         return '<img src="'+item.cover+'" style="height: 35px;width: 35px">';
                //     },width: 40,sorting: false,
                // },
                {headerTemplate: function() {return '职位发布';},
                    insertTemplate: function() {
                        //return '<a href="#" status-table="unpub" data-comment="" data-toggle="modal" data-target="#pageModal" class="btn btn-default btn-sm openJobs" >新增<i class="icon fa fa-edit"></i></a>';
                    },
                    itemTemplate: function(_, item) {
                        return '<a href="#" status-table="unpub" data-title='+item.name+' data-comment='+(item.jobs?JSON.stringify((item.jobs)):"[]")+' data-toggle="modal" data-target="#jobsModal" class="btn btn-default btn-sm openJobs" >'+(item.jobs&&item.jobs.length>0?item.jobs.length:'<i class="icon fa fa-edit"></i>')+'</a>';
                    },
                    align: "center",width: 40,sorting: false
                },
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
                {headerTemplate: function() {return '联系人';},
                    itemTemplate: function(_, item) {
                        return '<a href="#" status-table="unpub" data-title='+item.name+' data-comment='+(item.contact?JSON.stringify((item.contact)):"")+' data-toggle="modal" data-target="#pageModal" class="btn btn-default btn-sm openContact">'+(item.contact?item.contact.name:'')+'</a><input type="hidden" class="tabOperaId" data-id="'+item.id+'">';
                    },
                    align: "center",width: 40,sorting: false
                },
                { name: "name", title: "剧名", type: "text", width: 50 },

                { name: "invest", title: "总投资", type: "number", width: 30 },
                { name: "categoryC", title: "类型", type: "select", width: 50, items: tagsData.jobCategory, valueField: "id", textField: "name" },
                { name:"topicC1",title:"题材1",type:"select",items: tagsData.jobTopic,valueField:"id",textField:"name", width: 50},
                { name:"topicC2",title:"题材2",type:"select",items: tagsData.jobTopic,valueField:"id",textField:"name", width: 50},
                { name:"topicC3",title:"题材3",type:"select",items: tagsData.jobTopic,valueField:"id",textField:"name", width: 50},
                { name: "siteC", title: "地点", type:"select",class:"chosen-select",items: tagsData.city,valueField:"id",textField:"name", width: 50},
                { name:"startTimeC",title:"开机时间",type:"select",items: tagsData.jumuStart,valueField:"id",textField:"name", width: 50},
                { name:"periodC",title:"拍摄周期",type:"select",items: tagsData.jumuRunTime,valueField:"id",textField:"name", width: 50},
                { name: "runTime", title: "片长", type: "text", width: 30 },
                { name: "outline", title: "剧目介绍", type: "textarea", width: 140,height:1 },
                { name: "producer", title: "制片方", type: "text", width: 40 },
                { name: "creator", title: "主创", type: "text", width: 40 },
                { name: "platform", title: "播放平台", type: "text", width: 40 },
                {headerTemplate: function() {return '封面';},
                    itemTemplate: function(_, item) {
                        return item.cover?'<img src="'+serverUrl+item.cover+'" style="height: 35px;width: 35px">':'';
                    },width: 40,sorting: false,
                },
                {headerTemplate: function() {return '职位发布';},
                    itemTemplate: function(_, item) {
                        return '<a href="#" status-table="unpub" data-title='+item.name+' data-comment='+(item.jobs?JSON.stringify((item.jobs)):"")+' data-toggle="modal" data-target="#jobsModal" class="btn btn-default btn-sm openJobs" >'+(item.jobs&&item.jobs.length>0?item.jobs.length:'<i class="icon fa fa-edit"></i>')+'</a>';
                    },
                    align: "center",width: 40,sorting: false
                },
                { type: "control", editButton: false,deleteButton:manageRole,modeSwitchButton: false}
            ],
            onDataLoaded: function(args) {
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

    $('.pubMan').click(function(event) {
        var self = $(this);
        var mobile = self.prev().find('input');
        if(!mobileReg.test(mobile.val())) {
            alert('请输入有效的手机号码！');
            mobile.select();
            return false;
        }

        if(confirm('确定以这个号码发布招聘信息？')){
            alert('发布成功\n初始密码为123456，请尽快修改。');
            var isPubed = self.attr('isPubed');
            console.log('isPubed:'+isPubed);
            $('#contactForm').find('#hidden').append('<input type="hidden" name="isPubed" value="'+isPubed+'"/>');
            $('.pubMan').val('已发布').prop('disabled', true);
        }

//        var uid = $('#uid').val();
//        if (uid>0) {
//            if (confirm('确定创建这个人吗？')) {
//
//                $.ajax({
//                    type: "post",
//                    url: personController+'/pubMan',
//                    data: {mobile:mobile.val(),uid:uid},
//                    error: function( xhr ) {
//                        alert('出错了');
//                    },
//                    /*complete: function( xhr ) {
//                        alert('发布成功\n初始密码为123456，请尽快修改。');
//                        self.prop('disabled', false);
//                    }*/
//                }).done(function(data) {
//                    if (data) {
//                        alert('发布成功\n初始密码为123456，请尽快修改。');
//                        $('.pubMan').text('已发布').prop('disabled', true);
//                    }else{
//                        alert('出错了');
//                    }
//                });
//            }
//        }
    })

    $('#search').on('keyup',function(e){
        //console.log(e.keyCode);
        var mobile = $(this).val();
        if(e.keyCode == 13 && mobile.length == 11 ){
            //console.log(mobile.val());
            if(!mobileReg.test(mobile)) {
                alert('请输入有效的手机号码！');
                return false;
            }
            $.ajax({
                type: "POST",
                url: searchMobileController,
                data: {mobile:mobile}
            }).done(function(result) {//联系人操作
                if(result){
                    $('#uid').val(result.uid);
                    $('#isPubed').val(result.isPubed);
                    $('#contactName').val(result.name);
                    $('#fakeName').val(result.fakeName);
                    $('#fakeMobile').val(result.fakeMobile);
                    $('#realMobile').val(result.mobile);
                    $('#contactCompany').val(result.company);
                    $('#contactPosition').val(result.position);
                    $('#otherName').val(result.otherName);
                    $('#otherMobile').val(result.otherMobile);
                    $('#otherCompany').val(result.otherCompany);
                    $('#remark').val(result.remark);
                    if (result.isPubed==0) {
                        $('.pubMan').val('发布').prop('disabled', false);
                    }else{
                        $('.pubMan').val('已发布').prop('disabled', true);
                    }
                }else{
                    alert('搜索的号码不存在!');
                }

            });
        }
    })
});