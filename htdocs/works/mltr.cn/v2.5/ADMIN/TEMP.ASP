<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Option Explicit
Response.Buffer=True
Session.CodePage=65001

'======================================================================================
'Access 数据库 SQL 脚本生成 by MiniAccess Edit V1.0 P2(V37 PaintBlue.Net 2004 Asp Code)
'======================================================================================

SUB CreateDB(DB_Name,NewDB_Name,loginName,loginPassword,sapass,DTS)
DIM CONN,CONNstr
CONNStr="Provider=SQLOLEDB.1;Password='" & sapass & "';Persist Security InFso=true;User ID='sa';Initial Catalog='Master';Data Source='(local)';CONNect Timeout=30"
Set CONN=Server.CreateObject("ADODB.Connection")
CONN.open CONNStr

CONN.execute("Create Database [" & NewDB_Name & "]")
CONN.close
CONNStr="Provider=SQLOLEDB.1;Password='" & sapass & "';Persist Security InFso=true;User ID='sa';Initial Catalog='" & NewDB_Name & "';Data Source='(local)';CONNect Timeout=30"
CONN.open CONNStr

CONN.execute("if not exists (select * from master.dbo.syslogins where loginname = N'" & loginName & "') BEGIN exec sp_addlogin N'" & loginName & "','1','" & NewDB_Name & "' End ")
CONN.execute("exec sp_adduser '" & loginName & "','" & loginName & "','db_owner'")
'[Shop_Cate]:

CONN.execute("CREATE TABLE [dbo].[Shop_Cate] (" & _
    "[CateID] integer IDENTITY (1,1) not null," & _
   "[CateOrder] smallint Default (0) null ," & _
   "[CateName] nvarchar(255) null ," & _
   "[CateCName] nvarchar(255) null ," & _
   "[CateFatherID] smallint Default (0) null ," & _
   "[CateRootID] smallint Default (0) null " & _
  ") ON [Primary]")

'[Shop_Config]:

CONN.execute("CREATE TABLE [dbo].[Shop_Config] (" & _
   "[ConfigOrderPosted] ntext null " & _
  ") ON [Primary]")

'[Shop_Goods]:

CONN.execute("CREATE TABLE [dbo].[Shop_Goods] (" & _
    "[GoodsID] integer IDENTITY (1,1) not null," & _
   "[CateID] smallint Default (0) null ," & _
   "[GoodsName] nvarchar(255) null ," & _
   "[GoodsSummary] ntext null ," & _
   "[GoodsIntro] ntext null ," & _
   "[GoodsInfo] ntext null ," & _
   "[GoodsPic] nvarchar(255) null ," & _
   "[GoodsDate] datetime Default (=Date()) null ," & _
   "[GoodsPrice] smallint Default (0) null ," & _
   "[GoodsFavorPrice] smallint Default (0) null ," & _
   "[GoodsFavorNum] smallint Default (0) null ," & _
   "[GoodsMemberPrice] smallint Default (0) null ," & _
   "[GoodsPostPrice] smallint Default (0) null ," & _
   "[GoodsFastPostPrice] smallint Default (0) null ," & _
   "[GoodsCommentURL] nvarchar(255) null ," & _
   "[GoodsIsCommend] bit not null " & _
  ") ON [Primary]")

'[Shop_Order]:

CONN.execute("CREATE TABLE [dbo].[Shop_Order] (" & _
    "[OrderID] integer IDENTITY (1,1) not null," & _
   "[GoodsID] smallint Default (0) null ," & _
   "[OrderUserName] nvarchar(50) null ," & _
   "[OrderRealName] nvarchar(50) null ," & _
   "[OrderUserID] smallint Default (0) null ," & _
   "[OrderUserZipCode] nvarchar(50) null ," & _
   "[OrderUserAddress] ntext null ," & _
   "[OrderUserPhone] nvarchar(50) null ," & _
   "[OrderUserEmail] nvarchar(255) null ," & _
   "[OrderUserQQ] nvarchar(50) null ," & _
   "[OrderRemark] ntext null ," & _
   "[OrderDeliver] smallint Default (0) null ," & _
   "[OrderGoodsAmount] smallint Default (0) null ," & _
   "[OrderState] smallint Default (0) null ," & _
   "[OrderTime] datetime Default (=Now()) null ," & _
   "[OrderFactPrice] smallint Default (0) null " & _
  ") ON [Primary]")

