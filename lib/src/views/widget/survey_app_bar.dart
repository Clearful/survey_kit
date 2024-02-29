import 'package:flutter/material.dart';
import 'package:survey_kit/src/configuration/app_bar_configuration.dart';
import 'package:survey_kit/src/controller/survey_controller.dart';
import 'package:survey_kit/src/widget/keyboard_dismisser.dart';
import 'package:survey_kit/src/widget/survey_progress.dart';
import 'package:provider/provider.dart';

class SurveyAppBar extends StatelessWidget {
  final AppBarConfiguration appBarConfiguration;
  final SurveyController? controller;

  const SurveyAppBar({
    required this.appBarConfiguration,
    this.controller,
  });

  @override
  AppBar build(BuildContext context) {
    final _showProgress = appBarConfiguration.showProgress ?? context.read<bool>();
    final _canGoBack = appBarConfiguration.canBack ?? true;

    final surveyController = controller ?? context.read<SurveyController>();
    return AppBar(
      elevation: 0,
      leading: (_canGoBack || appBarConfiguration.onBackOverride != null)
          ? appBarConfiguration.leading ??
              BackButton(
                onPressed: () {
                  if (appBarConfiguration.onBackOverride != null) {
                    appBarConfiguration.onBackOverride!.call();
                  } else {
                    unfocusKeyboard();
                    surveyController.stepBack(
                      context: context,
                    );
                  }
                },
              )
          : Container(),
      // title: _showProgress ? SurveyProgress() : SizedBox.shrink(),
      // actions: [
      //   if (appBarConfiguration.showCancelButton ?? true)
      //     TextButton(
      //       child: appBarConfiguration.trailing ??
      //           Text(
      //             context.read<Map<String, String>?>()?['cancel'] ?? 'Cancel',
      //             style: TextStyle(
      //               color: Theme.of(context).primaryColor,
      //             ),
      //           ),
      //       onPressed: () {
      //         unfocusKeyboard();
      //         surveyController.closeSurvey(context);
      //       },
      //     ),
      // ],
      actions: [
        if (_showProgress) SurveyProgress(),
      ],
    );
  }
}
