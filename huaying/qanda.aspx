<%@ Page Language="C#" AutoEventWireup="true" CodeFile="qanda.aspx.cs" Inherits="qanda" %>

<%@ Register Src="~/footer.ascx" TagPrefix="uc1" TagName="footer" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html><head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>华樱外语_备考须知</title>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js">
  </script>
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
        <script language="javascript">
            function BodyScroll() {
                nScrollHight = document.body.scrollHeight;
                nScrollTop = document.body.scrollTop;
                if (nScrollTop + window.innerHeight >= nScrollHight - 300) {

                    document.getElementById("navbar-example").style.height = '460px';
                    document.getElementById("navbar-example").style.overflowY = 'scroll';
                    document.getElementById("navbar-example").style.top = '0px';

                }
                else {
                    document.getElementById("navbar-example").style.height = 'auto';
                    document.getElementById("navbar-example").style.overflowY = 'auto';
                    document.getElementById("navbar-example").style.top = 'auto';
                }
            }
</script>
		<body  onscroll="BodyScroll();"  data-offset="200" data-spy="scroll" data-target="#navbar-example">
        <div id="bodyscroll">
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
            <li  class="active"><a  href="qanda.aspx">备考须知</a> </li>
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
<!--scroll-->
<div class="news-container">
   <div id="navbar-example" class="news-left" >
   <div class="navbar-default">
<h1>FAQ</h1>
    <ul class="nav navbar-nav news-list">
    <asp:Literal ID="ltlleft" runat="server" Visible="true"></asp:Literal>  
    </ul>
    </div>
   </div>
<div class="news-right" >
<ul class="news-detail-list">
<asp:Literal ID="ltlright" runat="server" Visible="true"></asp:Literal>  
</ul>
</div>
  </div>
<!--scroll-->
<div class="clearfix"> </div>
            <br /><br /><br /><br />
            <div class="clearfix"> </div>
            <uc1:footer runat="server" ID="footer" />
</div>
</body>
</html>
