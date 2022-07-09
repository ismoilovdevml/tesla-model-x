import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'models/models.dart';
import 'pages/home_page/home_page.dart';
import 'pages/settings_page/settings_page.dart';
import 'pages/stats_page/stat_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomButtonModel()),
        ChangeNotifierProvider(create: (_) => StatsModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Tesla Car App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            iconTheme:
                const IconThemeData(color: Color.fromARGB(255, 101, 101, 101)),
            textTheme: const TextTheme(
              bodyText2: TextStyle(
                color: Colors.white,
              ),
            )),
        home: const MainFrame(),
      ),
    );
  }
}

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  State<MainFrame> createState() => _MainFrameState();
}
PageController _pageController = PageController(initialPage: 0);


class _MainFrameState extends State<MainFrame> {
  @override
  Widget build(BuildContext context) {
    int iBottom = Provider.of<BottomButtonModel>(context).number;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: buildBottomAppBar(iBottom, context),
        body: PageView(
          physics: const BouncingScrollPhysics(),
          onPageChanged: (index){
            Provider.of<BottomButtonModel>(context,listen: false).number = index;
            },
          controller: _pageController,
          children: [
            const HomePage(),
            const StatsPage(),
            const SettingsPage(),
            Container(
              child: const Center(child: Text('User Page'),),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  BottomAppBar buildBottomAppBar(int iBottom, BuildContext context) {
    return BottomAppBar(
        child: Container(
          color: kBottomAppBarColor,
          height: 60,
          width: double.infinity,
          child: Material(
            type: MaterialType.transparency,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyIconButton(
                  index: 0,
                  iBottom: iBottom,
                  icon: Icons.home_rounded,
                ),
                MyIconButton(
                  index: 1,
                  iBottom: iBottom,
                  icon: Icons.bar_chart_rounded,
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: buttonGradient,
                            boxShadow: [BoxShadow(
                              color: kPrimaryColor.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),]
                          ),
                          child: IconButton(
                            iconSize: 50,
                            icon: const Icon(Icons.power_settings_new_rounded),
                            color: Colors.white,
                            onPressed: () {
                              iBottom = Provider.of<BottomButtonModel>(context,
                                  listen: false)
                                  .number = 5;
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                MyIconButton(
                  index: 2,
                  iBottom: iBottom,
                  icon: Icons.settings,
                ),
                MyIconButton(
                  index: 3,
                  iBottom: iBottom,
                  icon: Icons.account_circle_rounded,
                ),
              ],
            ),
          ),
        ));
  }
}

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    Key? key,
    required this.icon,
    required this.index,
    required this.iBottom,
  }) : super(key: key);

  final IconData icon;
  final int index;
  final int iBottom;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: bottomSizeIcon,
        color: index == iBottom ? kPrimaryColor : Colors.grey,
      ),
      onPressed: () {
        Provider.of<BottomButtonModel>(context, listen: false).number = index;
        _pageController.animateToPage(index, duration: const Duration(microseconds: 400), curve: Curves.bounceInOut);
      },
    );
  }
}
