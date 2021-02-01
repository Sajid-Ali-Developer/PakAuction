class ListModel {
  String ImagePath;
  String name;
  String disc;
  ListModel({this.ImagePath, this.name, this.disc});
}

List<ListModel> event_listmodel = [
  ListModel(
    ImagePath: "Assets/sajid.jpg",
    name: "Sajid ali",
    disc: "sajid posted the car for auctioning",
  ),
  ListModel(
    ImagePath: "Assets/usairem.jpg",
    name: "Muhammad Usairem",
    disc: "Muhammad Usairem posted his car for auctioning, model 2007",
  ),
  ListModel(
    ImagePath: "Assets/boy.jpg",
    name: "Muhammad Nasir",
    disc: "Muhammad Nasir posted the car for auction",
  ),
];
