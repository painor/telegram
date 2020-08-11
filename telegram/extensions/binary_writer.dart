class BinaryWriter {
  List<int> _stream;

  BinaryWriter(List<int> this._stream);

  get length {
    return this._stream.length;
  }
  void write(List<int> buffer) {
    this._stream.addAll(buffer);
  }

  Future<List<int>> read(int number) async {


    if (number>this._stream.length){
      number = this._stream.length;
    }


    final toReturn = this._stream.sublist(0, number);


    this._stream.removeRange(0,number);


    return toReturn;
  }

  List<int> getValue() {
    return new List<int>.from(this._stream);
  }
}
