import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

void main() {
  runApp(const PersonalPortfolioApp());
}

class PersonalPortfolioApp extends StatelessWidget {

  const PersonalPortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(15),
          child: const PersonalPortfolio(),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class PersonalPortfolio extends StatefulWidget {

  const PersonalPortfolio({Key? key}) : super(key: key);

  
  @override
  PersonalPortfolioState createState() => PersonalPortfolioState();
}

class PersonalPortfolioState extends State<PersonalPortfolio> with TickerProviderStateMixin {
  
  final Color appColor = Colors.blueAccent;
  final String avatarImg = 'https://lh3.googleusercontent.com/a/AEdFTp5Pwl32euYMRqZfkP-BN2dlRbW21gqRM_B8Czmb=s96-c-rg-br100';

  late AnimationController ctrl;
  late AnimationController contentCtrl;
  
  @override
  void initState() {
    super.initState();
    ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    )..repeat();
    
    contentCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3)
    )..forward();
  }

  @override
  void dispose() {
    ctrl.dispose();
    contentCtrl.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(parent: contentCtrl, curve: Curves.easeInOut)),
      child: SlideTransition(
      position: Tween<Offset>(begin: const Offset(0.0, 0.125), end: Offset.zero)
      .animate(CurvedAnimation(parent: contentCtrl, curve: Curves.easeInOut)),
      child: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                FadeTransition(
                  opacity: Tween<double>(begin: 1.0, end: 0.0)
                  .animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOut)),
                  child: ScaleTransition(
                  scale: Tween<double>(begin: 1.0, end: 1.5).
                  animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOut)),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.circular(50),
                    )
                  ) 
                ) 
                ),
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(avatarImg),
                      fit: BoxFit.cover
                    ),
                    border: Border.all(
                      color: appColor,
                      width: 8
                    )
                  )
                )
              ] 
            ),
            Text('Google Developer Student Club', 
              style: GoogleFonts.lato(
                color: appColor, 
                fontSize: 20, 
                fontWeight: FontWeight.bold
              )
            ),
            Text('Western Michigan University', 
              style: GoogleFonts.lato(
                color: appColor, 
                fontSize: 15
              )
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 10),
                SizedBox(
                  height: 100,
                  child: DefaultTextStyle(
                      style: GoogleFonts.expletusSans(
                        color: Colors.white, 
                        fontSize: 35
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          RotateAnimatedText('Made By You'),
                          RotateAnimatedText('Keep It Real'),
                          RotateAnimatedText('Our Googley Growth'),
                        ],
                      ),
                    ),
                )
              ]
            ),
            const SizedBox(height: 20),
            OutlineGradientButton(
              gradient: LinearGradient(colors: [Color.fromARGB(255, 39, 96, 41), Colors.green]),
              strokeWidth: 4,
              radius: Radius.circular(8),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              onTap: () {
                launchUrl(Uri.parse('https://www.youtube.com/@gdscwmu3320'));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FaIcon(FontAwesomeIcons.youtube, color: Colors.green),
                  const SizedBox(width: 10),
                  Text('YouTube', style: GoogleFonts.lato(color: Colors.white))
                ],
              )
            ),
            const SizedBox(height: 10),            
            OutlineGradientButton(
              gradient: LinearGradient(colors: [Color.fromARGB(255, 39, 96, 41), Colors.green]),
              strokeWidth: 4,
              radius: Radius.circular(8),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              onTap: () {
                launchUrl(Uri.parse('https://www.instagram.com/gdsc_wmu/'));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FaIcon(FontAwesomeIcons.instagram, color: Colors.green),
                  const SizedBox(width: 10),
                  Text('Instagram', style: GoogleFonts.lato(color: Colors.white))
                ],
              )
            ),
            const SizedBox(height: 10),
            OutlineGradientButton(
              gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
              strokeWidth: 4,
              radius: Radius.circular(8),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              onTap: () {
                launchUrl(Uri.parse('https://github.com/GDSC-WMU'));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FaIcon(FontAwesomeIcons.github, color: Colors.deepOrange),
                  const SizedBox(width: 10),
                  Text('GitHub', style: GoogleFonts.lato(color: Colors.white))
                ],
              )
            ),
            const SizedBox(height: 10),
            OutlineGradientButton(
              gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
              strokeWidth: 4,
              radius: Radius.circular(8),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              onTap: () {
                launchUrl(Uri.parse('https://www.linkedin.com/company/google-developer-student-clubs-wmu/'));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FaIcon(FontAwesomeIcons.linkedin, color: Colors.deepOrange),
                  const SizedBox(width: 10),
                  Text('LinkedIn', style: GoogleFonts.lato(color: Colors.white))
                ],
              )
            ),
            const SizedBox(height: 10),
            OutlineGradientButton(
              gradient: LinearGradient(colors: [Colors.orange, Colors.yellow]),
              strokeWidth: 4,
              radius: Radius.circular(8),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              onTap: () {
                launchUrl(Uri.parse('https://gdsc.community.dev/western-michigan-university/'));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FaIcon(FontAwesomeIcons.globe, color: Colors.yellow),
                  const SizedBox(width: 10),
                  Text('Events Website', style: GoogleFonts.lato(color: Colors.white))
                ],
              )
            ),
            const SizedBox(height: 10),
            OutlineGradientButton(
              gradient: LinearGradient(colors: [Colors.orange, Colors.yellow]),
              strokeWidth: 4,
              radius: Radius.circular(8),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              onTap: () {
                launchUrl(Uri.parse('https://forms.office.com/Pages/ResponsePage.aspx?id=USJ2Jal6ckyQXzm_AmqKhEAH4b-M4TpHnpT1YOeVuktUNFJNV1k3Q0g3Vk5GQzJLQUIyRk5QUlQ5Qi4u'));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FaIcon(FontAwesomeIcons.addressBook, color: Colors.yellow),
                  const SizedBox(width: 10),
                  Text('Be a Member', style: GoogleFonts.lato(color: Colors.white))
                ],
              )
            ),
            const SizedBox(height: 40),
            Text('Made with ❤️ Tutorial on YouTube - First Flight with Flutter', 
              style: GoogleFonts.lato(
                color: Colors.white, 
                fontSize: 12
              )
            ),
      ]
      )
      )
    )
      )
    );
  }
}