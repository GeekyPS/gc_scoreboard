import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/src/stores/kriti_store.dart';

import '../../globals/colors.dart';
import '../../globals/enums.dart';
import '../../globals/styles.dart';
import '../../stores/common_store.dart';
import '../../stores/static_store.dart';

class KritiFilterBar extends StatefulWidget {
  const KritiFilterBar({Key? key}) : super(key: key);

  @override
  State<KritiFilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<KritiFilterBar> {
  List<String> cupNames = Cup.values.map((e) => e.cupName).toList();
  List<String> clubNames = Club.values.map((e) => e.clubName).toList();
  @override
  Widget build(BuildContext context) {
    var commonStore = context.read<CommonStore>();
    var kritiStore = context.read<KritiStore>();

    List<String> itemsEvents = ['Overall'];

    itemsEvents.addAll(StaticStore.kritiEvents);

    return Observer(builder: (context) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 99),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                children: [
                  commonStore.page == Pages.standings
                      ? Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                            child: PopupMenuButton(
                              constraints: const BoxConstraints(maxHeight: 300),
                              position: PopupMenuPosition.under,
                              color: Themes.cardColor1,
                              onSelected: (String item) {
                                kritiStore.changeSelectedEvent(item);
                                print(kritiStore.selectedEvent);
                              },
                              itemBuilder: (BuildContext context) => itemsEvents
                                  .map((item) => PopupMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: popUpItemStyle,
                                        ),
                                      ))
                                  .toList(),
                              child: Container(
                                height: 56,
                                decoration: boxDecoration,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(13, 0, 13, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 12,
                                            child: Text('Event',
                                                style: popUpHeadingStyle),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          SizedBox(
                                            height: 18,
                                            child: Text(
                                                kritiStore.selectedEvent,
                                                style: popUpItemStyle),
                                          )
                                        ],
                                      ),
                                      popUpIcon,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                      : Container(),
                  commonStore.page != Pages.standings ? Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: PopupMenuButton(
                          constraints: const BoxConstraints(maxHeight: 300),
                          position: PopupMenuPosition.under,
                          color: Themes.cardColor1,
                          onSelected: (String item) {
                            kritiStore.changeSelectedCup(item);
                            print(kritiStore.selectedCup.cupName);
                          },
                          itemBuilder: (BuildContext context) => cupNames
                              .map((item) => PopupMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: popUpItemStyle,
                                    ),
                                  ))
                              .toList(),
                          child: Container(
                            height: 56,
                            decoration: boxDecoration,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 12,
                                        child: Text('Cup',
                                            style: popUpHeadingStyle),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 18,
                                        child: Text(
                                            kritiStore.selectedCup.cupName,
                                            style: popUpItemStyle),
                                      )
                                    ],
                                  ),
                                  popUpIcon,
                                ],
                              ),
                            ),
                          ),
                        ),
                      )) : Container(),
                  commonStore.page != Pages.standings ? Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: PopupMenuButton(
                          constraints: const BoxConstraints(maxHeight: 300),
                          position: PopupMenuPosition.under,
                          color: Themes.cardColor1,
                          onSelected: (String item) {
                            kritiStore.changeSelectedClub(item);
                            print(kritiStore.selectedClub.clubName);
                          },
                          itemBuilder: (BuildContext context) =>
                              clubNames.map((item) => PopupMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: popUpItemStyle,
                                    ),
                                  ))
                              .toList(),
                          child: Container(
                            height: 56,
                            decoration: boxDecoration,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 12,
                                        child: Text('Club',
                                            style: popUpHeadingStyle),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 18,
                                        child: Text(
                                            kritiStore.selectedClub.clubName,
                                            style: popUpItemStyle),
                                      )
                                    ],
                                  ),
                                  popUpIcon,
                                ],
                              ),
                            ),
                          ),
                        ),
                      )) : Container(),
                ],
              ),
            ]),
          ));
    });
  }
}
