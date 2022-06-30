import 'package:flutter/material.dart';
import 'package:flutter_memory_game_app/constants.dart';
import 'package:flutter_memory_game_app/pages/records_page.dart';
import 'package:flutter_memory_game_app/theme.dart';

class Records extends StatefulWidget {
  const Records({Key? key}) : super(key: key);

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  showRecords(Mode mode) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => RecordsPage(mode: mode)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 15, right: 15),
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Records',
                style: TextStyle(
                  color: StrangerThingsTheme.color,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              title: const Text('Normal Mode'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecords(Mode.normal),
            ),
            ListTile(
              title: const Text('Vecna Mode'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecords(Mode.vecna),
            ),
          ],
        ),
      ),
    );
  }
}