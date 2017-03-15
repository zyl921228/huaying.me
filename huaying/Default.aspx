<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/footer.ascx" TagPrefix="uc1" TagName="footer" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>华樱外语</title>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.min.js"></script>
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
                function showAjax2() {
                    var l_course = document.getElementById("input_course").value;
                    var l_email = document.getElementById("input_email").value;
                    var l_phone = document.getElementById("input_phone").value;
                    var l_recommend = document.getElementById("input_recommend").value;
                    var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
                    if (l_phone == "") {
                        alert("请输入您的手机");
                        return;
                    }

                    $.post("ajax_post.ashx",
            {
                course: l_course,
                email: l_email,
                phone: l_phone,
                recommend:l_recommend,
                type: 0
            },
            function (data, status) {
                alert("您已经成功预约，课程顾问将在1个工作日内与您确认听课事宜，请保持联系方式畅通。");
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
		<!---//webfonts--->
		</head>
		<body>
<!----start-slider-script----> 
<script src="js/responsiveslides.min.js"></script> 
<script>
    // You can also use "$(window).load(function() {"
    $(function () {
        // Slideshow 4
        $("#slider4").responsiveSlides({
            auto: true,
            pager: false,
            nav: true,
            speed: 500,
            namespace: "callbacks",
            before: function () {
                $('.events').append("<li>before event fired.</li>");
            },
            after: function () {
                $('.events').append("<li>after event fired.</li>");
            }
        });

    });
			  </script> 
<!----//End-slider-script---->
<!----start-Accordion-script---->  
<script type="text/javascript">
    $(function () {
        $('#accordion > li').hover(function () {
            var $this = $('.bg');
            $this.stop().animate({ 'width': '95px' }, 1000);
            $('.heading', $this).stop(true, true).fadeIn();
            $('.description', $this).stop(true, true).fadeOut(500);
            $('.bgDescription', $this).stop(true, true).slideUp(700);

            var $this = $(this);
            $this.stop().animate({ 'width': '363px' }, 500);
            $('.heading', $this).stop(true, true).fadeOut();
            $('.bgDescription', $this).stop(true, true).slideDown(500);
            $('.description', $this).stop(true, true).fadeIn();
        }, function () {


        });

    });
</script>
<!----//End-Accordion-script----> 
<!----//Start-LightBox-script----> 

    <script src="js/lightGallery.js"></script>
    <script>
        $(document).ready(function () {
            $(".lightBox").lightGallery();


            var $this = $('#ac1');
            $this.stop().animate({ 'width': '363px' }, 500);
            $('.heading', $this).stop(true, true).fadeOut();
            $('.bgDescription', $this).stop(true, true).slideDown(500);
            $('.description', $this).stop(true, true).fadeIn();
        });
    </script>
<!----//End-LightBox-script----> 
<!-- Slideshow 4 -->
<div  id="top" class="callbacks_container">
          <div class="top_txtbox">
    <div class="top_txtbox_area"> 
              <div class="contact-inner-info"> 
        <!---- contact-form ---->
        <div class="contact-form">
            <div class="text-boxs"> <span>
              <input id="input_course" placeholder="请填写课程" type="text">
              </span> <span>
              <input id="input_email"  placeholder="请填写邮件" type="text">
              </span> <span>
              <input id="input_phone" placeholder="填写手机号（获得免费活动内容）" type="text">
              </span> <span>
              <input id="input_recommend" placeholder="推荐人手机（获得现金减免券）" type="text">
              </span> <span>
              <input type="submit" value="免费领取体验课" onclick="showAjax2()"/>
              </span> </div>
                </div>
        <!---- contact-form ----> 
        <!---- contact-form ---->
        
        <div class="clearfix"> </div>
        <!---- contact-form ----> 
      </div>
            </div>
  </div>
          <ul class="rslides" id="slider4">
    <li> <img src="images/slide1.gif" alt="">
              <div  class="caption"><div class="lightBox"><!--[if lte IE 8]><a data-iframe="true" data-src="http://v.qq.com/iframe/player.html?vid=m0118g4915b&height=480&tiny=1&auto=1"  class="play_btn" href="#"></a><![endif]--><!--[if !IE]><--><a data-iframe="true" data-src="http://v.qq.com/iframe/player.html?vid=m0118g4915b&tiny=1&auto=1"  class="play_btn" href="#"></a><![endif]--></div>
        <div class="caption_sub">
                  <p>播放次数：23621次</p>
                </div>
      </div>
            </li>
    <li> <img src="images/slide2.gif" alt="">
              <div class="caption"><div class="lightBox"><!--[if lte IE 8]><a data-iframe="true" data-src="http://v.qq.com/iframe/player.html?vid=m01184ui0x8&height=480&tiny=1&auto=1" class="play_btn" href="#"></a><![endif]--><!--[if !IE]><--><a data-iframe="true" data-src="http://v.qq.com/iframe/player.html?vid=m01184ui0x8&tiny=1&auto=1" class="play_btn" href="#"></a><![endif]--></div>
        <div class="caption_sub">
                  <p>播放次数：161616次</p>
                </div>
      </div>
            </li>
  </ul>
  <div class="top-telephone">课程热线：<b>028-86257330</b></div>
        </div>
<div class="clearfix"> </div>
<!----- //End-slider----> 
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
            <li  class="active"><a  href="Default.aspx">首页</a> </li>
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
            <li  class=""><a  href="exam.aspx">在线测评</a> </li>
            <li  class=""><a  href="qanda.aspx">备考须知</a> </li>
            <li  class=""><a  href="about.aspx">关于我们</a> </li>
          </ul>
                </nav>
      </div>
            </div>
  </header>
        </div>
<!----- //End-Nav----> 
<!---- index_course_head ---->
<div class="index_course">
          <div class="head-section">
    <div class="head-single-text"> <img src="images/course_select.png" alt="course_select"/> </div>
    <div class="head-double-text">
              <p class="up-p">课程选择</p>
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
        <p style="display:block;" id="p1">官方认证名师授课<br/>西南首批雅思官方合作伙伴<br/>高分：R:9.0、L:9.0、S:7.5、W:7.5<br/><br/><a class="icon-link" href="course_c1.html">最新开班</a></p>
      </div>
            </div>
    <div class="col-md-2">
              <div id="g2" class="top-grid"> <span>
                <a href="#"><label class="icon2"> </label></a>
                </span>
        <h3><a href="#">托福备考TOEFL</a></h3>
        <p id="p2">ETS 官方颁证教师授课<br/>TPO模考+精讲<br/>高分：R:30、L:30、S:27、W:28<br/><br/><a class="icon-link" href="course_c2.html">最新开班</a></p>
      </div>
            </div>
    <div class="col-md-2">
              <div id="g3" class="top-grid"> <span>
                <a href="#"><label class="icon3"> </label></a>
                </span>
        <h3><a href="#">美国高考SAT/ACT</a></h3>
        <p id="p3">托福不低于90分<br/>美国T50海归名师主讲<br/>高分：SAT I 2290分<br/><br/><a class="icon-link" href="course_c3.html">最新开班</a></p>
      </div>
            </div>
<div class="col-md-2">
              <div id="g4" class="top-grid"> <span>
                <a href="#"><label class="icon4"> </label></a>
                </span>
        <h3><a href="#">国际课程IB/AP</a></h3>
        <p id="p4">国际课程课后提升首选<br/>IB/AP/A-LEVEL/双语数理化<br/><br/><a class="icon-link" href="course_c4.html">最新开班</a></p>

      </div>
            </div>
<div class="col-md-2">
              <div id="g5" class="top-grid"> <span>
                <a href="#"><label class="icon5"> </label></a>
                </span>
        <h3><a href="#">小语种 法、意、日</a></h3>
        <p id="p5">J-TEST(日)、TCF/TEF(法)、CILS(意)<br/>海归名师授课<br/>海外同步 原版教材<br/><br/><a class="icon-link" href="course_c5.html">最新开班</a></p>
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

     }
     document.getElementById("g2").onmouseover = function () {
         document.getElementById("p1").style.display = 'none';
         document.getElementById("p2").style.display = 'block';
         document.getElementById("p3").style.display = 'none';
         document.getElementById("p4").style.display = 'none';
         document.getElementById("p5").style.display = 'none';

     }
     document.getElementById("g3").onmouseover = function () {
         document.getElementById("p1").style.display = 'none';
         document.getElementById("p2").style.display = 'none';
         document.getElementById("p3").style.display = 'block';
         document.getElementById("p4").style.display = 'none';
         document.getElementById("p5").style.display = 'none';

     }
     document.getElementById("g4").onmouseover = function () {
         document.getElementById("p1").style.display = 'none';
         document.getElementById("p2").style.display = 'none';
         document.getElementById("p3").style.display = 'none';
         document.getElementById("p4").style.display = 'block';
         document.getElementById("p5").style.display = 'none';

     }
     document.getElementById("g5").onmouseover = function () {
         document.getElementById("p1").style.display = 'none';
         document.getElementById("p2").style.display = 'none';
         document.getElementById("p3").style.display = 'none';
         document.getElementById("p4").style.display = 'none';
         document.getElementById("p5").style.display = 'block';

     }
</script>
<!---- //top-grids ---->
    <div class="clearfix"> </div>
<!---- Accordion ---->   
<div class="accordion_container">
<div class="accordion_text">
<div class="accordion_double_text">
<img src="images/choose_huaying.png" />
<p>4个理由，他们选择了华樱</p>
</div>
</div>
<div class="accordion_area">
	<!--特效部分-->
	<ul class="accordion" id="accordion">
		<li id="ac1" class="bg">
			<div class="heading">师资<br/><b>专业化</b><br/><span class="heading_en">Professional</span></div>
			<div class="description">
			<div class="heading_h">师资<br/><b>专业化</b><br/><span class="heading_en">Professional</span></div>
                        <p>我们坚信，<br/>专业的教学团队+严格的过程管理，<br/>才能在最短的时间内实现学生能力+分数同步提升</p>
			</div>
		</li>
		<li class="bg">
			<div class="heading">管理<br/><b>标准化</b><br/><span class="heading_en">Standardized</span></div>
			<div class="description">
			<div class="heading_h">管理<br/><b>标准化</b><br/><span class="heading_en">Standardized</span></div>
                        <p>我们的宗旨：做精品培训！<br/>10年来我们一直坚持执行：<br/>班主任管理制度、晚自习、每周周考、学习反馈。</p>
			</div>
		</li>
		<li class="bg">
			<div class="heading">服务<br/><b>人性化</b><br/><span class="heading_en">Considerate</span></div>
			<div class="description">
			<div class="heading_h">服务<br/><b>人性化</b><br/><span class="heading_en">Considerate</span></div>
                        <p>是老师，也是朋友，<br/>移民、游学、海归就业、<br/>家长英语课堂、实习小导师…..<br />我们希望学员在华樱收获更多！</p>
			</div>
		</li>
		<li class="bg">
			<div class="heading">口碑<br/><b>品牌化</b><br/><span class="heading_en">Prestigious </span></div>
			<div class="description">
			<div class="heading_h">口碑<br/><b>品牌化</b><br/><span class="heading_en">Prestigious </span></div>
                        <p>雅思8.0、托福117、SAT 2390<br/>四、七、九、成外、实外、川大、财大……<br/>知名院校学子首选！一切用成绩说话！</p>
			</div>
		</li>
	</ul>
	<!--特效结束-->
</div>
</div>
<!---- //Accordion ---->  
    <div class="clearfix"> </div>
<!--Index_news-->
<div class="index-news-container">
<div class="index-news-column col-md-4">
<div class="news-head">
<a href="news_list.aspx#q1">考试快讯</a>
</div>
<div class="news-image">
<a href="news_list.aspx#q1"><img src="images/upload_files/index_1.gif" width="200"  /></a>
</div>
<div class="clearfix"> </div>
<div class="news_list">
<ul>
<asp:Literal ID="ltlindexnew1" runat="server" Visible="true"></asp:Literal> 
</ul>
</div>
<div class="clearfix"> </div>
</div>
<div class="index-news-column col-md-4">
<div class="news-head">
<a  href="students.aspx">学霸专区</a>
</div>
<div class="news-image">
<a  href="students.aspx"><img src="images/upload_files/index_2.gif" width="200"  /></a>
</div>
<div class="clearfix"> </div>
<div class="news_list">
<ul>
<asp:Literal ID="ltlindexnew2" runat="server" Visible="true"></asp:Literal> 
</ul>
</div>
<div class="clearfix"> </div>
</div>
<div class="index-news-column col-md-4">
<div class="news-head">
<a href="news_list.aspx#q2">留学前沿</a>
</div>
<div class="news-image">
<a href="news_list.aspx#q2"><img src="images/upload_files/index_3.gif" width="200"  /></a>
</div>
<div class="clearfix"> </div>
<div class="news_list">
<ul>
<asp:Literal ID="ltlindexnew3" runat="server" Visible="true"></asp:Literal> 
</ul>
</div>
<div class="clearfix"> </div>
</div>
</div>
<!--//Index_news-->
    <div class="clearfix"> </div>
            <br /><br /><br /><br />
            <div class="clearfix"> </div>
            <uc1:footer runat="server" ID="footer" />
</body>
</html>
