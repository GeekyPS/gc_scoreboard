import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/src/globals/enums.dart';
import '../../globals/colors.dart';
import '../../stores/common_store.dart';
import '../../widgets/common/bottom_navigation_bar.dart';
import '../../widgets/common/coming_soon.dart';
import '../../widgets/common/home_app_bar.dart';
import '../../widgets/common/restricted_page.dart';

class ManthanHome extends StatefulWidget {
  const ManthanHome({Key? key}) : super(key: key);

  @override
  State<ManthanHome> createState() => _ManthanHomeState();
}

class _ManthanHomeState extends State<ManthanHome> {
  @override
  Widget build(BuildContext context) {
    var commonStore = context.read<CommonStore>();
    return Observer(builder: (context) {
      return Scaffold(
        backgroundColor: Themes.backgroundColor,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56), child: AppBarHomeComponent()),
        body: !commonStore.isManthanAdmin && commonStore.viewType==ViewType.admin
            ? const RestrictedPage()
            : ComingSoon(competition: commonStore.competition),
        bottomNavigationBar: const BottomNavBar(),
      );
    });
  }
}
