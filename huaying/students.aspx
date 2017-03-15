<%@ Page Language="C#" AutoEventWireup="true" CodeFile="students.aspx.cs" Inherits="students" %>

<%@ Register Src="~/footer.ascx" TagPrefix="uc1" TagName="footer" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>华樱外语_学霸专区</title>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
		<script type="text/javascript">
		    $(function () {
		        $('#home_slider').flexslider({
		            animation: 'slide',
		            controlNav: true,
		            directionNav: false,
		            animationLoop: true,
		            slideshow: false,
		            useCSS: false
		        });

		    });
							</script>
		<script type="text/javascript">
		    $(function () {
		        $('#love_slider').flexslider({
		            animation: 'slide',
		            controlNav: false,
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
		<!---- Ajax---->
            <script type="text/javascript">
                function showAjax2(str) {
                    var l_name = document.getElementById("love_name").value;
                    var l_phone = document.getElementById("love_phone").value;
                    var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
                    if (l_name == "") {
                        alert("请输入姓名");
                        return;
                    }
                    if (l_phone == "") {
                        alert("请输入电话/qq/微信");
                        return;
                    }
                    
                    $.post("ajax_post.ashx",
            {
                name: l_name,
                phone: l_phone,
                type: 1
            },
            function (data, status) {
                alert("注册成功！欢迎加入爱@世界！");
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
            nav: false,
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
<!----//Start-LightBox-script----> 

<script src="js/lightGallery.js"></script> 
<script>
    $(document).ready(function () {
        $(".lightBox").lightGallery();
    });
    </script> 
<!----//End-LightBox-script----> 
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
            <li  class="active"><a  href="students.aspx">学霸专区</a> </li>
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

<!-- Slideshow 4 -->
<div  id="top" class="callbacks_container">
          <ul class="rslides" id="slider4">
    <li> <img src="images/slide3.gif" alt="">
              <div class="caption">
        <div class="lightBox"><!--[if lte IE 8]><a data-iframe="true" data-src="http://v.qq.com/iframe/player.html?vid=m01184ui0x8&height=480&tiny=1&auto=1" class="play_btn" href="#"></a><![endif]--><!--[if !IE]><--><a data-iframe="true" data-src="http://v.qq.com/iframe/player.html?vid=m01184ui0x8&tiny=1&auto=1" class="play_btn" href="#"></a><![endif]--></div>
        <div class="caption_sub">
                  <p>播放次数：161616次</p>
                </div>
      </div>
            </li>
  </ul>
        </div>
<div class="clearfix"> </div>
<!----- //End-slider---->
<div class="clearfix"> </div>

<!---- students ---->
<div class="students">
          <div class="students-left">
    <p>在这段时间里我觉得这里的老师给我了其他机构不一样的感受。这里的老师对于每一个学生的情况了解的非常清楚。他们会和我谈心、聊天，帮我解答问题总的来说，在求学生涯上，华樱是一个非常温暖的港湾。</p>
    <h1>姜喆钟（托福103分、SAT I:2030分） <br/>
              现就读于英属哥伦比亚大学</h1>
    <p>十分幸运，在留学梦想的道路上，我选择了华樱；负责我法语签证培训的李老师，正因为有了他专业的培训指导，我才能顺利突破出国前最后的一道大难关面签！我能够一签顺利通过，离不开李老师丰富的经验和专业的指导！</p>
    <h1>步天星(法语TCF：363分） <br/>
              现就读学校：巴黎高级时装学院ESMOD</h1>
    <p>当初我非常明智的选择了华樱外语，是华樱给了我人生的一次飞跃。在得到这次肯定后，我决心将更多精力放在学习上，更不敢有丝毫的怠慢和松懈。我将会带着父母以及老师的期盼前往国外追寻属于自己的梦。</p>
    <h1>蓝天阳（雅思首战：7.0分） <br/>
              现就读于澳大利亚新南威尔士大学</h1>
  </div>
          <div class="students_slider"> 
    <!---- students_head ---->
    <div class="students_head">
              <div class="students_head_item col-md-3 ico_1"><div class="ico_img_1"></div>
        <p><b>3165</b>名<br/>
                  学员的选择</p>
      </div>
              <div class="students_head_item col-md-3 ico_2"><div class="ico_img_2"></div>
        <p><b>8.0</b>分<br/>
                  Best Score</p>
      </div>
              <div class="students_head_item col-md-3 ico_3"><div class="ico_img_3"></div>
        <p><b>117</b>分<br/>
                  Best Score</p>
      </div>
              <div class="students_head_item col-md-3 ico_4"><div class="ico_img_4"></div>
        <p><b>2290</b>分<br/>
                  Best Score</p>
      </div>
            </div>
    <!----//students_head---->
    <div class="clearfix"> </div>
    <div id="home_slider" class="flexslider">
              <ul class="slides">
                  <asp:Literal ID="ltlstu" runat="server" Visible="true"></asp:Literal>  
      </ul>
            </div>
  </div>
        </div>
<!----//students---->
<div class="clearfix"> </div>
    <!---- love_head ---->
    <div class="love_head">
    <div class="love_head_left">
    <img src="images/love_logo.jpg" width="216" height="72" />
    </div>
    <div class="love_head_right">
    <h1><b>就是你！充满正能量的90后</b></h1>
    <div class="clearfix"> </div>
              <div class="students_head_item col-md-3 ico_5"><div class="ico_img_5"></div>
        <p>The Aged Care<br/>
                  尊爱老人</p>
      </div>
              <div class="students_head_item col-md-3 ico_6"><div class="ico_img_6"></div>
        <p>Life & Health<br/>
                  生命健康</p>
      </div>
              <div class="students_head_item col-md-3 ico_7"><div class="ico_img_7"></div>
        <p>Animal Welfare<br/>
                  关爱动物</p>
      </div>
              <div class="students_head_item col-md-3 ico_8"><div class="ico_img_8"></div>
        <p>Friends of Earth<br/>
                 环保有我</p>
      </div>
            </div>
            </div>
    <!----//love_head---->
    <div class="clearfix"> </div>
<!----love---->
<div class="love_slider">
          <div id="love_slider" class="flexslider">
    <ul class="slides">
              <li>
        <div class="slide">
                  <div class="love_container"> 
                  <div class="love_item"><img src="images/love1.jpg" width="256" height="122" />
                  <p>爱@世界创意公益快闪<br/>时间：2014年3月<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一场西南地区前所未有的公益快闪，一群爱@世界尊爱老人小组成员，他们在严冬里的一曲“爱”，唱温暖了自己，也感动了路人。</p>
                  </div>
                                    <div class="love_item"><img src="images/love2.jpg" width="256" height="122" />
                  <p>荧光夜跑（Light Run）<br/>时间：2014年10月<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;荧光夜跑（Light Run）是一种新兴的运动方式，利用荧光装备装扮自己，进行无排名之分、无速度之争的跑步运动。这是一项推崇健康，分享快乐，传递正能量的运动。</p>
                  </div>
                                    <div class="love_item"><img src="images/love3.jpg" width="256" height="122" />
<p>亚洲动物保护基金“狗教授”活动<br/>时间：2014年7月<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以爱护动物为主题，邀请亚洲动物保护基金会老师及“狗教授”亲临授课。从理论上如何与猫狗相处，到亲身实践与狗狗接触，寓教于乐，让学生更加懂得如何饲养、爱护动物。</p>
                  </div>
                  </div>
                  <img class="love_bottom_img"  src="images/love_bottom.png" width="914" height="61" />
                </div>
      </li>
              <li>
        <div class="slide">
                  <div class="love_container"> 
                  <div class="love_item"><img src="images/love1.jpg" width="256" height="122" />
                  <p>爱@世界创意公益快闪<br/>时间：2014年3月<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一场西南地区前所未有的公益快闪，一群爱@世界尊爱老人小组成员，他们在严冬里的一曲“爱”，唱温暖了自己，也感动了路人。</p>
                  </div>
                                    <div class="love_item"><img src="images/love2.jpg" width="256" height="122" />
                  <p>荧光夜跑（Light Run）<br/>时间：2014年10月<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;荧光夜跑（Light Run）是一种新兴的运动方式，利用荧光装备装扮自己，进行无排名之分、无速度之争的跑步运动。这是一项推崇健康，分享快乐，传递正能量的运动。</p>
                  </div>
                                    <div class="love_item"><img src="images/love3.jpg" width="256" height="122" />
<p>亚洲动物保护基金“狗教授”活动<br/>时间：2014年7月<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以爱护动物为主题，邀请亚洲动物保护基金会老师及“狗教授”亲临授课。从理论上如何与猫狗相处，到亲身实践与狗狗接触，寓教于乐，让学生更加懂得如何饲养、爱护动物。</p>
                  </div>
                  </div>
                  <img class="love_bottom_img"  src="images/love_bottom.png" width="914" height="61" />
                </div>
      </li>
            </ul>
  </div>
        </div>
<!----//love---->
<div class="clearfix"> </div>
<br/><br/>
<!--join-love-->
<div class="join-love-form">
            <div class="join-love-boxs">
            <span class="join-love-text">
              我要加入爱@世界
              </span> <span>
              <input id="love_name" placeholder="姓名" type="text">
              </span> <span>
              <input id="love_phone" placeholder="手机\QQ\微信" type="text">
              </span> <span>
              <input type="submit" onclick="showAjax2(6)" value="提交" />
              </span> </div>
                </div>
<!--//join-love-->
<div class="clearfix"> </div>
            <br /><br /><br /><br />
            <div class="clearfix"> </div>
            <uc1:footer runat="server" ID="footer" />
</body>
</html>