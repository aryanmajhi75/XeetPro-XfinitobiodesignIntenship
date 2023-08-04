// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';
import 'userinfo.dart';
import 'phyprofile.dart';

class PreferencesService {
  Future saveSettings(UserinFo settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('uname', settings.name ?? " ");
    await preferences.setString('fname', settings.fnname ?? " ");
    await preferences.setString('mname', settings.mnname ?? " ");
    await preferences.setString('lname', settings.lnname ?? " ");
    await preferences.setString('email', settings.eemail ?? " ");
    await preferences.setString('dob', settings.ndob ?? " ");
    await preferences.setString('gender', settings.gender ?? " ");

    print('Saved in Shared Preference');
  }

  Future<UserinFo> getSetting() async {
    final preferences = await SharedPreferences.getInstance();

    final name = preferences.getString('uname');
    final fnname = preferences.getString('fname');
    final mnname = preferences.getString('mname');
    final lnname = preferences.getString('lname');
    final eemail = preferences.getString('email');
    final ndob = preferences.getString('dob');
    final gender = preferences.getString('gender');

    return UserinFo(
        name: name.toString(),
        fnname: fnname.toString(),
        mnname: mnname.toString(),
        lnname: lnname.toString(),
        ndob: ndob.toString(),
        eemail: eemail.toString(),
        gender: gender.toString());
  }

  Future savephyinfo(phyprof ui) async {
    final phypref = await SharedPreferences.getInstance();

    await phypref.setString('heigh', ui.heig.toString() ?? " ");
    await phypref.setString('hunit', ui.hunit);
    await phypref.setString('weigh', ui.weig.toString() ?? " ");
    await phypref.setString('wunit', ui.wunit);
    await phypref.setString('preco', ui.prec ?? " ");
    await phypref.setString('phyact', ui.phya ?? " ");
    await phypref.setString('descr', ui.desc ?? " ");
  }

  Future<phyprof> getphyinfo() async {
    final phypref = await SharedPreferences.getInstance();

    final heig = phypref.getString('heigh');
    final hunit = phypref.getString('hunit');
    final weig = phypref.getString('weigh');
    final wunit = phypref.getString('wunit');
    final prec = phypref.getString('preco');
    final phya = phypref.getString('phyact');
    final desc = phypref.getString('descr');

    return phyprof(
        heig: heig.toString(),
        hunit: hunit ?? "cm",
        weig: weig.toString(),
        wunit: wunit ?? "kg",
        prec: prec.toString(),
        phya: phya.toString(),
        desc: desc.toString());
  }
}
