

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static Future<void> createTables(Database database) async {
    await database.execute(
        """
    CREATE TABLE items(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      title TEXT,
      description TEXT, 
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }

  static Future<Database> db() async{
    var databasepath= await getDatabasesPath();
    String path = join(databasepath,'demo.db');
    return openDatabase("first.db",version: 1,onCreate: (Database database,int version) async {
      await createTables(database);
    });


  }
  static Future<int>  createItem(String title ,String? desciption) async {
    final db= await SQLHelper.db();
    final data = {"title":title ,"description": desciption};
    final id = await db.insert('items', data,conflictAlgorithm: ConflictAlgorithm.replace);
    return id ;

  }
  static Future<List<Map<String,dynamic>>> getItems()async{
    final db =await SQLHelper.db();
    return db.query('items',orderBy: "id");

  }
  static Future<List<Map<String,dynamic>>> getItem(int id)async{
    final db =await SQLHelper.db();
    return db.query('items',where: "id = ?",whereArgs: [id],limit: 1);

  }
  static Future<int> updateItem(int id , String title , String? description) async {
    final db = await SQLHelper.db();
    final data = {
      'title' : title ,
      'description' : description ,
      'createdAt' : DateTime.now().toString()
    };

    final result = await db.update('items', data,where: "id = ?", whereArgs: [id]);
    return result ;
  }

  static Future<void> deleteitem(int id ) async {
    final db = await SQLHelper.db();
    try {await db.delete("items", where: "id = ? ", whereArgs: [id]);} catch (err) {
      debugPrint("Something went wrong when deleting ");
    }
  }



}


