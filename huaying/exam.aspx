<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam.aspx.cs" Inherits="exam" %>

<%@ Register Src="~/footer.ascx" TagPrefix="uc1" TagName="footer" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>华樱外语_在线测评</title>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery.flexslider.js"></script>
	<script type="text/javascript">
	    $(window).load(function () {
	        $('.exam-slider').flexslider();
	    });
	    $.ajaxSetup({
	        cache: false //关闭AJAX相应的缓存 
	    });
	    function openlink() {
	        var win_art = window.open("http://chat16.live800.com/live800/chatClient/chatbox.jsp?companyID=287312&configID=46228&jid=2055270061&enterurl=", "info", "width=600,height=514")
	    }
	</script>
    <script src="js/html5media.min.js"></script>
    <script src="js/Chart.js"></script>
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
		<!---- Ajax---->
<script type="text/javascript">
    var score = [0, 0, 0, 0];
    function showAjax(str) {
        if (str == 2 || str == 3 || str == 4 || str == 5) {
            var _radio = document.getElementsByTagName("input");//获取单选框集合
            for (var i = 0; i < _radio.length; i++)
                if ((_radio[i].checked && _radio[i].className == "bingo") == true) {
                    score[str - 2] = score[str - 2] + 10;
                }
        }
        $('#Exam_Ajax').load('note' + str + '.xml', function () {
            $('.exam-slider').flexslider();
            //回调函数
        });
    }

    function showAjax2(str) {
        var r_name = document.getElementById("record_name").value;
        var r_email = document.getElementById("record_email").value;
        var r_phone = document.getElementById("record_phone").value;
        var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
        if (r_name == "") {
            alert("请输入姓名");
            return;
        }
        if (!pattern.test(r_email)) {
            alert("请输入正确的邮箱地址");
            return;
        }
        if (isNaN(r_phone) || r_phone=="") {
            alert("电话号码请输入纯数字");
            return;
        }
        $.post("ajax_post.ashx",
{
    name: r_name,
    email: r_email,
    phone: r_phone,
    type:2
},
function (data, status) {
    alert("恭喜您！注册成功！\n请查看您的成绩！");
});

        $('#Exam_Ajax').load('note' + str + '.xml', function () {
            
            var barChartData = {
                labels: ["词汇", "语法", "听力", "阅读"],
                datasets: [
                    {
                        fillColor: "rgba(232,186,117,1)",
                        strokeColor: "rgba(232,186,117,0.8)",
                        highlightFill: "rgba(232,186,117,0.75)",
                        highlightStroke: "rgba(232,186,117,1)",
                        data: [score[0], score[1], score[2], score[3]]
                    }
                ]

            }
            var average_score = (score[0] + score[1] + score[2] + score[3]) / 4;
            document.getElementById('Exam-result').innerHTML = "您的综合测评结果为：<b>" + average_score+"</b>分";


            var ctx = document.getElementById("canvas").getContext("2d");
            window.myBar = new Chart(ctx).Bar(barChartData, {
                responsive: true
            });//回调函数
        });
    }
</script>
		<!-- Custom Theme files -->
		<link  rel="stylesheet"  href="css/bootstrap.min.css">
		<link href="css/style_exam.css" rel='stylesheet' type='text/css' />
        <link rel="stylesheet"  href="css/lightGallery.css"/>
		<!-- Custom Theme files -->
<!--[if lte IE 8]>
	<script src="js/respond.src.js"></script>
<![endif]-->
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
		</head>
		<body>
            <form action="exam.aspx" runat="server">
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
            <li  class="item-with-ul"><a  href="course.aspx">我要选课</a>
                      <ul  style="display: none;"  class="">
                <li><a  href="course_c1.html">雅思 ｜ IELTS</a></li>
                <li><a  href="course_c2.html">托福 ｜ TOEFL</a></li>
                <li><a  href="course_c3.html">赛达 ｜ SAT</a></li>
                <li><a  href="course_c5.html">小语种法、意、日</a></li>
              </ul>
                    </li>
            <li  class=""><a  href="teachers.aspx">名师团队</a> </li>
            <li  class=""><a  href="students.aspx">学霸专区</a> </li>
            <li  class="active"><a  href="exam.aspx">在线测评</a> </li>
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
<!----- Start-Exam----> 

<div id="Exam_Ajax" class="Exam">
<div class="Exam-container">
<div class="Exam-logo">
<img src="images/logo_grey.png" />
</div>
<div class="Exam-img">
    <div class="Exam-img-text">
    <h3>Online Test</h3>你的词汇量有多少？<br />语法、阅读精准度有多高？<br />听力属于哪个等级？
        </div>
</div>

<div class="Exam-startbutton">
<a href="#" onclick="showAjax(1)">开始测试</a>
</div>

</div>
</div>

<!----- //End-Exam----> 

<div class="clearfix"> </div>
                <uc1:footer runat="server" ID="footer" />
                </form>
</body>
</html>