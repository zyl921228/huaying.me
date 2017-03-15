<%@ Page Language="C#" AutoEventWireup="true" CodeFile="course.aspx.cs" Inherits="course" %>

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
            $("#show"+str).hide();
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
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
        });
    });
		</script>
<!---- start-smoth-scrolling---->
    		<!---- Ajax---->
            <script type="text/javascript">
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
        //为filter下的所有a标签添加单击事件
        $("#filter a").click(function () {
            $(this).parents("dl").children("dd").each(function () {
                //下面三种方式效果相同（第三种写法的内部就是调用了find()函数，所以，第二、三种方法是等价的。）
                //$(this).children("div").children("a").removeClass("seled");
                //$(this).find("a").removeClass("seled");
                $('a', this).removeClass("seled");
            });

            $(this).attr("class", "seled");
            window.location.href = "course_" + RetSelecteds()+".html";
            //alert(RetSelecteds()); //返回选中结果   弹出
        });
        //alert(RetSelecteds()); //返回选中结果   弹出


    });

    function RetSelecteds() {
        var result = "";
        $("#filter a[class='seled']").each(function () {
            result += $(this).attr("name");
        });
        return result;
    }


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

<div  class="site-wrapper">
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
<!-- filter -->
<div  runat="server" id="filter">
  <dl>
    <dt>语种：</dt>
    <dd>
      <div><a name="" id="fil1_0">全部</a></div>
    </dd>
    <dd>
      <div><a name="a1" id="fil1_1">英语</a></div>
    </dd>
    <dd>
      <div><a name="a2" id="fil1_2">法语</a></div>
    </dd>
    <dd>
      <div><a name="a3" id="fil1_3">日语</a></div>
    </dd>
    <dd>
      <div><a name="a4" id="fil1_4">意大利语</a></div>
    </dd>
  </dl>
  <dl>
    <dt>年级：</dt>
    <dd>
      <div><a name="" id="fil2_0">全部</a></div>
    </dd>
    <dd>
      <div><a name="b1" id="fil2_1">初中</a></div>
    </dd>
    <dd>
      <div><a name="b2" id="fil2_2">高中</a></div>
    </dd>
    <dd>
      <div><a name="b3" id="fil2_3">大学</a></div>
    </dd>
    <dd>
      <div><a name="b4" id="fil2_4">研究生</a></div>
    </dd>
  </dl>
  <dl>
    <dt>课程：</dt>
    <dd>
      <div><a name="" id="fil3_0">全部</a></div>
    </dd>
    <dd>
      <div><a name="c1" id="fil3_1">雅思</a></div>
    </dd>
    <dd>
      <div><a name="c2" id="fil3_2">托福</a></div>
    </dd>
    <dd>
      <div><a name="c3" id="fil3_3">SAT</a></div>
    </dd>
    <dd>
      <div><a name="c4" id="fil3_4">AP</a></div>
    </dd>
          <dd>
      <div><a name="c5" id="fil3_5">小语种</a></div>
    </dd>
  </dl>
  <dl>
    <dt>时间：</dt>
    <dd>
      <div><a name="" id="fil4_0">全部</a></div>
    </dd>
    <dd>
      <div><a name="d1" id="fil4_1">本月新班</a></div>
    </dd>
    <dd>
      <div><a name="d2" id="fil4_2">全日制</a></div>
    </dd>
    <dd>
      <div><a name="d3" id="fil4_3">周末班</a></div>
    </dd>
  </dl>
  <dl>
    <dt>人数：</dt>
    <dd>
      <div><a name="" id="fil5_0">全部</a></div>
    </dd>
    <dd>
      <div><a name="e1" id="fil5_1">5人班</a></div>
    </dd>
    <dd>
      <div><a name="e2" id="fil5_2">15人班</a></div>
    </dd>
    <dd>
      <div><a name="e3" id="fil5_3">一对一</a></div>
    </dd>
  </dl>
  <dl>
    <dt>同学：</dt>
    <dd>
      <div><a name="" id="fil6_0">全部</a></div>
    </dd>
    <dd>
      <div><a name="f1" id="fil6_1">成外实外</a></div>
    </dd>
    <dd>
      <div><a name="f2" id="fil6_2">国际课程</a></div>
    </dd>
    <dd>
      <div><a name="f3" id="fil6_3">重点高中</a></div>
    </dd>
    <dd>
      <div><a name="f4" id="fil6_4">大学生</a></div>
    </dd>
    <dd>
      <div><a name="f5" id="fil6_5">海归再提升</a></div>
    </dd>
  </dl>
