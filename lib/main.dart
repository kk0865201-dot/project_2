import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView( 
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Image.asset('assets/images/logo.png', width: 140,),
                
                const SizedBox(height: 40),

                TextField(
                  decoration: InputDecoration(
                    hintText: 'Potato number',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                TextField(
                  obscureText: true, 
                  decoration: InputDecoration(
                    hintText: 'Potato password',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print("Forgot Potato Clicked");
                    },
                    child: const Text(
                      'Forgot Potato?',
                      style: TextStyle(color: Color.fromARGB(255, 207, 154, 70)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    print("Potato in Clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 207, 154, 70),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Potato in',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                
                const SizedBox(height: 20),
                const Text('or', style: TextStyle(color: Color.fromARGB(255, 207, 154, 70))),
                const SizedBox(height: 20),

                OutlinedButton(
                  onPressed: () {
                    print("Potato Login Clicked");
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    side: const BorderSide(color: Color.fromARGB(255, 207, 154, 70)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'P ', 
                        style: TextStyle(color: Color.fromARGB(255, 207, 154, 70), fontWeight: FontWeight.bold, fontSize: 20)
                      ),
                      Text(
                        'Continue with Potato', 
                        style: TextStyle(color: Color.fromARGB(255, 207, 154, 70), fontSize: 16)
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("don't have an Potato? "),
                    TextButton(
                      onPressed: () {
                        print("Navigate to Potato Up Page");
                      },
                      child: const Text(
                        'Potato Up',
                        style: TextStyle(
                          color: Color.fromARGB(255, 207, 154, 70),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}