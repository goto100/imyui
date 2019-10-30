<!-- #include file = "../../../common/classes/form.asp" -->
<%
function Album() {
	this.conn = Album.conn;

	this.id = 0;

	this.fill = function(value) {
		this.id = parseInt(value.id);
		this.name = value.name;
		this.title = value.title;
		this.transName = value.transName;
		this.year = value.year;
		this.date = value.date;
		this.sales = value.sales;
		this.place = value.place;
		this.intro = value.intro;
		this.info = value.info;
		this.content = value.content;
		this.category = {"id":value.cateId, "name":value.cateName};
		if (value.songs) {
			var songs = value.songs.split(", ");
			var sql = "SELECT id, name, lyric, listen FROM [Songs] WHERE ";
			for (var i = 0; i < songs.length; i++) {
				sql += "id=" + songs[i] + " OR ";
			}
			sql = sql.slice(0, -4);
			var tSongs = this.conn.query(sql);
			this.songs = [];
			for (var i = 0; i < songs.length; i++) {
				for (var j = 0; j < tSongs.length; j++) {
					if (tSongs[j].id == songs[i]) {
						this.songs.push(tSongs[j]);
						j = tSongs.length;
					}
				}
			}
		}
	}

	this.viewCountUp = function(number) {
		if (!number) number = 1;
		this.conn.execute("UPDATE [Albums] SET viewCount = viewCount + " + number + " WHERE id=" + this.id);
	}

	this.edit = function(value) {
		var form = Album.fillForm(true);
		if (form.submit(value) == true) return true;
		else Album.form = form;
	}
}

Album.getAlbums = function(cateId, currentPage) {
	if (cateId) {
		var sql = "SELECT a.id, a.name, a.title, a.transName, a.year, a.intro, c.id AS cateId, c.name AS cateName"
		+ " FROM [Albums] AS a, [Music_Categories] AS c"
		+ " WHERE a.cateId = c.id"
		+ " AND a.cateId = " + cateId
		+ " ORDER BY a.id DESC";
	} else {
		var sql = "SELECT id, name, title FROM [Albums] ORDER BY id DESC"
	}
	var tmpA = this.conn.query(sql, 20, currentPage);
	var albums = {};
	if (tmpA) {
		albums = tmpA;
		albums.category = {"id":tmpA[0].cateId, "name":tmpA[0].cateName};
	} else if (cateId) {
		var tmpA = this.conn.query("SELECT TOP 1 id, name FROM [Music_Categories] WHERE id = " + cateId);
		albums.category = {"id":tmpA[0].id, "name":tmpA[0].name};
	}
	albums.currentPage = currentPage;
	albums.pageCount = getPageCount(tmpA.recordCount, 20);
	return albums;
}

Album.getAlbum = function(id) {
	var tmpA = Album.conn.query("SELECT TOP 1 a.id, a.name, a.title, a.transName, a.year, a.date, a.sales, a.place, a.info, a.intro, a.content, a.songs, c.id AS cateId, c.name AS cateName"
		+ " FROM [Albums] AS a, [Categories] AS c"
		+ " WHERE a.cateId = c.id"
		+ " AND a.id = " + id, 1);
	if (tmpA) {
		var album = new Album();
		album.fill(tmpA);
		return album;
	}
}

Album.add = function(input) {
	var form = Album.fillForm();
	if (form.submit(input) == true) return true;
	else Album.form = form;
}

Album.del = function(id) {
	Album.conn.del("Albums", "id=" + id);
	return true;
}

Album.fillForm = function(isEdit) {
	var form = new Form();
	form.conn = Album.conn;
	form.mode = isEdit? "edit" : "add";
	form.table = "Albums";

	if (isEdit) {
		form.addItem("sign", "id", "number");
		form.addSubmit("id", search.id);
	}
	form.addItem(true, "name", "string", true, "名称必填");
	form.addItem(true, "title", "string");
	form.addItem(true, "cateId", "number", true, "分类必选");
	form.addItem(true, "transName", "string");
	form.addItem(true, "year", "number");
	form.addItem(true, "date", "string");
	form.addItem(true, "place", "string");
	form.addItem(true, "sales", "string");
	form.addItem(true, "info", "string");
	form.addItem(true, "intro", "string");
	form.addItem(true, "content", "string");
	form.addItem(true, "songs", "string")

	return form;
}

%>