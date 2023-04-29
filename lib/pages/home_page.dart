import 'package:connect_to_server/models/class_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import 'package:connect_to_server/gen/assets.gen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _classNumber, _className, _description;
  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    context.read<ClassBloc>().add(SendClassEvent(
        classDetails: ClassDetails(
            id: int.parse(_classNumber!),
            name: _className!,
            description: _description!,
            date: DateTime.now().microsecond)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لیست کلاس ها'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  addClass();
                },
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ImageIcon(Image.asset(Assets.icons.add.path).image),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('اضافه کردن کلاس'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  AlertDialog addClass() {
    return AlertDialog(
      content: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('شماره کلاس'),
                    const SizedBox(
                      width: 10,
                    ),
                    TextFormField(
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        labelText: 'شماره کلاس',
                      ),
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'شماره کلاس لازم است';
                        }
                        final number = int.parse(value);
                        if (number < 100 || number > 199) {
                          return 'شماره کلاس باید بین 100 تا 199 باشد';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _classNumber = value;
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('نام کلاس'),
                    const SizedBox(
                      width: 10,
                    ),
                    TextFormField(
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        labelText: 'نام کلاس',
                      ),
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'نام کلاس لازم است';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _className = value;
                      },
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'توضیحات',
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'توضیحات لازم است';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _description = value;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              _submit();
              Navigator.of(context).pop();
            },
            child: Text('ثبت'))
        // FlatButton(
        //   child: Text('Cancel'),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
      ],
    );
  }
}
