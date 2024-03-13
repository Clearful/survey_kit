import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';
import 'package:survey_kit/src/answer_format/text_choice.dart';

part 'multiple_choice_answer_format.g.dart';

@JsonSerializable()
class MultipleChoiceAnswerFormat implements AnswerFormat {
  final List<TextChoice> _textChoices;
  @JsonKey(defaultValue: const [])
  final List<TextChoice> defaultSelection;
  @JsonKey(defaultValue: false)
  final bool otherField;
  @JsonKey(defaultValue: 100)
  final int maxAnswers;
  @JsonKey(defaultValue: false)
  final bool randomizeOrder;

  const MultipleChoiceAnswerFormat({
    required List<TextChoice> textChoices,
    this.defaultSelection = const [],
    this.otherField = false,
    this.maxAnswers = 100,
    this.randomizeOrder = false,
  }) : _textChoices = textChoices;

  List<TextChoice> get textChoices => randomizeOrder ? _shuffleList(_textChoices) : _textChoices;

  static List<TextChoice> _shuffleList(List<TextChoice> items) {
    var list = List<TextChoice>.from(items); // Create a mutable copy
    list.shuffle(); // Shuffle the copy
    return list; // Return the shuffled copy
  }

  factory MultipleChoiceAnswerFormat.fromJson(Map<String, dynamic> json) => _$MultipleChoiceAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$MultipleChoiceAnswerFormatToJson(this);
}
