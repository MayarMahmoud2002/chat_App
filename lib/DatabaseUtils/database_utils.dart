import 'package:chat_app/models/my_user.dart';
import 'package:chat_app/models/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseUtils
{
  static CollectionReference<MyUser> getUserCollection()
  {
    return FirebaseFirestore.instance.collection(MyUser.COLLECTION_NAME)
        .withConverter<MyUser>(fromFirestore: (snapshot , options) =>
        MyUser.fromJson(snapshot.data()!),
         toFirestore: (value , options) => value.toJson(),);
  }
  
  static Future<void> AddUserToFirestore(MyUser myUser)
  {
    // FirebaseFirestore.instance.collection("Users")
        return getUserCollection().doc(myUser.id).set(myUser);
  }

  static Future <MyUser?> readUserFromFirestore(String id ) async
  {
    DocumentSnapshot <MyUser> user =
        await getUserCollection().doc(id).get();

    var myUser = user.data();
    return myUser;
  }

  static CollectionReference<Rooms> getRoomsCollection()
  {
    return FirebaseFirestore.instance.collection(Rooms.COLLECTION_NAME)
        .withConverter<Rooms>(fromFirestore: (snapshot , options) =>
        Rooms.fromJson(snapshot.data()!),
      toFirestore: (room , options) => room.toJson(),);
  }

  static Future<void> AddRoomsToFirestore(Rooms rooms)
  {
    var collection = getRoomsCollection();
    var docRef = collection.doc();
    rooms.id= docRef.id;
    return docRef.set(rooms);


  }

  static Future<List<Rooms>> readRoomsFromFirStore() async
  {
    QuerySnapshot<Rooms> snapRooms =await getRoomsCollection().get();

    return snapRooms.docs.map((doc) => doc.data()).toList();
  }

  
}