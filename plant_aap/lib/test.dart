
import 'dart:io';

void main() async{
  File file = File('assets/images/bottom_img_1.png');
  print(file.absolute.existsSync());
  RandomAccessFile accessFile = await file.open();
  int byte = await accessFile.readByte();
  print(byte);
}