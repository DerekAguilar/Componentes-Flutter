class Data {
  String? name;
  bool? likesFlutter;
  int? flutterRating;
  String? mobDevLanguage;
  bool? web;
  bool? emulator;
  bool? phone;

  Data({required String nm, required bool likes,required int rating,required String lang,required bool wb,required bool emu,required bool phn}) {
    name=nm;
    likesFlutter=likes;
    flutterRating=rating;
    mobDevLanguage=lang;
    web=wb;
    emulator=emu;
    phone=phn;
  }
}