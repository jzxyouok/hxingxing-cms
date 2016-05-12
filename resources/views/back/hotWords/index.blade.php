@extends('layout._back')

@section('content-header')
<link type="text/css" rel="stylesheet" href="../plugins/jsgrid-1.4.1/jsgrid.min.css"/>
<link type="text/css" rel="stylesheet" href="../plugins/jsgrid-1.4.1/jsgrid-theme.min.css" />
<style>
  input,select{border: 1px solid #cccccc;border-radius: 4px;}
  .jsgrid-table{width: 100%!important}
  .jsgrid-pager-container .jsgrid-pager-current-page {background: #c4e2ff;color: #fff;
  }
</style>
@parent

    <ol class="breadcrumb">
      <li><a href="{{ route('admin') }}"><i class="fa fa-dashboard"></i> 主页</a></li>
      <li class="active">热词</li>
    </ol>
@stop

@section('content')
    <div id="pubed"></div>
    <div id="pubedPager"></div>
@stop

@section('extraPlugin')
<!-- jsgrid -->
<script src="{{ asset('plugins/jsgrid-1.4.1/jsgrid.min.js') }}" type="text/javascript"></script>
<script type="text/javascript" src="{{ asset('plugins/jsgrid-1.4.1/zh.js') }}"></script>
<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var hotWordsController = '{{ route("admin.hotWords.index") }}';
    var _token = '{{ csrf_token() }}';
</script>
<script src="{{ asset('plugins/jsgrid-1.4.1/hotWords.js') }}" type="text/javascript"></script>
@stop

@section('filledScript')
@stop