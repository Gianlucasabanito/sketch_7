
String stripFilename(String s) {
  s = s.substring(s.lastIndexOf('/')+1, s.length());
  s = s.substring(s.lastIndexOf('\\')+1, s.length());
  s = s.substring(0, s.lastIndexOf('.'));
  return s;
}
  
