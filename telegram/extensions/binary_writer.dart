class BinaryWriter {
  final List<int> _stream;

  BinaryWriter(List<int> this._stream);

  void write(List<int> buffer) {
    this._stream.addAll(buffer);
  }

  List<int> getValue() {
    return new List<int>.from(this._stream);
  }
}
