# huaying.me



Requirements: User Interfaces are expected to adapt different kinds of devices, such as computers, tablets, and cellphones, which have different screen sizes.

Solution: Using "@media (max-width:991px)" in stylesheets.  

Course Filter

Page URL：http://www.huaying.me/course.html

huaying_selector



Requirements: 1. A course filter, which has multiple conditions. 2. Better Search Engine Optimization (SEO).  

Solution: Using JavaScript combined with URL Rewrite.

JS Code:

<script type="text/javascript"> $(function () { function () { $(this).addClass("seling"); }, function () { $(this).removeClass("seling"); } ); $("#fil1_1,#fil2_1,#fil3_1,#fil4_1,#fil5_1,#fil6_1").attr("class", "seled");  $("#filter a").click(function () { $(this).parents("dl").children("dd").each(function () { $('a',this).removeClass("seled"); }); $(this).attr("class", "seled"); }); }); function RetSelecteds() { var result = ""; $("#filter a[class='seled']").each(function () { result += $(this).html()+"\n"; }); return result; } </script>  

Web.config:  

<RewriterConfig> <Rules> <RewriterRule> <LookFor>~/course_.html</LookFor> <SendTo>~/course.aspx?course=</SendTo> </RewriterRule> </Rules> </RewriterConfig>  

Online Test

Page URL：http://www.huaying.me/exam.aspx



Requirements: 1. To provide richer, faster and more interactive experiences by updating data without reloading the entire page. 2. Three different kinds of questions (Reading, Listening, Grammar), each of which has its own panel style.  

Solution: AJAX + XML +jQuery

JS Code:

var score = [0, 0, 0, 0]; function showAjax(str) { if (str == 2 || str == 3 || str == 4 || str == 5) { var _radio = document.getElementsByTagName("input"); for (var i = 0; i < _radio.length; i++) if ((_radio[i].checked && _radio[i].className == "bingo") == true) { score[str - 2] = score[str - 2] + 10; } } $('#Exam_Ajax').load('note' + str + '.xml', function () { $('.exam-slider').flexslider(); }); }

Tags System

Page URL：http://www.huaying.me/news_detail_580.html

huaying_tags1

huaying_tags2



Requirements: 1. Each post has several tags which can be customized by the web editor. 2. By clicking one of these tags, you can see a list of posts including the same tag.

Solution: Using <asp:Literal></asp:Literal> + SQL Select Command

C# Code:

//news_detail.aspx.cs

SqlDataReader reader_keywords = SqlHelper.ExecuteReader("select * from keywords"); while (reader_keywords.Read()) { Regex r = new Regex(reader_keywords["name"].ToString().Trim()); content = r.Replace(content, "<a href=\"" + reader_keywords["url"].ToString().Trim() + "\">" + reader_keywords["name"].ToString().Trim() + "</a>", 1); } reader_keywords.Close(); StringBuilder sb_taglink = new StringBuilder(""); sb_tags.Append(reader["tags"].ToString().Trim()); string[] tag = sb_tags.ToString().Split(new char[] { ';' }); for (int i = 0; i < tag.Length;i++ ) { sb_taglink.Append("&nbsp;&nbsp;<a href=\"news_tags_" + UnicodeConverter.ToUnicode(tag[i]) + "_page1.html\">" + tag[i] + "</a>");// UnicodeConverter.ToUnicode(tag[i]) } ltlhead.Text = sb_head.ToString(); ltlsubhead.Text = sb_subhead.ToString(); ltlcontent.Text = content; ltltags.Text = sb_taglink.ToString();

//news_tags.aspx.cs

SqlDataSource1.SelectCommand = "select top " + pageSize + " * from news where (id not in (select top " + (page_id - 1) * pageSize + " id from news where [tags] LIKE '%" + tag_decode + "%' order by id desc)) AND ([tags] LIKE '%" + tag_decode + "%') order by id desc"; ltlpager.Text = pager_tmp.ToString(); return pager_tmp.ToString();

Co-workers: Designers in Huaying Education Group (Providing UI Design Draft) I conducted front-end and back-end coding.    
