<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Dim db
db="/database/复件 news2.mdb"

Dim NewsConn
SetConn NewsConn, db
'删除无用表
NewsConn.Execute("DROP TABLE blog_Info")
NewsConn.Execute("DROP TABLE blog_WordFilter")
NewsConn.Execute("DROP TABLE blog_VisitorRecord")
NewsConn.Execute("DROP TABLE blog_UserGroup")
NewsConn.Execute("DROP TABLE blog_TrackBack")
NewsConn.Execute("DROP TABLE blog_Smilies")
NewsConn.Execute("DROP TABLE blog_Member")
'删除无用字段
'Content
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_Intro")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_DisTrackBack")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_AutoURL")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_DisIMG")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_DisUBB")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_DisSM")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_TrackBackNums")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_Status")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_IP")
NewsConn.Execute("DROP INDEX log_PostYear ON blog_Content")
NewsConn.Execute("DROP INDEX log_PostMonth ON blog_Content")
NewsConn.Execute("DROP INDEX log_PostDay ON blog_Content")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_PostYear")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_PostMonth")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_PostDay")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_TrackBack")
NewsConn.Execute("DROP INDEX log_AuthorID ON blog_Content")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_AuthorID")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_Author")
NewsConn.Execute("ALTER TABLE blog_Content DROP COLUMN log_Modify")
'Comment
NewsConn.Execute("ALTER TABLE blog_Comment DROP COLUMN comm_DisSM")
NewsConn.Execute("ALTER TABLE blog_Comment DROP COLUMN comm_DisUBB")
NewsConn.Execute("ALTER TABLE blog_Comment DROP COLUMN comm_DisIMG")
NewsConn.Execute("ALTER TABLE blog_Comment DROP COLUMN comm_AutoURL")
NewsConn.Execute("ALTER TABLE blog_Comment DROP COLUMN comm_Hidden")
'Cate
NewsConn.Execute("ALTER TABLE blog_Category DROP COLUMN cate_Order")
NewsConn.Execute("ALTER TABLE blog_Category DROP COLUMN cate_Nums")
NewsConn.Execute("ALTER TABLE blog_Category DROP COLUMN cate_Mode")

'重命名字段
Dim RenameColumns
Set RenameColumns=Server.CreateObject("ADOX.Catalog")
RenameColumns.ActiveConnection="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & db
'Content
RenameColumns.Tables("blog_Content").Columns("log_ID")="NewsID"
RenameColumns.Tables("blog_Content").Columns("log_CateID")="CateID"
RenameColumns.Tables("blog_Content").Columns("log_Title")="NewsTitle"
RenameColumns.Tables("blog_Content").Columns("log_From")="NewsFrom"
RenameColumns.Tables("blog_Content").Columns("log_FromUrl")="NewsUrl"
RenameColumns.Tables("blog_Content").Columns("log_Content")="NewsContent"
RenameColumns.Tables("blog_Content").Columns("log_PostTime")="NewsTime"
RenameColumns.Tables("blog_Content").Columns("log_CommNums")="CountComment"
RenameColumns.Tables("blog_Content").Columns("log_ViewNums")="CountNews"
'Comment
RenameColumns.Tables("blog_Comment").Columns("comm_ID")="CommentID"
RenameColumns.Tables("blog_Comment").Columns("log_ID")="NewsID"
RenameColumns.Tables("blog_Comment").Columns("comm_Content")="CommentContent"
RenameColumns.Tables("blog_Comment").Columns("comm_AuthorID")="UserID"
RenameColumns.Tables("blog_Comment").Columns("comm_Author")="UserName"
RenameColumns.Tables("blog_Comment").Columns("comm_PostTime")="CommentTime"
RenameColumns.Tables("blog_Comment").Columns("comm_IP")="UserIP"
'Cate
RenameColumns.Tables("blog_Category").Columns("cate_ID")="CateID"
RenameColumns.Tables("blog_Category").Columns("cate_Name")="CateName"
Set RenameColumns=Nothing

'重命名表
Dim RenameTables
Set RenameTables=Server.CreateObject("ADOX.Catalog")
RenameTables.ActiveConnection="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & db
RenameTables.Tables("blog_Content").Name="News_Content"
RenameTables.Tables("blog_Comment").Name="News_Comment"
RenameTables.Tables("blog_Category").Name="News_Cate"
Set RenameTables=Nothing
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>转换程序</title>
</head>
<body>
<p>执行完毕</p>
</body>
</html>

<%Response.End()%>