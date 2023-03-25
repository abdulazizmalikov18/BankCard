import 'package:bankcard/features/main/domain/entities/bank_card_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BankCardDatabase {
  static final BankCardDatabase instance = BankCardDatabase._init();
  static Database? _database;

  BankCardDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('bankcards.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE bankcards(
        id INTEGER PRIMARY KEY,
        cardHolderName TEXT,
        cardNumber TEXT,
        expiryDate TEXT,
        cvvCode TEXT,
        file TEXT,
        assets TEXT,
        color INTEGER,
        isImage INTEGER
      )
    ''');
  }

  Future<int> create(BankCardEntity bankCard) async {
    final db = await instance.database;
    
    return db.insert('bankcards', bankCard.toMap());
  }

  Future<List<BankCardEntity>> readAll() async {
    final db = await instance.database;
    final result = await db.query('bankcards');

    return result.map((json) => BankCardEntity.fromMap(json)).toList();
  }

  Future<int> update(BankCardEntity card) async {
    final db = await instance.database;
    return db.update(
      'bankcards',
      card.toMap(),
      where: 'id = ?',
      whereArgs: [card.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      'bankcards',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
