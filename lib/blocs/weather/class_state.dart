part of 'class_bloc.dart';

abstract class ClassState extends Equatable {
  const ClassState();

  @override
  List<Object> get props => [];
}

class InitialClassState extends ClassState {
  List<ClassDetails> classes;
  InitialClassState({
    required this.classes,
  });
}

class ClassesState extends ClassState {
  List<ClassDetails> classes;
  ClassesState({
    required this.classes,
  });
}
