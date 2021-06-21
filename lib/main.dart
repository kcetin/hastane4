import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/firebase_user_provider.dart';
import 'package:hastane/phone_sign_page/phone_sign_page_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'anasayfa/anasayfa_widget.dart';
import 'giris/giris_widget.dart';
import 'nobetci/nobetci_widget.dart';
import 'rehber/rehber_widget.dart';
import 'icapci/icapci_widget.dart';
import 'result_page/result_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<HastaneFirebaseUser> userStream;
  HastaneFirebaseUser initialUser;

  @override
  void initState() {
    super.initState();
    userStream = hastaneFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hastane',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4b39ef)),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : PhoneSignPageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'giris';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Anasayfa': AnasayfaWidget(),
      'giris': GirisWidget(),
      'nobetci': NobetciWidget(),
      'rehber': RehberWidget(),
      'icapci': IcapciWidget(),
      'ResultPage': ResultPageWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 28,
            ),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.blur_on_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.blur_circular_sharp,
              size: 24,
            ),
            label: 'Giriş',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.moon,
              size: 24,
            ),
            label: 'nöbetci',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.userFriends,
              size: 24,
            ),
            label: 'Rehber',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm,
              size: 24,
            ),
            label: 'İcapcı',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm,
              size: 24,
            ),
            label: '',
          )
        ],
        backgroundColor: Colors.white,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: FlutterFlowTheme.secondaryColor,
        unselectedItemColor: Color(0x8A000000),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
