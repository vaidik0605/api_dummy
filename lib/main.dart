import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: Dummy(),
  ));
}

class Dummy extends StatefulWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  List l = [];

  Future<void> loadData() async {
    var url = Uri.parse(
        'https://growsolutions.in/www/MyPhotoKeyboard/getAllTheme.php');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map map = jsonDecode(response.body);

    //print(map);

    if (response.statusCode == 200) {
      l = map['theme_list'];
    }
    //print(l);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            const Text("Dummy API", style: TextStyle(color: Color(0xff40AAF8))),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          Map m = l[index];

          User user = User.fromJson(m);

          return ListTile(
            title: Text('${user.name}'),
            subtitle: Text('${user.id}'),
          );
        },
      ),
    );
  }
}

class User {
  String? id;
  String? name;
  String? themeTag;
  String? pkgName;
  String? previewImg;
  String? bigPreviewNew;
  String? themeSmallPreview;
  String? fullPreview;
  String? applyButton;
  String? themeDirectDownloadLink;
  String? themeDirectAvailable;
  String? isThemeDirectDownloadFree;
  String? textColor;
  String? hintColor;
  String? themeColor;
  String? themeTextColor;
  String? fontFile;
  String? isAd;
  String? userHit;
  String? themeType;
  String? isActive;
  String? isTop;
  String? isPremium;
  Null? entryDate;
  String? isLiveToday;
  Null? userId;

  User(
      {this.id,
      this.name,
      this.themeTag,
      this.pkgName,
      this.previewImg,
      this.bigPreviewNew,
      this.themeSmallPreview,
      this.fullPreview,
      this.applyButton,
      this.themeDirectDownloadLink,
      this.themeDirectAvailable,
      this.isThemeDirectDownloadFree,
      this.textColor,
      this.hintColor,
      this.themeColor,
      this.themeTextColor,
      this.fontFile,
      this.isAd,
      this.userHit,
      this.themeType,
      this.isActive,
      this.isTop,
      this.isPremium,
      this.entryDate,
      this.isLiveToday,
      this.userId});

  User.fromJson(Map json) {
    id = json['id'];
    name = json['name'];
    themeTag = json['theme_tag'];
    pkgName = json['pkg_name'];
    previewImg = json['preview_img'];
    bigPreviewNew = json['big_preview_new'];
    themeSmallPreview = json['theme_small_preview'];
    fullPreview = json['full_preview'];
    applyButton = json['apply_button'];
    themeDirectDownloadLink = json['theme_direct_download_link'];
    themeDirectAvailable = json['theme_direct_available'];
    isThemeDirectDownloadFree = json['is_theme_direct_download_free'];
    textColor = json['text_color'];
    hintColor = json['hint_color'];
    themeColor = json['theme_color'];
    themeTextColor = json['theme_text_color'];
    fontFile = json['font_file'];
    isAd = json['is_ad'];
    userHit = json['user_hit'];
    themeType = json['theme_type'];
    isActive = json['is_active'];
    isTop = json['isTop'];
    isPremium = json['isPremium'];
    entryDate = json['entry_date'];
    isLiveToday = json['is_live_today'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['theme_tag'] = this.themeTag;
    data['pkg_name'] = this.pkgName;
    data['preview_img'] = this.previewImg;
    data['big_preview_new'] = this.bigPreviewNew;
    data['theme_small_preview'] = this.themeSmallPreview;
    data['full_preview'] = this.fullPreview;
    data['apply_button'] = this.applyButton;
    data['theme_direct_download_link'] = this.themeDirectDownloadLink;
    data['theme_direct_available'] = this.themeDirectAvailable;
    data['is_theme_direct_download_free'] = this.isThemeDirectDownloadFree;
    data['text_color'] = this.textColor;
    data['hint_color'] = this.hintColor;
    data['theme_color'] = this.themeColor;
    data['theme_text_color'] = this.themeTextColor;
    data['font_file'] = this.fontFile;
    data['is_ad'] = this.isAd;
    data['user_hit'] = this.userHit;
    data['theme_type'] = this.themeType;
    data['is_active'] = this.isActive;
    data['isTop'] = this.isTop;
    data['isPremium'] = this.isPremium;
    data['entry_date'] = this.entryDate;
    data['is_live_today'] = this.isLiveToday;
    data['userId'] = this.userId;
    return data;
  }
}
