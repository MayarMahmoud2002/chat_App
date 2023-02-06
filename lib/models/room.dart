class Rooms
{

  String id;
  String title;
  String description;
  String CatId;

  static const String COLLECTION_NAME = "Rooms";

  Rooms({ this.id =" ", required this.title , required this.description , required this.CatId });
  Rooms.fromJson(Map<String , dynamic> json):this(

    id: json["id"],
    title: json["title"],
    description: json ["description"],
      CatId : json ["CatId"],

  );
  Map<String , dynamic> toJson()
  {
    return {
      "id": id,
      "title" : title,
      "description" : description,
      "CatId":CatId,
    };
  }
}