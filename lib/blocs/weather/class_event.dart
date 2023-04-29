part of 'class_bloc.dart';

abstract class ClassEvent extends Equatable {
  const ClassEvent();

  @override
  List<Object> get props => [];
}

class SendClassEvent extends ClassEvent {
  final ClassDetails classDetails;
  SendClassEvent({
    required this.classDetails,
  });
}

class GetClassesEvent extends ClassEvent {}
