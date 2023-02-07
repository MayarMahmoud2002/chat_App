
import 'package:chat_app/DatabaseUtils/database_utils.dart';
import 'package:chat_app/models/room.dart';
import 'package:chat_app/shared/base.dart';

class HomeViewModel extends BaseViewModel
{

  List<Rooms> rooms =[];

  void readRooms() async
  {
     DatabaseUtils.readRoomsFromFirStore().then((value)
    {
      rooms = value;
    }).catchError((error)
    {
      navigator!.showMessege(error.toString());
    });
  }

}