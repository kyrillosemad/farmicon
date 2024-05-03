import 'package:cloud_firestore/cloud_firestore.dart';


class Firebase {
  bool loading = true;

  Future<List> getdata() async {
    List data = [];
    await FirebaseFirestore.instance.collection("users").get().then((value) {
      for (var element in value.docs) {
        data.add({
          "name": element['name'],
          "address": element['address'],
        });
      }
    });
    loading = false;
    if (loading == false) {
      return data;
    }
    return data;
  }
}
