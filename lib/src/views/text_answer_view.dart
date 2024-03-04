import 'package:flutter/material.dart';
import 'package:survey_kit/src/answer_format/text_answer_format.dart';
import 'package:survey_kit/src/result/question/text_question_result.dart';
import 'package:survey_kit/src/steps/predefined_steps/question_step.dart';
import 'package:survey_kit/src/views/decoration/input_decoration.dart';
import 'package:survey_kit/src/views/widget/step_view.dart';
import 'package:survey_kit/src/views/widget/step_view_text.dart';
import 'package:survey_kit/src/views/widget/step_view_title.dart';

class TextAnswerView extends StatefulWidget {
  final QuestionStep questionStep;
  final TextQuestionResult? result;

  const TextAnswerView({
    Key? key,
    required this.questionStep,
    required this.result,
  }) : super(key: key);

  @override
  _TextAnswerViewState createState() => _TextAnswerViewState();
}

class _TextAnswerViewState extends State<TextAnswerView> {
  late final TextAnswerFormat _textAnswerFormat;
  late final DateTime _startDate;

  late final TextEditingController _controller;
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _textAnswerFormat = widget.questionStep.answerFormat as TextAnswerFormat;
    _controller.text = widget.result?.result ?? _textAnswerFormat.defaultValue ?? '';
    _checkValidation(_controller.text);
    _startDate = DateTime.now();
  }

  void _checkValidation(String text) {
    setState(() {
      if (_textAnswerFormat.validationRegEx != null) {
        RegExp regExp = new RegExp(_textAnswerFormat.validationRegEx!);
        _isValid = regExp.hasMatch(text);
      } else {
        _isValid = true;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: widget.questionStep,
      resultFunction: () => TextQuestionResult(
        id: widget.questionStep.stepIdentifier,
        startDate: _startDate,
        endDate: DateTime.now(),
        valueIdentifier: _controller.text,
        result: _controller.text,
      ),
      title: widget.questionStep.title.isNotEmpty
          ? StepViewTitle(
              widget.questionStep.title,
            )
          : widget.questionStep.content,
      isValid: _isValid || widget.questionStep.isOptional,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, left: 14.0, right: 14.0),
            child: widget.questionStep.text.isNotEmpty
                ? StepViewText(
                    widget.questionStep.text,
                  )
                : SizedBox.shrink(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            child: TextField(
              textInputAction: TextInputAction.next,
              autofocus: true,
              decoration: textFieldInputDecoration(
                context,
                hint: _textAnswerFormat.hint,
              ),
              cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
              style: Theme.of(context).textTheme.bodyLarge,
              controller: _controller,
              textAlign: TextAlign.center,
              onChanged: (String text) {
                _checkValidation(text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
