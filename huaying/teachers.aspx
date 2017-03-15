<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teachers.aspx.cs" Inherits="teachers" %>

<%@ Register Src="~/footer.ascx" TagPrefix="uc1" TagName="footer" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>华樱外语_名师团队</title>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
                <script type="text/javascript">
                    function showBg(str) {
                        $("#show" + str).show();
                    }
                    function closeBg(str) {
                        $("#show" + str).hide();
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
                    var l_name = document.getElementById("record_name" + str).value;
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
                askwhom: str,
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
        $(".T-team-container ul li:gt(7)").hide();
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
            <li  class="active"><a  href="teachers.aspx">名师团队</a> </li>
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
<!----- T-top-image----> 
    <div class="clearfix"> </div>

<div id="T-top-image">
    <img src="images/teacher_all.gif" width="1920" height="1366" id="ttopimg" />
    <img class="T-top-image-head" src="images/teachers_head.png" />
</div>
<!----- //T-top-image---->
 <!----- T-top-text----> 
    <div class="clearfix"> </div>

<div class="T-top-text">
<div class="T-top-text-container">
<div class="col-md-4">
<div class="T-top-text-item">
<h1>雅思教研组</h1>
<p><br/>西南首批雅思官方合作伙伴<br/>阅读最高成绩：<b>9.0分</b><br/>听力最高成绩：<b>9.0分</b><br/>口语最高成绩：<b>7.5分</b><br/>写作读最高成绩：<b>7.5分</b><br/><br/></p>
</div>
</div>
<div class="col-md-4">
<div class="T-top-text-item">
<h1>北美教研组</h1>
<p><br/>ETS官方颁证托福名师<br/>美国T50海归SAT/ACT名师	<br/>TPO模考+精讲<br/>最高托福成绩：<b>117分</b><br/>最高SAT成绩：<b>2290分</b><br/><br/></p>
</div>
</div>
<div class="col-md-4">
<div class="T-top-text-item">
<h1>小语种教研组</h1>
<p><br/>法、意、日海归名师授课<br/>日语（J-TEST）考试培训<br/>法语(TCF/TEF) 考试培训<br/>意大利语(CILS) 考试培训<br/><b>最新海外同步教材</b><br/><br/></p>
</div>
</div>
</div>
</div>
<!----- //T-top-text---->
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
    

<!----- T-team---->
<div class="T-team">
<div class="T-team-text-container">
<div class="T-team-text">
<p class="ttt1">看得见的<b>高分荣耀，</b></p><p class="ttt2">&nbsp;看不见的<b>专业力量！</b>
</p></div>
</div>   

<div class="T-team-container">
<ul>
    <asp:Literal ID="ltltea" runat="server" Visible="true"></asp:Literal>  
</ul>
</div>
</div>
    <div class="clearfix"> </div>
<div class="T-team-container"><button id="T-jianhua" onclick="javascript:button_onclick();">more>></button></div>
<script>
    function button_onclick() {
        if ($("#T-jianhua").text() == "fold<<") {
            $(".T-team-container ul li:gt(7)").hide();
            $("#T-jianhua").text("more>>");
        } else {
            $(".T-team-container ul li:gt(7)").show();
            $("#T-jianhua").text("fold<<");
        }
    }
</script>
<!----- //T-team---->
    <div class="clearfix"> </div>
            <br /><br /><br />
            <div class="clearfix"> </div>
            <uc1:footer runat="server" ID="footer" />
</body>
</html>