</div>
<div style="clear:both"></div>
<!-- filter --> 
<!--course_slider-->
<div class="course_slider">
  <div id="course_slider" class="flexslider">
    <ul class="slides">
         <asp:Literal ID="ltlcourse" runat="server" Visible="true"></asp:Literal> 
    </ul>
  </div>
</div>
<!--//course_slider--> 
        <div class="clearfix"></div>
<!---- index_course_head ---->
<div class="index_course">
  <div class="head-section">
    <div class="head-single-text"> <img src="images/course_select.png" alt="course_select"/> </div>
    <div class="head-double-text">
      <p class="up-p">本月新班</p>
      <p class="sub-p">移动鼠标选择自己需要的课程</p>
    </div>
  </div>
</div>
<!----//index_course_head----> 
<!---- top-grids ---->
<div id="about" class="top-grids text-center">
         <div class="container">
    <div class="col-md-2">
              <div id="g1" class="top-grid"> <span>
                <a href="#"><label class="icon1"> </label></a>
                </span>
        <h3><a href="#">雅思备考IELTS</a></h3>
        <p style="display:block;" id="p1">官方认证名师授课<br/>西南首批雅思官方合作伙伴</p>
      </div>
            </div>
    <div class="col-md-2">
              <div id="g2" class="top-grid"> <span>
                <a href="#"><label class="icon2"> </label></a>
                </span>
        <h3><a href="#">托福备考TOEFL</a></h3>
        <p id="p2">ETS 官方颁证教师授课<br/>TPO模考+精讲</p>
      </div>
            </div>
    <div class="col-md-2">
              <div id="g3" class="top-grid"> <span>
                <a href="#"><label class="icon3"> </label></a>
                </span>
        <h3><a href="#">美国高考SAT/ACT</a></h3>
        <p id="p3">托福不低于90分<br/>美国T50海归名师主讲</p>
      </div>
            </div>
<div class="col-md-2">
              <div id="g4" class="top-grid"> <span>
                <a href="#"><label class="icon4"> </label></a>
                </span>
        <h3><a href="#">国际课程IB/AP</a></h3>
        <p id="p4">国际课程课后提升首选<br/>IB/AP/A-LEVEL/双语数理化</p>

      </div>
            </div>
<div class="col-md-2">
              <div id="g5" class="top-grid"> <span>
                <a href="#"><label class="icon5"> </label></a>
                </span>
        <h3><a href="#">小语种 法、意、日</a></h3>
        <p id="p5">J-TEST(日)、TCF/TEF(法)、CILS(意)<br/>海归名师授课<br/>海外同步 原版教材</p>
      </div>
            </div>
    <div class="clearfix"> </div>
  </div>
