// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current;
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Home Workouts`
  String get homeWorkouts {
    return Intl.message(
      'Home Workouts',
      name: 'homeWorkouts',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get discover {
    return Intl.message(
      'Discover',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get activity {
    return Intl.message(
      'Activity',
      name: 'activity',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Transformation`
  String get transformation {
    return Intl.message(
      'Transformation',
      name: 'transformation',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get beginner {
    return Intl.message(
      'Beginner',
      name: 'beginner',
      desc: '',
      args: [],
    );
  }

  /// `Challenges`
  String get challenges {
    return Intl.message(
      'Challenges',
      name: 'challenges',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Kcal`
  String get kcal {
    return Intl.message(
      'Kcal',
      name: 'kcal',
      desc: '',
      args: [],
    );
  }

  /// `Workouts`
  String get workouts {
    return Intl.message(
      'Workouts',
      name: 'workouts',
      desc: '',
      args: [],
    );
  }

  /// `Week`
  String get week {
    return Intl.message(
      'Week',
      name: 'week',
      desc: '',
      args: [],
    );
  }

  /// `Intermediate`
  String get intermediate {
    return Intl.message(
      'Intermediate',
      name: 'intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get advanced {
    return Intl.message(
      'Advanced',
      name: 'advanced',
      desc: '',
      args: [],
    );
  }

  /// `Calories`
  String get calories {
    return Intl.message(
      'Calories',
      name: 'calories',
      desc: '',
      args: [],
    );
  }

  /// `Seconds`
  String get seconds {
    return Intl.message(
      'Seconds',
      name: 'seconds',
      desc: '',
      args: [],
    );
  }

  /// `Quick Workouts`
  String get quickWorkouts {
    return Intl.message(
      'Quick Workouts',
      name: 'quickWorkouts',
      desc: '',
      args: [],
    );
  }

  /// `Popular Workouts`
  String get popularWorkouts {
    return Intl.message(
      'Popular Workouts',
      name: 'popularWorkouts',
      desc: '',
      args: [],
    );
  }

  /// `Top Picks`
  String get topPicks {
    return Intl.message(
      'Top Picks',
      name: 'topPicks',
      desc: '',
      args: [],
    );
  }

  /// `Stretches`
  String get stretches {
    return Intl.message(
      'Stretches',
      name: 'stretches',
      desc: '',
      args: [],
    );
  }

  /// `GO`
  String get go {
    return Intl.message(
      'GO',
      name: 'go',
      desc: '',
      args: [],
    );
  }

  /// `Exercises`
  String get exercises {
    return Intl.message(
      'Exercises',
      name: 'exercises',
      desc: '',
      args: [],
    );
  }

  /// `WORKOUT`
  String get workout {
    return Intl.message(
      'WORKOUT',
      name: 'workout',
      desc: '',
      args: [],
    );
  }

  /// `Cathelete`
  String get app_name {
    return Intl.message(
      'Cathelete',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  String get intro_desc_1 {
    return Intl.message(
      'Welcome',
      name: 'intro_desc_1',
      desc: '',
      args: [],
    );
  }

  String get intro_desc_2 {
    return Intl.message(
      'Welcome',
      name: 'intro_desc_2',
      desc: '',
      args: [],
    );
  }

  String get intro_desc_3 {
    return Intl.message(
      'Welcome',
      name: 'intro_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Workout`
  String get workout_small {
    return Intl.message(
      'Workout',
      name: 'workout_small',
      desc: '',
      args: [],
    );
  }

  /// `Shape Your Body`
  String get shapeYourBody {
    return Intl.message(
      'Shape Your Body',
      name: 'shapeYourBody',
      desc: '',
      args: [],
    );
  }

  /// `build muscle, get toned, achive an athlet's body`
  String get buildMuscleGetTonedAchiveAnAthletsBody {
    return Intl.message(
      'achive',
      name: 'achive',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
