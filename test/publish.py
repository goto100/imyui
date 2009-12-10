#python

import re
import pysvn

client = pysvn.Client()


def processCss(path):
	def processStr(m):
		fileName = m.group(1)
		str = '/* start file of ' + fileName + ', import by ' + path + ' */\n'
		str += processCss(fileName)
		str += '/* end file of ' + fileName + ' */'
		return str
	src = open(path)
	str = src.read()
	newstr = re.sub('@import\surl\((.+?)\);?', processStr, str)
	return newstr

css = processCss("a.src.css")
print css
newCss = open("a.css", "w");
newCss.write(css)

