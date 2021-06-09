// import 'package:fruits/models/users.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:io';

// class DbProvider {
//   //crreate a singleton class
//  DbProvider instance = DbProvider._instance();
//    Database _db;
//   DbProvider._instance();

//   //User Table
//   //id |Email|Password
//   //0|''|''   |''

//   //Getter for Db Variable
//   Future<Database> get db async {
//     if (_db == null) {
//       _db = await _initDb();
//     }
//     return _db;
//   }

//   Future<Database> _initDb() async {
//     Directory documentDir = await getApplicationDocumentsDirectory();
//     String path = join(documentDir.path, "users.db");
//     final userDb = await openDatabase(path, version: 1, onCreate: _onCreateDb);
//     return userDb;
//   }

//   void _onCreateDb(Database db, int version) async {
//     await db.execute("""
//     CREATE TABLE userTable(
//       id INTEGER PRIMARY KEY  AUTOINCREMENT,
//      phoneNumber TEXT,
//       username TEXT,
//       password TEXT
//     )
//     """);
//   }

//   Future<List<Map<String, dynamic>>> getTaskMapList() async {
//     Database db = await this.db;
//     final List<Map<String, dynamic>> result = await db.query('userTable');
//     return result;
//   }

// //convert map into Object
//   Future<List<User>> getUserList() async {
//     final List<Map<String, dynamic>> userMapList = await getTaskMapList();
//     final List<User> userList = [];
//     userMapList.forEach((userMap) {
//       userList.add(User.fromMap(userMap));
//     });
//     return userList;
//   }

// //
//   Future<int> insertUser(User user) async {
//     Database db = await this.db;
//     final int result = await db.insert('userTable', user.toMap());
//     return result;
//   }

//   Future<int> updateUser(User user) async {
//     Database db = await this.db;
//     final int result = await db.update(
//       'userTable',
//       user.toMap(),
//       where: 'id=?',
//       whereArgs: [user.id],
//     );
//     return result;
//   }

//   Future<int> deleteUser(User user) async {
//     Database db = await this.db;
//     final int result = await db.delete(
//       'userTable',
//       where: 'id=?',
//       whereArgs: ['id'],
//     );
//     return result;
//   }
// }
