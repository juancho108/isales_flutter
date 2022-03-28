import 'dart:io';

import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

class DbLite {
  static Future<sql.Database> database() async {
    var databasesPath = await sql.getDatabasesPath();
    var path = join(databasesPath, "powersales.db");

    var exists = await sql.databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "powersales.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
// open the database
    final db = await sql.openDatabase(path);

    return db;
  }

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

  static Future<List<Map<String, dynamic>>> getClients() async {
    final db = await DbLite.database();
    const myquery = """select *  from POS_CUSTOMERS""";
    return db.rawQuery(myquery);
  }

  static Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await DbLite.database();
    const myquery = """select *  from POS_PRODUCTS""";
    return db.rawQuery(myquery);
  }
}
