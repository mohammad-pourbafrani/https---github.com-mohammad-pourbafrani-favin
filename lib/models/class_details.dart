import 'package:equatable/equatable.dart';

class ClassDetails extends Equatable {
  final int id;
  final String name;
  final String description;
  final int date;
  ClassDetails({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
  });

  factory ClassDetails.fromJson(Map<String, dynamic> json) {
    return ClassDetails(
      id: json['description'],
      name: json['name'],
      description: json['description'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> classData = <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'date': date
    };
    return classData;
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      date,
    ];
  }

  @override
  String toString() {
    return 'class(id: $id, name: $name, description: $description, date: $date)';
  }

  ClassDetails copyWith({
    int? id,
    String? name,
    String? description,
    int? date,
  }) {
    return ClassDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }
}
