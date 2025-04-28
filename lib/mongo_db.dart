// // import 'package:flutter/material.dart';
// // import 'package:mongo_dart/mongo_dart.dart';


// // class MongoDatabase {
// //   static var db, userCollection;

// //   static connect() async {
// //     db = await Db.create(MONGO_CONN_URL);
// //     await db.open();
// //     userCollection = db.collection(USER_COLLECTION);
// //   }

// //   static Future<List<Map<String, dynamic>>> getDocuments() async {
// //     try {
// //       final users = await userCollection.find().toList();
// //       return users;
// //     } catch (e) {
// //       print(e);
// //       return Future.value();
// //     }
// //   }

// //   static insert(User user) async {
// //     await userCollection.insertAll([user.toMap()]);
// //   }

// //   static update(User user) async {
// //     var u = await userCollection.findOne({"_id": user.id});
// //     u["name"] = user.name;
// //     u["age"] = user.age;
// //     u["phone"] = user.phone;
// //     await userCollection.save(u);
// //   }

// //   static delete(User user) async {
// //     await userCollection.remove(where.id(user.id));
// //   }
// // }

// // class UserCard extends StatelessWidget {
// //   UserCard({required this.user, required this.onTapDelete, required this.onTapEdit});
// //   final User user;
// //   final GestureTapCallback onTapEdit, onTapDelete;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Material(
// //       elevation: 2.0,
// //       color: Colors.white,
// //       child: ListTile(
// //         leading: Text(
// //           '${user.age}',
// //           // style: Theme.of(context).textTheme.headline6,
// //         ),
// //         title: Text(user.name),
// //         subtitle: Text('${user.phone}'),
// //         trailing: Column(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //             GestureDetector(
// //               child: Icon(Icons.edit),
// //               onTap: onTapEdit,
// //             ),
// //             GestureDetector(
// //               child: Icon(Icons.delete),
// //               onTap: onTapDelete,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// // const MONGO_CONN_URL = "<MONGO_URI>";
// // const USER_COLLECTION = "users";

// // class User {
// //   final ObjectId id;
// //   final String name;
// //   final int age;
// //   final int phone;

// //   const User({required this.id, required this.name, required this.age, required this.phone});

// //   Map<String, dynamic> toMap() {
// //     return {
// //       '_id': id,
// //       'name': name,
// //       'age': age,
// //       'phone': phone,
// //     };import 'package:flutter/material.dart';
// import 'package:mongo_dart/mongo_dart.dart';


// class MongoDatabase {
//   static var db, userCollection;

//   static connect() async {
//     db = await Db.create(MONGO_CONN_URL);
//     await db.open();
//     userCollection = db.collection(USER_COLLECTION);
//   }

//   static Future<List<Map<String, dynamic>>> getDocuments() async {
//     try {
//       final users = await userCollection.find().toList();
//       return users;
//     } catch (e) {
//       print(e);
//       return Future.value();
//     }
//   }

//   static insert(User user) async {
//     await userCollection.insertAll([user.toMap()]);
//   }

//   static update(User user) async {
//     var u = await userCollection.findOne({"_id": user.id});
//     u["name"] = user.name;
//     u["age"] = user.age;
//     u["phone"] = user.phone;
//     await userCollection.save(u);
//   }

//   static delete(User user) async {
//     await userCollection.remove(where.id(user.id));
//   }
// }

// class UserCard extends StatelessWidget {
//   UserCard({required this.user, required this.onTapDelete, required this.onTapEdit});
//   final User user;
//   final GestureTapCallback onTapEdit, onTapDelete;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 2.0,
//       color: Colors.white,
//       child: ListTile(
//         leading: Text(
//           '${user.age}',
//           // style: Theme.of(context).textTheme.headline6,
//         ),
//         title: Text(user.name),
//         subtitle: Text('${user.phone}'),
//         trailing: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             GestureDetector(
//               child: Icon(Icons.edit),
//               onTap: onTapEdit,
//             ),
//             GestureDetector(
//               child: Icon(Icons.delete),
//               onTap: onTapDelete,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// const MONGO_CONN_URL = "<MONGO_URI>";
// const USER_COLLECTION = "users";

// class User {
//   final ObjectId id;
//   final String name;
//   final int age;
//   final int phone;

//   const User({required this.id, required this.name, required this.age, required this.phone});

//   Map<String, dynamic> toMap() {
//     return {
//       '_id': id,
//       'name': name,
//       'age': age,
//       'phone': phone,
//     };
//   }

//   User.fromMap(Map<String, dynamic> map)
//       : name = map['name'],
//         id = map['_id'],
//         age = map['age'],
//         phone = map['phone'];
// }
// //   }

// //   User.fromMap(Map<String, dynamic> map)
// //       : name = map['name'],
// //         id = map['_id'],
// //         age = map['age'],
// //         phone = map['phone'];
// // }