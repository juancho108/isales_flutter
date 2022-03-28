import 'package:agenda/models/activity.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key, required this.activity}) : super(key: key);
  final Activity activity;
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final nameController = TextEditingController();
  final typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.activity.name!;
    dateController.text = widget.activity.dataAgendada;
    timeController.text = widget.activity.hora;
    typeController.text = widget.activity.type!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.activity.name!,
          overflow: TextOverflow.fade,
        ),
        backgroundColor: Color(0xff9CBE00),
        toolbarHeight: 80,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.verified)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldModel(
              controller: nameController,
              label: 'Nome do Cliente',
            ),
            TextFieldModel(
              controller: typeController,
              label: 'Ocorrencia',
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InputDatePickerFormField(
                firstDate: DateTime(2010, 8),
                lastDate: DateTime(2101),
                initialDate: DateTime.parse(widget.activity.dataAgendada),
                fieldLabelText: 'Data de Retorno',
                
              ),
            ),
            TextFieldModel(
              controller: timeController,
              label: 'Hora de Retorno',
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldModel extends StatelessWidget {
  TextFieldModel({Key? key, required this.controller, required this.label})
      : super(key: key);
  TextEditingController controller;
  String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xffF8BA90)),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TextField(
              controller: controller,
              decoration: InputDecoration(
                label: Text(label),
                border: InputBorder.none,
              )),
        ),
      ),
    );
  }
}
