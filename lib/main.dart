import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations', 
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.dark) {
        _themeMode = ThemeMode.light;
      } else {
        _themeMode = ThemeMode.dark;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      
      themeMode: _themeMode,
      
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: const PotatoLoginPage(), 
    );
  }
}

class AppTextField extends StatelessWidget {
  final String hintTextKey;
  final IconData prefixIcon;
  final bool isPassword;

  const AppTextField({
    super.key,
    required this.hintTextKey,
    required this.prefixIcon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintTextKey.tr(),
        prefixIcon: Icon(prefixIcon, color: isDarkMode ? Colors.white70 : Colors.grey),
        suffixIcon: isPassword 
            ? Icon(Icons.visibility_off, color: isDarkMode ? Colors.white70 : Colors.grey) 
            : null,
        filled: true,
        fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String textKey;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.textKey,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 207, 154, 70), 
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        textKey.tr(),
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

class PotatoLoginPage extends StatelessWidget {
  const PotatoLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Color.fromARGB(255, 207, 154, 70)),
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar'));
              } else {
                context.setLocale(const Locale('en'));
              }
            },
          ),
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
              color: const Color.fromARGB(255, 207, 154, 70),
            ),
            onPressed: () {
              MyApp.of(context)?.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 140),
              const SizedBox(height: 40),
              const AppTextField(hintTextKey: 'potato_number', prefixIcon: Icons.phone),
              const SizedBox(height: 15),
              const AppTextField(hintTextKey: 'potato_password', prefixIcon: Icons.lock, isPassword: true),
              const SizedBox(height: 25),
              PrimaryButton(
                textKey: 'potato_in',
                onPressed: () {
                  print("Potato Login Clicked");
                },
              ),
              const SizedBox(height: 20),
              Text('or'.tr(), style: const TextStyle(color: Color.fromARGB(255, 207, 154, 70))),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Color.fromARGB(255, 207, 154, 70)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'P',
                      style: TextStyle(color: Color.fromARGB(255, 207, 154, 70), fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'continue_potato'.tr(), 
                      style: const TextStyle(color: Color.fromARGB(255, 207, 154, 70), fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('no_potato'.tr()),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PotatoSignUpPage()),
                      );
                    },
                    child: Text(
                      'potato_up'.tr(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 207, 154, 70),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PotatoSignUpPage extends StatefulWidget {
  const PotatoSignUpPage({super.key});

  @override
  State<PotatoSignUpPage> createState() => _PotatoSignUpPageState();
}

class _PotatoSignUpPageState extends State<PotatoSignUpPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back, 
            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Color.fromARGB(255, 207, 154, 70)),
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar'));
              } else {
                context.setLocale(const Locale('en'));
              }
            },
          ),
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
              color: const Color.fromARGB(255, 207, 154, 70),
            ),
            onPressed: () {
              MyApp.of(context)?.toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'potato_up'.tr(),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            
            const AppTextField(hintTextKey: 'potato_name', prefixIcon: Icons.person),
            const SizedBox(height: 15),
            const AppTextField(hintTextKey: 'potato_number', prefixIcon: Icons.phone),
            const SizedBox(height: 15),
            const AppTextField(hintTextKey: 'potato_password', prefixIcon: Icons.lock, isPassword: true),
            const SizedBox(height: 15),
            const AppTextField(hintTextKey: 'confirm_potato_password', prefixIcon: Icons.lock_outline, isPassword: true),
            const SizedBox(height: 15),
            const AppTextField(hintTextKey: 'potato_mail', prefixIcon: Icons.email),
            const SizedBox(height: 20),
            
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  activeColor: const Color.fromARGB(255, 207, 154, 70),
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Text('agree_terms'.tr(), style: const TextStyle(fontSize: 14)),
                ),
              ],
            ),
            const SizedBox(height: 25),
            
            PrimaryButton(
              textKey: 'send_otp',
              onPressed: () {
                print("Send Potato OTP Clicked");
              },
            ),
            const SizedBox(height: 25),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('already_have'.tr()),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'potato_in'.tr(),
                    style: const TextStyle(
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
    );
  }
}
