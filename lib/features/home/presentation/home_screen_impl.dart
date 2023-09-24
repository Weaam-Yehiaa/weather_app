import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/result_screen.dart';

class HomeScreenImpl extends StatelessWidget {
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white,Colors.blue],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Weather Track',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                  fontWeight: FontWeight.w700
                ),

              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 70,
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      label: Text('Country Name',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 70,
                child: Material(
                  elevation: 10.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(searchController.text)));
                      },
                      child: Text(
                        'search',
                        style: TextStyle(fontSize: 19, color: Colors.blue),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
