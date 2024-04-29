

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static Future<void> createTables(Database database) async {
    await database.execute(
        """
    CREATE TABLE User(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      username TEXT,
      CIN INTEGER,
      Phone INTEGER,
      email TEXT,
      Password TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }
  static Future<bool> checkCredentials(String phone, String password) async {
    final db = await SQLHelper.db();
    final res = await db.query(
      'User',
      where: "Phone = ? AND Password = ?",
      whereArgs: [phone, password],
    );
    return res.isNotEmpty;
  }

  static Future<int?> getUserIdByPhone(String phone) async {
    final db = await SQLHelper.db();
    final res = await db.query(
        'User',
        columns: ['id'], // Only retrieve the id
        where: "Phone = ?",
        whereArgs: [phone],
        limit: 1
    );

    if (res.isNotEmpty) {
      return res.first['id'] as int;
    }
    return null;
  }
  static Future<bool> updatePassword(int userId, String oldPassword, String newPassword) async {
    final db = await SQLHelper.db();
    var res = await db.query(
      'User',
      where: "id = ? AND Password = ?",
      whereArgs: [userId, oldPassword],
    );

    if (res.isNotEmpty) {
      int result = await db.update(
          'User',
          {'Password': newPassword},
          where: "id = ?",
          whereArgs: [userId]
      );
      return result > 0;
    } else {

      return false;
    }
  }
  static Future<Database> db() async{
    var databasepath= await getDatabasesPath();
    String path = join(databasepath,'demo.db');
    return openDatabase("first.db",version: 1,onCreate: (Database database,int version) async {
      await createTables(database);
    });


  }
  static Future<int>  createUser(String username ,int? Phone,String email,String Password,int?  CIN ) async {
    final db= await SQLHelper.db();
    final data = {"username":username ,"Phone": Phone,"email": email ,"Password":Password ,"CIN":CIN};
    final id = await db.insert('User', data,conflictAlgorithm: ConflictAlgorithm.replace);
    return id ;

  }
  static Future<List<Map<String,dynamic>>> getUsers()async{
    final db =await SQLHelper.db();
    return db.query('User',orderBy: "id");

  }
  static Future<List<Map<String,dynamic>>> getUserById(int id)async{
    final db =await SQLHelper.db();
    return db.query('User',where: "id = ?",whereArgs: [id],limit: 1);

  }
  static Future<int> updateUser(int id , String username , int? Phone,String email ,String Password,int CIN) async {
    final db = await SQLHelper.db();
    final data = {
      'username' : username ,
      'Phone' : Phone ,
      'CIN' : CIN ,
      'email':email,
      "Password":Password,
      'createdAt' : DateTime.now().toString()
    };

    final result = await db.update('User', data,where: "id = ?", whereArgs: [id]);
    return result ;
  }

  static Future<void> deleteUser(int id ) async {
    final db = await SQLHelper.db();
    try {await db.delete("User", where: "id = ? ", whereArgs: [id]);} catch (err) {
      debugPrint("Something went wrong when deleting ");
    }
  }



}


