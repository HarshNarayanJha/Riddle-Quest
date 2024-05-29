import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff0061a4),
      surfaceTint: Color(0xff0061a4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff66b0ff),
      onPrimaryContainer: Color(0xff00223f),
      secondary: Color(0xff006685),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff56a7ca),
      onSecondaryContainer: Color(0xff00121a),
      tertiary: Color(0xff396476),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8cb7cb),
      onTertiaryContainer: Color(0xff002937),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfff8f9ff),
      onBackground: Color(0xff181c21),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff181c21),
      surfaceVariant: Color(0xffdce3f0),
      onSurfaceVariant: Color(0xff404752),
      outline: Color(0xff707883),
      outlineVariant: Color(0xffc0c7d4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3137),
      inverseOnSurface: Color(0xffeef1f8),
      inversePrimary: Color(0xff9fcaff),
      primaryFixed: Color(0xffd1e4ff),
      onPrimaryFixed: Color(0xff001d36),
      primaryFixedDim: Color(0xff9fcaff),
      onPrimaryFixedVariant: Color(0xff00497d),
      secondaryFixed: Color(0xffbfe9ff),
      onSecondaryFixed: Color(0xff001f2a),
      secondaryFixedDim: Color(0xff82d0f6),
      onSecondaryFixedVariant: Color(0xff004d65),
      tertiaryFixed: Color(0xffbde9fe),
      onTertiaryFixed: Color(0xff001f29),
      tertiaryFixedDim: Color(0xffa1cde2),
      onTertiaryFixedVariant: Color(0xff1e4c5d),
      surfaceDim: Color(0xffd7dae2),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f3fb),
      surfaceContainer: Color(0xffebeef6),
      surfaceContainerHigh: Color(0xffe5e8f0),
      surfaceContainerHighest: Color(0xffe0e2ea),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff004577),
      surfaceTint: Color(0xff0061a4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0078c9),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff004960),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff237d9f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1a4859),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff507a8d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff8f9ff),
      onBackground: Color(0xff181c21),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff181c21),
      surfaceVariant: Color(0xffdce3f0),
      onSurfaceVariant: Color(0xff3c434e),
      outline: Color(0xff58606b),
      outlineVariant: Color(0xff747b87),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3137),
      inverseOnSurface: Color(0xffeef1f8),
      inversePrimary: Color(0xff9fcaff),
      primaryFixed: Color(0xff0078c9),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005fa0),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff237d9f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff006482),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff507a8d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff366173),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dae2),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f3fb),
      surfaceContainer: Color(0xffebeef6),
      surfaceContainerHigh: Color(0xffe5e8f0),
      surfaceContainerHighest: Color(0xffe0e2ea),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff002341),
      surfaceTint: Color(0xff0061a4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004577),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff002633),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff004960),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002632),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff1a4859),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff8f9ff),
      onBackground: Color(0xff181c21),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffdce3f0),
      onSurfaceVariant: Color(0xff1d242e),
      outline: Color(0xff3c434e),
      outlineVariant: Color(0xff3c434e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3137),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffe2edff),
      primaryFixed: Color(0xff004577),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002e52),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff004960),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003142),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff1a4859),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003140),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dae2),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f3fb),
      surfaceContainer: Color(0xffebeef6),
      surfaceContainerHigh: Color(0xffe5e8f0),
      surfaceContainerHighest: Color(0xffe0e2ea),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9fcaff),
      surfaceTint: Color(0xff9fcaff),
      onPrimary: Color(0xff003258),
      primaryContainer: Color(0xff3b9df7),
      onPrimaryContainer: Color(0xff000814),
      secondary: Color(0xff82d0f6),
      onSecondary: Color(0xff003547),
      secondaryContainer: Color(0xff237d9f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xffa2cee2),
      onTertiary: Color(0xff003545),
      tertiaryContainer: Color(0xff7aa5b9),
      onTertiaryContainer: Color(0xff00141c),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff101419),
      onBackground: Color(0xffe0e2ea),
      surface: Color(0xff101419),
      onSurface: Color(0xffe0e2ea),
      surfaceVariant: Color(0xff404752),
      onSurfaceVariant: Color(0xffc0c7d4),
      outline: Color(0xff8a919d),
      outlineVariant: Color(0xff404752),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2ea),
      inverseOnSurface: Color(0xff2d3137),
      inversePrimary: Color(0xff0061a4),
      primaryFixed: Color(0xffd1e4ff),
      onPrimaryFixed: Color(0xff001d36),
      primaryFixedDim: Color(0xff9fcaff),
      onPrimaryFixedVariant: Color(0xff00497d),
      secondaryFixed: Color(0xffbfe9ff),
      onSecondaryFixed: Color(0xff001f2a),
      secondaryFixedDim: Color(0xff82d0f6),
      onSecondaryFixedVariant: Color(0xff004d65),
      tertiaryFixed: Color(0xffbde9fe),
      onTertiaryFixed: Color(0xff001f29),
      tertiaryFixedDim: Color(0xffa1cde2),
      onTertiaryFixedVariant: Color(0xff1e4c5d),
      surfaceDim: Color(0xff101419),
      surfaceBright: Color(0xff36393f),
      surfaceContainerLowest: Color(0xff0a0e14),
      surfaceContainerLow: Color(0xff181c21),
      surfaceContainer: Color(0xff1c2025),
      surfaceContainerHigh: Color(0xff262a30),
      surfaceContainerHighest: Color(0xff31353b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa7ceff),
      surfaceTint: Color(0xff9fcaff),
      onPrimary: Color(0xff00172e),
      primaryContainer: Color(0xff3b9df7),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff86d5fa),
      onSecondary: Color(0xff001923),
      secondaryContainer: Color(0xff489abd),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffa5d1e6),
      onTertiary: Color(0xff001922),
      tertiaryContainer: Color(0xff7aa5b9),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff101419),
      onBackground: Color(0xffe0e2ea),
      surface: Color(0xff101419),
      onSurface: Color(0xfffafaff),
      surfaceVariant: Color(0xff404752),
      onSurfaceVariant: Color(0xffc4cbd8),
      outline: Color(0xff9ca3b0),
      outlineVariant: Color(0xff7c848f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2ea),
      inverseOnSurface: Color(0xff262a30),
      inversePrimary: Color(0xff004a7f),
      primaryFixed: Color(0xffd1e4ff),
      onPrimaryFixed: Color(0xff001225),
      primaryFixedDim: Color(0xff9fcaff),
      onPrimaryFixedVariant: Color(0xff003862),
      secondaryFixed: Color(0xffbfe9ff),
      onSecondaryFixed: Color(0xff00131c),
      secondaryFixedDim: Color(0xff82d0f6),
      onSecondaryFixedVariant: Color(0xff003b4f),
      tertiaryFixed: Color(0xffbde9fe),
      onTertiaryFixed: Color(0xff00131c),
      tertiaryFixedDim: Color(0xffa1cde2),
      onTertiaryFixedVariant: Color(0xff063b4c),
      surfaceDim: Color(0xff101419),
      surfaceBright: Color(0xff36393f),
      surfaceContainerLowest: Color(0xff0a0e14),
      surfaceContainerLow: Color(0xff181c21),
      surfaceContainer: Color(0xff1c2025),
      surfaceContainerHigh: Color(0xff262a30),
      surfaceContainerHighest: Color(0xff31353b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffafaff),
      surfaceTint: Color(0xff9fcaff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffa7ceff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff7fbff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff86d5fa),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff7fbff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa5d1e6),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff101419),
      onBackground: Color(0xffe0e2ea),
      surface: Color(0xff101419),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff404752),
      onSurfaceVariant: Color(0xfffafaff),
      outline: Color(0xffc4cbd8),
      outlineVariant: Color(0xffc4cbd8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2ea),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff002b4e),
      primaryFixed: Color(0xffd9e8ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa7ceff),
      onPrimaryFixedVariant: Color(0xff00172e),
      secondaryFixed: Color(0xffcaecff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff86d5fa),
      onSecondaryFixedVariant: Color(0xff001923),
      tertiaryFixed: Color(0xffc7ecff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa5d1e6),
      onTertiaryFixedVariant: Color(0xff001922),
      surfaceDim: Color(0xff101419),
      surfaceBright: Color(0xff36393f),
      surfaceContainerLowest: Color(0xff0a0e14),
      surfaceContainerLow: Color(0xff181c21),
      surfaceContainer: Color(0xff1c2025),
      surfaceContainerHigh: Color(0xff262a30),
      surfaceContainerHighest: Color(0xff31353b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
