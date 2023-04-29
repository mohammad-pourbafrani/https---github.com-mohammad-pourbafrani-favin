import 'package:connect_to_server/blocs/blocs.dart';
import 'package:connect_to_server/models/data_class.dart';
import 'package:connect_to_server/pages/home_page.dart';
import 'package:connect_to_server/repositories/class_repository.dart';
import 'package:connect_to_server/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataClassAdapter());
  final box = await Hive.openBox<DataClass>('classData');
  runApp(MyApp(
    box: box,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.box});
  Box<DataClass> box;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ClassRepository(box: box),
      child: BlocProvider(
        create: (context) => ClassBloc(
          apiServices: ApiServices(),
          classRepository: context.watch<ClassRepository>(),
        ),
        child: const MaterialApp(
          home: HomePage(),
        ),
      ),
    );
  }
}
