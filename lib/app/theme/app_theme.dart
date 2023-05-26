import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ArdillaAppTheme {
  static Color lightThemeTextColor = const Color(0xff8807F7);
  static Color darkThemeTextColor = const Color(0xfffefefe);

  static TextTheme primaryTextThemeLight = TextTheme(
    bodyLarge: GoogleFonts.raleway(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: lightThemeTextColor,
    ),
    bodyMedium: GoogleFonts.raleway(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: lightThemeTextColor,
    ),
    bodySmall: GoogleFonts.raleway(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: lightThemeTextColor,
    ),
    displayLarge: GoogleFonts.raleway(
      fontSize: 34.0,
      fontWeight: FontWeight.w700,
      color: lightThemeTextColor,
    ),
    displayMedium: GoogleFonts.raleway(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: lightThemeTextColor,
    ),
    displaySmall: GoogleFonts.raleway(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: lightThemeTextColor,
    ),
    headlineLarge: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: lightThemeTextColor,
    ),
    headlineMedium: GoogleFonts.raleway(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: lightThemeTextColor,
    ),
    headlineSmall: GoogleFonts.raleway(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: lightThemeTextColor,
    ),
    titleLarge: GoogleFonts.raleway(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: lightThemeTextColor,
    ),
    titleMedium: GoogleFonts.raleway(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: lightThemeTextColor,
    ),
    titleSmall: GoogleFonts.raleway(
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
      color: lightThemeTextColor,
    ),
  );

  static TextTheme primaryTextThemeDark = TextTheme(
    bodyLarge: GoogleFonts.raleway(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
    displayLarge: GoogleFonts.roboto(
      fontSize: 34.0,
      fontWeight: FontWeight.w700,
      color: darkThemeTextColor,
    ),
    displayMedium: GoogleFonts.roboto(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: darkThemeTextColor,
    ),
    displaySmall: GoogleFonts.roboto(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: darkThemeTextColor,
    ),
    headlineLarge: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: darkThemeTextColor,
    ),
    headlineMedium: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: darkThemeTextColor,
    ),
    headlineSmall: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: darkThemeTextColor,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: darkThemeTextColor,
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: darkThemeTextColor,
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
  );
  InputDecorationTheme inputDecorationTheme = const InputDecorationTheme();

  static IconThemeData darkIconTheme =
      const IconThemeData(color: Color(0xffafafaf));
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
        dividerColor: const Color(0xffCBF3FC),
        disabledColor: const Color(0xffBBBFC1),
        dialogBackgroundColor: Colors.white,
        drawerTheme: drawerTheme,
        iconTheme: lightIconTheme,
        navigationBarTheme:
            const NavigationBarThemeData(indicatorColor: Color(0xff34f5c5)),
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

  static ThemeData dark() {
    Color darkThemeColor = const Color(0xff00161f);
    Color darkCardColor = const Color(0xff062735);

    return ThemeData(
        brightness: Brightness.dark,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              return Colors.black;
            },
          ),
        ),
        indicatorColor: const Color(0xffF3E6FF),
        secondaryHeaderColor: const Color(0xff4d4d4d),
        primaryColor: const Color(0xff000000),
        primaryColorDark: darkThemeColor,
        backgroundColor: darkThemeColor,
        dialogBackgroundColor: darkCardColor,
        canvasColor: darkCardColor,
        cardColor: darkCardColor,
        selectedRowColor: const Color(0xff005a80),
        drawerTheme: darkThemeDrawerTheme,
        scaffoldBackgroundColor: darkThemeColor,
        shadowColor: Colors.black87,
        iconTheme: darkIconTheme,
        appBarTheme: AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: darkCardColor,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: darkCardColor,
                statusBarBrightness: Brightness.dark,
                systemNavigationBarContrastEnforced: false,
                systemNavigationBarColor: const Color(0xffF3E6FF))),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: const Color(0xff29ABE2),
            backgroundColor: darkCardColor),
        primaryTextTheme: primaryTextThemeDark);
  }
}
