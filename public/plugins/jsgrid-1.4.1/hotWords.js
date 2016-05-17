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
                item._token=_token;
                console.log(item)
                $.ajax({
                    type: "POST",
                    url: hotWordsController,
                    data: item,
                    async:false,
                    success : function(data){
                        $("#pubed").jsGrid("search");
                    }
                });
            },
            updateItem: function(item) {
                item._token=_token;
                console.log(item);
                $.ajax({
                    type: "PUT",
                    url: hotWordsController+'/'+item.id,
                    data: item,
                    async:false,
                    success : function(data){
                        $("#pubed").jsGrid("search");
                    }
                });
            },
            deleteItem: function(item) {
                item._method='delete';
                item._token=_token;
                $.ajax({
                    type: "POST",
                    url: hotWordsController+'/'+item.id,
                    data: item,
                    async:false,
                    success : function(data){
                        $("#pubed").jsGrid("search");
                    }
                });
            }
        },
        fields: [
            { name: "word", title: "词语", type: "text"},
            { name: "type", title: "类型", type: "select", items: [{ name: "", id: '' },{ name: "剧目", id: 'operas' },{ name: "演职位", id: 'jobs' },{ name: "123", id: 'persons' }], valueField: "id", textField: "name" },
            { type: "control", editButton: false }
        ]
    });
});