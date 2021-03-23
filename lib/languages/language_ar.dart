import 'languages.dart';

class LanguageAr extends Languages {
  @override
  bool get isArabic => true;

  @override
  String get lowerSignUp => 'انشئ حساب';

  @override
  String get lowerLogin => 'تسجيل دخول';

  @override
  String get upperLogin => 'تسجيل دخول';

  @override
  String get upperSignUp => 'انشاء حساب';

  @override
  String get filter => 'تصفية';

  @override
  String get sort => 'رتب';

  @override
  String get verify => 'رجاء قم بتاكيد الحساب ثم سجل دخولك';

  /// Start Language Page
  @override
  String get languageAppBar => 'اختيار اللغة';

  @override
  String get languageButton => 'تقدم';

  @override
  String get selectLanguage => 'اختر لغتك';

  @override
  String get languageWelcome => 'اهلا بك في CStore';

  ///End Language Page

  ///Start Login

  @override
  String get logSwitch => 'ليس لديك حساب ؟';

  @override
  String get logPassHint => 'الرقم السري';

  @override
  String get logEmailHint => 'البريد الالكتروني';

  @override
  String get logPassError => 'رقم سري خاطئ';

  @override
  String get logEmailError => 'ادخل بريدك';

  @override
  String get logError => 'خطأ بالبريد او الرقم السري';

  ///End Login

  ///Start SignUp

  @override
  String get signPhoneHint => 'رقم الهاتف';

  @override
  String get signPassError => 'ادخل رقم بـ +6 خانات';

  @override
  String get signPassHint => 'الرقم السري';

  @override
  String get signEmailError => 'ادخل بريدك الالكتروني';

  @override
  String get signEmailHint => 'البريد الالكتروني';

  @override
  String get signUserError => 'ادخل اسم المستخدم';

  @override
  String get signUserHint => 'اسم المستخدم';

  @override
  String get signSwitch => 'لديك حساب بالفعل ؟';

  @override
  String get signError => 'ايميل غير صحيح';

  @override
  String get signPhoneError => 'رقم الهاتف غير صالح';

  ///End SignUp

  /// Start SearchHintText

  @override
  String get ps3SearchHint => 'ابحث في متجر Ps3';

  @override
  String get ps4SearchHint => 'ابحث في متجر Ps4';

  @override
  String get ps5SearchHint => 'ابحث في متجر Ps5';

  @override
  String get x3SearchHint => 'ابحث في متجر XBox 360';

  @override
  String get x4SearchHint => 'ابحث في متجر XBox 1';

  @override
  String get x5SearchHint => 'ابحث في متجر XBox X';

  /// End SearchHintText

  /// Start Filter
  @override
  String get price => 'السعر';

  @override
  String get filterUnit => 'دينار';

  @override
  String get filterTextField1 => 'من';

  @override
  String get filterTextField2 => 'الى';

  @override
  String get condition => 'حالة المنتج';

  @override
  String get buy => 'شراء';

  @override
  String get sell => 'بيع';

  @override
  String get used => 'مستعمل';

  @override
  String get new1 => 'جديد';

  @override
  String get filterButton => 'تأكيد';

  ///End Filter

  /// ///Start Sort

  @override
  String get sortChoice2 => 'السعر : من الاقل للاعلى';

  @override
  String get sortChoice1 => 'السعر : من الاعلى للاقل';

  @override
  String get sortLabel => 'رتب حسب';

  ///End Sort

  ///Start SideBar

  @override
  String get sideOut => 'تسجيل خروج';

  @override
  String get sidePremium => 'اشتراك';

  @override
  String get sideAdd => 'اضف اعلان';

  @override
  String get sideAds => 'حسابي(الاعلانات)';

  ///End SideBar

  ///Start AddAd

  //Start CityChoices

  @override
  String get mafraq => 'المفرق';

  @override
  String get maan => "معان";

  @override
  String get madaba => 'مأدبا';

  @override
  String get karak => 'الكرك';

  @override
  String get alAqaba => 'العقبة';

  @override
  String get ajloun => 'عجلون';

  @override
  String get tafilah => 'الطفيلة';

  @override
  String get alBalqa => 'البلقاء';

  @override
  String get jerash => 'جرش';

  @override
  String get zarqa => 'الزرقاء';

  @override
  String get irbid => 'اربد';

  @override
  String get amman => 'عمان';

  //End CityChoices

  @override
  String get addButton => 'تأكيد';

  @override
  String get addType => 'الفئة';

  @override
  String get addSOrB => 'بيع ام شراء';

  @override
  String get addCondition => 'الحالة';

  @override
  String get addCity => 'المدينة';

  @override
  String get addNeighborhoodHint => 'الحي السكني';

  @override
  String get addPriceHint => 'السعر';

  @override
  String get addDescHint => 'التفاصيل';

  @override
  String get addTitleHint => 'العنوان';

  @override
  String get addAppBar => 'اضف اعلانك';

  @override
  String get addTypeError => 'اختر الفئة';

  @override
  String get addSOrBError => 'اخبرنا';

  @override
  String get addConditionError => 'حالة المنتج رجاء';

  @override
  String get addCityError => 'اختر مدينتك';

  @override
  String get addPriceError => 'ادخل السعر';

  @override
  String get addTitleError => 'اضف عنوان';

  ///End AddAd

  ///Start Details

  @override
  String get detailsCall => 'اتصل';

  @override
  String get detailsCreated => 'أنشئ قبل';

  @override
  String get detailsLocation => 'الموقع';

  ///End Details

  ///Start User

  @override
  String get userAds => 'الاعلانات';

  @override
  String get userJoined => 'انضم في ';

  ///End User
}
