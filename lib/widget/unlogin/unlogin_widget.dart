import 'package:flutter/material.dart';

class UnloginWidget extends StatefulWidget {
  const UnloginWidget({super.key});

  @override
  State<StatefulWidget> createState() => _UnloginWidgetState();
}

class _UnloginWidgetState extends State<UnloginWidget> {

  @override
  Widget build(BuildContext context) {
    double size = Theme.of(context).textTheme.headlineMedium!.fontSize!;
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: const Text("Чиркнуть"),
        ),
      ),
      body: SafeArea(
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
                        "Вы хотите чиркнуть?",
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
                        child: const Text('Зарегистрироваться')),
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
                    child: const Text('Авторизоваться')),
                 SizedBox(height: 50),

              ],
            )
          ],
        ),
      ),
    );
  }
}
