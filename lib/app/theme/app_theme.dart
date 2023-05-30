import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ArdillaAppTheme {
  static Color lightThemeTextColor = const Color(0xff8807F7);
  static Color lightDeepThemeTextColor = const Color(0xff3D0072);
  static Color darkThemeTextColor = const Color(0xfffefefe);

  static TextTheme primaryTextThemeLight = TextTheme(
    bodyLarge: GoogleFonts.spaceGrotesk(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xff6B7280),
    ),
    bodyMedium: GoogleFonts.spaceGrotesk(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xff6B7280),
    ),
    bodySmall: GoogleFonts.spaceGrotesk(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xff6B7280),
    ),
    displayLarge: GoogleFonts.spaceGrotesk(
      fontSize: 34.0,
      fontWeight: FontWeight.w700,
      color: lightDeepThemeTextColor,
    ),
    displayMedium: GoogleFonts.spaceGrotesk(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: lightDeepThemeTextColor,
    ),
    displaySmall: GoogleFonts.spaceGrotesk(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: lightDeepThemeTextColor,
    ),
    headlineLarge: GoogleFonts.spaceGrotesk(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: lightThemeTextColor,
    ),
    headlineMedium: GoogleFonts.spaceGrotesk(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: lightThemeTextColor,
    ),
    headlineSmall: GoogleFonts.spaceGrotesk(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: lightThemeTextColor,
    ),
    titleLarge: GoogleFonts.spaceGrotesk(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: lightThemeTextColor,
    ),
    titleMedium: GoogleFonts.spaceGrotesk(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: lightThemeTextColor,
    ),
    titleSmall: GoogleFonts.spaceGrotesk(
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
      color: lightThemeTextColor,
    ),
  );

 
  InputDecorationTheme inputDecorationTheme = const InputDecorationTheme();

 
  static IconThemeData lightIconTheme =
      const IconThemeData(color: Color(0xff8807F7));
  static BottomAppBarTheme lightBottomAppBarTheme =
      const BottomAppBarTheme(color: Color(0xffffffff));
  static DrawerThemeData drawerTheme = const DrawerThemeData(
    backgroundColor: Color(0xffF3E6FF),
  );

  static DrawerThemeData darkThemeDrawerTheme = const DrawerThemeData(
    backgroundColor: Color(0xff00374E),
  );

  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              return Colors.black;
            },
          ),
        ),
        indicatorColor: const Color(0xffF3E6FF),
        secondaryHeaderColor: const Color(0xff4d4d4d),
        primaryColor: const Color(0xff8807F7),
        primaryColorDark: const Color(0xff3D0072),
        primaryColorLight: const Color(0xffE7CDFE),
        cardColor: const Color(0xfffdfdfd),
        canvasColor: const Color(0xffefefef),
        selectedRowColor: const Color(0xfff5f5ff),
        backgroundColor: const Color(0xffFFFFFF),
        toggleableActiveColor: const Color(0xffE7CDFE),
        dividerColor: const Color(0xff9CA3AF),
        disabledColor: const Color(0xffBBBFC1),
        dialogBackgroundColor: Colors.white,
        drawerTheme: drawerTheme,
        iconTheme: lightIconTheme,
        navigationBarTheme:
            const NavigationBarThemeData(indicatorColor: Colors.transparent),
        shadowColor: Colors.grey.shade300,
        hintColor: const Color(0xffBFC9E0),
        scaffoldBackgroundColor: const Color(0xffFFFFFF),
        bottomAppBarTheme: lightBottomAppBarTheme,
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Color(0xffFFFFFF),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color(0xffFFFFFF),
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark, // status bar color
                systemNavigationBarContrastEnforced: false,
                systemNavigationBarColor: Color(0xffF3E6FF))),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color(0xffF3E6FF),
            backgroundColor: Color(0xffffffff)),
        primaryTextTheme: primaryTextThemeLight);
  }

  
}
