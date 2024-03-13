// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_choice_answer_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultipleChoiceAnswerFormat _$MultipleChoiceAnswerFormatFromJson(
        Map<String, dynamic> json) =>
    MultipleChoiceAnswerFormat(
      textChoices: (json['textChoices'] as List<dynamic>)
          .map((e) => TextChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultSelection: (json['defaultSelection'] as List<dynamic>?)
              ?.map((e) => TextChoice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      otherField: json['otherField'] as bool? ?? false,
      maxAnswers: json['maxAnswers'] as int? ?? 100,
      randomizeOrder: json['randomizeOrder'] as bool? ?? false,
    );

Map<String, dynamic> _$MultipleChoiceAnswerFormatToJson(
        MultipleChoiceAnswerFormat instance) =>
    <String, dynamic>{
      'defaultSelection': instance.defaultSelection,
      'otherField': instance.otherField,
      'maxAnswers': instance.maxAnswers,
      'randomizeOrder': instance.randomizeOrder,
      'textChoices': instance.textChoices,
    };
