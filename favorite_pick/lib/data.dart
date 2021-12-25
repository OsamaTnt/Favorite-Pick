import 'package:flutter/cupertino.dart';



class Data extends ChangeNotifier{
  List<String> sports = ['Football', 'Basketball', 'Ice Hockey', 'Baseball'];
  String? selectedSport;

  void selectSport(String? sportName){
    selectedSport = sportName;
    notifyListeners();
  }

  String? getSportIconPath(String? sportName){
    return (sportName == 'Football')? 'images/SI_Soccer.png':
    (sportName == 'Basketball')? 'images/SI_Basketball.png':
    (sportName == 'Ice Hockey')? 'images/SI_IceHockey.png':
    (sportName == 'Baseball')? 'images/SI_Baseball.png': '';
  }

}