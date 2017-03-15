<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<%@ Register Src="~/footer.ascx" TagPrefix="uc1" TagName="footer" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>华樱外语_关于我们</title>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
                                    <script type="text/javascript">
                                        $(function () {
                                            $('#home_slider').flexslider({
                                                animation: 'slide',
                                                controlNav: true,
                                                directionNav: true,
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
        $(".T-team-container ul li:gt(7)").hide();
        FullScreenBackground('#ttopimg');
    }
    $(window).resize(function () {
        FullScreenBackground('#ttopimg');
    });
</script>
		<!---//image-response-script--->
		</head>
		<body>
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
            <li  class=""><a  href="exam.aspx">在线测评</a> </li>
            <li  class=""><a  href="qanda.aspx">备考须知</a> </li>
            <li  class="active"><a  href="about.aspx">关于我们</a> </li>
          </ul>
                </nav>
                          
      </div>
      <div class="top-telephone-T">课程热线：<b>028-86257330</b></div>
            </div>
  </header>
        </div>
<!----- //End-Nav----> 
<!----- T-top-image----> 
    <div class="clearfix"> </div>

<div id="L1">
<div class="L1-text">
    <img src="images/about/why.png"/>
    </div>
<div class="L1-img">
    <img src="images/about/social.png"/>
    </div>
</div>
<div class="clearfix"> </div>
<div id="L2">
<div class="L2-float"></div>
<div class="L2-container">
<div class="L2-text">
    <img src="images/about/professional.png"/>
    <div class="L2-text-title">
    <h1>师资专业化·权威师资</h1>
    <p>十余年留学培训行业经验</p>
    </div>
    <div class="L2-text-content">
    <div class="L2-text-icon">
    <img src="images/about/about_icon_v.png"/>
    <br/>
    IELTS认证名师
    </div>
        <div class="L2-text-icon">
    <img src="images/about/about_icon_pen.png"/>
    <br/>
    ETS培训导师
    </div>
        <div class="L2-text-icon">
    <img src="images/about/about_icon_8.png"/>
    <br/>
    英语专8级证书
    </div>
        <div class="L2-text-icon">
    <img src="images/about/about_icon_plane.png"/>
    <br/>
    美、澳、英海归名师
    </div>
        <div class="L2-text-icon">
    <img src="images/about/about_icon_v.png"/>
    <br/>
    ESL认证名师
    </div>
        <div class="L2-text-icon">
    <img src="images/about/about_icon_people.png"/>
    <br/>
    双语数理化教学团队
    </div>
    </div>
    </div>
<div class="L2-img">
    <img src="images/about/teachers.png"/>
    </div>
</div>
</div>
            <div id="L5">
<div class="L5-float"></div>
<div class="L5-container">
<div class="L5-text">
<img src="images/about/considerable.png"/>
</div>
<div class="clearfix"> </div>
<div class="L5-image">
<div class="col-md-3">
<img src="images/about/c1.png" />
<p><b>免费代报名服务</b><br/>（雅思、托福、SAT）</p>
</div>
<div class="col-md-3">
<img src="images/about/c2.png" />
<p><b>在读反馈服务</b><br/>（电话、微信、面访）</p>
</div>
<div class="col-md-3">
<img src="images/about/c3.png" />
<p><b>考前心理减压服务</b><br/>（班主任、授课教师一对一减压辅导）</p>
</div>
<div class="col-md-3">
<img src="images/about/c4.png" />
<p><b>无忧留学服务</b><br/>（一站式留学无缝衔接）</p>
</div>
</div>
</div>
</div>

<div class="clearfix"> </div>
            <div id="L4">
<div class="L4-float"></div>
<div class="L4-container">
<div class="L4-text">
    <img src="images/about/standardized.png"/>
    <div class="clearfix"> </div>
    <div class="L4-text-content">
    <ul>
    <li>
    入学评估<br/><br/><br/><br/>
    </li>
    <li>
    个性化方案订制<br/><br/><br/><br/>
    </li>
    <li>
    班主任管理制度<br/><br/><br/><br/>
    </li>
    <li>
    周考成绩反馈
    </li>
    </ul>
    <br/><br/>
    <p>为保证教学品质的稳定，所有流程均有严格的执行标准。</p>
    </div>
    </div>
<div class="L4-img">
    <img src="images/about/gears.png"/>
    </div>
</div>
</div>

<div id="L3">
<div class="L3-float"></div>
<div class="L3-container">
<div class="L3-text">
<img src="images/about/international.png"/>
<p>简约教室设计、西式布局、Wi-Fi无线全覆盖。<br/>
独家仿真雅思、托福模考教室，实战演练，无忧应考。<br/>
首家提供专属自习区的专业留学培训机构，静心备考。
 </p>
</div>
<div class="clearfix"> </div>
<div class="L3-image">
<div class="col-md-4">
<img src="images/about/img1.png" />
</div>
<div class="col-md-4">
<img src="images/about/img2.png" />
</div>
<div class="col-md-4">
<img src="images/about/img3.png" />
</div>
</div>
</div>
</div>

<div id="L6">
<div class="L6-float"></div>
<div class="L6-container">
<img src="images/about/prestigious.png"/>
<div class="L6-text">
<p>我们努力为华樱学子提供最优的学习环境,努力用最专业的知识帮助所有同学在提升英语能力的同时获得你们所想要的分数。
加入华樱大家庭，我们就不再是单一的师生关系，我们是和你一起在留学备考道路上一起奔跑的战友！我们是你在迷茫时帮
你走出困境的导师！</p>
<br/>
<h1><img src="images/about/comma_l.png" width="77" height="59" /> 大家说：</h1>
<br/>
<p class="L6-comment">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;感谢华樱外语各位老师半年来的陪伴与教育，不仅在学习上传授给了我经典又适合的学习方法，生活是对我也是非常照顾。在华樱就像在自己家一样，我爱你们。
</p>
<br/>
<p class="L6-sign">Garrison Chen</p>
<br/><br/><br/>
<p class="L6-comment">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;去年六月，我来到华樱，虽然我在华樱的日子不长，但是片言之赐，皆我师也。正是华樱外语老师的专业和关怀，才让我们仰之弥高、钻之弥坚。感谢华樱！
</p>
<br/>
<p class="L6-sign">伍先煜Edger Wu</p>
<br/><br/><br/>
<p class="L6-comment">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;孤单奋斗SAT的日子中，是你们陪我一路走来！现在还怀念每天跑到办公室抓住你们问题的日子！最后，不要太辛苦，注意休息。
</p>
<br/>
<p class="L6-sign">喵若林万岁万万岁<img style="margin-right:-140px; margin-left:10px;" src="images/about/comma_r.png" width="77" height="59" /> </p>
</div>
<div class="clearfix"> </div>
<div id="a_letter" class="L6-image">
<div class="L6-image-letter">
<h1>致，亲爱的同学们！</h1>
<br />
<p>公交5分钟一班，地铁7分钟一班，若60分钟于你，又是何意义?<br/>
于我，它可以高谈阔论赛达阅读的咬文嚼字; <br/>
于我，它可以低沉深思托福阅读的静谧厚重;<br/>
于我，它可以架起与学生的另类友谊;<br/>
于我，它可以撑起与家长的超凡沟通。<br/>
于我，它赋予的不只是三尺讲台，一缕书卷;<br/>
于我，它让我明白了教师的视野，人生的理想，积淀的密度，责任的宽度。<br/>
于我，它馈赠了犹如秋天的硕果，陈年的美酒般的愉悦。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;感谢这短暂的时光，感谢这匆匆的岁月，感谢这平凡的职位，我相信，终有一天它必使我一生厚重而充实与这群可爱的孩子们共同学习生活的时间里，有很多感动的事，难忘的点滴。留学语言学习、专业选择、文书准备这些仅仅是留学的前奏。要真正适应海外学习，在海外愉快地生活、最终提升自己的竞争力才是我们留学的真正意义所在！相信汗水和付出总能收获到一份属于你们自己的成功！
</p>
<h2>爱你们的华樱老师</h2>
</div>
</div>
</div>
</div>
<!----- //T-top-image---->

<div class="clearfix"> </div>
            <uc1:footer runat="server" ID="footer" />
</body>
</html>