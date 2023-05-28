import 'package:flutter/material.dart';

class UnloginWidget extends StatefulWidget {
  final String text;

  const UnloginWidget(this.text, {super.key});

  @override
  State<StatefulWidget> createState() => _UnloginWidgetState();
}

class _UnloginWidgetState extends State<UnloginWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      widget.text,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                        Navigator.pushNamed(context, "/register");
                      },
                      child: const Text('Зарегистрируйтесь')),
                ],
              )
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Уже есть аккаунт?",
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.pushNamed(context, "/login");
                  },
                  child: const Text('Авторизуйтесь')),
              const SizedBox(height: 50),
            ],
          )
        ],
      ),
    );
  }
}
