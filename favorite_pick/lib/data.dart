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

  List<String> sports = ['soccer', 'basketball', 'icehockey', 'baseball'];
  String selectedSport = 'soccer';
  List<Club> clubs = [];

  static Map<String, Map<String, String>> sportMap = {
    'soccer': {
      'league_name': 'UEFA Champions League',
      'league_id': '1040',
    },
    'basketball': {
      'league_name': 'Basketball Champions League',
      'league_id': '2104',
    },
    'baseball': {
      'league_name': 'MLB',
      'league_id': '225',
    },
    'icehockey': {
      'league_name': 'Champions Hockey League',
      'league_id': '152',
    },

  };

  static String getSportTranslation(String sportName){
    switch(sportName){
      case 'soccer': return 'Football';
      case 'basketball': return 'Basketball';
      case 'baseball': return 'Baseball';
      case 'icehockey': return 'Ice Hockey';
      default: return '';
    }
  }

  void selectSport(String sportName){
    selectedSport = sportName;
    print(selectedSport);
    notifyListeners();
  }

  String getSportIconPath(){
    switch(selectedSport){
      case 'soccer': return 'images/SI_Soccer.png';
      case 'basketball': return 'images/SI_Basketball.png';
      case 'icehockey': return 'images/SI_IceHockey.png';
      case 'baseball': return 'images/SI_Baseball.png';
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