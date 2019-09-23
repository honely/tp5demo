<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:72:"E:\houtai\xiaowu\xiaowu\public/../application/admin\view\shop\index.html";i:1568625845;s:74:"E:\houtai\xiaowu\xiaowu\public/../application/admin\view\index\header.html";i:1567735110;s:74:"E:\houtai\xiaowu\xiaowu\public/../application/admin\view\index\footer.html";i:1567735110;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <title>大城小屋后台管理系统</title>
    <link rel="stylesheet" href="__LAY__/css/layui.css">
    <script src="__PUBLIC__/static/jquery-1.10.2.min.js"></script>
    <script src="__LAY__/layui.js"></script>
	<style>
		.layui-body{
			left:0!important
		}
	</style>
</head>
<body class="layui-layout-body">

<style>
    #pages .layui-laypage-prev {
        padding: 0 12px;
    }
    #pages .layui-laypage-next{
        padding: 0 12px;
    }
    #pages .layui-laypage a{
        border:none;
    }
    #pages .layui-laypage-curr{
        padding: 0 11px;
        height: 24px;
        line-height: 24px;
    }
    #pages .layui-laypage input{
        padding: 0 11px;
        height: 26px;
        line-height: 26px;
    }
    #pages .layui-laypage input, .layui-laypage button{
        padding: 0 11px;
        height: 26px;
        line-height: 26px;
    }
    #pages .layui-laypage select{
        height: 18px;
    }
    em{
        font-style: normal;
    }
    .layui-table td{
        padding: 0px 15px;
        height: 40px !important;
    }
