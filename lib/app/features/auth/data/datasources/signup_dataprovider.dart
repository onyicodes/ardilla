import 'package:ardilla/core/error/exceptions.dart';
import 'package:ardilla/core/models/user_model.dart';
import 'package:ardilla/core/parameters/signup/email_signup_params.dart';
import 'package:ardilla/core/parameters/signup/signin_params.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

abstract class AuthLocalDataProvider {
  Future<bool> checkUserExists({required String email});
  Future<bool> signup({required SignupParams params});
  Future<UserModel> signin({required SigninParams params});
}

class AuthLocalDataProviderImpl implements AuthLocalDataProvider {
  static final AuthLocalDataProviderImpl _dbHelper =
      AuthLocalDataProviderImpl._internal();
  String userTable = "accountTable";
  String colId = "id";
  String colUsername = "username";
  String colFirstname = "firstName";
  String colLastname = "lastName";
  String colEmail = "email";
  String colDateCreated = "dateCreated";
  String colPhoneNumber = "phoneNumber";
  String colRefCode = "refCode";
  String colPassword = "password";
  String colRank = "rank";

  AuthLocalDataProviderImpl._internal();

  factory AuthLocalDataProviderImpl() {
    return _dbHelper;
  }

  static Database? _db;

  Future<Database> get db async {
    // _db!.execute("DROP TABLE IF EXISTS $routineTable");

    _db ??= await initializeDb();
    return _db as Database;
  }

  Future<Database> initializeDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}ardilla_ldb.db";

    var ardillaDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return ardillaDb;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $userTable($colId INTEGER PRIMARY KEY autoincrement, $colUsername TEXT, "
        "$colFirstname TEXT, $colLastname TEXT, $colRank TEXT, $colEmail TEXT, $colDateCreated DATETIME, $colPhoneNumber TEXT, $colPassword TEXT, $colRefCode TEXT)");
  }

  @override
  Future<bool> checkUserExists({required String email}) async {
    Database db = await this.db;

    try {
      final user = await db
          .rawQuery("SELECT * FROM $userTable where $colEmail = '$email'");

      return user.isNotEmpty;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<bool> signup({required SignupParams params}) async {
    Database db = await this.db;
    int result;
    try {
      final user = await db.rawQuery(
          "SELECT * FROM $userTable WHERE $colEmail = ?",[params.email]);
      if (user.isEmpty) {
        print(user);
        result = await db.rawInsert(
            "INSERT INTO $userTable ('$colFirstname', '$colLastname', '$colPhoneNumber', '$colUsername', '$colEmail', '$colRefCode', '$colPassword', '$colDateCreated')"
            "VALUES('${params.firstName}', '${params.lastName}', '${params.phone}', '${params.userName}', '${params.email}', '${params.refCode}','${params.password}', '${DateTime.now().toIso8601String()}')");
      } else {
        throw AccountExistsException();
      }

      return result != 0; //result == 0 not inserted
    } on AccountExistsException {
      throw AccountExistsException();
    } catch (e) {
      print(e);
      throw CacheException();
    }
  }

  @override
  Future<UserModel> signin({required SigninParams params}) async {
    Database db = await this.db;
    try {
      final user = await db.rawQuery(
          "SELECT * FROM $userTable where $colEmail = '${params.email}' AND $colPassword = '${params.password}'");
      if (user.isEmpty) {
        throw AccountNotFoundException();
      }
      return UserModel.fromJson(user.first);
    } on AccountNotFoundException {
      throw AccountNotFoundException();
    } catch (e) {
      print(e);
      throw CacheException();
    }
  }
}
