import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/widgets/scorecard/score_card_widget.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final VoidCallback onAvatarTap;

  AppBarWidget({
    required this.user,
    required this.onAvatarTap,
  }) : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    height: 161,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: "Hello, ",
                              style: AppTextStyles.title,
                              children: [
                                TextSpan(
                                    text: user.name,
                                    style: AppTextStyles.titleBold)
                              ]),
                        ),
                        GestureDetector(
                          child: Container(
                            height: 58,
                            width: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  user.photoUrl,
                                ),
                              ),
                            ),
                          ),
                          onTap: onAvatarTap,
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 1),
                    child: ScoreCardWidget(
                      percentage: user.score / 100,
                    ),
                  )
                ],
              ),
            ));
}
