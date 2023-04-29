import 'package:hive/hive.dart';

part 'data_class.g.dart';

@HiveType(typeId: 0)
class DataClass {
  DataClass(
      {required this.id,
      required this.name,
      required this.description,
      required this.date});

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String description;

  @HiveField(3)
  int date;
}
