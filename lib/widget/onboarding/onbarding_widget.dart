import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';


class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pageViewModel = _initPageVM(context);
    return SafeArea(
      child: IntroductionScreen(
        pages: pageViewModel,
        dotsDecorator: DotsDecorator(
          activeColor: Theme.of(context).colorScheme.primary,
        ),
        baseBtnStyle: ElevatedButton.styleFrom(),
        showSkipButton: true,
        showNextButton: true,
        showBackButton: false,
        showDoneButton: true,
        skip: Text("Пропустить"),
        next: Text("Далее"),
        done: Text("Начать"),
        onDone: () {
          Navigator.pop(context);
        },

      ),
    );
  }

  List<PageViewModel> _initPageVM(BuildContext context) {
    return [
      PageViewModel(
        title: "Просматривайте ленту",
        body: "Просматривайте ленту и оценивайте чирки пользователей",
        image: Center(
          child: Image.asset("assets/img/onboarding_1.png"),
        ),
        decoration: _getPageDecoration(context),
      ),
      PageViewModel(
        title: "Делитесь своими мыслями с миром",
        body: "Создавайте свои чирки и делитесь ими с другими людьми",
        image: Center(
          child: Image.asset("assets/img/onboarding_2.png"),
        ),
        decoration: _getPageDecoration(context),
      ),
      PageViewModel(
        title: "Отправляйте исчезающие чирки",
        body: "Отправляйте чирки которые будут скрыватся через день",
        image: Center(
          child: Image.asset("assets/img/onboarding_3.png"),
        ),
        decoration: _getPageDecoration(context),
        footer: Container(padding: EdgeInsets.fromLTRB(48, 0, 48, 0),
          alignment: Alignment.center,
          child:ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/login");
            },
            child: Text("Авторизоватся"),
          ),),
      ),
    ];
  }

  PageDecoration _getPageDecoration(BuildContext context) => PageDecoration(
    imagePadding: EdgeInsets.all(24),
    footerPadding: EdgeInsets.all(24),
    pageColor: Theme.of(context).colorScheme.background,
  );
}