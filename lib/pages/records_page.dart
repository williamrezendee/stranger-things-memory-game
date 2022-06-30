import 'package:flutter/material.dart';
import 'package:flutter_memory_game_app/constants.dart';
import 'package:flutter_memory_game_app/theme.dart';

class RecordsPage extends StatelessWidget {
  final Mode mode;
  final List<String> records = ['Mode', 'Level 8', 'Level 10', 'Level 12'];
  
  RecordsPage({Key? key, required this.mode}) : super(key: key);

  getMode() {
    return mode == Mode.normal ? 'Normal' : 'Vecna';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Records'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(itemBuilder: (BuildContext context, int index) {
          return index == 0 ?
          Padding(
            padding: const EdgeInsets.only(top: 36, bottom: 24),
            child: Center(
              child: Text(
                '${getMode()} Mode',
                style: const TextStyle(fontSize: 28, color: StrangerThingsTheme.color),
              ),
            ),
          )
          : ListTile(
            title: Text(records[index]),
            trailing: const Text('X jogadas'),
            tileColor: Colors.grey[900],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          );
        }, separatorBuilder: (_, __) => const Divider(color: Colors.transparent,), 
        itemCount: records.length),
      ),
    );
  }
}