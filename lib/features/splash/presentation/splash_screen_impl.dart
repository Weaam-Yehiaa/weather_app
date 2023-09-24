import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/home_screen.dart';

class SplashScreenImpl extends StatefulWidget {
  const SplashScreenImpl({Key? key}) : super(key: key);

  @override
  State<SplashScreenImpl> createState() => _SplashScreenImplState();
}

class _SplashScreenImplState extends State<SplashScreenImpl> {
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white,Colors.blue],
          ),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration:  Duration(milliseconds: 500),
              top: size.height/2.5,
              left: animate ? size.width/1.351: -300,
              child:Text(
                'Weather ',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w900,
                  fontSize: size.width/17,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: size.height/2,
              right: animate ? size.width/1.262 : -300,
              child:   Text(
                 'Track',
                 style: TextStyle(
                   color: Colors.blue,
                   fontWeight: FontWeight.w900,
                   fontSize: size.width/17,
                 )
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    startAnimation();
  }
  Future startAnimation() async {
    //must to complete beside await don't move to next line
    //want to delay for how much as long as a duration will
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      animate=true;
    });
    // after 5 sec we can go to next page
    await Future.delayed(Duration(milliseconds: 800));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context)=>HomeScreen()
        )
    );
  }
}
