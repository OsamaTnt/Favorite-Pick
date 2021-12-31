import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:favorite_pick/data.dart';


class APIManager{

  String baseURL = 'https://spoyer.ru/api/en/get.php?';
  String login = 'ayna';
  String token = '12784-OhJLY5mb3BSOx0O';
  int maxNum = 65;  //65+65 =130(Max, since there's home & away that are added by 2).

  Future<List<Club>> fetchClubs({required String sport}) async {
    String url = baseURL+'login=$login'+'&token=$token'+'&task=enddata'+'&sport=$sport'+'&league=${Data.sportMap[sport]?['league_id']}';
    List<Club> clubs = [];
    int randIndexChunk = Random().nextInt(maxNum);
    int maxChunk =  (randIndexChunk+maxNum).toInt();

    http.Response r = await http.get(Uri.parse(url));
    try{
      if (r.statusCode == 200) {
        dynamic teams = jsonDecode(r.body)['games_end'];
        for(int i=randIndexChunk; i<maxChunk; i++){
          var team = teams[i]['home'];
          clubs.add(Club(name:team['name'], id:team['id'], image_id:team['image_id'], cc:team['cc']));
          team = teams[i]['away'];
          clubs.add(Club(name:team['name'], id:team['id'], image_id:team['image_id'], cc:team['cc']));
        }
      }
      clubs.shuffle(Random(DateTime.now().second.toInt()));
      return clubs;

    }
    catch(e){throw('err in fetchClub');}

  }

  // Future<bool> bCheckClubData(Club club, String sport) async{
  //   http.Response r = await http.get(Uri.parse(getClubImageURL(sport: sport, imageID: club.id)));
  //   if(r.statusCode!=200){return false;}
  //   else{
  //     r = await http.get(Uri.parse(getClubCountryImageURL(cc: club.cc)));
  //     if(r.statusCode==200){return true;}
  //   }
  //   return false; //default
  // }

  String getClubImageURL ({required String sport, required imageID}) {
    return 'https://spoyer.ru/api/team_img/$sport/$imageID.png';
  }

  String getClubCountryImageURL ({required String cc}) {
    return 'https://spoyer.ru/api/icons/countries/$cc.svg';
  }


}
