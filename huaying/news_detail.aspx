<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news_detail.aspx.cs" Inherits="course" %>

<%@ Register Src="~/footer.ascx" TagPrefix="uc1" TagName="footer" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
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
      <div class="top-telephone-T">课程热线：<b>028-86257330</b></div>
    </div>
  </header>
</div>
<!----- //End-Nav---->
<div class="clearfix"> </div>
        <div class="N-news-detail-container">
        <div class="N-news-detail-left">
            <div class="C-sub-head">
                    您现在所在的位置：<a>华樱外语</a>>><a href="news_sublist.aspx">华樱外语资讯</a>>><asp:Literal ID="ltlnewsnavi" runat="server" Visible="true"></asp:Literal>
                    </div>
<h1><asp:Literal ID="ltlhead" runat="server" Visible="true"></asp:Literal> </h1>

            <div class="N-news-detail-subhead">
                <asp:Literal ID="ltlsubhead" runat="server" Visible="true"></asp:Literal> 
            </div>

                                <p style="text-align:center; padding:4px;"><div id="BaiduButton">
<div class="jiathis_style"><span class="jiathis_txt">文章分享到：</span>
	<a class="jiathis_button_weixin"></a>
	<a class="jiathis_button_tsina"></a>
	<a class="jiathis_button_tqq"></a>
	<a class="jiathis_button_qzone"></a>
	<a class="jiathis_button_renren"></a>
	<a class="jiathis_button_tianya"></a>
	<a class="jiathis_button_mop"></a>
	<a class="jiathis_button_qq"></a>
	<a class="jiathis_button_cqq"></a>
	<a class="jiathis_button_feixin"></a>
	<a class="jiathis_button_tieba"></a>
	<a class="jiathis_button_baidu"></a>
	<a class="jiathis_button_hi"></a>
	<a class="jiathis_button_xiaoyou"></a>
	<a href="http://www.jiathis.com/share?uid=1638154" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
	<a class="jiathis_counter_style"></a>
</div>
<script type="text/javascript">
    var jiathis_config = { data_track_clickback: 'true' };
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1340095230357416" charset="utf-8"></script>
</div></p>
<br /><br />

            <div class="N-news-detail-left-content">
                <asp:Literal ID="ltlcontent" runat="server" Visible="true"></asp:Literal> 
                <br /><br /><br /><br />
                Tags:<asp:Literal ID="ltltags" runat="server" Visible="true"></asp:Literal>
                </div>
        </div>
        <div class="N-news-detail-right">
            <div class="N-news-detail-right-background">
                <asp:ScriptManager ID="ScriptManager1" runat="server" > 
</asp:ScriptManager> 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                <EmptyDataTemplate>
                    <span>未返回数据。</span>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <div class="N-news-detail-list">
                        <asp:HyperLink runat="server" NavigateUrl='<%# Eval("id","news_detail_{0}.html") %>'><asp:Image ID="Image1" runat="server" Width="111px" Height="62px" ImageUrl='<%# HavePic(Eval("picpath").ToString()) %>'/>
<asp:Label  CssClass="N-news-detail-list-title" ID="Label1" runat="server"  Text='<%# StringSub(Eval("title").ToString(),40) %>' />
<asp:Label CssClass="N-news-detail-list-id" ID="idLabel" runat="server" Text='<%# (Container.DataItemIndex+1).ToString() %>' />
</asp:HyperLink></div></ItemTemplate><LayoutTemplate>
                                        <div class="N-news-detail-list-btn-container">
                          <asp:DataPager ID="DataPager2" runat="server" PageSize="8">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="N-news-detail-list-btn upbtn" ShowNextPageButton="False" PreviousPageText="" RenderNonBreakingSpacesBetweenControls="False"/></Fields>
                        </asp:DataPager>
                                            </div>
                        <div class="N-news-detail-list-head">最多点击</div><div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div class="N-news-detail-list-btn-container">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="8">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="N-news-detail-list-btn" ShowPreviousPageButton="False" NextPageText="" RenderNonBreakingSpacesBetweenControls="False" /></Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            </ContentTemplate>
        </asp:UpdatePanel>
                </div>
                <br />
        <a href="news_sublist_0_1.html" style="color:#2c3542;float:right;font-size:14px;">查看更多新闻>></a>
        </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeconnectionString %>" SelectCommand="SELECT * FROM [news] ORDER BY [date] DESC"></asp:SqlDataSource>
            </div>
<div class="clearfix"> </div>
<br /><br /><br /><br />
<div class="clearfix"> </div>
        <uc1:footer runat="server" ID="footer" />
        </form>
</body>
</html>