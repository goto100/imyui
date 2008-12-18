<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<script language="javascript" runat="server">
Date.toISOString = function(date) {
	var _DATE_PARTS = {
		FullYear: 2,
		Month: 4,
		Date: 6,
		Hours: 8,
		Minutes: 10,
		Seconds: 12,
		Milliseconds: 14
	};
	var _TRIM_ZEROES   = /(((00)?:0+)?:0+)?\.0+$/;
	var _TRIM_TIMEZONE = /(T[0-9:.]+)$/;
	var string = "####-##-##T##:##:##.###";
	for (var part in _DATE_PARTS) {
		string = string.replace(/#+/, function(digits) {
			var value = date["getUTC" + part]();
			if (part == "Month") value++; // js month starts at zero
			return ("000" + value).slice(-digits.length); // pad
		});
	}
	return string.replace(_TRIM_ZEROES, "").replace(_TRIM_TIMEZONE, "$1Z");
}

Response.ContentType = "text/xml";
Response.Write("<?xml version=\"1.0\"?>");
Response.Write("<now>" + Date.toISOString(new Date()) + "</now>");
</script>