import 'dart:collection';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:cathelete/models/ModelChallengesMainCat.dart';
import 'package:cathelete/models/ModelDiscover.dart';
import 'package:cathelete/models/ModelExerciseDetail.dart';
import 'package:cathelete/models/ModelExerciseList.dart';
import 'package:cathelete/models/ModelHistory.dart';
import 'package:cathelete/models/ModelMainCategory.dart';
import 'package:cathelete/models/ModelPopularWorkout.dart';
import 'package:cathelete/models/ModelQuickWorkout.dart';
import 'package:cathelete/models/ModelWorkoutExerciseList.dart';
import 'package:cathelete/models/ModelWorkoutList.dart';

class DataHelper {
  static final _databaseName = "flutter_workout_db.db";
  static final _databaseVersion = 1;

  DataHelper._privateConstructor();

  static final DataHelper instance = DataHelper._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }

    return _database;
  }

  _initDatabase() async {
    var databasepath = await getDatabasesPath();
    String path = join(databasepath, _databaseName);

    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }

      ByteData data = await rootBundle.load(join("assets", _databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    } else {}
    return await openDatabase(path, version: _databaseVersion, readOnly: false);
  }

  Future<List<ModelMainCategory>> getAllMainCategory() async {
    Database database = await instance.database;
    var results = await database.query("tbl_main_category");
    List<ModelMainCategory> list = results.isNotEmpty
        ? results.map((c) => ModelMainCategory.fromMap(c)).toList()
        : null;
    return list;
  }

  Future<List<ModelChallengesMainCat>> getAllChallengesList() async {
    Database database = await instance.database;
    var results = await database.query("tbl_challenges_list");
    List<ModelChallengesMainCat> list = results.isNotEmpty
        ? results.map((c) => ModelChallengesMainCat.fromMap(c)).toList()
        : null;
    return list;
  }

  Future<List<ModelExerciseList>> getAllExerciseByMainCategory(int id) async {
    Database database = await instance.database;
    var results = await database
        .query("tbl_exercise_list", where: "main_cat_id=?", whereArgs: [id]);
    List<ModelExerciseList> list = results.isNotEmpty
        ? results.map((c) => ModelExerciseList.fromMap(c)).toList()
        : null;
    return list;
  }

  Future<List<ModelQuickWorkout>> getAllQuickWorkoutList() async {
    Database database = await instance.database;
    var results = await database.query("tbl_quick_workout");
    List<ModelQuickWorkout> list = results.isNotEmpty
        ? results.map((c) => ModelQuickWorkout.fromMap(c)).toList()
        : null;
    return list;
  }

  Future<List<ModelPopularWorkout>> getAllPopularWorkoutList() async {
    Database database = await instance.database;
    var results = await database.query("tbl_popular_workout");
    List<ModelPopularWorkout> list = results.isNotEmpty
        ? results.map((c) => ModelPopularWorkout.fromMap(c)).toList()
        : null;
    return list;
  }

  Future<List<ModelPopularWorkout>> getAllTopPicksList() async {
    Database database = await instance.database;
    var results = await database.query("tbl_top_picks");
    List<ModelPopularWorkout> list = results.isNotEmpty
        ? results.map((c) => ModelPopularWorkout.fromMap(c)).toList()
        : null;
    return list;
  }

  Future<List<ModelPopularWorkout>> getAllStretchesList() async {
    Database database = await instance.database;
    var results = await database.query("tbl_stretches");
    List<ModelPopularWorkout> list = results.isNotEmpty
        ? results.map((c) => ModelPopularWorkout.fromMap(c)).toList()
        : null;
    return list;
  }

  Future<List<ModelDiscover>> getAllDiscoverWorkouts() async {
    Database database = await instance.database;
    var results = await database.query("tbl_discover");
    List<ModelDiscover> list = results.isNotEmpty
        ? results.map((c) => ModelDiscover.fromMap(c)).toList()
        : null;
    return list;
  }

  Future<List<ModelWorkoutList>> getWorkoutList() async {
    Database database = await instance.database;
    var results = await database.query("tbl_workout_list");
    List<ModelWorkoutList> list = results.isNotEmpty
        ? results.map((c) => ModelWorkoutList.fromMap(c)).toList()
        : null;
    return list;
  }

  Future<List<ModelHistory>> getHistoryByDate(String date) async {
    Database database = await instance.database;
    var results =
        await database.query("tbl_history", where: "date=?", whereArgs: [date]);
    List<ModelHistory> list = results.isNotEmpty
        ? results.map((c) => ModelHistory.fromMap(c)).toList()
        : null;
    return list;
  }

  Future<int> addHistoryData(String title, String startTime, int totalDuration,
      int kcal, String date) async {
    Database database = await instance.database;
    var map = new HashMap<String, dynamic>();
    map['title'] = title;
    map['start_time'] = startTime;
    map['total_duration'] = totalDuration;
    map['kcal'] = kcal;
    map['date'] = date;
    return database.insert("tbl_history", map, nullColumnHack: 'id');
  }

  Future<List> calculateTotalWorkout() async {
    Database database = await instance.database;
    var result = await database.rawQuery("SELECT * FROM tbl_history");
    return result.toList();
  }

  Future<List<ModelWorkoutExerciseList>> getWorkoutExerciseListById(
      int id) async {
    id = 1;
    Database database = await instance.database;
    var results = await database.query("tbl_workout_exercise_list",
        where: "workout_id=?", whereArgs: [id]);
    List<ModelWorkoutExerciseList> list = results.isNotEmpty
        ? results.map((c) => ModelWorkoutExerciseList.fromMap(c)).toList()
        : null;
    return list;
  }

  Future<ModelWorkoutList> getWorkoutLevelById(int id) async {
    Database database = await instance.database;
    var results = await database
        .query("tbl_workout_list", where: "id=?", whereArgs: [id]);
    ModelWorkoutList list =
        results.isNotEmpty ? ModelWorkoutList.fromMap(results.first) : null;
    return list;
  }

  Future<ModelExerciseDetail> getExerciseDetailById(int id) async {
    Database database = await instance.database;
    var results = await database
        .query("tbl_exercise_detail", where: "id=?", whereArgs: [id]);
    ModelExerciseDetail exerciseDetail =
        results.isNotEmpty ? ModelExerciseDetail.fromMap(results.first) : null;
    return exerciseDetail;
  }
}
