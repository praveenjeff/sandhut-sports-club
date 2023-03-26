import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:slide_countdown/slide_countdown.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
    initialization();
  }

  void initialization() {}
  var chight;
  //responsive app bar
  bool mobile = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //responsive app bar
    final mobile = MediaQuery.of(context).size.width > 900 ? false : true;
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    var key1 = GlobalKey();
    var key2 = GlobalKey();
    var key3 = GlobalKey();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Image.asset(
                'assets/logo/app_bar_logo_B.png',
                height: 70,
              ),
            ],
          ),
          actions: mobile
              ? null
              : [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Scrollable.ensureVisible(key1.currentContext!);
                            },
                            child: Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Mokoto',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              Scrollable.ensureVisible(key2.currentContext!);
                            },
                            child: Text(
                              'About Us',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Mokoto',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                              ),
                            )),
                        // TextButton(
                        //     onPressed: () {},
                        //     child: Text(
                        //       'Coaching',
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //         fontFamily: 'Mokoto',
                        //         fontWeight: FontWeight.w300,
                        //         fontSize: 12,
                        //       ),
                        //     )),
                        TextButton(
                            onPressed: () {
                              html.window.open(
                                  'https://www.youtube.com/@SandHutSports',
                                  "_blank");
                            },
                            child: Text(
                              'Media',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Mokoto',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              Scrollable.ensureVisible(key3.currentContext!);
                            },
                            child: Text(
                              'Contact Us',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Mokoto',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
          leading: mobile
              ? IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    if (scaffoldKey.currentState!.isDrawerOpen) {
                      scaffoldKey.currentState!.closeDrawer();
                      //close drawer, if drawer is open
                    } else {
                      scaffoldKey.currentState!.openDrawer();
                      //open drawer, if drawer is closed
                    }
                  },
                )
              : null),
      drawer: mobile
          ? Drawer(
              width: 250,
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  ListTile(
                    leading: const Icon(Icons.home,color: Colors.black,),
                    title: const Text(
                      ' Home ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Mokoto',
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                      ),
                    ),
                    onTap: () {
                      Scrollable.ensureVisible(key1.currentContext!);
                      if (scaffoldKey.currentState!.isDrawerOpen) {
                        scaffoldKey.currentState!.closeDrawer();
                        //close drawer, if drawer is open
                      } else {
                        scaffoldKey.currentState!.openDrawer();
                        //open drawer, if drawer is closed
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.warehouse_rounded,color: Colors.black,),
                    title: const Text(
                      ' About Us ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Mokoto',
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                      ),
                    ),
                    onTap: () {

                      Scrollable.ensureVisible(key2.currentContext!);
                      if (scaffoldKey.currentState!.isDrawerOpen) {
                        scaffoldKey.currentState!.closeDrawer();
                        //close drawer, if drawer is open
                      } else {
                        scaffoldKey.currentState!.openDrawer();
                        //open drawer, if drawer is closed
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.online_prediction,color: Colors.black,),
                    title: const Text(
                      ' Media ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Mokoto',
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                      ),
                    ),
                    onTap: () {
                      html.window.open(
                          'https://www.youtube.com/@SandHutSports',
                          "_blank");
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.contact_support,color: Colors.black,),
                    title: const Text(
                      ' Contact Us ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Mokoto',
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                      ),
                    ),
                    onTap: () {
                      Scrollable.ensureVisible(key3.currentContext!);
                      if (scaffoldKey.currentState!.isDrawerOpen) {
                        scaffoldKey.currentState!.closeDrawer();
                        //close drawer, if drawer is open
                      } else {
                        scaffoldKey.currentState!.openDrawer();
                        //open drawer, if drawer is closed
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.join_full,color: Colors.black,),
                    title: const Text(
                      ' Join Now',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Mokoto',
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                      ),
                    ),
                    onTap: () {
                      html.window.open(
                          'https://forms.office.com/Pages/ResponsePage.aspx?id=WPNK0ty7iUGIGL-XC2CVb79h7MoVdQlMjBo1bXf0XWBUN1JPV05TOTdFMkE3OVhITUkxS0dPTFA1SC4u',
                          "_blank");
                    },
                  ),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              key: key1,
              child: Image.asset(
                'assets/section_images/S11.png',
                width: MediaQuery.of(context).size.width * 1,
              ),
            ),
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width * 1,
              height: 91,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: Text(
                      'Closing Soon..',
                      style: TextStyle(
                          fontSize: mobile ? 12 : 32,
                          fontFamily: 'Mokoto',
                          color: Colors.white),
                    ),
                  ),
                  SlideCountdownSeparated(
                    textStyle: TextStyle(
                        fontSize: mobile ? 14 : 32,
                        color: Colors.white,
                        fontFamily: 'Mokoto'),
                    width: mobile ? 30 : 70,
                    separatorStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    duration: const Duration(days: 2),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  //   child: OutlinedButton(
                  //     style: OutlinedButton.styleFrom(
                  //       backgroundColor: Colors.black,
                  //       primary: Colors.white,
                  //       side: BorderSide(color: Colors.white, width: 1), //<-- SEE HERE
                  //     ),
                  //     onPressed: () {},
                  //     child: Padding(
                  //       padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  //       child: const Text(
                  //         'Contact Us',
                  //         style: TextStyle(fontSize: 18,fontFamily: 'Mokoto',),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onHover: (value) {},
                    onTap: () {
                      html.window.open(
                          'https://forms.office.com/Pages/ResponsePage.aspx?id=WPNK0ty7iUGIGL-XC2CVb79h7MoVdQlMjBo1bXf0XWBUN1JPV05TOTdFMkE3OVhITUkxS0dPTFA1SC4u',
                          "_blank");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 100,
                      width: mobile
                          ? MediaQuery.of(context).size.width * 0.3
                          : MediaQuery.of(context).size.width * 0.2,
                      child: Center(
                          child: Text("Join Now\n\n@499/-",
                              style: TextStyle(
                                  fontSize: chight,
                                  fontFamily: 'Mokoto',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              key: key2,
              color: Colors.black,
              width: MediaQuery.of(context).size.width * 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: Column(
                  children: [
                    Text('About Us',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Mokoto',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/logo/sandhut_sports_club_W.png',
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(80, 10, 80, 20),
                      child: Text(
                        "SandHut Sports Club was founded in 2023 by a group of passionate cricket enthusiasts who wanted to create a community where players of all skill levels could come together and enjoy the game they loved. Hoping Over the years, SandHut Sports Club will grown into one of the premier cricket clubs in the region, hosting tournaments and events that draw players from all over India and beyond.",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'DMSans',
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(80, 10, 80, 20),
                      child: Center(
                        child: Text(
                          "At SandHut Sports Club, our mission is to promote sportsmanship, teamwork, and fair play both on and off the field. We believe that cricket is more than just a game; it's a way to bring people together, foster community, and build lifelong friendships. Our values are reflected in everything we do, from our commitment to excellence on the pitch to our dedication to serving our members and the wider community.",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'DMSans',
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 100,
              width: MediaQuery.of(context).size.width * 1,
              child:  InkWell(
                onHover: (value) {},
                onTap: () {
                  html.window.open(
                      'https://forms.office.com/Pages/ResponsePage.aspx?id=WPNK0ty7iUGIGL-XC2CVb79h7MoVdQlMjBo1bXf0XWBUN1JPV05TOTdFMkE3OVhITUkxS0dPTFA1SC4u',
                      "_blank");
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(12)),
                    height: 100,
                    width: mobile
                        ? MediaQuery.of(context).size.width * 0.3
                        : MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                        child: Text("Join Now @499/-",
                            style: TextStyle(
                                fontSize: chight,
                                fontFamily: 'Mokoto',
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
            ),
            Container(
              key: key3,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text('Contact Us',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Mokoto',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding: mobile ? EdgeInsets.fromLTRB(20, 20, 20, 0):EdgeInsets.fromLTRB(80, 20, 80, 0),
                      child: Center(
                        child: Text(
                          "If you have any questions or would like to learn more about SandHut Sports Club, we'd love to hear from you! You can reach us by phone, email, or by filling out the contact form below. Our contact information is as follows",
                          style: TextStyle(
                            fontSize: mobile ? 12 :18,
                            fontFamily: 'DMSans',
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  mobile ? Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(80, 20, 80, 0),
                            child: Center(
                              child: Text(
                                "Phone No.",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'DMSans',
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(80, 0, 80, 10),
                            child: Center(
                              child: Text(
                                "+91-7353-11-9898",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'DMSans',
                                  color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),

                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(80, 10, 80, 0),
                            child: Center(
                              child: Text(
                                "Email Us",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'DMSans',
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(80, 0, 80, 10),
                            child: Center(
                              child: Text(
                                "info@sandhut.in",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'DMSans',
                                  color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                            child: Center(
                              child: Text(
                                "Google Map Location",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'DMSans',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              html.window.open(
                                  'https://goo.gl/maps/AtAv1zCzMZUhyBLs8',
                                  "_blank");
                            },
                            child: Image.asset(
                              'assets/logo/Location.png',
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Scan / Click",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'DMSans',
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )  :Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(80, 10, 80, 0),
                              child: Center(
                                child: Text(
                                  "Phone No.",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'DMSans',
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                              child: Center(
                                child: Text(
                                  "+91-7353-11-9898",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'DMSans',
                                    color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(80, 10, 80, 0),
                              child: Center(
                                child: Text(
                                  "Email Us",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'DMSans',
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                              child: Center(
                                child: Text(
                                  "info@sandhut.in",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'DMSans',
                                    color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(80, 10, 80, 0),
                                child: Center(
                                  child: Text(
                                    "Google Map Location",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'DMSans',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  html.window.open(
                                      'https://goo.gl/maps/AtAv1zCzMZUhyBLs8',
                                      "_blank");
                                },
                                child: Image.asset(
                                  'assets/logo/Location.png',
                                  width: MediaQuery.of(context).size.width * 0.09,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Scan / Click",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'DMSans',
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: mobile ? EdgeInsets.fromLTRB(20, 20, 20, 0):EdgeInsets.fromLTRB(80, 20, 80, 0),
                      child: Center(
                        child: Text(
                          "We're available to answer your questions and provide guidance on membership options, event bookings, and more. Don't hesitate to reach out!",
                          style: TextStyle(
                            fontSize: mobile ? 12 :18,
                            fontFamily: 'DMSans',
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              color: Colors.black,
              height: 100,
              width: MediaQuery.of(context).size.width * 1,
              child:  InkWell(
                onHover: (value) {},
                onTap: () {
                  html.window.open(
                      'https://forms.office.com/Pages/ResponsePage.aspx?id=WPNK0ty7iUGIGL-XC2CVb79h7MoVdQlMjBo1bXf0XWBUN1JPV05TOTdFMkE3OVhITUkxS0dPTFA1SC4u',
                      "_blank");
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(12)),
                    height: 100,
                    width: mobile
                        ? MediaQuery.of(context).size.width * 0.3
                        : MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                        child: Text("Join Now @499/-",
                            style: TextStyle(
                                fontSize: chight,
                                fontFamily: 'Mokoto',
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.black,
              child: Center(
                child: Text("© 2023-2024 SANDHUT INDIA PVT LTD. All Rights Reserved.",
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'DMSans',
                        color: Colors.white,)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
