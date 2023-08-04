import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'model.dart';

class DbManager {
  Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await openDb();
      return _database;
    }
  }

  Future openDb() async {
    print("inside openDB");
    _database = await openDatabase(join(await getDatabasesPath(), "xeet.db"),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
        '''CREATE TABLE xeetpro(
          id INTEGER PRIMARY KEY autoincrement,
          userid INTEGER, 
          username TEXT,
          fname TEXT,
          mname TEXT,
          lname TEXT, 
          dob TEXT, 
          email TEXT, 
          gender TEXT,
          hunit TEXT,
          wunit TEXT,
          height INT,
          weight INT,
          precon TEXT,
          phyact TEXT,
          desc TEXT,
          image1 TEXT,
          image2 TEXT,
          image3 TEXT,
          image4 TEXT,
          image5 TEXT,
          image6 TEXT,
          image7 TEXT,
          image8 TEXT,
          image9 TEXT,
          image10 TEXT,
          vid1 TEXT,
          vid2 TEXT
          )''',
      );
    });
    return _database;
  }

  Future insertModel(Model model) async {
    await openDb();
    return await _database?.insert('xeetpro', model.toJson());
  }

  Future<List<Model>> getModelList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database!.query(
      'xeetpro',
      // where: "userid = ?",
      // whereArgs: [id],
    );

    print("Here : ${maps.toString()}");

    return List.generate(maps.length, (i) {
      return Model(
          id: maps[i]['id'],
          userid: maps[i]['userid'],
          username: maps[i]['username'],
          fname: maps[i]['fname'],
          mname: maps[i]['mname'],
          lname: maps[i]['lname'],
          dob: maps[i]['dob'],
          email: maps[i]['email'],
          gender: maps[i]['gender'],
          hunit: maps[i]['hunit'],
          wunit: maps[i]['wunit'],
          height: maps[i]['height'],
          weight: maps[i]['weight'],
          precon: maps[i]['precon'],
          phyact: maps[i]['phyact'],
          desc: maps[i]['desc'],
          image1: maps[i]['image1'],
          image2: maps[i]['image2'],
          image3: maps[i]['image3'],
          image4: maps[i]['image4'],
          image5: maps[i]['image5'],
          image6: maps[i]['image6'],
          image7: maps[i]['image7'],
          image8: maps[i]['image8'],
          image9: maps[i]['image9'],
          image10: maps[i]['image10'],
          vid1: maps[i]['vid1'],
          vid2: maps[i]['vid2']
          );
    });
    // return maps
    //     .map((e) => Model(
    //         id: e["id"], fruitName: e["fruitName"], quantity: e["quantity"]))
    //     .toList();
  }

  Future<int> updateModel(Model model) async {
    await openDb();
    return await _database!.update('xeetpro', model.toJson(),
        where: "userid = ?", whereArgs: [model.id]);
  }

  Future<void> deleteModel(Model model) async {
    await openDb();
    await _database!
        .delete('xeetpro', where: "userid = ?", whereArgs: [model.id]);
  }
}
