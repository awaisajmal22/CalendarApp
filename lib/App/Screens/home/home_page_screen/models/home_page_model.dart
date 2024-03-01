import 'userprofile_item_model.dart';

class HomePageModel {
  List<UserprofileItemModel> userprofileItemList = [
    UserprofileItemModel(
        timeText: "10:00-13:00",
        designText: "Design new UX flow for Michael",
        startText: "Start from screen 16"),
    UserprofileItemModel(
        timeText: "14:00-15:00", designText: "Brainstorm with the team "),
    UserprofileItemModel(
        designText: "Workout with Ella",
        startText: "We will do the legs and back workout")
  ];
}
