import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Data extends ChangeNotifier{
  List<String> sports = ['Football', 'Basketball', 'Ice Hockey', 'Baseball'];
  String? selectedSport;

  void selectSport(String? sportName){
    selectedSport = sportName;
    notifyListeners();
  }

  String? getSportIconPath(String? sportName){
    switch(sportName){
      case 'Football': return 'images/SI_Soccer.png';
      case 'Basketball': return 'images/SI_Basketball.png';
      case 'Ice Hockey': return 'images/SI_IceHockey.png';
      case 'Baseball': return 'images/SI_Baseball.png';
      default : return '';
    }
  }

  String? getTeamIconPath(String? teamName){
    switch(teamName){
      case 'Paris Saint-Germain': return 'images/Paris Saint-Germain.png';
      case 'Manchester United': return 'images/Manchester United.png';
      default : return '';
    }
  }

  String? getCountryIconPath(String? teamName){
    switch(teamName){
      case 'Paris Saint-Germain': return 'images/France.png';
      case 'Manchester United': return 'images/Uk.png';
      default : return '';
    }
  }

}