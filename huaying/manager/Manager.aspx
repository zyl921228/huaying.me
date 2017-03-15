<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Manager.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>华樱外语_后台管理</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="ext/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="ext/ext-all.js"></script>
    
    <script type="text/javascript">
    Ext.onReady(function(){
       Ext.BLANK_IMAGE_URL="ext/resources/images/default/s.gif";
       var viewport = new Ext.Viewport({
            layout:'border',
            items:[ {
                region:'west',
                id:'west',
                //el:'panelWest',
                title:'菜单导航',
                split:true,
                width: 200,
                minSize: 200,
                maxSize: 400,
                collapsible: true,
                margins:'60 0 2 2',
                cmargins:'60 5 2 2',
                layout:'fit',
                layoutConfig:{ activeontop:true},
                defaults: { bodyStyle: 'margin:0;padding:0;'},
                //iconCls:'nav',
                items:
                    new Ext.TabPanel({
                        border:false,
                        activeTab:0,
                        tabPosition:'bottom',
                        items:[
                               {
                                   contentEl: 'west_content',
                                  layout:'accordion',layoutConfig:{animate:true }, 
                                  title:'后台管理',
                                  autoScroll:true,
                                  border:false,
                                  items:[<%=  GetMenuString() %>]
                               }]
                     })
            },{
                region:'center',
                el:'center',
                deferredRender:false,
                margins:'60 0 2 0',
                html: '<iframe id="center-iframe" width="100%" height=100% name="main"  frameborder="0" scrolling="auto" style="border:0px none; background-color:#FFF;"  src="right.aspx" ></iframe>',
                autoScroll:true 
            },
            {
                region:'south',
                margins:'0 0 0 2',
                border:false,
                html:'<div class="menu south">huaying.me后台框架</div>'
               }
            ]
        });
        
        setTimeout(function(){
        Ext.get('loading').remove();
        Ext.get('loading-mask').fadeOut({remove:true});
        }, 250)
    });
    </script>
    <base target="_self" />
</head>
<body>
    <form id="form1" runat="server">
     <div id="loading-mask" style=""></div>
      <div id="loading">
        <div class="loading-indicator"><img src="ext/resources/extanim32.gif" width="32" height="32" style="margin-right:8px;" align="absmiddle"/>Loading...</div>
      </div>
  <div id="header"><h1><%= ConfigurationManager.AppSettings["SubTitle"] %></h1></div>
  <div class="menu">
                <span style="float: left">欢迎您&nbsp;&nbsp;<b>管理员</b>&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="LinkButton1" runat="server">清空缓存</asp:LinkButton></span>
                <span id="aLoginOut" runat="server" style="float: right"><a onclick="if (!window.confirm('您确认要注消当前登录用户吗？')){return false;}"
                    href="loginout.aspx">注销</a></span>
            </div>
  <div id="west">
    
  </div>
  <div id="center">
    
  </div>
  <div id="west_content" style="height:300px; ">
     <%-- <asp:TreeView ID="TreeView1" runat="server" ExpandDepth="0" 
          ImageSet="XPFileExplorer" ShowLines="True">
      </asp:TreeView>--%>
  </div>
    </form>
</body>
</html>
