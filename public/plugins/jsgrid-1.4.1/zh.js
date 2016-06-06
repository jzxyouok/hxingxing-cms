(function(jsGrid) {

    jsGrid.locales.zh = {
        grid: {
            noDataContent: "没有数据",
            deleteConfirm: "你确定 ?",
            pagerFormat: "{first} {prev} {pages} {next} {last} &nbsp;&nbsp; {pageIndex} / {pageCount}",
            pagePrevText: "<",
            pageNextText: ">",
            pageFirstText: "<<",
            pageLastText: ">>",
            loadMessage: "加载...",
            invalidMessage: "请检查输入!"
        },

        loadIndicator: {
            message: "加载中..."
        },

        fields: {
            control: {
                searchModeButtonTooltip: "搜索",
                insertModeButtonTooltip: "添加条目",
                editButtonTooltip: "变化",
                deleteButtonTooltip: "抹去",
                searchButtonTooltip: "发现",
                clearFilterButtonTooltip: "抹去",
                insertButtonTooltip: "添加",
                updateButtonTooltip: "保存",
                cancelEditButtonTooltip: "取消"
            }
        },

        validators: {
            required: { message: "必填字段" },
            rangeLength: { message: "字段值的长度是所定义的范围之外" },
            minLength: { message: "该字段值太长" },
            maxLength: { message: "该字段值太短" },
            pattern: { message: "字段值不对应于所述定义的配置" },
            range: { message: "该字段值定义的范围之外" },
            min: { message: "该字段值过大" },
            max: { message: "该字段值太小" }
        }
    };

}(jsGrid, jQuery));

