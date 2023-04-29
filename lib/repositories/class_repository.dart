import 'package:connect_to_server/models/data_class.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/class_details.dart';

class ClassRepository {
  final Box<DataClass> box;
  ClassRepository({required this.box});

  void addToDataClass(ClassDetails classDetails) {
    box.add(DataClass(
        id: classDetails.id,
        name: classDetails.name,
        description: classDetails.description,
        date: classDetails.date));
  }

  List<ClassDetails> getClassDetails() {
    final classes = List<ClassDetails>.empty(growable: true);
    box.values.toList().forEach((element) {
      classes.add(
        ClassDetails(
          id: element.id,
          name: element.name,
          description: element.description,
          date: element.date,
        ),
      );
    });
    return classes;
  }
}
