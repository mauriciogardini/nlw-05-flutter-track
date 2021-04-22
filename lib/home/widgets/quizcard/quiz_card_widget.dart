import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/progressindicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String progressText;
  final double progressPercent;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.progressText,
    this.progressPercent = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.border,
            ),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    progressText,
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ProgressIndicatorWidget(
                    value: progressPercent,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
