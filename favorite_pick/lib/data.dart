import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Club{
  String name;
  String id;
  String image_id;
  String cc;
  int stars=0;  //winning will be based on how many stars the club will have
  Club({required this.name, required this.id, required this.image_id, required this.cc});
}


class Data extends ChangeNotifier{

  List<String> sports = ['soccer', 'basketball', 'icehockey', 'baseball'];
  String activeSport = 'soccer';
  List<Club> clubs = [];
  late Club selectedClub;
  late Club favoriteClub;
  int roundIndex = 0;
  bool bShakeLeftClub = false;
  bool bShakeRightClub = false;

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


  void init(){
    clubs = [];
    roundIndex = 0;
    bShakeLeftClub = false;
    bShakeRightClub = false;
    // selectedClub = clubs[0];
  }

  static String getSportTranslation(String sportName){
    switch(sportName){
      case 'soccer': return 'Football';
      case 'basketball': return 'Basketball';
      case 'baseball': return 'Baseball';
      case 'icehockey': return 'Ice Hockey';
      default: return '';
    }
  }


  int getMaxRound(){
    return clubs.length;
  }

  void updateRound(){
    roundIndex++;
    notifyListeners();
  }

  void updateSelectedClub(Club club){
    selectedClub = club;
    selectedClub.stars++;
    notifyListeners();
  }

  void shakeLeftClub(bool value){
    bShakeLeftClub = value;
    notifyListeners();
  }

  void shakeRightClub(bool value){
    bShakeRightClub = value;
    notifyListeners();
  }

  void setFavoriteClub(){
    int favIndex = 0;
    for(int i=0; i<getMaxRound(); i++){
      print('i: $i');
      if(clubs[i].stars> clubs[favIndex].stars){
        favIndex = i;
      }
      print(favIndex);
    }
    favoriteClub = clubs[favIndex];
    notifyListeners();

  }

  void updateActiveSport(String sportName){
    activeSport = sportName;
    notifyListeners();
  }

  void initClubs(List<Club> clubList){
    clubs = clubList;
    updateSelectedClub(clubs[0]); //0 is used to init selectedClub;
    notifyListeners();
  }

  String getSportIconPath(){
    switch(activeSport){
      case 'soccer': return 'images/SI_Soccer.png';
      case 'basketball': return 'images/SI_Basketball.png';
      case 'icehockey': return 'images/SI_IceHockey.png';
      case 'baseball': return 'images/SI_Baseball.png';
      default : return '';
    }
  }

  String getTeamIconPath(String teamName){
    switch(teamName){
      case 'Paris Saint-Germain': return 'images/Paris Saint-Germain.png';
      case 'Manchester United': return 'images/Manchester United.png';
      default : return '';
    }
  }

  String getCountryIconPath(String teamName){
    switch(teamName){
      case 'Paris Saint-Germain': return 'images/France.png';
      case 'Manchester United': return 'images/Uk.png';
      default : return '';
    }
  }


}