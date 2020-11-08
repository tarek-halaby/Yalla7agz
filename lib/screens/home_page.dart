import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  final List<String> locations = <String>['Nasr City', 'Tagamo3 el 5ames', 'Tagamo3 el awel', 'Tagamo3 el talet','Masr el gdida','Maadi'];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: locations.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  padding: EdgeInsets.only(left: 10),
                  color: Colors.grey,
                  child: Text('${locations[index]}')
              );
            },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
    );
  }
}