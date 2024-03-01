
/// This class is used in the [userprofile_item_widget] screen.
class UserprofileItemModel {
  UserprofileItemModel({
    this.timeText,
    this.designText,
    this.startText,
    this.id,
  }) {
    timeText = timeText ?? "10:00-13:00";
    designText = designText ?? "Design new UX flow for Michael";
    startText = startText ?? "Start from screen 16";
    id = id ?? "";
  }

  String? timeText;

  String? designText;

  String? startText;

  String? id;
}
