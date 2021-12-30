import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:favorite_pick/data.dart';

// /**
//
//  * Base-url :
//     - url: https://spoyer.ru/api/en/get.php?login=ayna&token=12784-OhJLY5mb3BSOx0O&task=enddata&sport=${sport}&league=${league_id}
//
//     - football:
//         league_name = "UEFA Champions League";
//         league_id = 1040
//
//     - basketball:
//         league_name = "Basketball Champions League"
//         league_id = 2104
//
//     - baseball:
//         league_name = "MLB"
//         league_id = 225
//
//     - IceHockey = "Champions Hockey League"
//         league_id = 152
//
// **/


class APIManager{

  String baseURL = 'https://spoyer.ru/api/en/get.php?';
  String login = 'ayna';
  String token = '12784-OhJLY5mb3BSOx0O';

  Future<List<Club>> fetchClubs({required String sport}) async {
    String url = baseURL+'login=$login'+'&token=$token'+'&task=enddata'+'&sport=$sport'+'&league=${Data().sportMap[sport]?['league_id']}';
    http.Response r = await http.get(Uri.parse(url));
    if(r.statusCode!=200) {throw('statusCode error');}
    dynamic games = jsonDecode(r.body)['games_end'];
    List<Club> clubs = [];
    int maxNum = 128;
    for(var game in games) {
      if (clubs.length > maxNum) {
        break;
      }
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
    return clubs;
  }

  String getClubImageURL ({required String sport, required imageID}) {
    return 'https://spoyer.ru/api/team_img/$sport/$imageID.png';
  }

  String getClubCountryImageURL ({required String cc}) {
    return 'https://spoyer.ru/api/icons/countries/$cc.svg';
  }

}
