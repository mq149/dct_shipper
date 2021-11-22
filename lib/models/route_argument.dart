import '../bases/base_model.dart';

class RouteArgument extends BaseModel {
  String id;
  String heroTag;
  dynamic param;

  RouteArgument({required this.id, required this.heroTag, this.param});

  @override
  String toString() {
    return '{id: $id, heroTag:${heroTag.toString()}}';
  }
}
