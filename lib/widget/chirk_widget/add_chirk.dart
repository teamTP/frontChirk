import 'package:flutter/material.dart';

class AddChirkWidget extends StatefulWidget {
  const AddChirkWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AddChirkWidgetState();
}

class _AddChirkWidgetState extends State<AddChirkWidget> {
  bool _isCheced = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Создать чирк"),
      ),
      body: Form(
        child: Column(
          children: [
            Card(
              child: TextFormField(
                minLines: 5,
                maxLines: 20,
                decoration: const InputDecoration(
                  hintText: "Создайте чирк",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: _isCheced,
                    tristate: true,
                    onChanged: (newValue) {
                      setState(() {
                        _isCheced = !_isCheced;
                      });
                    }),
                Text("Скрыть сообщение через 24 часа")
              ],
            ),
            ElevatedButton(onPressed: () {}, child: Text("Опубликовать чирк"))
          ],
        ),
      ),
    );
  }
}
