import 'dart:io';

class ClassWriter {
  File? file;
  ClassWriter({this.file});
  write(String s) {
    file!.writeAsStringSync(s, mode: FileMode.writeOnlyAppend);
  }
}
