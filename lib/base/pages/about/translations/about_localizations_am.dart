import 'about_localizations.dart';

/// The translations for Amharic (`am`).
class AboutLocalizationAm extends AboutLocalization {
  AboutLocalizationAm([String locale = 'am']) : super(locale);

  @override
  String get aboutCollapseContent => 'አዲስ ማፕ, በአዲስ አበባ በመቶዎች የሚቆጠሩ የአውቶብስ እና ሚኒባስ መንገዶችን ሰብስቦ በOpenStreetMap ላይ በማከል ለህብረተሰቡ አገልግሎት እንዲውሉ አድርጓል። ይህ መተግበሪያ በት ማህበትሩፊ ስራ ላይ የተመሰረተ ነው። ይህ መተግበሪያ በTrufi ማህበር ስራ ላይ የተመሰረተ ነው። ትሩፊ ማህበር የህዝብ ማመላለሻን ቀላልነት እና ተደራሽነት የሚያበረታታ አለም አቀፍ መንግሥታዊ ያልሆነ ድርጅት ነው። የእኛ መተግበሪያ ሁሉም ሰው በከተማው ውስጥ በሚጓጓዝበት ወቅት ከነጥብ ሀ እስከ ነጥብ ፐ ለማግኘት ምርጡን መንገድ እንዲያገኙ ያግዛል። \n\nIn በብዙ ከተሞች ውስጥ ምንም አይነት ኦፊሴላዊ ካርታዎች፣ መስመሮች፣ መተግበሪያዎች ወይም የጊዜ ሰሌዳዎች የሉም። ስለዚህ ያለውን መረጃ እንሰበስባለን እና አንዳንዴም ከተማዋን ከሚያውቁ የአካባቢው ሰዎች ጋር በመስራት ከባዶ መንገዶችን በዲጂታል ካርታ እንዲቀናበሩ እናደርጋለን። መተግበሪያችን ለአጠቃቀም ቀላል የሆነ የመጓጓዣ ዘዴ ለበለጠ ዘላቂነት ላለው ለውጥ፣ ለንጹህ አየር ጠበቃ እና የተሻለ የህይወት ለመምራት ያግዛል።';

  @override
  String get aboutCollapseContentFoot => 'ካርታ ሰሪዎች፣ ገንቢዎች፣ እቅድ አውጪዎች፣ ሞካሪዎች እና ሌሎች ብዙ እጆች እንፈልጋለን።';

  @override
  String get aboutCollapseTitle => 'ስለትሩፊ እና አዲስ ማፕ ተጨማሪ';

  @override
  String aboutContent(Object appName) {
    return 'የሆነ ቦታ መሄድ አለብህ እህ (ሽ) የትኛውን ታክሲ ወይም አውቶቡስ መውሰድ እንዳለብህ (ሽ) አታውቅም (አታውቅቂ)?\n ይህንንም $appName ቀላል ያደርገዋል!\n\n የትሩፊ ማህበር የቦሊቪያ እና ከዚያ በላይ የሆነ ቡድን ነው። የህዝብ ማመላለሻን እንወዳለን፣ እና ለሁሉም ሰው ለመጠቀም ቀላል እንዲሆን እንፈልጋለን። ስለዚህ ይህን መተግበሪያ ገንብተናል። እንደምተደሰቱ እና ለናንተም ከፍተኛ ጠቀሜታ እንደሚሰጥ ተስፋ እናደርጋለን።';
  }

  @override
  String get aboutLicenses => 'ፈቃዶች';

  @override
  String get aboutOpenSource => 'ይህ መተግበሪያ በ GitHub ላይ እንደ ክፍት ምንጭ ተለቅቋል። ወደ የራስዎ ከተማ ለማበርከት ወይም ለማምጣት ነፃነት ይሰማዎ።';

  @override
  String get menuAbout => 'ስለ';

  @override
  String tagline(Object city) {
    return 'በ$city የብዙሀን ትራንስፖርት';
  }

  @override
  String get trufiWebsite => 'የአዲስማፕ ትራንዚት ድረ-ገፅ';

  @override
  String version(Object version) {
    return 'Version $version';
  }

  @override
  String get volunteerTrufi => 'አዲስማፕ ትራንዚትን በጎ ፈቃደኛ ሆነው ይቀላቀሉ።';
}