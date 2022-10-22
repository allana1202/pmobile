import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBhelper {
  initDB() async {
    String databasesPath = await getDatabasesPath();
    String databaseName = join(databasesPath, 'pacotes.db');
    var db = await openDatabase(
      databaseName,
      version: 2,
      onCreate: onCreate,
    );

    print(databaseName);
    return db;
  }

  onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE package(id INTEGER PRIMARY KEY, head varchar(100), user varchar(100), email varchar(100), password varchar(100));';
    await db.execute(sql);

    sql =
        "INSERT INTO package (id, head, user, email, password) VALUES (1, 'Login', 'Maria', 'M.paula_123@gmail.com', '12345678');";
    await db.execute(sql);
    sql =
        "INSERT INTO package (id, head, user, email, password) VALUES (2, 'Login', 'Mary', 'Mary12@gmail.com', '12020506');";
    await db.execute(sql);

    sql =
        "INSERT INTO package (id, head, user, email, password) VALUES (3, 'Login', 'Mariana', 'Mariana23@gmail.com', '23261221');";
    await db.execute(sql);
  }
}
