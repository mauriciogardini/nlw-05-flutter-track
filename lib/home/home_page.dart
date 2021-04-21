import 'package:devquiz/home/widgets/levelbutton/level_button_widget.dart';
import 'package:devquiz/home/widgets/quizcard/quiz_card_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/appbar/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: "Easy",
                  ),
                  LevelButtonWidget(
                    label: "Medium",
                  ),
                  LevelButtonWidget(
                    label: "Hard",
                  ),
                  LevelButtonWidget(
                    label: "Expert",
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: [
                    QuizCardWidget(),
                    QuizCardWidget(),
                    QuizCardWidget(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
