import 'about_localizations.dart';

/// The translations for English (`en`).
class AboutLocalizationEn extends AboutLocalization {
  AboutLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get aboutCollapseContent => 'AddisMap, Ethiopia collected hundreds of bus- and minibus-routes in Addis Ababa and added them to OpenStreetMap to make them usable for the general public. This app is based on the work for Trufi Association. Trufi Association is an international NGO that promotes easier access to public transport. Our apps help everyone find the best way to get from point A to point B within their cities.\n\nIn many cities there are no official maps, routes, apps or timetables. So we compile the available information, and sometimes even map routes from scratch working with local people who know the city. An easy-to-use transportation system contributes to greater sustainability, cleaner air and a better quality of life.';

  @override
  String get aboutCollapseContentFoot => 'We need mappers, developers, planners, testers, and many other hands.';

  @override
  String get aboutCollapseTitle => 'More About AddisMap and Trufi Association';

  @override
  String aboutContent(Object appName) {
    return 'Need to go somewhere and don\'t know which minibus or bus to take?\nThe $appName App makes it easy!\n\nAddisMap is team from Ethiopia and beyond. We love minibuses and public transportation, and we want to make it easier to use for everyone. So we developed this app. We hope you enjoy it.';
  }

  @override
  String get aboutLicenses => 'Licenses';

  @override
  String get aboutOpenSource => 'This app is released as open source on GitHub. Feel free to contribute to the code, or bring an app to your own city.';

  @override
  String get menuAbout => 'About us';

  @override
  String tagline(Object city) {
    return 'Public transportation in $city';
  }

  @override
  String get trufiWebsite => 'AddisMapTransit Website';

  @override
  String version(Object version) {
    return 'Version $version';
  }

  @override
  String get volunteerTrufi => 'Volunteer For Trufi';
}
