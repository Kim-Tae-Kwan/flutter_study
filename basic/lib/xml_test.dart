import 'package:xml/xml.dart';
import 'dart:io';

void main(){
  final file = File('C:/development/flutter/hello/lib/test.xml');
  final XmlDocument document = XmlDocument.parse(file.readAsStringSync());
  final Iterable<XmlElement> data = document.findAllElements("item");
  data.map((node) => node.findElements('bstopnm')).forEach(print);
}