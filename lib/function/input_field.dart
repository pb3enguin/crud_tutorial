import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFieldWidget extends StatelessWidget {
  InputFieldWidget({
    Key? key,
    required this.type,
    required this.editingController,
    required this.title,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  late final String type;
  late final TextEditingController editingController;
  late final String title;
  late final String hintText;
  late final void Function(String)? onChanged;

  String content = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 15.0),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputWidget(
              type: type,
              hintText: hintText,
              editingController: editingController,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key? key,
    required this.type,
    required this.hintText,
    required this.editingController,
    required this.onChanged,
  }) : super(key: key);

  final String type;
  final String hintText;
  final TextEditingController editingController;
  final void Function(String p1)? onChanged;

  @override
  Widget build(BuildContext context) {
    if (type == 'text') {
      return TextInputWidget(
        hintText: hintText,
        editingController: editingController,
        onChanged: onChanged,
      );
    } else if (type == 'number') {
      return NumberInputWidget(
        hintText: hintText,
        editingController: editingController,
        onChanged: onChanged,
      );
    } else if (type == 'date') {
      return DateInputWidget(
        hintText: hintText,
        editingController: editingController,
        onChanged: onChanged,
      );
    } else {
      return TextInputWidget(
        hintText: hintText,
        editingController: editingController,
        onChanged: onChanged,
      );
    }
  }
}

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    Key? key,
    required this.hintText,
    required this.editingController,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final TextEditingController editingController;
  final void Function(String p1)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        hintText: hintText,
      ),
      controller: editingController,
      onChanged: onChanged,
    );
  }
}

class NumberInputWidget extends StatelessWidget {
  const NumberInputWidget({
    Key? key,
    required this.hintText,
    required this.editingController,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final TextEditingController editingController;
  final void Function(String p1)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: editingController,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        hintText: hintText,
      ),
    );
  }
}

class DateInputWidget extends StatefulWidget {
  const DateInputWidget({
    Key? key,
    required this.hintText,
    required this.editingController,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final TextEditingController editingController;
  final void Function(String p1)? onChanged;

  @override
  State<DateInputWidget> createState() => _DateInputWidgetState();
}

class _DateInputWidgetState extends State<DateInputWidget> {
  DateTime _dateTime = DateTime(1980);
  String _dateString = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(
                  _dateString == '' ? 'Select Date' : _dateString,
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: _dateTime,
              firstDate: DateTime(1800),
              lastDate: DateTime(2500),
            );
            if (newDate != null) {
              setState(() {
                _dateTime = newDate;
                _dateString =
                    '${_dateTime.year}-${_dateTime.month}-${_dateTime.day}';
                widget.onChanged!(_dateString);
              });
            }
          },
          icon: const Icon(Icons.date_range),
        ),
      ],
    );
  }
}
