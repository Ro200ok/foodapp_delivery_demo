import 'dart:developer';
import 'dart:io';

import 'package:food_app_test/models/product/product.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// class SqlStorageRepository {
//   Database? _database;
//   final tableName = 'cart1';

//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }
//     _database = await _init();
//     return _database!;
//   }

//   Future<String> get fullPath async {
//     const name = 'cart.db';
//     final path = await getDatabasesPath();
//     return join(path, name);
//   }

//   Future<Database> _init() async {
//     final path = await fullPath;
//     var databae = await openDatabase(path,
//         version: 1, onCreate: create, singleInstance: true);
//     return databae;
//   }

//   Future<void> create(Database database, int version) async {
//     return await createTable(database);
//   }

//   Future<void> createTable(Database database) async {
//     await database.execute(
//         """CREATE TABLE IF NOT EXIST $tableName (id INTEGER, name TEXT, image_url TEXT, cost INTEGER, sizes TEXT, categoryId INTEGER, description TEXT, PRIMARY KEY("id" AUTOINCREMENT));""");
//   }

//   Future<void> insertProduct(Product product) async {
//     final db = await SqlStorageRepository().database;
//     await db.insert(tableName, product.toJson(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   Future<List<Product>> fetchProducts() async {
//     final db = await SqlStorageRepository().database;
//     final List<Map<String, dynamic>> products = await db.query(tableName);
//     return List.generate(
//         products.length, (index) => Product.fromJson(products[index]));
//   }

//   Future<void> deleteProduct(int id) async {
//     final db = await SqlStorageRepository().database;

//     await db.delete(
//       tableName,
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
// }

class ProductDb {
  static Database? _productDb;
  static ProductDb? _productDatabaseHelper;

  // @HiveField(1) int? id,
  //   @HiveField(2) String? name,
  //   @HiveField(3) String? image_url,
  //   @HiveField(4) int? cost,
  //   @HiveField(5) String? sizes,
  //   @HiveField(6) int? categoryId,
  //   @HiveField(7) String? description,

  String productTable = 'productTable';
  String cartTable = 'cartTable';
  String id = 'id';
  String name = 'name';
  String imageUrl = 'image_url';
  String cost = "cost";
  String sizes = 'sizes';
  String categoryId = 'categoryId';
  String description = "description";

  ProductDb._createInstance();

  static final ProductDb db = ProductDb._createInstance();

  factory ProductDb() {
    _productDatabaseHelper ??= ProductDb._createInstance();
    return _productDatabaseHelper!;
  }

  Future<Database> get database async {
    _productDb ??= await initializeDatabase();
    return _productDb!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}products.db';
    var myDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return myDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE $productTable"
        "($id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$name TEXT, $imageUrl TEXT, $cost INTEGER, $sizes TEXT, $categoryId INTEGER, $description TEXT)");
    await db.execute('CREATE TABLE $cartTable'
        "($id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$name TEXT, $imageUrl TEXT, $cost INTEGER, $sizes TEXT, $categoryId INTEGER, $description TEXT)");
  }

  Future<List<Map<String, dynamic>>> getProductMapList() async {
    Database db = await database;
    var result = await db.query(productTable, orderBy: "$id ASC");
    return result;
  }

  Future<List<Map<String, dynamic>>> getCartMapList() async {
    Database db = await database;
    var result = await db.query(cartTable, orderBy: id);
    return result;
  }

  Future<int> insertProduct(Product product, {cart = false}) async {
    // print(cart);
    Database db = await database;
    var result =
        await db.insert(cart ? cartTable : productTable, product.toJson());
    log('$result    insertProduct result');
    return result;
  }

  Future<int> updateProduct(Product product, {cart = false}) async {
    var db = await database;
    var result = await db.update(
        cart ? cartTable : productTable, product.toJson(),
        where: '$id = ?', whereArgs: [product.id]);
    return result;
  }

  Future<int> deleteProduct(int id, {cart = false}) async {
    var db = await database;
    int result = await db.delete(cart ? cartTable : productTable,
        where: '$id = ?', whereArgs: [id]);

    return result;
  }

  Future<int?> getCount(tableName) async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $tableName');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Product>> getCartProductList() async {
    var productMapList = await getCartMapList();
    int? count = await getCount(cartTable);

    List<Product> productList = <Product>[];
    for (int i = 0; i < count!; i++) {
      productList.add(Product.fromJson(productMapList[i]));
    }
    return productList;
  }

  close() async {
    var db = await database;
    var result = db.close();
    return result;
  }
}