</div>
<script language="javascript">
    document.getElementById("g1").onmouseover = function () {
        document.getElementById("p1").style.display = 'block';
        document.getElementById("p2").style.display = 'none';
        document.getElementById("p3").style.display = 'none';
        document.getElementById("p4").style.display = 'none';
        document.getElementById("p5").style.display = 'none';
        document.getElementById("ct1").style.display = 'table';
        document.getElementById("ct2").style.display = 'none';
        document.getElementById("ct3").style.display = 'none';
        document.getElementById("ct4").style.display = 'none';
        document.getElementById("ct5").style.display = 'none';

    }
    document.getElementById("g2").onmouseover = function () {
        document.getElementById("p1").style.display = 'none';
        document.getElementById("p2").style.display = 'block';
        document.getElementById("p3").style.display = 'none';
        document.getElementById("p4").style.display = 'none';
        document.getElementById("p5").style.display = 'none';
        document.getElementById("ct1").style.display = 'none';
        document.getElementById("ct2").style.display = 'table';
        document.getElementById("ct3").style.display = 'none';
        document.getElementById("ct4").style.display = 'none';
        document.getElementById("ct5").style.display = 'none';

    }
    document.getElementById("g3").onmouseover = function () {
        document.getElementById("p1").style.display = 'none';
        document.getElementById("p2").style.display = 'none';
        document.getElementById("p3").style.display = 'block';
        document.getElementById("p4").style.display = 'none';
        document.getElementById("p5").style.display = 'none';
        document.getElementById("ct1").style.display = 'none';
        document.getElementById("ct2").style.display = 'none';
        document.getElementById("ct3").style.display = 'table';
        document.getElementById("ct4").style.display = 'none';
        document.getElementById("ct5").style.display = 'none';
    }
    document.getElementById("g4").onmouseover = function () {
        document.getElementById("p1").style.display = 'none';
        document.getElementById("p2").style.display = 'none';
        document.getElementById("p3").style.display = 'none';
        document.getElementById("p4").style.display = 'block';
        document.getElementById("p5").style.display = 'none';
        document.getElementById("ct1").style.display = 'none';
        document.getElementById("ct2").style.display = 'none';
        document.getElementById("ct3").style.display = 'none';
        document.getElementById("ct4").style.display = 'table';
        document.getElementById("ct5").style.display = 'none';

    }
    document.getElementById("g5").onmouseover = function () {
        document.getElementById("p1").style.display = 'none';
        document.getElementById("p2").style.display = 'none';
        document.getElementById("p3").style.display = 'none';
        document.getElementById("p4").style.display = 'none';
        document.getElementById("p5").style.display = 'block';
        document.getElementById("ct1").style.display = 'none';
        document.getElementById("ct2").style.display = 'none';
        document.getElementById("ct3").style.display = 'none';
        document.getElementById("ct4").style.display = 'none';
        document.getElementById("ct5").style.display = 'table';

    }
</script> 
<!---- //top-grids ---->
<!---- table ---->
<div class="clearfix"> </div>
<table id="ct1" cellspacing="7" class="course_table" border="0">
  <thead>
    <tr>
      <th>类别</th>
      <th>上课地点</th>
      <th>学时</th>
      <th>开班时间</th>
      <th>结束时间</th>
    </tr>
  </thead>
  <tbody>
      <asp:Literal ID="tbl_1" runat="server" Visible="true"></asp:Literal> 
  </tbody>
</table>
<table id="ct2" cellspacing="7" class="course_table" border="0">
  <thead>
    <tr>
      <th>类别</th>
      <th>上课地点</th>
      <th>学时</th>
      <th>开班时间</th>
      <th>结束时间</th>
    </tr>
  </thead>
  <tbody>
      <asp:Literal ID="tbl_2" runat="server" Visible="true"></asp:Literal> 
  </tbody>
</table>
<table id="ct3" cellspacing="7" class="course_table" border="0">
  <thead>
    <tr>
      <th>类别</th>
      <th>上课地点</th>
      <th>学时</th>
      <th>开班时间</th>
      <th>结束时间</th>
    </tr>
  </thead>
  <tbody>
      <asp:Literal ID="tbl_3" runat="server" Visible="true"></asp:Literal> 
  </tbody>
</table>
<table id="ct4" cellspacing="7" class="course_table" border="0">
  <thead>
    <tr>
      <th>类别</th>
      <th>上课地点</th>
      <th>学时</th>
      <th>开班时间</th>
      <th>结束时间</th>
    </tr>
  </thead>
  <tbody>
      <asp:Literal ID="tbl_4" runat="server" Visible="true"></asp:Literal> 
  </tbody>
