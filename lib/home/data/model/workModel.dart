// ignore_for_file: public_member_api_docs, sort_constructors_first
class WorkModel {
  String? workType;
  String workTitle;
  String workDescription;
  String image;
  WorkModel({
  this.workType,
    required this.workTitle,
    required this.workDescription,
    required this.image,
  });
}
