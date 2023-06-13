import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OEHIcons {
  static SvgPicture getChat([Color? color]) => SvgPicture.asset(
        "assets/icons/chat.svg",
        color: color,
      );
  static SvgPicture getHome([Color? color]) => SvgPicture.asset(
        "assets/icons/home.svg",
        color: color,
      );
  static SvgPicture getLink([Color? color]) => SvgPicture.asset(
        "assets/icons/link.svg",
        color: color,
      );
  static SvgPicture getMartini([Color? color]) => SvgPicture.asset(
        "assets/icons/martini.svg",
        color: color,
      );
  static SvgPicture getMessages([Color? color]) => SvgPicture.asset(
        "assets/icons/messages.svg",
        color: color,
      );
  static SvgPicture getNo([Color? color]) => SvgPicture.asset(
        "assets/icons/no.svg",
        color: color,
      );
  static SvgPicture getNotifications([Color? color]) => SvgPicture.asset(
        "assets/icons/notifications.svg",
        color: color,
      );
  static SvgPicture getPin([Color? color]) => SvgPicture.asset(
        "assets/icons/pin.svg",
        color: color,
      );
  static SvgPicture getProfile([Color? color]) => SvgPicture.asset(
        "assets/icons/profile.svg",
        color: color,
      );
  static SvgPicture getRefresh([Color? color]) => SvgPicture.asset(
        "assets/icons/refresh.svg",
        color: color,
      );
  static SvgPicture getSave([Color? color]) => SvgPicture.asset(
        "assets/icons/save.svg",
        color: color,
      );
  static SvgPicture getSearch([Color? color]) => SvgPicture.asset(
        "assets/icons/search.svg",
        color: color,
      );
  static SvgPicture getSended([Color? color]) => SvgPicture.asset(
        "assets/icons/sended.svg",
        color: color,
      );
  static SvgPicture getSettings([Color? color]) => SvgPicture.asset(
        "assets/icons/settings.svg",
        color: color,
      );
  static SvgPicture getTrash([Color? color]) => SvgPicture.asset(
        "assets/icons/trash.svg",
        color: color,
      );
  static SvgPicture getYes([Color? color]) => SvgPicture.asset(
        "assets/icons/yes.svg",
        color: color,
      );
}

class OEHAssets {
  static OEHIcons icons = OEHIcons();
  static Image getHeader([double? heigth]) => Image.asset(
        "assets/images/header.png",
        height: heigth,
      );
  static Image getDefaultPostImage([double? height, double? width]) =>
      Image.asset(
        "assets/images/default_image.jpg",
        height: height,
        width: width,
        fit: BoxFit.fill,
      );
}

class OEHColors {
  static Color oehWhite = const Color(0xFFF3E6FF);
  static Color oehPurple = const Color(0xFF8F6EF6);
  static Color oehGreen = const Color(0xFF6BCBAE);
}
