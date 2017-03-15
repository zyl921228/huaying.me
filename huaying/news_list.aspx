<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news_list.aspx.cs" Inherits="course" %>

<%@ Register Src="~/footer.ascx" TagPrefix="uc1" TagName="footer" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>华樱外语_我要选课</title>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
    <script type="text/javascript">
        function showBg(str) {
            $("#show"+str).show();
        }
        function closeBg(str) {
            $("#show"+str).hide();
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
<body   onscroll="BodyScroll();"  data-offset="200" data-spy="scroll" data-target="#navbar-example" style="background-color:#f5f5f5;">
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
<!--C-top-list-->
<div class="N-news-container">
<div class="N-news-leftcol">
       <div id="navbar-example" class="news-left" >
   <div class="navbar-default">
    <ul class="nav navbar-nav news-list">
    <li><a href="#q1">考试快讯</a></li>
<li><a href="#q2">留学前沿</a></li>
    </ul>
    </div>
   </div>
</div>        
<div class="N-news-rightcol">
    <div id="q1" class="N-news-rightcol-head">考试快讯</div>
<div class="N-news-list">
            <br /><br /><br />
    <asp:ScriptManager ID="ScriptManager1" runat="server" > 
</asp:ScriptManager> 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
            <EmptyDataTemplate>
                <table id="Table1" runat="server"  style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>未返回数据。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td id="Td1" runat="server" />
            </EmptyItemTemplate>
            <ItemTemplate> <div id="Td2" runat="server" class="N-news-list-item">
              <asp:HyperLink ID="HyperLink1" runat="server"   NavigateUrl='<%# Eval("id","news_detail_{0}.html") %>' > 
                    <asp:Image ID="Image1" runat="server" CssClass="N-news-list-image"  ImageUrl='<%# Eval("picpath_w") %>'/>
                    <br />
                  <asp:Label ID="N_detail_title" runat="server" Text='<%# StringSub(Eval("title").ToString(),34) %>' />  
                    <br />
                    <asp:Label ID="N_detail_intro" CssClass="N_detail_intro" runat="server" Text='<%# StringSub(Eval("intro").ToString(),34) %>' />
                    <br />
                    <asp:Label ID="N_detail_date" runat="server" Text='<%# Eval("date","{0:yyyy年MM月dd日}") %>' />
                    <br />
               </asp:HyperLink> </div>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="Table2" runat="server" cellspacing="0" cellpadding="0">
                    <tr id="Tr1" runat="server">
                        <td id="Td3" runat="server">
                        <table id="itemPlaceholderContainer" class="N-news-list-placeholder" runat="server">
                            <tr id="itemPlaceholder" runat="server"></tr>
                        </table>
                        </td>
                    </tr>
                    <tr id="Tr2" runat="server">
                        <td id="Td4" runat="server" class="N-pager">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowNextPageButton="False" ButtonCssClass="N-pager-pre"  PreviousPageText=""  />
                                              
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowPreviousPageButton="False" ButtonCssClass="N-pager-next" NextPageText=""  />
                                    <asp:TemplatePagerField>              
            <PagerTemplate>
            <div class="N-pager-num">第
            <asp:Label runat="server" ID="CurrentPageLabel" 
              Text="<%# Container.TotalRowCount>0 ? (Container.StartRowIndex / Container.PageSize) + 1 : 0 %>" />
            /
            <asp:Label runat="server" ID="TotalPagesLabel" 
              Text="<%# Math.Ceiling ((double)Container.TotalRowCount / Container.PageSize) %>" />
            页
                </div>
            </PagerTemplate>
          </asp:TemplatePagerField>
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
            </ContentTemplate>
        </asp:UpdatePanel>
</div>
    <div class="clearfix"></div>
    <br /><br /><br />
    <div class="clearfix"></div>
        <div name="q2" id="q2" class="N-news-rightcol-head">留学前沿</div>
<div class="N-news-list">
            <br /><br /><br />

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
        <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource2" EnableModelValidation="True">
            <EmptyDataTemplate>
                <table id="Table1" runat="server"  style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>未返回数据。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td id="Td1" runat="server" />
            </EmptyItemTemplate>
            <ItemTemplate> <div id="Td2" runat="server" class="N-news-list-item">
              <asp:HyperLink ID="HyperLink1" runat="server"   NavigateUrl='<%# Eval("id","news_detail_{0}.html") %>' > 
                  <asp:Label ID="N_detail_title" runat="server" Text='<%# StringSub(Eval("title").ToString(),38) %>' />  
                    <br />
                    <asp:Label ID="N_detail_intro" CssClass="N_detail_intro" runat="server" Text='<%# StringSub(Eval("intro").ToString(),38) %>' />
                    <br />
                    <asp:Label ID="N_detail_date" runat="server" Text='<%# Eval("date","{0:yyyy年MM月dd日}") %>' />
                    <br />
               </asp:HyperLink> </div>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="Table2" runat="server" cellspacing="0" cellpadding="0">
                    <tr id="Tr1" runat="server">
                        <td id="Td3" runat="server">
                        <table id="itemPlaceholderContainer" class="N-news-list-placeholder" runat="server">
                            <tr id="itemPlaceholder" runat="server"></tr>
                        </table>
                        </td>
                    </tr>
                    <tr id="Tr2" runat="server">
                        <td id="Td4" runat="server" class="N-pager">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowNextPageButton="False" ButtonCssClass="N-pager-pre"  PreviousPageText=""  />
                                              
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowPreviousPageButton="False" ButtonCssClass="N-pager-next" NextPageText=""  />
                                    <asp:TemplatePagerField>              
            <PagerTemplate>
            <div class="N-pager-num">第
            <asp:Label runat="server" ID="CurrentPageLabel" 
              Text="<%# Container.TotalRowCount>0 ? (Container.StartRowIndex / Container.PageSize) + 1 : 0 %>" />
            /
            <asp:Label runat="server" ID="TotalPagesLabel" 
              Text="<%# Math.Ceiling ((double)Container.TotalRowCount / Container.PageSize) %>" />
            页
                </div>
            </PagerTemplate>
          </asp:TemplatePagerField>
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
                </ContentTemplate>
            </asp:UpdatePanel>
</div>
    <br />
        <a href="news_sublist_0_1.html" style="color:#2c3542;float:right;font-size:14px;">查看更多新闻>></a>
</div>   
</div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeconnectionString %>" SelectCommand="SELECT * FROM [news] where [type]=1 ORDER BY [date] DESC"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MeconnectionString %>" SelectCommand="SELECT * FROM [news] where [type]=2 ORDER BY [date] DESC"></asp:SqlDataSource>
<!--//C-top-list-->
<div class="clearfix"> </div>
<!--C-top-list-->
<div class="news-list">

</div>
<!--//C-top-list-->
<div class="clearfix"> </div>
        <br /><br /><br /><br />
        <div class="clearfix"> </div>
        <uc1:footer runat="server" ID="footer" />
        </form>
</body>
</html>