import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speed_brain_test/service/method.dart';

import '../../model.dart';

Widget containerTile(PlayBlocModel playModel) {
  return InkWell(
    onTap: () => playPageVoid(playModel),
    child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 3.0),
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(35.0),
        child: Text(
          playModel.index.toString(),
          style: Theme.of(playModel.context).textTheme.headline5,
        )),
  );
}

GridView gridButtonNumber(PlayBlocModel playModel) {
  return GridView.count(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    crossAxisCount: 3,
    scrollDirection: Axis.vertical,
    children: List.generate(9, (index) {
      return containerTile(PlayBlocModel(
          context: playModel.context,
          index: index + 1,
          result: playModel.result));
    }),
  );
}
/*
           return Center(
              child: InkWell(
                // onTap: () => print('${}'),
                onTap: () {
                  if (result == index + 1) playPageBloc.add(Add());
                  playPageBloc.add(Subtract());
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 3.0),
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(35.0),
                  child: Text(
                    '${index + 1}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            );
 */
