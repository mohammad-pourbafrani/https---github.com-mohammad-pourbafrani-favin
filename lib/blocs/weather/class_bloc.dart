import 'dart:async';

import 'package:connect_to_server/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/class_details.dart';
import '../../repositories/class_repository.dart';

part 'class_event.dart';
part 'class_state.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  final ClassRepository classRepository;
  final ApiServices apiServices;
  ClassBloc({required this.classRepository, required this.apiServices})
      : super(InitialClassState(classes: classRepository.getClassDetails())) {
    on<SendClassEvent>(_sendClass);
    on<GetClassesEvent>(_getClassEvent);
  }

  Future<void> _sendClass(
    SendClassEvent event,
    Emitter<ClassState> emit,
  ) async {
    classRepository.addToDataClass(event.classDetails);
    apiServices.postClass(event.classDetails);
    final classes = classRepository.getClassDetails();
    emit(ClassesState(classes: classes));
  }

  FutureOr<void> _getClassEvent(
      GetClassesEvent event, Emitter<ClassState> emit) async {
    final classes = classRepository.getClassDetails();
    emit(ClassesState(classes: classes));
  }
}
