
String shout(String msg, {int exclamations}) {
	var loud =  msg.toUpperCase();
	if (exclamations != null) {
		for (var i = 0; i < exclamations; i++) {
			loud += "!";
		}
	}
	return loud;
}

void main () {
	var list=[1,2,3,4];
	print (list.forEach(n));
}