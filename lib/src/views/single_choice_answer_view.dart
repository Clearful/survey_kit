import 'package:flutter/material.dart';
import 'package:survey_kit/src/answer_format/single_choice_answer_format.dart';
import 'package:survey_kit/src/answer_format/text_choice.dart';
import 'package:survey_kit/src/result/question/single_choice_question_result.dart';
import 'package:survey_kit/src/steps/predefined_steps/question_step.dart';
import 'package:survey_kit/src/views/widget/selection_list_tile.dart';
import 'package:survey_kit/src/views/widget/step_view.dart';
import 'package:survey_kit/src/views/widget/step_view_text.dart';
import 'package:survey_kit/src/views/widget/step_view_title.dart';

class SingleChoiceAnswerView extends StatefulWidget {
  final QuestionStep questionStep;
  final SingleChoiceQuestionResult? result;

  const SingleChoiceAnswerView({
    Key? key,
    required this.questionStep,
    required this.result,
  }) : super(key: key);

  @override
  _SingleChoiceAnswerViewState createState() => _SingleChoiceAnswerViewState();
}

class _SingleChoiceAnswerViewState extends State<SingleChoiceAnswerView> {
  late final DateTime _startDate;
  late final SingleChoiceAnswerFormat _singleChoiceAnswerFormat;
  TextChoice? _selectedChoice;

  @override
  void initState() {
    super.initState();
    _singleChoiceAnswerFormat = widget.questionStep.answerFormat as SingleChoiceAnswerFormat;
    _selectedChoice = widget.result?.result ?? _singleChoiceAnswerFormat.defaultSelection;
    _startDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: widget.questionStep,
      resultFunction: () => SingleChoiceQuestionResult(
        id: widget.questionStep.stepIdentifier,
        startDate: _startDate,
        endDate: DateTime.now(),
        valueIdentifier: _selectedChoice?.value ?? '',
        result: _selectedChoice,
      ),
      isValid: widget.questionStep.isOptional || _selectedChoice != null,
      title: widget.questionStep.title.isNotEmpty
          ? StepViewTitle(
              widget.questionStep.title,
            )
          : widget.questionStep.content,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: widget.questionStep.text.isNotEmpty
                ? StepViewText(
                    widget.questionStep.text,
                  )
                : SizedBox.shrink(),
          ),
          Column(
            children: [
              ..._singleChoiceAnswerFormat.textChoices.map(
                (TextChoice tc) {
                  return SelectionListTile(
                    text: tc.text,
                    onTap: () {
                      if (_selectedChoice == tc) {
                        _selectedChoice = null;
                      } else {
                        _selectedChoice = tc;
                      }
                      setState(() {});
                    },
                    isSelected: _selectedChoice == tc,
                  );
                },
              ).toList(),
            ],
          ),
        ],
      ),
    );
  }
}
