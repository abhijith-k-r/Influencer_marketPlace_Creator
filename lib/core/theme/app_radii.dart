import 'package:flutter/material.dart';

/// Global Border Radii Tokens matching HTML Tailwind styles:
/// rounded-xl, rounded-2xl, rounded-[24px], rounded-[28px], rounded-[32px], rounded-full.
abstract final class AppRadii {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double card = 24.0;
  static const double hero = 28.0;
  static const double banner = 32.0;
  static const double pill = 9999.0;
  static const double full = 9999.0;

  // BorderRadius instances
  static const BorderRadius roundedXs = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius roundedSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius roundedMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius roundedLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius roundedXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius roundedXxl = BorderRadius.all(Radius.circular(xxl));
  static const BorderRadius roundedCard = BorderRadius.all(Radius.circular(card));
  static const BorderRadius roundedHero = BorderRadius.all(Radius.circular(hero));
  static const BorderRadius roundedBanner = BorderRadius.all(Radius.circular(banner));
  static const BorderRadius roundedPill = BorderRadius.all(Radius.circular(pill));
  static const BorderRadius roundedFull = BorderRadius.all(Radius.circular(full));

  // Modal sheet top rounded
  static const BorderRadius sheetTop = BorderRadius.only(
    topLeft: Radius.circular(hero),
    topRight: Radius.circular(hero),
  );

  // Chat Bubble Tail Radii
  static const BorderRadius bubbleIncoming = BorderRadius.only(
    topLeft: Radius.circular(0),
    topRight: Radius.circular(lg),
    bottomRight: Radius.circular(lg),
    bottomLeft: Radius.circular(lg),
  );

  static const BorderRadius bubbleOutgoing = BorderRadius.only(
    topLeft: Radius.circular(lg),
    topRight: Radius.circular(0),
    bottomLeft: Radius.circular(lg),
    bottomRight: Radius.circular(lg),
  );
}
