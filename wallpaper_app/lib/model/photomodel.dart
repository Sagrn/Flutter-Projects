
class PhotoModel {
  String src;
  String photoName;
  PhotoModel({required this.src,required this.photoName});

  static PhotoModel fromApi2App (Map<String,dynamic> photoMap){
    // print("PhotoModel method is called");
    return PhotoModel(src: (photoMap["src"])["portrait"], photoName: photoMap["photographer"]);
  }
}