<%@ Page Language="C#" AutoEventWireup="true" CodeFile="course_detail.aspx.cs" Inherits="course" %>

<%@ Register Src="~/footer.ascx" TagPrefix="uc1" TagName="footer" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>华樱外语_我要选课</title>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
    <script type="text/javascript">
        function showBg(str) {
            $("#show"+str).show();
        }
        function closeBg(str) {
            $("#show" + str).hide();
        }
        function openlink() {
            var win_art = window.open("http://chat16.live800.com/live800/chatClient/chatbox.jsp?companyID=287312&configID=46228&jid=2055270061&enterurl=", "info", "width=600,height=514")
        }

							</script>
<script type="text/javascript">
    $(function () {
        $('#home_slider').flexslider({
            animation: 'slide',
            controlNav: true,
            directionNav: false,
            animationLoop: false,
            slideshow: false,
            useCSS: false
        });

    });
							</script>
<script type="text/javascript">
    $(function () {
        $('#course_slider').flexslider({
            animation: 'slide',
            controlNav: true,
            directionNav: false,
            animationLoop: true,
            slideshow: false,
            useCSS: false
        });

    });
							</script>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        showAjax(1);
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
        });
    });
		</script>
<!---- start-smoth-scrolling---->
    		<!---- Ajax---->
            <script type="text/javascript">



                function showAjax(str) {
                    $('#C-sub-right-link-a').load('list' + str + '.xml', function () {
                        $('#csrl1').removeAttr("class", "csrl-selected");
                        $('#csrl2').removeAttr("class", "csrl-selected");
                        $('#csrl3').removeAttr("class", "csrl-selected");
                        $('#csrl' + str).attr("class", "csrl-selected");
                        //回调函数
                    });
                }




                function show(str) {
                    var l_name = document.getElementById("record_name"+str).value;
                    var l_phone = document.getElementById("record_phone" + str).value;
                    var l_question = document.getElementById("record_question" + str).value;
                    var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
                    if (l_name == "") {
                        alert("请输入姓名");
                        return;
                    }
                    if (isNaN(l_phone) || l_phone == "") {
                        alert("电话号码请输入纯数字");
                        return;
                    }

                    $.post("ajax_post.ashx",
            {
                name: l_name,
                phone: l_phone,
                question: l_question,
                askwhom:str,
                type: 3
            },
            function (data, status) {
                alert("提问成功！我们的教师会尽快答复您！");
            });

                }
            </script>

<!-- Custom Theme files -->
<link  rel="stylesheet"  href="css/bootstrap.min.css">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet"  href="css/lightGallery.css"/>
<!-- Custom Theme files -->
<!--[if lte IE 8]>
	<script src="js/respond.src.js"></script>
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!---image-response-script--->
<script type="text/javascript">
    function FullScreenBackground(theItem) {
        var winWidth = $(window).width();
        var winHeight = $(window).height();
        var imageWidth = $(theItem).width();
        var imageHeight = $(theItem).height();
        var picHeight = imageHeight / imageWidth;
        var picWidth = imageWidth / imageHeight;
        if ((winHeight / winWidth) < picHeight) {
            $(theItem).css("width", winWidth);
            $(theItem).css("height", picHeight * winWidth);
        } else {
            $(theItem).css("height", winHeight);
            $(theItem).css("width", picWidth * winHeight);
        };
        $(theItem).css("margin-left", winWidth / 2 - $(theItem).width() / 2);
        $(theItem).css("margin-top", winHeight / 2 - $(theItem).height() / 2);
    }
</script>
<script type="text/javascript">
    window.onload = function () {
        FullScreenBackground('#ttopimg');
    }
    $(window).resize(function () {
        FullScreenBackground('#ttopimg');
    });
</script>
<!---//image-response-script--->
    <!----//Start-LightBox-script----> 

    <script src="js/lightGallery.js"></script>
    <script>
        $(document).ready(function () {
            $(".lightBox").lightGallery();
        });
    </script>
<!----//End-LightBox-script----> 
<!---filter-script--->
<script type="text/javascript">
    $(function () {
        //选中filter下的所有a标签，为其添加hover方法，该方法有两个参数，分别是鼠标移上和移开所执行的函数。
        $("#filter a").hover(
            function () {
                $(this).addClass("seling");
            },
            function () {
                $(this).removeClass("seling");
            }
        );


        //选中filter下所有的dt标签，并且为dt标签后面的第一个dd标签下的a标签添加样式seled。(感叹jquery的强大)
       // $("#fil1_1,#fil2_1,#fil3_1,#fil4_1,#fil5_1,#fil6_1").attr("class", "seled");
        /*注意：这儿应该是设置(attr)样式，而不是添加样式(addClass)，不然后面通过$("#filter a[class='seled']")访问不到class样式为seled的a标签。*/


    });


</script>
<!---//filter-script--->
</head>
<body>
    <form runat="server">
<!----start-Nav-script----> 
<script  src="js/jquery.flexnav.min.js"></script> 
<script  src="js/jquery.hoverIntent.minified.js"></script> 
<script  src="js/custom.js"></script> 
<!----//End-Nav-script----> 
<!--Nav Start-->

