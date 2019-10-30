<!-- #include file = "../../../common/classes/form.asp" -->
<%
function Song() {
	this.conn = Song.conn;

	this.fill = function(value) {
		this.id = value.id;
		this.name = value.name;
		this.transName = value.transName;
		this.author = value.author;
		this.lyric = value.lyric;
		this.copyright = value.copyright;
		this.listen = value.listen;
	}

	this.edit = function(value) {
		var form = Song.fillForm(true);
		if (form.submit(value) == true) return true;
		else Song.form = form;
	}

	this.viewCountUp = function(number) {
		if (!number) number = 1;
		this.conn.execute("UPDATE [Songs] SET viewCount=viewCount+1 WHERE id=" + this.id);
	}

	this.listenCountUp = function(number) {
		if (!number) number = 1;
		this.conn.execute("UPDATE [Songs] SET listenCount=listenCount+1 WHERE id=" + this.id);
	}
}

Song.getSong = function(id) {
	var tmpA = Song.conn.query("SELECT TOP 1 id, name, transName, author, lyric, copyright, listen"
		+ " FROM [Songs]"
		+ " WHERE id = " + id, 1);
	if (tmpA) {
		var song = new Song();
		song.fill(tmpA);
		return song;
	}
}

Song.add = function(input) {
	var form = Song.fillForm();
	if (form.submit(input) == true) return true;
	else Song.form = form;
}

Song.del = function(id) {
	Song.conn.del("Songs", "id=" + id);
	return true;
}

Song.fillForm = function(isEdit) {
	var form = new Form();
	form.conn = Song.conn;
	form.mode = isEdit? "edit" : "add";
	form.table = "Songs";

	if (isEdit) {
		form.addItem("sign", "id", "number");
		form.addSubmit("id", search.id);
	}
	if (!addMode) form.addItem("hidden", "id");
	form.addItem(true, "name", "string", true, "名称必填");
	form.addItem(true, "transName", "string");
	form.addItem(true, "author", "string");
	form.addItem(true, "lyric", "string");
	form.addItem(true, "copyright", "string");
	form.addItem(true, "listen", "bool");

	return form;
}
%>
