import 'package:flutter/material.dart';
import 'package:survey_kit/src/answer_format/integer_answer_format.dart';
import 'package:survey_kit/src/result/question/integer_question_result.dart';
import 'package:survey_kit/src/steps/predefined_steps/question_step.dart';
import 'package:survey_kit/src/views/decoration/input_decoration.dart';
import 'package:survey_kit/src/views/widget/step_view.dart';
import 'package:survey_kit/src/views/widget/step_view_title.dart';

class IntegerAnswerView extends StatefulWidget {
  final QuestionStep questionStep;
  final IntegerQuestionResult? result;

  const IntegerAnswerView({
    Key? key,
    required this.questionStep,
    required this.result,
  }) : super(key: key);

  @override
  _IntegerAnswerViewState createState() => _IntegerAnswerViewState();
}

class _IntegerAnswerViewState extends State<IntegerAnswerView> {
  late final IntegerAnswerFormat _integerAnswerFormat;
  late final TextEditingController _controller;
  late final DateTime _startDate;

  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _integerAnswerFormat = widget.questionStep.answerFormat as IntegerAnswerFormat;
    _controller = TextEditingController();
    _controller.text = widget.result?.result?.toString() ?? '';
    _checkValidation(_controller.text);
    _startDate = DateTime.now();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkValidation(String text) {
    setState(() {
      _isValid = text.isNotEmpty && int.tryParse(text) != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: widget.questionStep,
      resultFunction: () => IntegerQuestionResult(
        id: widget.questionStep.stepIdentifier,
        startDate: _startDate,
        endDate: DateTime.now(),
        valueIdentifier: _controller.text,
        result: int.tryParse(_controller.text) ?? _integerAnswerFormat.defaultValue ?? null,
      ),
      isValid: _isValid || widget.questionStep.isOptional,
      title: widget.questionStep.title.isNotEmpty
          ? StepViewTitle(
              widget.questionStep.title,
            )
          : widget.questionStep.content,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: TextField(
            textInputAction: TextInputAction.next,
            autofocus: true,
            decoration: textFieldInputDecoration(
              context,
              hint: _integerAnswerFormat.hint,
            ),
            style: Theme.of(context).textTheme.bodyLarge,
            cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
            controller: _controller,
            onChanged: (String value) {
              _checkValidation(value);
            },
            
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
