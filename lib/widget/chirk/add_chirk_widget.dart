import 'package:chirk/widgetModel/chirk/add_chirk_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddChirkWidget extends ElementaryWidget<IAddChirkWM> {
  const AddChirkWidget(super.wmFactory, {super.key});

  @override
  Widget build(IAddChirkWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Создать чирк"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    controller: wm.messageController,
                    maxLength: 255,
                    maxLengthEnforcement:
                        MaxLengthEnforcement.truncateAfterCompositionEnds,
                    minLines: 5,
                    maxLines: 20,
                    decoration: const InputDecoration(
                      hintText: "Создайте чирк",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Row(
                    children: [
                      EntityStateNotifierBuilder(
                          listenableEntityState: wm.disappearState,
                          builder: (context, isDisappear) {
                            return Checkbox(
                                value: isDisappear ?? false,
                                tristate: true,
                                onChanged: (newValue) {
                                  wm.onTapCheck();
                                });
                          }),
                      const Text("Скрыть сообщение через 24 часа")
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        wm.addChirk();
                      },
                      child: const Text("Опубликовать чирк"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
