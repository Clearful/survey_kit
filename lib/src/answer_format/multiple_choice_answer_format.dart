import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';
import 'package:survey_kit/src/answer_format/text_choice.dart';

part 'multiple_choice_answer_format.g.dart';

@JsonSerializable()
class MultipleChoiceAnswerFormat implements AnswerFormat {
  final List<TextChoice> textChoices;
  @JsonKey(defaultValue: const [])
  final List<TextChoice> defaultSelection;
  @JsonKey(defaultValue: false)
  final bool otherField;
  @JsonKey(defaultValue: 100)
  final int maxAnswers;
  @JsonKey(defaultValue: false)
  final bool randomizeOrder;

  MultipleChoiceAnswerFormat({
    required List<TextChoice> textChoices,
    this.defaultSelection = const [],
    this.otherField = false,
    this.maxAnswers = 100,
    this.randomizeOrder = false,
  }) : textChoices = randomizeOrder ? _shuffleList(textChoices) : textChoices;

  static List<TextChoice> _shuffleList(List<TextChoice> items) {
    final mutableList = List<TextChoice>.from(items);
    mutableList.shuffle();
    return mutableList;
  }

  factory MultipleChoiceAnswerFormat.fromJson(Map<String, dynamic> json) => _$MultipleChoiceAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$MultipleChoiceAnswerFormatToJson(this);
}
