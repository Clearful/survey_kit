import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:flutter/services.dart';
import 'package:survey_kit/survey_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: FutureBuilder<Task>(
              future: getSampleClearfulTask(),
              builder: (BuildContext context, AsyncSnapshot<Task> snapshot) {
                print("snapshot: $snapshot");
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData && snapshot.data != null) {
                  final Task task = snapshot.data!;
                  return SurveyKit(
                    onResult: (SurveyResult result) {
                      print(result.finishReason);
                      final json = result.toJson();
                      print(json);
                      Navigator.pushNamed(context, '/');
                    },
                    task: task,
                    showProgress: true,
                    localizations: const <String, String>{
                      'cancel': 'Cancel',
                      'next': 'Next',
                    },
                    appBar: (AppBarConfiguration appBarConfiguration) => SurveyAppBar(
                      appBarConfiguration: AppBarConfiguration(
                        canBack: appBarConfiguration.canBack,
                        showProgress: appBarConfiguration.showProgress,
                        showCancelButton: false,
                      ),
                    ),
                    // themeData: Theme.of(context).copyWith(
                    //   primaryColor: Colors.cyan,
                    //   appBarTheme: const AppBarTheme(
                    //     color: Colors.white,
                    //     iconTheme: IconThemeData(
                    //       color: Colors.cyan,
                    //     ),
                    //     titleTextStyle: TextStyle(
                    //       color: Colors.cyan,
                    //     ),
                    //   ),
                    //   iconTheme: const IconThemeData(
                    //     color: Colors.cyan,
                    //   ),
                    //   textSelectionTheme: const TextSelectionThemeData(
                    //     cursorColor: Colors.cyan,
                    //     selectionColor: Colors.cyan,
                    //     selectionHandleColor: Colors.cyan,
                    //   ),
                    //   cupertinoOverrideTheme: const CupertinoThemeData(
                    //     primaryColor: Colors.cyan,
                    //   ),
                    //   outlinedButtonTheme: OutlinedButtonThemeData(
                    //     style: ButtonStyle(
                    //       minimumSize: MaterialStateProperty.all(
                    //         const Size(150.0, 60.0),
                    //       ),
                    //       side: MaterialStateProperty.resolveWith(
                    //         (Set<MaterialState> state) {
                    //           if (state.contains(MaterialState.disabled)) {
                    //             return const BorderSide(
                    //               color: Colors.grey,
                    //             );
                    //           }
                    //           return const BorderSide(
                    //             color: Colors.cyan,
                    //           );
                    //         },
                    //       ),
                    //       shape: MaterialStateProperty.all(
                    //         RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(8.0),
                    //         ),
                    //       ),
                    //       textStyle: MaterialStateProperty.resolveWith(
                    //         (Set<MaterialState> state) {
                    //           if (state.contains(MaterialState.disabled)) {
                    //             return Theme.of(context).textTheme.labelLarge?.copyWith(
                    //                   color: Colors.grey,
                    //                 );
                    //           }
                    //           return Theme.of(context).textTheme.labelLarge?.copyWith(
                    //                 color: Colors.cyan,
                    //               );
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    //   textButtonTheme: TextButtonThemeData(
                    //     style: ButtonStyle(
                    //       textStyle: MaterialStateProperty.all(
                    //         Theme.of(context).textTheme.labelLarge?.copyWith(
                    //               color: Colors.cyan,
                    //             ),
                    //       ),
                    //     ),
                    //   ),
                    //   textTheme: const TextTheme(
                    //     displayMedium: TextStyle(
                    //       fontSize: 28.0,
                    //       color: Colors.black,
                    //     ),
                    //     headlineSmall: TextStyle(
                    //       fontSize: 24.0,
                    //       color: Colors.black,
                    //     ),
                    //     bodyMedium: TextStyle(
                    //       fontSize: 18.0,
                    //       color: Colors.black,
                    //     ),
                    //     bodySmall: TextStyle(
                    //       fontSize: 14.0,
                    //       color: Colors.black,
                    //     ),
                    //     titleMedium: TextStyle(
                    //       fontSize: 18.0,
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    //   inputDecorationTheme: const InputDecorationTheme(
                    //     labelStyle: TextStyle(
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    //   colorScheme: ColorScheme.fromSwatch(
                    //     primarySwatch: Colors.cyan,
                    //   )
                    //       .copyWith(
                    //         onPrimary: Colors.white,
                    //       )
                    //       .copyWith(background: Colors.white),
                    // ),
                    surveyProgressbarConfiguration: SurveyProgressConfiguration(
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                return const CircularProgressIndicator.adaptive();
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<Task> getSampleClearfulTask() {
    final OrderedTask task = OrderedTask(
      id: TaskIdentifier(),
      steps: <Step>[
        QuestionStep(
          title: 'How did you hear about Clearful?',
          buttonText: 'Let\'s go!',
          isOptional: true,
          stepIdentifier: StepIdentifier(id: 'hear_about_clearful'),
          answerFormat: const MultipleChoiceAnswerFormat(
            textChoices: <TextChoice>[
              TextChoice(text: 'Friend or Family', value: 'friend_family'),
              TextChoice(text: 'Browsing the App Store', value: 'app_store_browse'),
              TextChoice(text: 'Searching the App Store', value: 'app_store_search'),
              TextChoice(text: 'Search Engine (E.g, Google, Bing)', value: 'search_engine'),
              TextChoice(text: 'Podcast', value: 'podcast'),
              TextChoice(text: 'Article or Blog', value: 'article_blog'),
              TextChoice(text: 'X (Formerly Twitter)', value: 'x_twitter'),
              TextChoice(text: 'Instagram', value: 'instagram'),
              TextChoice(text: 'TikTok', value: 'tiktok'),
              TextChoice(text: 'Reddit', value: 'reddit'),
              TextChoice(text: 'Ad', value: 'ad'),
              TextChoice(text: 'Other', value: 'other'),
            ],
          ),
        ),
        QuestionStep(
          title: 'How old are you?',
          stepIdentifier: StepIdentifier(id: 'age'),
          answerFormat: const IntegerAnswerFormat(
            defaultValue: 25,
            hint: 'Please enter your age',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Medication?',
          text: 'Are you using any medication',
          stepIdentifier: StepIdentifier(id: 'medication'),
          answerFormat: const BooleanAnswerFormat(
            positiveAnswer: 'Yes',
            negativeAnswer: 'No',
            result: BooleanResult.POSITIVE,
          ),
        ),
        QuestionStep(
          title: 'Tell us about you',
          text: 'Tell us about yourself and why you want to improve your health.',
          stepIdentifier: StepIdentifier(id: 'about_you'),
          answerFormat: const TextAnswerFormat(
            maxLines: 5,
            validationRegEx: r'^(?!\s*\$).+',
          ),
        ),
        QuestionStep(
          title: 'Select your body type',
          stepIdentifier: StepIdentifier(id: 'body_type'),
          answerFormat: const ScaleAnswerFormat(
            step: 1,
            minimumValue: 1,
            maximumValue: 5,
            defaultValue: 3,
            minimumValueDescription: '1',
            maximumValueDescription: '5',
          ),
        ),
        QuestionStep(
          title: 'Known allergies',
          text: 'Do you have any allergies that we should be aware of?',
          isOptional: false,
          answerFormat: const MultipleChoiceAnswerFormat(
            textChoices: <TextChoice>[
              TextChoice(text: 'Penicillin', value: 'Penicillin'),
              TextChoice(text: 'Latex', value: 'Latex'),
              TextChoice(text: 'Pet', value: 'Pet'),
              TextChoice(text: 'Pollen', value: 'Pollen'),
            ],
          ),
        ),
        QuestionStep(
          title: 'Done?',
          text: 'We are done, do you mind to tell us more about yourself?',
          isOptional: true,
          answerFormat: const SingleChoiceAnswerFormat(
            textChoices: <TextChoice>[
              TextChoice(text: 'Yes', value: 'Yes'),
              TextChoice(text: 'No', value: 'No'),
            ],
            defaultSelection: TextChoice(text: 'No', value: 'No'),
          ),
        ),
        QuestionStep(
          title: 'When did you wake up?',
          answerFormat: const TimeAnswerFormat(
            defaultValue: TimeOfDay(
              hour: 12,
              minute: 0,
            ),
          ),
        ),
        QuestionStep(
          title: 'When was your last holiday?',
          answerFormat: DateAnswerFormat(
            minDate: DateTime.utc(1970),
            defaultDate: DateTime.now(),
            maxDate: DateTime.now(),
          ),
        ),
        // QuestionStep(
        //   title: 'Upload a image of you',
        //   answerFormat: const ImageAnswerFormat(
        //     buttonText: 'Upload your photo',
        //     useGallery: true,
        //   ),
        // ),
        CompletionStep(
          stepIdentifier: StepIdentifier(id: '321'),
          text: 'Thanks for taking the survey, we will contact you soon!',
          title: 'Done!',
          buttonText: 'Submit survey',
        ),
      ],
    );
    // task.addNavigationRule(
    //   forTriggerStepIdentifier: task.steps[6].stepIdentifier,
    //   navigationRule: ConditionalNavigationRule(
    //     resultToStepIdentifierMapper: (String? input) {
    //       switch (input) {
    //         case 'Yes':
    //           return task.steps[0].stepIdentifier;
    //         case 'No':
    //           return task.steps[7].stepIdentifier;
    //         default:
    //           return null;
    //       }
    //     },
    //   ),
    // );
    return Future<Task>.value(task);
  }

  Future<Task> getSampleTask() {
    final OrderedTask task = OrderedTask(
      id: TaskIdentifier(),
      steps: <Step>[
        InstructionStep(
          title: 'Welcome to the\nQuickBird Studios\nHealth Survey',
          text: 'Get ready for a bunch of super random questions!',
          buttonText: 'Let\'s go!',
          // showAppBar: true,
          // showProgress: false,
          // canGoBack: false,
        ),
        QuestionStep(
          title: 'How old are you?',
          answerFormat: const IntegerAnswerFormat(
            defaultValue: 25,
            hint: 'Please enter your age',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Medication?',
          text: 'Are you using any medication',
          answerFormat: const BooleanAnswerFormat(
            positiveAnswer: 'Yes',
            negativeAnswer: 'No',
            result: BooleanResult.POSITIVE,
          ),
        ),
        QuestionStep(
          title: 'Tell us about you',
          text: 'Tell us about yourself and why you want to improve your health.',
          answerFormat: const TextAnswerFormat(
            maxLines: 5,
            validationRegEx: r'^(?!\s*\$).+',
          ),
        ),
        QuestionStep(
          title: 'Select your body type',
          answerFormat: const ScaleAnswerFormat(
            step: 1,
            minimumValue: 1,
            maximumValue: 5,
            defaultValue: 3,
            minimumValueDescription: '1',
            maximumValueDescription: '5',
          ),
        ),
        QuestionStep(
          title: 'Known allergies',
          text: 'Do you have any allergies that we should be aware of?',
          isOptional: false,
          answerFormat: const MultipleChoiceAnswerFormat(
            textChoices: <TextChoice>[
              TextChoice(text: 'Penicillin', value: 'Penicillin'),
              TextChoice(text: 'Latex', value: 'Latex'),
              TextChoice(text: 'Pet', value: 'Pet'),
              TextChoice(text: 'Pollen', value: 'Pollen'),
            ],
          ),
        ),
        QuestionStep(
          title: 'Done?',
          text: 'We are done, do you mind to tell us more about yourself?',
          isOptional: true,
          answerFormat: const SingleChoiceAnswerFormat(
            textChoices: <TextChoice>[
              TextChoice(text: 'Yes', value: 'Yes'),
              TextChoice(text: 'No', value: 'No'),
            ],
            defaultSelection: TextChoice(text: 'No', value: 'No'),
          ),
        ),
        QuestionStep(
          title: 'When did you wake up?',
          answerFormat: const TimeAnswerFormat(
            defaultValue: TimeOfDay(
              hour: 12,
              minute: 0,
            ),
          ),
        ),
        QuestionStep(
          title: 'When was your last holiday?',
          answerFormat: DateAnswerFormat(
            minDate: DateTime.utc(1970),
            defaultDate: DateTime.now(),
            maxDate: DateTime.now(),
          ),
        ),
        QuestionStep(
          title: 'Upload a image of you',
          answerFormat: const ImageAnswerFormat(
            buttonText: 'Upload your photo',
            useGallery: true,
          ),
        ),
        CompletionStep(
          stepIdentifier: StepIdentifier(id: '321'),
          text: 'Thanks for taking the survey, we will contact you soon!',
          title: 'Done!',
          buttonText: 'Submit survey',
        ),
      ],
    );
    // task.addNavigationRule(
    //   forTriggerStepIdentifier: task.steps[6].stepIdentifier,
    //   navigationRule: ConditionalNavigationRule(
    //     resultToStepIdentifierMapper: (String? input) {
    //       switch (input) {
    //         case 'Yes':
    //           return task.steps[0].stepIdentifier;
    //         case 'No':
    //           return task.steps[7].stepIdentifier;
    //         default:
    //           return null;
    //       }
    //     },
    //   ),
    // );
    return Future<Task>.value(task);
  }

  Future<Task> getJsonTask() async {
    try {
      final String taskJson = await rootBundle.loadString('assets/example_json.json');
      final Map<String, dynamic> taskMap = json.decode(taskJson) as Map<String, dynamic>;

      return Task.fromJson(taskMap);
    } catch (e) {
      rethrow;
    }
  }
}
