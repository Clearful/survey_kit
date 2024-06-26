import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_kit/src/controller/survey_controller.dart';
import 'package:survey_kit/src/result/question_result.dart';
import 'package:survey_kit/src/steps/step.dart' as surveystep;
import 'package:survey_kit/src/widget/full_width_btn.dart';

class StepView extends StatelessWidget {
  final surveystep.Step step;
  final Widget title;
  final Widget child;
  final QuestionResult Function() resultFunction;
  final bool isValid;
  final SurveyController? controller;

  const StepView({
    required this.step,
    required this.child,
    required this.title,
    required this.resultFunction,
    this.controller,
    this.isValid = true,
  });

  @override
  Widget build(BuildContext context) {
    final _surveyController = controller ?? context.read<SurveyController>();

    return _content(_surveyController, context);
  }

  Widget _content(SurveyController surveyController, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                        child: title,
                      ),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child:
                // FilledButton(
                //   onPressed: isValid || step.isOptional
                //       ? () => [
                //             FocusScope.of(context).hasFocus ? FocusScope.of(context).unfocus() : null,
                //             surveyController.nextStep(context, resultFunction),
                //           ]
                //       : null,
                //   child: Text(
                //     context.read<Map<String, String>?>()?['next'] ?? step.buttonText ?? 'Next',
                //     style: TextStyle(
                //         // color: isValid ? Theme.of(context).primaryColor : Colors.grey,
                //         ),
                //   ),
                // ),
                FullWidthBtn(
              onPressed: isValid || step.isOptional
                  ? () => [
                        FocusScope.of(context).hasFocus ? FocusScope.of(context).unfocus() : null,
                        surveyController.nextStep(context, resultFunction),
                      ]
                  : null,
              child: Text(
                context.read<Map<String, String>?>()?['next'] ?? step.buttonText ?? 'Continue',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onPrimary,
                      // height: 1.17,
                      height: 1.125,
                      letterSpacing: .5,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
