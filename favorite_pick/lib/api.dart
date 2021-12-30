import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:favorite_pick/data.dart';

class APIManager{

  String baseURL = 'https://spoyer.ru/api/en/get.php?';
  String login = 'ayna';
  String token = '12784-OhJLY5mb3BSOx0O';

  Future<List<Club>> fetchClubs({required String sport}) async {
    String url = baseURL+'login=$login'+'&token=$token'+'&task=enddata'+'&sport=$sport'+'&league=${Data().sportMap[sport]?['league_id']}';
    List<Club> clubs = [];
    int maxNum = 128;

    try{
      http.Response r = await http.get(Uri.parse(url));
      if(r.statusCode==200) {
        dynamic games = jsonDecode(r.body)['games_end'];
        for(var game in games) {
          if (clubs.length > maxNum) {break;}
          clubs.add(
            Club(
              name: game['home']['name'],
              id: game['home']['id'],
              image_id: game['home']['image_id'],
              cc: game['home']['cc'],
            ),
          );
          clubs.add(
            Club(
              name: game['away']['name'],
              id: game['away']['id'],
              image_id: game['away']['image_id'],
              cc: game['away']['cc'],
            ),
          );
        }
        clubs.shuffle(Random(DateTime.now().second));
      }
    } catch(e){throw('$e');}

    return clubs;
  }

  String getClubImageURL ({required String sport, required imageID}) {
    return 'https://spoyer.ru/api/team_img/$sport/$imageID.png';
  }

  String getClubCountryImageURL ({required String cc}) {
    return 'https://spoyer.ru/api/icons/countries/$cc.svg';
  }

}
