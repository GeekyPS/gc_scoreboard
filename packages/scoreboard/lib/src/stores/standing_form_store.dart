import 'package:scoreboard/src/models/hostel_points.dart';
import 'package:scoreboard/src/models/standing_model.dart';
import '../globals/enums.dart';

class StandingFormStore {
  String? event;
  Category? category;
  List<HostelPoints>? standing = [];

  void addNewPosition() {
    standing?.add(HostelPoints());
  }

  void setPreData(StandingModel standings) {

      event = standings.event;
      standing = standings.standings;
      if(standings.category == 'Men')
        {

          category = Category.men;
        }
      else if(standings.category == 'Women')
        {

          category = Category.women;
        }
      else {

        category = Category.menandwomen;
      }

  }

  void clearStandings() {
    standing = [HostelPoints()];
  }
}
