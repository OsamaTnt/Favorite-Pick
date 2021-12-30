import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Club{
  String name;
  String id;
  String image_id;
  String cc;
  Club({required this.name, required this.id, required this.image_id, required this.cc});
}

class Data extends ChangeNotifier{
  Map<String, Map<String, String>> sportMap = {
    'soccer': {
      'league_name': 'UEFA Champions League',
      'league_id': '1040'
    },
    'basketball': {
      'league_name': 'Basketball Champions League',
      'league_id': '2104'
    },
    'baseball': {
      'league_name': 'MLB',
      'league_id': '225'
    },
    'icehockey': {
      'league_name': 'Champions Hockey League',
      'league_id': '152'
    },

  };

  List<String> sports = ['Football', 'Basketball', 'Ice Hockey', 'Baseball'];
  String? selectedSport = 'soccer';
  List<Club> clubs = [];


  void selectSport(String? sportName){
    selectedSport = sportName;
    notifyListeners();
  }

  String? getSportIconPath(){
    switch(selectedSport){
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

  void setClubs(List<Club> c){
    clubs = c;
  }

}