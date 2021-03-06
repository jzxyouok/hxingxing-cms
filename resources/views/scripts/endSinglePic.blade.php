        {{-- SinglePic --}}
        $('.uploadPic').click(function(){
            var ele = $(this).data('id');
            $.layer({
                    type : 2,
                    shade: [0.5, '#000',true],
                    border: [0],
                    title: false,
                    closeBtn: false,
                    shadeClose: true,
                    fix: false,
                    iframe : {src: '{{ route('admin.upload') }}?from='+ ele},
                    area : ['600px' , '250px'],
                    offset : ['', ''],
                    success: function(layero){
                        console.log(layero);
                        $(layero['selector'] + ' .xubox_main').css('border-radius','6px');
                        $(layero['selector'] + ' .xubox_iframe').css('border-radius','6px');
                        /*
                        $('#xubox_layer1 .xubox_main').css('border-radius','3px');
                        $('#xubox_layer1 .xubox_iframe').css('border-radius','3px');
                        */
                    },
                    close : function(index){
                        layer.closeAll();
                    },
                    end : function(index){
                        //location.reload();
                    }
                });
        });
        $('.previewPic').hover(function(){
            var ele = $(this).data('id');
            var pic_url = $.trim($('#'+ele).val());
            tmp = '<div style="max-width: 300px;"><img src="{{ url('') }}/' + pic_url + '" width="300" /></div>';
            $('#layerPreviewPic').html(tmp);
            $.layer({
                type : 1,
                title : false,
                fix : false,
                border: [0],
                shade: [0],
                offset:['50px' , ''],
                area : ['300px', 'auto'],
                page : {dom : '#layerPreviewPic'}
            });
        });
