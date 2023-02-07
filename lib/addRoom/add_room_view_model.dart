
import 'package:chat_app/DatabaseUtils/database_utils.dart';
import 'package:chat_app/addRoom/add_room_navigator.dart';
import 'package:chat_app/models/room.dart';
import 'package:chat_app/shared/base.dart';

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator>
{
  void AddRoomsToDB(String title , String description , String CatId)
  {
    Rooms room = Rooms( title: title, description: description, CatId: CatId);
    DatabaseUtils.AddRoomsToFirestore(room).then((value)
    {
      navigator!.RoomCreated();

    }).catchError((Error)
    {

    });
  }

}