import 'dart:io';

import 'package:agenda/data/databasevalues.dart';
import 'package:agenda/models/pos_customers.dart';
import 'package:agenda/models/pos_products.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

class DbLite {
  static final int DATABASE_VERSION = 4;
  static final String DATABASE_NAME = "isalesotm-flutter.db";

  static final DbLite db = DbLite._();
  static Database? _database;
  DbLite._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, DATABASE_NAME);

    //open/create database at a given path
    var db = await openDatabase(path,
        version: DATABASE_VERSION, onCreate: _onCreate);

    return db;
  }

  _onCreate(Database db, int version) async {
    // Database is created, create the table
    var data = DatabaseValues.information;

    data.forEach((key, value) async {
      print('****************CRIANDO ${value['tableName']!}****************');
      await db.execute(value['create_script']!);
    });

    // // print('****************CRIANDO ACTIVITIES****************');
    // // await db.execute(DatabaseValues.createTablePOS_ACTIVITIES);
    // print('****************CRIANDO CUSTOMERS****************');
    // await db.execute(DatabaseValues.createTablePOS_CUSTOMERS);
    // // print('****************CRIANDO CUSTOMERS ADDRESS********');
    // // await db.execute(DatabaseValues.createTablePOS_CUSTOMERS_ADDRESS);
    // print('****************CRIANDO PRODUCTS****************');
    // await db.execute(DatabaseValues.createTablePOS_PRODUCTS);
  }

  Future close() async {
    final dba = await db.database;

    dba.close();
  }

  _onUpdate(Database db, int oldVersion, int newVersion) async {
    for (var i = oldVersion - 1; i <= newVersion - 1; i++) {
      //await db.execute(migrationScripts[i]);
    }
  }

  Future<void> deleteAllDatabase() async {
    // deleteAllFromTable('POS_ACTIVITIES');
    print('****APAGANDO BD****');
    deleteAllFromTable('POS_CUSTOMERS');
    deleteAllFromTable('POS_PRODUCTS');
    // deleteAllFromTable('POS_CUSTOMERS_ADDRESS');
    // dropAllFromTable('POS_CUSTOMERS');
    // dropAllFromTable('POS_PRODUCTS');
  }

  Future<dynamic> checkIfEmpty(bool sameUser) async {
    final db = await database;
    // List<Map> result = await db.rawQuery("select  count(*) from TipoTarefas " +
    //     " UNION ALL select count(*) from Status ");

    List<Map> result = await db.rawQuery("select  count(*) from POS_CUSTOMERS" +
        " UNION ALL select count(*) from POS_PRODUCTS " +
        " UNION ALL select count(*) from POS_CUSTOMERS_ADDRESS ");

    return result;
  }

  Future<int> deleteAllFromTable(String table) async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM $table');

    return res;
  }

  Future<void> dropAllFromTable(String table) async {
    final db = await database;
    await db.execute("DROP TABLE IF EXISTS $table");
  }

  addElement(dynamic element, String table) async {
    final db = await database;
    final res = await db.insert(table, element.toMap());

    return res;
  }

/*
  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await DbLite.database();
    const myquery = """select 
       datetime(oc.APPOINTMENT_DATE) as date, 
       ot.NAME as type, 
       oc.POS_OCCURRENCE_ID as id, 
       0 as classID, 
       oc.HOUR as hour, 
       c.NAME as name  
       from POS_OCCURRENCES as oc 
       left join POS_OCC_TYPE as ot on ot.SALESUP_ID = oc.OCCURRENCE_ID and ot.SHOW_AGENDA = 1 
       left join POS_CUSTOMERS as c on c.SALESUPID = oc.CUSTOMER_ID 
       --where date(oc.APPOINTMENT_DATE) = "2021-11-08" and oc.SOLVED = 0 
       where oc.SOLVED = 0 
       union  
       select 
       datetime(c.NEXT_CONTACT_DATE) as date, 
       ct.NAME as type, 
       c.POS_CONTACT_ID as id, 
       1 as classID, 
       c.NEXT_CONTACT_HOUR as hour, 
       c.OPPORTUNITY as name  
       from POS_CONTACT as c 
       left join POS_CONTACT_TYPE as ct on c.TYPE_CODE = ct.CODE 
       --where date(NEXT_CONTACT_DATE) = "2021-11-08" order by hour""";
    return db.rawQuery(myquery);
  }

  */

  Future<List<Customer>> getClients() async {
    final db = await database;
    const myquery = """select *  from POS_CUSTOMERS""";
    final res = await db.rawQuery(myquery);

    List<Customer> list = res.isNotEmpty
        ? res.map((c) => Customer.fromMapFromDb(c)).toList()
        : [];
    return list;
  }

  Future<List<Product>> getProducts() async {
    final db = await database;
    const myquery = """select *  from POS_PRODUCTS""";
    final res = await db.rawQuery(myquery);

    List<Product> list =
        res.isNotEmpty ? res.map((c) => Product.fromMapFromDb(c)).toList() : [];
    return list;
  }
}
