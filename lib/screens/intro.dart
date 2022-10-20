import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:todo_app/screens/home.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      showNextButton: true,
      showDoneButton: true,
      showSkipButton: false,
      done: const Text('Done'),
      onDone: () => Get.to(() => const Home()),
      next: const Icon(Icons.arrow_forward),
      pages: [
        PageViewModel(
          image: SvgPicture.asset('assets/intro1.svg'),
          title: 'Todo App',
          body:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et lorem eget risus placerat luctus. Nam tristique ligula sed massa finibus consectetur.',
          decoration: const PageDecoration(
            imagePadding: EdgeInsets.only(top: 50),
          ),
        ),
        PageViewModel(
          image: SvgPicture.asset('assets/intro2.svg'),
          title: 'Todo App',
          body:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et lorem eget risus placerat luctus. Nam tristique ligula sed massa finibus consectetur.',
          decoration: const PageDecoration(
            imagePadding: EdgeInsets.only(top: 50),
          ),
        ),
      ],
    );
  }
}
