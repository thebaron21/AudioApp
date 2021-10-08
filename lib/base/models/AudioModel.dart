import 'package:test_getx/core/contracts/Model.dart';

abstract class AudioModel extends Model{
  @override
  List<Model> toList() {
    throw UnimplementedError();
  }
}