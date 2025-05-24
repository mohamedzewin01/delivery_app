import 'dart:io';


import 'package:delivery/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class CustomLaunchUrl {
  ///launchUrlWhatsapp
  static Future<void> launchUrlWhatsapp(
      {required numPhone,
        required String name,
      }) async {
// String num='966';
    var androidUrl =
        "whatsapp://send?phone=+$numPhone&text=Flowery rider \n $name\n"
    // " $linkImage$urlPreview "
        ;
    var iosUrl = "https://wa.me/$numPhone?text=${Uri.parse(name)}";
    var desktopUrl =
        "https://wa.me/$numPhone/?text=${Uri.parse(name)}&type=+$numPhone&app_absent=1";
    var webUrl = "https://web.whatsapp.com/send?phone=+$numPhone&text=$name";

    try {
      if (Platform.isIOS) {
        await launchUrl(
          Uri.parse(iosUrl),
        );
      } else if (Platform.isAndroid) {
        await launchUrl(Uri.parse(androidUrl));
      } else if (Platform.isWindows) {
        await launchUrl(Uri.parse(desktopUrl));
      } else {
        await launchUrl(Uri.parse(webUrl));
      }
    } catch (e) {
      print(e.toString());
    }
  }



  ///launchUrlCall
  static Future<void> launchUrlCall(
      {required String numPhone, String? messageSms}) async {
    var androidUrl = 'tel:$numPhone';
    var iosUrl = 'tel:$numPhone';
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else if (Platform.isAndroid) {
        await launchUrl(Uri.parse(androidUrl));
      }
    } catch (e) {
      print(e.toString());
    }
  }


}

class CustomShareInfoApp extends StatefulWidget {
  const CustomShareInfoApp({
    super.key,
    required this.icon,
    this.colorIcon,
    required this.onTap,
  });

  final IconData icon;
  final Color? colorIcon;
  final Future<void> Function() onTap; // تعديل هنا

  @override
  State<CustomShareInfoApp> createState() => _CustomShareInfoAppState();
}

class _CustomShareInfoAppState extends State<CustomShareInfoApp> {
  bool _isSharing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _isSharing = true;
        });
        try {
          await widget.onTap();
        } catch (e) {
          debugPrint(e.toString());
        } finally {
          setState(() {
            _isSharing = false;
          });
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder:
            (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child:
        _isSharing
            ? const SizedBox(
          key: ValueKey("loading"),
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: Colors.blueAccent,
            strokeWidth: 6,
          ),
        )
            : Icon(
          key: const ValueKey("icon"),
          size: 20,
          widget.icon,
          color: widget.colorIcon ?? ColorManager.white,
        ),
      ),
    );
  }
}