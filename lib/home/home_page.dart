import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/home/widgets/levelbutton/level_buttons_widget.dart';
import 'package:devquiz/home/widgets/quizcard/quiz_card_widget.dart';
import 'package:devquiz/settings/settings_page.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';

import 'widgets/appbar/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController.instance;

  @override
  void initState() {
    super.initState();
    controller.getData();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
          appBar: AppBarWidget(
            user: controller.user!,
            onAvatarTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Expanded(
                    child: LevelButtonsWidget(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    children: controller.quizzes!
                        .where((element) => controller.filterStatuses
                            .map((el) {
                              var index = controller.filterStatuses.indexOf(el);
                              return el ? controller.filterNames[index] : "";
                            })
                            .toList()
                            .contains(element.level.parse))
                        .toList()
                        .map(
                          (e) => QuizCardWidget(
                            title: e.title,
                            progressPercent:
                                e.answeredQuestions / e.questions.length,
                            progressText:
                                "${e.answeredQuestions}/${e.questions.length}",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChallengePage(
                                    questions: e.questions,
                                    title: e.title,
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ));
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