<div  class="site-wrapper" >
  <header  class="header header-default">
    <div  class="header-main">
      <div  class="nav-container">
        <div  class="logo"> <a  href="#"><img  src="images/logo.png"  alt="华樱外语"  style="	position: relative;width: auto; height: auto;"/></a> </div>
        <button  type="button"  class="navbar-toggle active"> <i  class="fa fa-bars"></i> <span  class="touch-button active"><i  class="navicon"></i></span></button>
        <nav  class="nav-main">
          <ul  data-breakpoint="992"  class="flexnav with-js opacity lg-screen">
            <li  class=""><a  href="Default.aspx">首页</a> </li>
            <li  class="active item-with-ul"><a  href="course.aspx">我要选课</a>
              <ul  style="display: none;"  class="">
                <li><a  href="course_c1.html">雅思 ｜ IELTS</a></li>
                <li><a  href="course_c2.html">托福 ｜ TOEFL</a></li>
                <li><a  href="course_c3.html">赛达 ｜ SAT</a></li>
                <li><a  href="course_c5.html">小语种法、意、日</a></li>
              </ul>
            </li>
            <li  class=""><a  href="teachers.aspx">名师团队</a> </li>
            <li  class=""><a  href="students.aspx">学霸专区</a> </li>
            <li  class=""><a  href="exam.aspx">在线测评</a> </li>
            <li  class=""><a  href="qanda.aspx">备考须知</a> </li>
            <li  class=""><a  href="about.aspx">关于我们</a> </li>
          </ul>
        </nav>
      </div>
      <div class="top-telephone-T">课程热线：<b>028-86257330</b></div>
    </div>
  </header>
</div>
<!----- //End-Nav---->
<div class="clearfix"> </div>
<div class="clearfix"> </div>
<!--C-top-list-->
<div class="C-top-list">
    <div class="C-top-list-container">
    <div id="ctl1" runat="server" class="col-md-2 C-top-list-item">
        <a href="course_list.aspx?class=1"><div  class="C-top-square">雅思</div></a>
        <div class="C-top-a"><a href="course_detail.aspx?type=1">预备班</a><a href="course_detail.aspx?type=2">基础班</a><a href="course_detail.aspx?type=3">强化班</a><br /><a href="course_detail.aspx?type=4">6/7/8专项提分课程</a></div>
    </div>
    <div id="ctl2" runat="server" class="col-md-2 C-top-list-item">
        <a href="course_list.aspx?class=2"><div class="C-top-square">托福</div></a>
        <div class="C-top-a"><a href="course_detail.aspx?type=5">预备班</a><a href="course_detail.aspx?type=6">基础班</a><a href="course_detail.aspx?type=7">强化班</a><br /><a href="course_detail.aspx?type=8">托福TPO模考班</a></div>
    </div>
    <div id="ctl3" runat="server" class="col-md-2 C-top-list-item">
        <a href="course_list.aspx?class=3"><div class="C-top-square Cts-double ">美国<br />高考</div></a>
        <div class="C-top-a"><a href="course_detail.aspx?type=9">预备班</a><a href="course_detail.aspx?type=10">基础班</a><br /><a href="course_detail.aspx?type=11">强化班</a><a href="course_detail.aspx?type=12">SAT模考班</a></div>
    </div>
    <div id="ctl4" runat="server" class="col-md-2 C-top-list-item">
        <a href="course_list.aspx?class=4"><div class="C-top-square Cts-double ">综合<br />英语</div></a>
        <div class="C-top-a"><a href="course_detail.aspx?type=13">留学精品班</a><a href="course_detail.aspx?type=14">正音行前班</a><br /><a  href="course_detail.aspx?type=15">语法、词汇专项提升班</a></div>
    </div>
    <div id="ctl5" runat="server" class="col-md-2 C-top-list-item">
        <a href="course_list.aspx?class=5"><div class="C-top-square Cts-double ">小<br />语种</div></a>
        <div class="C-top-a"><a href="course_detail.aspx?type=16">日语零基础</a><a href="course_detail.aspx?type=17">J-test集训班</a><br /><a  href="course_detail.aspx?type=18">法语零基础班</a><a  href="course_detail.aspx?type=19">法语直通车</a></div>
    </div>
</div>
    </div>

<!--//C-top-list-->
<div class="clearfix"> </div>
<!--C-sub-->
        <div class="C-sub">
            <div class="C-sub-container">
                <div class="C-sub-left col-md-9">
                    <div class="C-sub-head">
                    您现在所在的位置：<a>华樱外语</a>>><a>我要选课</a>>><asp:Literal ID="ltlcoursenavi" runat="server" Visible="true"></asp:Literal>
                    </div>
                    <asp:Image ID="Image_top" runat="server" Width="799" ImageUrl="~/images/upload_files/banner/up.png" />
                    <div class="C-sub-detail">                        
                        <asp:Image CssClass="C-sub-detail-itemimage col-md-5" ID="Image3" runat="server"/>
                        <div class="C-sub-detail-itemcontent col-md-7">
                            <asp:Literal ID="ltlcoursedetail" runat="server" Visible="true"></asp:Literal> 
                        </div>
                    </div>
                    <div class="C-sub-table-container">
                        <div class="clearfix"> </div>
<table class="C-sub-table" cellspacing="0" class="" border="0">
  <thead>
    <tr>
      <th>班级名称</th>
      <th>上课时间</th>
      <th>上课地点</th>
      <th>报名情况</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
       <asp:Literal ID="ltlcourselist" runat="server" Visible="true"></asp:Literal> 
  </tbody>
</table>
                    </div>  
                </div>
                <div class="C-sub-right col-md-3">
                    <asp:Image ID="Image_right" runat="server" Width="264" />
                    <div class="C-sub-right-link">
                        <a id="csrl1" onclick="showAjax(1)">托福</a>&nbsp;<a id="csrl2" onclick="showAjax(2)">雅思</a>&nbsp;<a id="csrl3" onclick="showAjax(3)">SAT</a>实用工具
                        <div id="C-sub-right-link-a" class="C-sub-right-link-a">
                        </div>
                        
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </div>
<!--//C-sub-->
<div class="clearfix"> </div>
        <br /><br /><br /><br />
        <div class="clearfix"> </div>
        <uc1:footer runat="server" ID="footer" />

        </form>
</body>
</html>