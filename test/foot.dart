// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:some/new/phyprofile.dart';
import 'package:some/new/videoplayer.dart';

void main() => runApp(const Foot());

class Foot extends StatelessWidget {
  const Foot({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: const Center(child: Footwidget()),
    )));

    //,);
  }
}

class Footwidget extends StatefulWidget {
  const Footwidget({Key? key}) : super(key: key);
  @override
  State<Footwidget> createState() => _Footwidget();
}

class _Footwidget extends State<Footwidget>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  Future<void> getImage(BuildContext context) async {
    final XTypeGroup typeG = XTypeGroup(
      label: 'images',
      extensions: <String>['jpg', 'png', 'jpeg'],
    );
    final List<XFile> f =
        await openFiles(acceptedTypeGroups: <XTypeGroup>[typeG]);
    if (f.isEmpty) {
      return;
    }
    //final XFile file = f[0];
    //final String fname = file.name;
    //final String fpath = file.path;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Xeuron AI',
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.w500,
                    fontSize: 35),
              )),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 50),
              child: const Text(
                'Foot Images',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              )),
          Row(
            children: <Widget>[
              Expanded(
                  child: // Image.asset('assets/images/ffoot1.jpg',height: 250, fit: BoxFit.contain)
                      IconButton(
                icon: Image.asset('assets/images/ffoot1.jpg'),
                iconSize: 150,
                splashColor: Colors.amber,
                tooltip: 'Front foot Upload',
                onPressed: () => getImage(context),
              )),
              Expanded(
                  child: IconButton(
                icon: Image.asset('assets/images/bfoot1.jpg'),
                iconSize: 150,
                splashColor: Colors.amber,
                tooltip: 'Back foot Upload',
                onPressed: () => getImage(context),
              )),
              Expanded(
                  child: IconButton(
                icon: Image.asset('assets/images/foot1.jpg'),
                iconSize: 150,
                splashColor: Colors.amber,
                tooltip: 'Left foot Upload',
                onPressed: () => getImage(context),
              )),
              Expanded(
                  child: IconButton(
                icon: Image.asset('assets/images/rrfoot1.jpg'),
                iconSize: 150,
                splashColor: Colors.amber,
                tooltip: 'Right foot Upload',
                onPressed: () => getImage(context),
              )),
              Expanded(
                  child: IconButton(
                icon: Image.asset('assets/images/ssole1.jpg'),
                iconSize: 150,
                splashColor: Colors.amber,
                tooltip: 'Sole Upload',
                onPressed: () => getImage(context),
              )),
            ],
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            child: Row(
              children: <Widget>[
                ElevatedButton(
                    child: const Text('Back'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Phyprof();
                        },
                      ));
                    }),
                ElevatedButton(
                  child: const Text('Next'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Camera();
                      },
                    ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