'[Shop_Cate]:

CONN.execute("CREATE INDEX [CateFatherID] on [dbo].[Shop_Cate]([CateFatherID] ) ON [Primary]")
CONN.execute("CREATE INDEX [CateID] on [dbo].[Shop_Cate]([CateID] ) ON [Primary]")
CONN.execute("CREATE INDEX [CateRootID] on [dbo].[Shop_Cate]([CateRootID] ) ON [Primary]")

'[Shop_Config]:


'[Shop_Goods]:

CONN.execute("CREATE Unique INDEX [GoodsID] on [dbo].[Shop_Goods]([GoodsID] ) ON [Primary]")

'[Shop_Order]:

CONN.execute("CREATE Unique INDEX [OrderID] on [dbo].[Shop_Order]([OrderID] ) ON [Primary]")
CONN.execute("CREATE INDEX [GoodsNum] on [dbo].[Shop_Order]([OrderGoodsAmount] ) ON [Primary]")
CONN.execute("CREATE INDEX [OrderGoodsID] on [dbo].[Shop_Order]([GoodsID] ) ON [Primary]")
CONN.execute("CREATE INDEX [OrderUserZipCode] on [dbo].[Shop_Order]([OrderUserZipCode] ) ON [Primary]")

'[Shop_Cate]:
CONN.execute("SET IDENTITY_INSERT [dbo].[Shop_Cate] ON")

CONN.execute("INSERT INTO [dbo].[Shop_Cate] ([CateID],[CateOrder],[CateName],[CateCName],[CateFatherID],[CateRootID]) " & _
 "SELECT [CateID],[CateOrder],[CateName],[CateCName],[CateFatherID],[CateRootID] " & _
 "FROM OPENDATASOURCE('Microsoft.Jet.OLEDB.4.0','Data Source=""F:\WORK\MLTR.Cn\database\shop.mdb""')...[Shop_Cate]")

CONN.execute("SET IDENTITY_INSERT [dbo].[Shop_Cate] Off")


'[Shop_Config]:
CONN.execute("INSERT INTO [dbo].[Shop_Config] ([ConfigOrderPosted]) " & _
 "SELECT [ConfigOrderPosted] " & _
 "FROM OPENDATASOURCE('Microsoft.Jet.OLEDB.4.0','Data Source=""F:\WORK\MLTR.Cn\database\shop.mdb""')...[Shop_Config]")

'[Shop_Goods]:
CONN.execute("SET IDENTITY_INSERT [dbo].[Shop_Goods] ON")

CONN.execute("INSERT INTO [dbo].[Shop_Goods] ([GoodsID],[CateID],[GoodsName],[GoodsSummary],[GoodsIntro],[GoodsInfo],[GoodsPic],[GoodsDate],[GoodsPrice],[GoodsFavorPrice],[GoodsFavorNum],[GoodsMemberPrice],[GoodsPostPrice],[GoodsFastPostPrice],[GoodsCommentURL],[GoodsIsCommend]) " & _
 "SELECT [GoodsID],[CateID],[GoodsName],[GoodsSummary],[GoodsIntro],[GoodsInfo],[GoodsPic],[GoodsDate],[GoodsPrice],[GoodsFavorPrice],[GoodsFavorNum],[GoodsMemberPrice],[GoodsPostPrice],[GoodsFastPostPrice],[GoodsCommentURL],[GoodsIsCommend] " & _
 "FROM OPENDATASOURCE('Microsoft.Jet.OLEDB.4.0','Data Source=""F:\WORK\MLTR.Cn\database\shop.mdb""')...[Shop_Goods]")

CONN.execute("SET IDENTITY_INSERT [dbo].[Shop_Goods] Off")


'[Shop_Order]:
CONN.execute("SET IDENTITY_INSERT [dbo].[Shop_Order] ON")