</style>
<div class="layui-body">
    <div style="margin: 20px;">
    <span class="layui-breadcrumb" lay-separator=">">
        <a>商城管理</a>
        <a><cite>商品管理</cite></a>
    </span>
        <div style="float:right;">
            <a href="<?=url('shop/addProduct')?>" class="layui-btn layui-btn-primary layui-btn-sm" ><i class="layui-icon"></i>添加商品</a>
        </div>
    </div>
    <hr/>
    <section class="panel panel-padding" style="padding-top: 10px;padding-left: 10px;">
        <form class="layui-form layui-form-pane1" id="queryForm" >
            <div class="layui-form-item  demoTable">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="text" name="goods_name" value="<?php if(isset($goods_name)): ?><?php echo $goods_name; endif; ?>" placeholder="请输入商品名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="text" value="<?php if(isset($goods_add_date)): ?><?php echo $goods_add_date; endif; ?>" name="goods_add_date" readonly class="layui-input" id="art_createtime"  placeholder="请选择发布时间">
                    </div>
                </div>
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <select name="goods_type" id="sort" lay-filter="bu_p_id">
                            <option value="">商品一级分类</option>
                            <?php if(is_array($sort) || $sort instanceof \think\Collection || $sort instanceof \think\Paginator): $i = 0; $__LIST__ = $sort;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <option value="<?php echo $vo['ss_id']; ?>" <?php if(isset($goods_type)): if($goods_type == $vo['ss_id']): ?>selected<?php endif; endif; ?>><?php echo $vo['ss_title']; ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="goods_sort" id="bu_c_id">
                            <option value="">商品二级分类</option>
                            <?php if(isset($goods_sort)): if(is_array($sorts) || $sorts instanceof \think\Collection || $sorts instanceof \think\Paginator): $i = 0; $__LIST__ = $sorts;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <option value="<?php echo $vo['ss_id']; ?>" <?php if(isset($goods_sort)): if($goods_sort == $vo['ss_id']): ?>selected<?php endif; endif; ?>><?php echo $vo['ss_title']; ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; endif; ?>
                        </select>
                    </div>
                </div>

                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <span class="layui-btn" id="reload">查询</span>
                        <a href="<?=url('shop/index')?>" class="layui-btn layui-btn-warm">刷新</a>
                    </div>
                </div>
            </div>
        </form>
        <form id="upload" action="<?=url('import/import')?>" method="post" enctype="multipart/form-data">
            <input type="file" name="file" id="file" value="导入文件">   <input type="submit"  class="layui-btn" name="submit" value="上传文档" />
        </form>
    </section>
    <section class="panel panel-padding layui-form" >
        <table lay-skin="line" class="layui-table" lay-filter="parse-table-demo" style="padding: 10px;text-align: left;border: 1px;solid-color: #28282c">
            <!--            <colgroup>-->
            <!--                <col width="120">-->
            <!--                <col width="200">-->
            <!--                <col width="200">-->
            <!--                <col width="260">-->
            <!--                <col width="260">-->
            <!--                <col width="160">-->
            <!--                <col width="160">-->
            <!--            </colgroup>-->
            <thead>
            <tr>
                <th></th>
                <th>商品编号</th>
                <th>商品名称</th>
                <th>商品图片</th>
                <th>原价</th>
                <th>折扣价</th>
                <th>分类</th>
                <th>销量</th>
                <th>状态</th>
                <th>是否置顶</th>
                <th>操作时间</th>
                <th>操作人</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <?php if($list == null): ?>
            <tr><td colspan="8" style="text-align: center">暂无内容</td></tr>
            <?php endif; if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$na): $mod = ($i % 2 );++$i;?>
            <tr>
                <td>
                </td>
                <td><?php echo $na['goods_id']; ?></td>
                <td><?php echo $na['goods_name']; ?></td>
                <td><img style="width: 30px;height: 30px;" src="<?php echo $na['goods_img']; ?>"/></td>

                <td><?php echo $na['goods_price']; ?></td>
                <td><?php echo $na['goods_dis_price']; ?></td>
                <td><?php echo $na['goods_sort']; ?></td>
                <td><?php echo $na['goods_sales_num']; ?></td>
                <td><?php echo $na['goods_del_flgs']; ?></td>
                <td>
                    <input type="checkbox" value="<?php echo $na['goods_id']; ?>" <?php if($na['goods_top_flg'] == 1): ?>checked<?php endif; ?> lay-filter="isTop" lay-skin="switch" lay-text="是|否">
                </td>
                <td><?php echo date('Y-m-d H:i:s',$na['goods_change_date']); ?></td>
                <td><?php echo $na['goods_admin']; ?></td>
                <td>
                    <?php if($na['goods_del_flg'] == 2): ?>
                    <button class="layui-btn layui-btn-xs" onclick="onLine(<?php echo $na['goods_id']; ?>)"><i class="layui-icon">&#xe619;</i>上架</button>
                    <button class="layui-btn layui-btn-xs" onclick="editPro(<?php echo $na['goods_id']; ?>)"><i class="layui-icon">&#xe642;</i>编辑</button>
                    <button class="layui-btn layui-btn-xs" onclick="delGoods(<?php echo $na['goods_id']; ?>)"><i class="layui-icon">&#xe640;</i>删除</button>
                    <?php endif; if($na['goods_del_flg'] == 1): ?>
                    <button class="layui-btn layui-btn-xs" onclick="offLine(<?php echo $na['goods_id']; ?>)"><i class="layui-icon">&#xe61a;</i>下架</button>
                    <?php endif; if($na['goods_del_flg'] == 3): endif; ?>
                </td>
            </tr>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
        <div id="pages" style="text-align: left;padding: 7px;"></div>
    </section>
    <script>
        layui.use(['form','layer','laypage','laydate'], function(){
            var form = layui.form,
                laypage = layui.laypage,
                laydate = layui.laydate,
                layer = layui.layer;

            form.on('select(bu_p_id)', function(data){
                var ss_id=data.value;
                $.ajax({
                    type: 'POST',
                    url: "<?=url('shop/getSubSort')?>",
                    data: {ss_id:ss_id},
                    dataType:  'json',
                    success: function(data){
                        var code=data.data;
                        $("#bu_c_id").html("<option value=''>商品二级分类</option>");
                        $.each(code, function(i, val) {
                            var option1 = $("<option>").val(val.ss_id).text(val.ss_title);
                            $("#bu_c_id").append(option1);
                            form.render('select');
                        });
                        $("#bu_c_id").get(0).selectedIndex=0;
                    }
                });
            });
            laydate.render({
                elem: '#art_createtime'
                ,range: true
            });
            laypage.render({
                elem: 'pages'
                ,count: <?php echo $count; ?>
                ,limit: <?php echo $limit; ?>
                ,curr: <?php echo $page; ?>
                ,limits: [10, 20, 30]
                ,prev:'<i class="layui-icon">&#xe603;</i>'
                ,next:'<i class="layui-icon">&#xe602;</i>'
                ,layout: ['prev', 'page', 'next', 'skip','count',  'limit']
                ,jump: function(obj,frist){
                    if(!frist){
                        window.location.href="<?=url('shop/index')?>?page="+obj.curr+"&limit="+obj.limit;
                    }
                }
            });
            //监听指定开关
            form.on('switch(isTop)', function(obj){
                var change = obj.elem.checked;
                if(change){
                    change = 1;
                }else{
                    change = 0;
                }
                //状态表示将要更改成为的状态
                var nav_id = obj.value;
                $.ajax({
                    type:"post",
                    url:"<?=url('shop/goodsTop')?>",
                    dataType: 'json',
                    data:{
                        "change":change,
                        'nav_id':nav_id
                    },
                    success:function (data) {
                        console.log(data);
                        layer.msg(data.msg);
                    },
                    error:function (error) {
                        console.log(error);
                    }
                })
            });
        });
    </script>
    <script type="text/javascript">
        //修改商品，上架的商品不能直接修改，要先下架，然后才能修改
        function editPro(g_id){
            window.location.href='<?=url("shop/stepTwo")?>?g_id='+ g_id;
        }
        //删除商品，上架的商品不能直接删除，要先下架，然后才能删除，删除是软删除，之是前端不显示，不代表数据库数据的实际删除
        function delGoods(g_id){
            layer.confirm('确定删除该商品？删除后不可恢复！', {
                btn : [ '确定', '取消' ]//按钮
            }, function() {
                $.ajax({
                    'type':"get",
                    'url':"<?=url('shop/delProduct')?>",
                    'data':{g_id:g_id},
                    'success':function (result) {
                        if(result.code < 1){
                            layer.msg(result.msg);
                        }else {
                            layer.msg(result.msg);
                            layer.open({
                                title: '信息'
                                ,content: result.msg
                                ,yes: function(index){
                                    layer.close(index);
                                    window.location.href='<?=url("shop/index")?>';
                                }
                                ,cancel:function (index) {
                                    layer.close(index);
                                    window.location.href='<?=url("shop/index")?>';
                                }
                            });
                        }
                    },
                    'error':function () {
                        console.log('error');
                    }
                })
            },function(){
                layer.msg('您已取消该操作！',{
                    time: 2000
                });
            });
        }
        //上架商品，添加或者修改完成的完善的商品，执行上架操作，上架后产品可以在前端显示给用户。
        function onLine(g_id){
            layer.confirm('上架改商品后，用户可以在商城购买！', {
                btn : [ '确定', '取消' ]//按钮
            }, function() {
                $.ajax({
                    'type':"get",
                    'url':"<?=url('shop/onLine')?>",
                    'data':{g_id:g_id},
                    'success':function (result) {
                        if(result.code < 1){
                            layer.msg(result.msg);
                        }else {
                            layer.msg(result.msg);
                            layer.open({
                                title: '信息'
                                ,content: result.msg
                                ,yes: function(index){
                                    layer.close(index);
                                    window.location.href='<?=url("shop/index")?>';
                                }
                                ,cancel:function (index) {
                                    layer.close(index);
                                    window.location.href='<?=url("shop/index")?>';
                                }
                            });
                        }
                    },
                    'error':function () {
                        console.log('error');
                    }
                })
            },function(){
                layer.msg('您已取消该操作！',{
                    time: 2000
                });
            });
        }
        //下架商品，在线上的商品，需要修改或者删除的，先要下架了，才能进行修改和删除的操作。下架后已在前端的显示的商品，前端讲不会再显示
        function offLine(g_id){
            layer.confirm('下架商品后，后台可进行在修改或删除！', {
                btn : [ '确定', '取消' ]//按钮
            }, function() {
                $.ajax({
                    'type':"get",
                    'url':"<?=url('shop/offLine')?>",
                    'data':{g_id:g_id},
                    'success':function (result) {
                        if(result.code < 1){
                            layer.msg(result.msg);
                        }else {
                            layer.msg(result.msg);
                            layer.open({
                                title: '信息'
                                ,content: result.msg
                                ,yes: function(index){
                                    layer.close(index);
                                    window.location.href='<?=url("shop/index")?>';
                                }
                                ,cancel:function (index) {
                                    layer.close(index);
                                    window.location.href='<?=url("shop/index")?>';
                                }
                            });
                        }
                    },
                    'error':function () {
                        console.log('error');
                    }
                })
            },function(){
                layer.msg('您已取消该操作！',{
                    time: 2000
                });
            });
        }

        $('#reload').click(function () {
            var goods_name = $("input[name='goods_name']").val();
            var goods_add_date = $("input[name='goods_add_date']").val();
            var goods_type = $("select[name='goods_type']").val();
            var goods_sort = $("select[name='goods_sort']").val();
                window.location.href='<?=url("shop/index")?>?goods_name='+goods_name+'&goods_add_date='+goods_add_date+'&goods_type='+goods_type+'&goods_sort='+goods_sort;
        });
    </script>
    </div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>