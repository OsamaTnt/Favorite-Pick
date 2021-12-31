import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Club{
  String name;
  String id;
  String image_id;
  String cc;
  int stars=0;  //winning will be based on how many stars the club will have
  Club({required this.name, required this.id, required this.image_id, required this.cc});

  void increaseStars(){
    stars++;
  }

}


class Data extends ChangeNotifier{

  List<String> sports = ['soccer', 'basketball', 'icehockey', 'baseball'];
  List<Club> clubs = [];
  late String activeSport;
  late Club selectedClub;
  late Club favoriteClub;
  int roundIndex = 0;
  bool bShakeLeftClub = false;
  bool bShakeRightClub = false;

  static Map<String, Map<String, String>> sportMap = {
    'soccer': {
      'league_name': 'UEFA Champions League',
      'league_id': '1040',
      'header': 'Football',
      'icon_path': 'images/SI_Soccer.png',

    },
    'basketball': {
      'league_name': 'Basketball Champions League',
      'league_id': '2104',
      'header': 'Basketball',
      'icon_path': 'images/SI_Basketball.png',
    },
    'baseball': {
      'league_name': 'MLB',
      'league_id': '225',
      'header': 'Baseball',
      'icon_path': 'images/SI_Baseball.png',
    },
    'icehockey': {
      'league_name': 'Champions Hockey League',
      'league_id': '152',
      'header': 'Ice Hockey',
      'icon_path': 'images/SI_IceHockey.png',
    },
  };

  void init(){
    clubs = [];
    roundIndex = 1;
    bShakeLeftClub = false;
    bShakeRightClub = false;
  }

  static String getSportHeader({required String sport}){
    String? header = sportMap[sport]?['header'];
    return header.toString();
  }

  int getMaxRound(){
    return 5; //test
    // return clubs.length;
  }

  void updateRound(){
    roundIndex++;
    notifyListeners();
  }

  void updateSelectedClub(Club club){
    selectedClub = club;
    selectedClub.increaseStars();
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
    for(int i=1; i<getMaxRound(); i++){
      print('i: $i');
      if(clubs[i].stars > clubs[favIndex].stars){favIndex = i;}
      print(favIndex);
    }
    //if the last selectedClub have same stars as fav, set it as the favIndex.
    if(clubs[favIndex].stars == selectedClub.stars){favoriteClub = selectedClub;}
    else{favoriteClub = clubs[favIndex];}
    notifyListeners();
  }

  void setActiveSport(String sportName){
    activeSport = sportName;
    notifyListeners();
  }

  void initClubs(List<Club> clubList){
    clubs = clubList;
    updateSelectedClub(clubs[0]); //0 is used to init selectedClub;
    notifyListeners();
  }

  static String getSportIconPath({required String sport}){
    String? path = sportMap[sport]?['icon_path'];
    return path.toString();
  }

}