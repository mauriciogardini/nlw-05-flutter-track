import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  static HomeController instance = HomeController();
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;
  final filters = [
    {
      "label": "Easy",
      "color": AppColors.levelButtonEasy,
      "fontColor": AppColors.levelButtonTextEasy,
      "borderColor": AppColors.levelButtonBorderEasy,
    },
    {
      "label": "Medium",
      "color": AppColors.levelButtonMedium,
      "fontColor": AppColors.levelButtonTextMedium,
      "borderColor": AppColors.levelButtonBorderMedium,
    },
    {
      "label": "Hard",
      "color": AppColors.levelButtonHard,
      "fontColor": AppColors.levelButtonTextHard,
      "borderColor": AppColors.levelButtonBorderHard,
    },
    {
      "label": "Expert",
      "color": AppColors.levelButtonExpert,
      "fontColor": AppColors.levelButtonTextExpert,
      "borderColor": AppColors.levelButtonBorderExpert,
    }
  ];
  List<String> filterNames = ["easy", "medium", "hard", "expert"];
  List<bool> filterStatuses = [false, false, false, false];

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    user = await repository.getUser();

    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    List<String> activeFilters = filterStatuses
        .map((e) => e ? filterNames[filterStatuses.indexOf(e)] : '')
        .toList();

    quizzes = await repository.getQuizzes(activeFilters);

    state = HomeState.success;
  }

  void getData() async {
    state = HomeState.loading;

    List<String> activeFilters = [];
    // List<String> activeFilters = filterStatuses
    //     .map((e) => e ? filterNames[filterStatuses.indexOf(e)] : '')
    //     .toList();

    user = await repository.getUser();
    quizzes = await repository.getQuizzes(activeFilters);

    state = HomeState.success;
  }
}
