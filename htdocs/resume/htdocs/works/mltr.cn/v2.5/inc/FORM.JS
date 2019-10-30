function AddText(NewCode) {
	if(document.all){
		insertAtCaret(document.newsform.newscontent, NewCode);
		setfocus();
	} else{
		document.newsform.newscontent.value += NewCode;
		setfocus();
	}
}
function setfocus() {
		document.newsform.newscontent.focus();
}
function insertAtCaret (textEl, text){
	if (textEl.createTextRange && textEl.caretPos){
		var caretPos = textEl.caretPos;
		caretPos.text += caretPos.text.charAt(caretPos.text.length - 2) == ' ' ? text + ' ' : text;
	} else if(textEl) {
		textEl.value += text;
	} else {
		textEl.value = text;
	}
}
function storeCaret(cursorPosition) {
	if (cursorPosition.createTextRange) cursorPosition.caretPos = document.selection.createRange().duplicate();
}

function tag(strtag) {
	if (document.selection && document.selection.type == "Text") {
		var range = document.selection.createRange();
		range.text = "["+strtag+"]" + range.text + "[/"+strtag+"]";
	}
	else {
		AddTxt="["+strtag+"][/"+strtag+"]";
		AddText(AddTxt);
	}
}

function CtrlEnter() { 
	if(event.ctrlKey && window.event.keyCode==13) document.newsform.submit.click();
}
