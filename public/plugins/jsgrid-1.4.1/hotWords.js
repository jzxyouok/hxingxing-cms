$(function() {
    jsGrid.locale("zh");
    $("#pubed").jsGrid({
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
        pagerContainer: "#pubedPager",
        deleteConfirm: "确定删除吗?",
        controller: {
            loadData: function(filter) {
                return $.getJSON(hotWordsController+'/indexData',filter);
            },
            insertItem: function(item) {
                item.pubStatus=0;
                // console.log(item)
                $.ajax({
                    type: "POST",
                    url: hotWordsController,
                    data: item,
                    async:false,
                    success : function(result){
                        $("#pubed").jsGrid("search");
                        result = JSON.parse(result);
                        item.id = result.id;
                        return item;
                    }
                });
            },
            updateItem: function(item) {
                item._token=_token;
                $.ajax({
                    type: "PUT",
                    url: hotWordsController+'/'+item.id,
                    data: item,
                    async:false,
                    success : function(data1){
                        $("#pubed").jsGrid("search");
                        result = data1;
                    },
                    error:function(data) {
                        alert('出错了');
                        result = false;
                    }
                });
                return result;
            },
            deleteItem: function(item) {
                item._method='delete';
                item._token=_token;
                return $.ajax({
                    type: "POST",
                    url: hotWordsController+'/'+item.id,
                    data: item
                });
            }
        },
        fields: [
            { name: "word", title: "词语", type: "text"},
            { name: "type", title: "类型", type: "select", items: [{ name: "", id: '' },{ name: "剧目", id: 'operas' },{ name: "演职位", id: 'jobs' }], valueField: "id", textField: "name" },
            { type: "control", editButton: false }
        ],
    });
});