</table>
<table id="ct5" cellspacing="7" class="course_table" border="0">
  <thead>
    <tr>
      <th>类别</th>
      <th>上课地点</th>
      <th>学时</th>
      <th>开班时间</th>
      <th>结束时间</th>
    </tr>
  </thead>
  <tbody>
      <asp:Literal ID="tbl_5" runat="server" Visible="true"></asp:Literal> 
  </tbody>
</table>
<!---- //table ---->
<div class="clearfix"> </div>
<!-- course-button-->
<div class="course_button">
<a href="exam.aspx"><div class="course_button_item">在线测试</div></a>
<a onclick="openlink()"><div class="course_button_item">托福、雅思、SAT代报名</div></a>
<a href="teachers.aspx"><div class="course_button_item">师资介绍</div></a>
</div>
<!-- //course-button-->
<div class="clearfix"> </div>
<!---- elite_teachers ---->
<div class="block_home_slider"> 
  <!---- elite_teachers_head ---->
  <div class="index_course">
    <div class="head-section">
      <div class="head-single-text"> <img src="images/elite_teachers.png" alt="course_select"/> </div>
      <div class="head-double-text">
        <p class="up-p">名师推荐</p>
        <p class="sub-p">查看更多名师介绍</p>
      </div>
    </div>
  </div>
  <!----//elite_teachers_head---->
  <div class="clearfix"> </div>
  <div id="home_slider" class="flexslider">
    <ul class="slides">
      <li>
        <div class="slide">
          <div class="T-et-container">  

            <div class="T-et-left">
              <h1><b>Alvin Feng</b> 教学总监（雅思教研组）</h1>
              <p>专业背景：10年留学英语培训经验！英语文学学士，专业八级，具有专业SAT执教资格和国内教师资格证。教学严谨、风趣。教学成果显著，托福100分以上，雅思7分以上，SAT2000分以上的学生占有很大比例。</p>
              <p>教学专长：<b>SAT长难句、SAT语法、托福阅读、雅思阅读</b></p>
              <div class="T-et-left-stu">
                <div class="col-md-3">
                    <div id="show1" class="T-show">
                        <a class="T-close" onclick="closeBg(1)">X</a>
                              <form>
          <table class="T-Register">
              <tr>
            <td>姓名：</td>
            <td>
              <input id="record_name1" type="text"/>
            </td>
              </tr>
            
            <tr>
            <td>手机号：</td>
            <td>
              <input id="record_phone1" type="text"/>
            </td>
              </tr>
              <tr>
            <td>问题：</td>
            <td>
              <textarea id="record_question1"  class="T-wrap" ></textarea>
            </td>
              </tr>
          </table>
      </form>
                        <div class="T-submitbutton"> <a href="#" onclick="show(1)">提交</a> </div>
                    </div>
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s1_1.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>董同学</h3>
                      <p>雅思首战7.5</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s1_2.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>繆同学</h3>
                      <p>托福114、SAT I 2200</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s1_3.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>潘同学</h3>
                      <p>托福108、SAT I 2070</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s1_4.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>邵同学</h3>
                      <p>托福112、SAT I 2160</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s1_5.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>朱同学</h3>
                      <p>托福114分、SAT I 2130分</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s1_6.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>羊同学</h3>
                      <p>SAT II 首战2400满分</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s1_7.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>罗同学</h3>
                      <p>SAT I 2200</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s1_8.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>关同学</h3>
                      <p>托福103、SAT I 2230</p>
                    </div>
                    </a></div>

                </div>

              </div>

            </div>

            <div class="T-et-right"> <img src="images/upload_files/teachers/t1.png"/> <br />
              <br />
              <div class="T-et-right-link"> <a>冯老师推荐的备考资料</a> </div>
              <br />
              <div class="T-et-right-link"> <a onclick="showBg(1);">给冯老师提问</a> </div>
            </div>

          </div>

        </div>

      </li>
      <li>
        <div class="slide">
          <div class="T-et-container">
            <div class="T-et-left">
              <h1><b>Jiayi Jiang</b> 教学总监（托福&SAT教研组）</h1>
              <p>专业背景：美国俄勒冈大学及中山大学语言学硕士。曾任教于俄勒冈大学美语中心及国内高校，主要研究方向为汉语为母语学生的语言（英语）习得。拥有丰富的海外生活及语言教学经历，熟悉了解北美国际标准化考试。善于结合学生的个体特点，针对其不同的学习习惯及学习风格，灵活调整教学方法以满足学生的学习需求。</p>
              <p>教学专长：<b>托福阅读、托福写作、SAT写作、语法</b></p>
              <div class="T-et-left-stu">
                <div class="col-md-3">
                    <div id="show2" class="T-show">
                        <a class="T-close" onclick="closeBg(2)">X</a>
                              <form>
          <table class="T-Register">
              <tr>
            <td>姓名：</td>
            <td>
              <input id="record_name2" type="text"/>
            </td>
              </tr>
            
            <tr>
            <td>手机号：</td>
            <td>
              <input id="record_phone2" type="text"/>
            </td>
              </tr>
              <tr>
            <td>问题：</td>
            <td>
              <textarea id="record_question2"  class="T-wrap" ></textarea>
            </td>
              </tr>
          </table>
      </form>
                        <div class="T-submitbutton"> <a href="#" onclick="show(2)">提交</a> </div>
                    </div>
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s2_1.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>曾同学</h3>
                      <p>托福114、SAT I 2280</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s2_2.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>潘同学</h3>
                      <p>托福108、SAT I 2070</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s2_3.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>关同学</h3>
                      <p>托福103、SAT I 2230</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s2_4.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>李同学</h3>
                      <p>托福首战101分</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s2_5.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>黄同学</h3>
                      <p>托福104分</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s2_6.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>康同学</h3>
                      <p>托福首战100</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s2_7.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>龙同学</h3>
                      <p>托福102、SAT I 2040</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s2_8.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>陈同学</h3>
                      <p>托福104、SAT I 2070</p>
                    </div>
                    </a></div>
                </div>
              </div>
            </div>
            <div class="T-et-right"> <img src="images/upload_files/teachers/t2.png"/> <br />
              <br />
              <div class="T-et-right-link"> <a>蒋老师推荐的备考资料</a> </div>
              <br />
              <div class="T-et-right-link"> <a onclick="showBg(2);">给蒋老师提问</a> </div>
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="slide">
          <div class="T-et-container">
            <div class="T-et-left">
              <h1><b>Jenny Zhou</b> 华樱外语资深英语老师</h1>
              <p>专业背景：四川师范大学英语文学学士学位，专业八级，拥有SAT执教资格证书，主讲新概念英语，雅思，托福，'O'LEVEL， SAT阅读，并有丰富的教学经验。主张：授人以鱼不如授人以渔，教学风格清新活泼却也不失严肃。</p>
              <p>教学专长：<b>SAT阅读、托福阅读、综合词汇、语法</b></p>
              <div class="T-et-left-stu">
                <div class="col-md-3">
                    <div id="show3" class="T-show">
                        <a class="T-close" onclick="closeBg(3)">X</a>
                              <form>
          <table class="T-Register">
              <tr>
            <td>姓名：</td>
            <td>
              <input id="record_name3" type="text"/>
            </td>
              </tr>
            
            <tr>
            <td>手机号：</td>
            <td>
              <input id="record_phone3" type="text"/>
            </td>
              </tr>
              <tr>
            <td>问题：</td>
            <td>
             <textarea id="record_question3"  class="T-wrap" ></textarea>
            </td>
              </tr>
          </table>
      </form>
                        <div class="T-submitbutton"> <a href="#" onclick="show(3)">提交</a> </div>
                    </div>
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s3_1.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>朱同学</h3>
                      <p>托福114分、SAT I 2130分</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s3_2.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>潘同学</h3>
                      <p>托福108 阅读30分满分</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s3_3.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>龙同学</h3>
                      <p>托福102、SAT I 2040</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s3_4.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>陈同学</h3>
                      <p>托福104、SAT I 2070</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s3_5.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>关同学</h3>
                      <p>托福103、SAT I 2230</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s3_6.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>缪同学</h3>
                      <p>托福114、SAT I 2200</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s3_7.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>邵同学</h3>
                      <p>托福112、SAT I 2160</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s3_8.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>刘同学</h3>
                      <p>托福108</p>
                    </div>
                    </a></div>
                </div>
              </div>
            </div>
            <div class="T-et-right"> <img src="images/upload_files/teachers/t3.png"/> <br />
              <br />
              <div class="T-et-right-link"> <a>周老师推荐的备考资料</a> </div>
              <br />
              <div class="T-et-right-link"> <a onclick="showBg(3);">给周老师提问</a> </div>
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="slide">
          <div class="T-et-container">
            <div class="T-et-left">
              <h1><b>Yuki Zhang</b> 华樱外语资深日语老师</h1>
              <p>专业背景：在日10年，获得日本的国立大学日本语教育硕士学位，拥有日本语教员资格证。曾经在日本的冈山大学和冈山外国语学校的任教经验。了解日本的各种考试考点，拥有丰富的留学经验。</p>
              <p>教学专长：<b>J-TEST/JLPT语法和阅读、基础口语、应用口语</b></p>
              <div class="T-et-left-stu">
                <div class="col-md-3">
                    <div id="show4" class="T-show">
                        <a class="T-close" onclick="closeBg(4)">X</a>
                              <form>
          <table class="T-Register">
              <tr>
            <td>姓名：</td>
            <td>
              <input id="record_name4" type="text"/>
            </td>
              </tr>
            
            <tr>
            <td>手机号：</td>
            <td>
              <input id="record_phone4" type="text"/>
            </td>
              </tr>
              <tr>
            <td>问题：</td>
            <td>
             <textarea id="record_question4"  class="T-wrap" ></textarea>
            </td>
              </tr>
          </table>
      </form>
                        <div class="T-submitbutton"> <a href="#" onclick="show(4)">提交</a> </div>
                    </div>
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s4_1.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>黄同学</h3>
                      <p>10周J-test获得425分</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s4_2.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>赵同学</h3>
                      <p>培训10周获得460分</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s4_3.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>张同学</h3>
                      <p>培训5周J-test获得411分</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s4_4.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>王同学</h3>
                      <p>培训10周J-test获得396分</p>
                    </div>
                    </a></div>
                </div>
              </div>
            </div>
            <div class="T-et-right"> <img src="images/upload_files/teachers/t4.png"/> <br />
              <br />
              <div class="T-et-right-link"> <a>张老师推荐的备考资料</a> </div>
              <br />
              <div class="T-et-right-link"> <a onclick="showBg(4);">给张老师提问</a> </div>
            </div>
          </div>
        </div>
      </li>
              <li>
        <div class="slide">
          <div class="T-et-container">
            <div class="T-et-left">
              <h1><b>Camille Huang</b> 华樱外语资深法语老师</h1>
              <p>专业背景：1998年进入北京语言文化大学法语及法国文学专业，2002年获得法语学士学位。同年留学法国南特大学，2003年获得企业行政管理硕士学位。</p>
              <p>教学专长：<b>法语语音、TEF/TCF阅读、基础口语及法国文化。</b></p>
              <div class="T-et-left-stu">
                <div class="col-md-3">
                                        <div id="show5" class="T-show">
                                            <a class="T-close" onclick="closeBg(5)">X</a>
                              <form>
          <table class="T-Register">
              <tr>
            <td>姓名：</td>
            <td>
              <input id="record_name5" type="text"/>
            </td>
              </tr>
            
            <tr>
            <td>手机号：</td>
            <td>
              <input id="record_phone5" type="text"/>
            </td>
              </tr>
              <tr>
            <td>问题：</td>
            <td>
              <textarea id="record_question5"  class="T-wrap" ></textarea>
            </td>
              </tr>
          </table>
      </form>
                        <div class="T-submitbutton"> <a href="#" onclick="show(5)">提交</a> </div>
                    </div>
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s5_1.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>张同学</h3>
                      <p>TEF 409<br/>巴黎十一大</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s5_2.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>朱同学</h3>
                      <p>TEF 405<br />鲁昂国立应用科学学院</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s5_3.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>官同学</h3>
                      <p>TEF 471<br />巴黎商业研究与商业行为学院</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s5_4.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>周同学</h3>
                      <p>TEF 407<br />巴黎六大</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s5_5.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>郁同学</h3>
                      <p>TEF 416<br />格勒诺布尔一大</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s5_6.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>刘同学</h3>
                      <p>TCF 412<br />雷恩一大</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s5_7.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>税同学</h3>
                      <p>TCF 400<br />斯特拉斯堡国立应用科学学院</p>
                    </div>
                    </a></div>
                </div>
              </div>
            </div>
            <div class="T-et-right"> <img src="images/upload_files/teachers/t5.png"/> <br />
              <br />
              <div class="T-et-right-link"> <a>黄老师推荐的备考资料</a> </div>
              <br />
              <div class="T-et-right-link"> <a onclick="showBg(5);">给黄老师提问</a> </div>
            </div>
          </div>
        </div>
      </li>
              <li>
        <div class="slide">
          <div class="T-et-container">
            <div class="T-et-left">
              <h1><b>Aroma Gong</b> 咨询主管</h1>
              <p>专业背景：多年从业经历。擅长将学生的留学需求及学生自身的英语水平相结合，合理规划制定学生的外语培训方案，帮助学生更快的确立学习方向及目标，确保学生能够提前做好语言准备，顺利入读海外名校。</p>
              <div class="T-et-left-stu">
                <div class="col-md-3">
                                        <div id="show6" class="T-show">
                                            <a class="T-close" onclick="closeBg(6);">X</a>
                              <form>
          <table class="T-Register">
              <tr>
            <td>姓名：</td>
            <td>
              <input id="record_name6" type="text"/>
            </td>
              </tr>
            
            <tr>
            <td>手机号：</td>
            <td>
              <input id="record_phone6" type="text"/>
            </td>
              </tr>
              <tr>
            <td>问题：</td>
            <td>
             <textarea id="record_question6"  class="T-wrap" ></textarea>
            </td>
              </tr>
          </table>
      </form>
                        <div class="T-submitbutton"> <a href="#" onclick="show(6)">提交</a> </div>
                    </div>
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s6_1.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>姜同学</h3>
                      <p>托福103分、SAT I 2040分</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s6_2.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>庞同学</h3>
                      <p>托福95分<br />美国普渡大学</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s6_3.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>曾同学</h3>
                      <p>托福105分、SAT I 2120分</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s6_4.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>潘同学</h3>
                      <p>托福96分、SAT I 1930分</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s6_5.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>水同学</h3>
                      <p>雅思6.5分<br />澳大利亚昆士兰大学</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s6_6.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>曾同学</h3>
                      <p>雅思6分<br />德国德累斯顿工业大学</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s6_7.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>朱同学</h3>
                      <p>托福114分、SAT I 2130分</p>
                    </div>
                    </a></div>
                </div>
                <div class="col-md-3">
                  <div  class="item-hover circle"><a  href="#">
                    <div  class="img"><img  src="images/upload_files/students/s6_8.jpg"  alt="img"></div>
                    <div  class="info">
                      <h3>欧阳同学</h3>
                      <p>雅思7.0分<br />澳大利亚墨尔本大学</p>
                    </div>
                    </a></div>
                </div>
              </div>
            </div>
            <div class="T-et-right"> <img src="images/upload_files/teachers/t6.png"/> <br />
              <br />
              <div class="T-et-right-link"> <a>宫老师推荐的备考资料</a> </div>
              <br />
              <div class="T-et-right-link"> <a onclick="showBg(6);">给宫老师提问</a> </div>
            </div>
          </div>
        </div>
      </li>
    </ul>
  </div>
</div>
<!----//elite_teachers---->
<div class="clearfix"> </div>
        <br /><br /><br /><br />
<div class="clearfix"> </div>
        <uc1:footer runat="server" ID="footer" />
        </form>
</body>
</html>