CONN.execute("INSERT INTO [dbo].[Shop_Order] ([OrderID],[GoodsID],[OrderUserName],[OrderRealName],[OrderUserID],[OrderUserZipCode],[OrderUserAddress],[OrderUserPhone],[OrderUserEmail],[OrderUserQQ],[OrderRemark],[OrderDeliver],[OrderGoodsAmount],[OrderState],[OrderTime],[OrderFactPrice]) " & _
 "SELECT [OrderID],[GoodsID],[OrderUserName],[OrderRealName],[OrderUserID],[OrderUserZipCode],[OrderUserAddress],[OrderUserPhone],[OrderUserEmail],[OrderUserQQ],[OrderRemark],[OrderDeliver],[OrderGoodsAmount],[OrderState],[OrderTime],[OrderFactPrice] " & _
 "FROM OPENDATASOURCE('Microsoft.Jet.OLEDB.4.0','Data Source=""F:\WORK\MLTR.Cn\database\shop.mdb""')...[Shop_Order]")

CONN.execute("SET IDENTITY_INSERT [dbo].[Shop_Order] Off")



End SUB

call CreateSQLDB()

SUB Main()
   Response.write("<html><head></head><body topmargin=0><br><center><FORM METHOD=POST><table border=1><tr><td><table cellspacing=0 cellpadding=2 align=center border=0 width=""600"" style=""font-size:9pt"" bgcolor=#D4D0C8>")
   Response.write("<tr bgcolor=#A4D0F8><td colspan=2 align=center style=""font-size:9pt;color:#000000"" height=30><b>Access To SQL server 导入</b>(CooSel2.0 CreateSQL脚本编写器创建 )</td></tr>")
   Response.write("<tr bgcolor=#667766><td colspan=2 height=1></td></tr>")
   Response.write("<tr><td align=right width=""30%"">Sa登陆密码:</td><td><input name=sapass type=password Value='' style=""width:70%;"">(必须输入才能键库)</td></tr>")
   Response.write("<tr bgcolor=#667766><td colspan=2 height=1></td></tr>")
   Response.write("<tr><td align=right width=""30%"">要导入的Access数据库:</td><td><input name=DB_Name Value='F:\WORK\MLTR.Cn\database\shop.mdb' style=""width:70%;""></td></tr>")
   
   Response.write("<tr><td align=right width=""30%"">新建SQL数据库名:</td><td><input name=NewDB_Name Value='shop' style=""width:70%;""></td></tr>")
   Response.write("<tr><td align=right>新建SQL数据库登陆名:</td><td><input name=loginName Value='1' style=""width:70%;""></td></tr>")
   Response.write("<tr><td align=right>新建SQL数据库登陆密码:</td><td><input type=password name=loginPassword Value='1' style=""width:70%;""></td></tr>")
   
   Response.write("<tr><td align=right>是否导入MDB数据到SQL</td><td><input name=DTS type=radio Value='1' checked>是 <input name=DTS type=radio Value='0'>否  </td></tr>")
   Response.write("<tr><td align=right></td><td><br><INPUT TYPE=submit name=CreateDB Value="" 确 定 ""><br><br>注:如果有外键则只建库结构再导入数据可能会出错,要导入的数据库必须和原来的编写SQL脚本的数据库结构一致</td></tr>")
   Response.write("</table></td></tr></table></FORM></center><body></html>")
End SUB

SUB CreateSQLDB()
   dim NewDB_Name,loginName,loginpassword,sapass,DB_Name,DTS,Tstr
   NewDB_Name=questStr("NewDB_Name")
   loginName=questStr("loginName")
   loginpassword=questStr("loginpassword")
   sapass=questStr("sapass")
   DB_Name=questStr("DB_Name")
   DTS=questStr("DTS")
   if isNumeric(DTS) then 
       DTS=clng(DTS)
   else DTS=0
   end if
   if DTS=0 then 
       Tstr="创建完成" 
   else Tstr="创建完成,数据已经导入"
   end if
   if NewDB_Name<>"" then
       Call CreateDB(DB_Name,NewDB_Name,loginName,loginpassword,sapass,DTS)
       response.write vbcrlf & Tstr & "<br>连接字串:<br>CONNstr=""Provider=SQLOLEDB.1;Persist Security InFso=true;Data Source='(local)';Initial Catalog='" & NewDB_Name & "';User ID='" & loginName & "';Password='" & loginpassword & "';CONNect Timeout=30""<br>" & vbcrlf
   else
       call main()
   end if
End SUB

Function questStr(Str)
       Str=request(Str)
       Str=replace(Str,"'","")
       Str=Replace(Str,Chr(0),"")
       Str=Replace(Str," ","")
       questStr=Str
End Function


%>