import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';
import 'package:survey_kit/src/answer_format/text_choice.dart';

part 'multiple_choice_auto_complete_answer_format.g.dart';

@JsonSerializable()
class MultipleChoiceAutoCompleteAnswerFormat implements AnswerFormat {
  final List<TextChoice> textChoices;
  @JsonKey(defaultValue: const [])
  final List<TextChoice> defaultSelection;
  @JsonKey(defaultValue: const [])
  final List<TextChoice> suggestions;
  @JsonKey(defaultValue: false)
  final bool otherField;
  @JsonKey(defaultValue: false)
  final bool randomizeOrder;

  MultipleChoiceAutoCompleteAnswerFormat({
    required List<TextChoice> textChoices,
    this.defaultSelection = const [],
    this.suggestions = const [],
    this.otherField = false,
    this.randomizeOrder = false,
  }) : textChoices = randomizeOrder ? _shuffleList(textChoices) : textChoices;

  static List<TextChoice> _shuffleList(List<TextChoice> items) {
    final mutableList = List<TextChoice>.from(items);
    mutableList.shuffle();
    return mutableList;
  }

  factory MultipleChoiceAutoCompleteAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceAutoCompleteAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$MultipleChoiceAutoCompleteAnswerFormatToJson(this);
}
