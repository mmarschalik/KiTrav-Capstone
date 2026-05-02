import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'ar', 'zh_Hans', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
    String? arText = '',
    String? zh_HansText = '',
    String? esText = '',
  }) =>
      [enText, frText, arText, zh_HansText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SubscriptionPlan
  {
    'qnj5v051': {
      'en': 'Choose Your Plan',
      'ar': 'اختر خطتك',
      'es': 'Elige tu plan',
      'fr': 'Choisissez votre forfait',
      'zh_Hans': '选择您的方案',
    },
    'g3ouzc1n': {
      'en':
          'Select the plan that works best for you. Upgrade or downgrade at any time.',
      'ar': 'اختر الخطة الأنسب لك. يمكنك الترقية أو التخفيض في أي وقت.',
      'es':
          'Selecciona el plan que mejor se adapte a ti. Puedes cambiar a un plan superior o inferior en cualquier momento.',
      'fr':
          'Choisissez le forfait qui vous convient le mieux. Vous pouvez passer à un forfait supérieur ou inférieur à tout moment.',
      'zh_Hans': '选择最适合您的套餐。随时可以升级或降级。',
    },
    '9e1cs06n': {
      'en': 'Free Plan',
      'ar': 'خطة مجانية',
      'es': 'Plan gratuito',
      'fr': 'Plan gratuit',
      'zh_Hans': '免费计划',
    },
    '2kbwhp64': {
      'en': '\$0',
      'ar': '0 دولار',
      'es': '\$0',
      'fr': '0 \$',
      'zh_Hans': '0美元',
    },
    'ywjd60nm': {
      'en': 'per month',
      'ar': 'كل شهر',
      'es': 'por mes',
      'fr': 'par mois',
      'zh_Hans': '每月',
    },
    'igirjixt': {
      'en': 'Basic search results',
      'ar': 'نتائج البحث الأساسية',
      'es': 'Resultados de búsqueda básica',
      'fr': 'Résultats de recherche de base',
      'zh_Hans': '基本搜索结果',
    },
    'fbz70peb': {
      'en': '5 searches per month',
      'ar': '5 عمليات بحث شهرياً',
      'es': '5 búsquedas al mes',
      'fr': '5 recherches par mois',
      'zh_Hans': '每月搜索次数：5次',
    },
    '1f7v3gjw': {
      'en': 'Advertisment',
      'ar': 'إعلان',
      'es': 'Anuncio',
      'fr': 'Publicité',
      'zh_Hans': '广告',
    },
    'dtf51uao': {
      'en': 'Advanced filters',
      'ar': 'فلتر متقدم',
      'es': 'Filtros avanzados',
      'fr': 'Filtres avancés',
      'zh_Hans': '高级筛选器',
    },
    '8k72skqz': {
      'en': 'Priority support',
      'ar': 'دعم ذو أولوية',
      'es': 'Apoyo prioritario',
      'fr': 'Soutien prioritaire',
      'zh_Hans': '优先支持',
    },
    'ck94dr7g': {
      'en': 'Continue for Free',
      'ar': 'استمر مجاناً',
      'es': 'Continúa gratis',
      'fr': 'Continuez gratuitement',
      'zh_Hans': '免费继续',
    },
    'i41xis3z': {
      'en': 'Premium Plan',
      'ar': 'الخطة المميزة',
      'es': 'Plan Premium',
      'fr': 'Formule Premium',
      'zh_Hans': '高级计划',
    },
    '467tolkv': {
      'en': 'POPULAR',
      'ar': 'شائع',
      'es': 'POPULAR',
      'fr': 'POPULAIRE',
      'zh_Hans': '受欢迎的',
    },
    'sspm6hpj': {
      'en': '\$10',
      'ar': '10 دولارات',
      'es': '\$10',
      'fr': '10 \$',
      'zh_Hans': '10美元',
    },
    'fhn7t0xn': {
      'en': 'per month',
      'ar': 'كل شهر',
      'es': 'por mes',
      'fr': 'par mois',
      'zh_Hans': '每月',
    },
    'z9s8hr94': {
      'en': 'All basic features included',
      'ar': 'جميع الميزات الأساسية متضمنة',
      'es': 'Todas las funciones básicas incluidas',
      'fr': 'Toutes les fonctionnalités de base incluses',
      'zh_Hans': '包含所有基本功能',
    },
    '1m8qbu2s': {
      'en': 'Unlimited searches',
      'ar': 'عمليات بحث غير محدودة',
      'es': 'Búsquedas ilimitadas',
      'fr': 'Recherches illimitées',
      'zh_Hans': '无限次搜索',
    },
    '0jfgnn5k': {
      'en': 'Ad-free experience',
      'ar': 'تجربة خالية من الإعلانات',
      'es': 'Experiencia sin anuncios',
      'fr': 'Expérience sans publicité',
      'zh_Hans': '无广告体验',
    },
    'bj1pqhrw': {
      'en': 'Advanced filters',
      'ar': 'فلتر متقدم',
      'es': 'Filtros avanzados',
      'fr': 'Filtres avancés',
      'zh_Hans': '高级筛选器',
    },
    'gbuk8l06': {
      'en': 'Priority customer support',
      'ar': 'دعم العملاء ذو ​​الأولوية',
      'es': 'Soporte prioritario al cliente',
      'fr': 'Assistance clientèle prioritaire',
      'zh_Hans': '优先客户支持',
    },
    'etkwyb63': {
      'en': 'Exclusive discounts & offers',
      'ar': 'خصومات وعروض حصرية',
      'es': 'Descuentos y ofertas exclusivas',
      'fr': 'Réductions et offres exclusives',
      'zh_Hans': '专属折扣和优惠',
    },
    '3iokb9hl': {
      'en': 'Early access to deals',
      'ar': 'الوصول المبكر إلى العروض',
      'es': 'Acceso anticipado a ofertas',
      'fr': 'Accès anticipé aux offres',
      'zh_Hans': '提前获取优惠信息',
    },
    't9u9xpjm': {
      'en': 'VIP curated itineraries',
      'ar': 'برامج رحلات مُعدّة خصيصًا لكبار الشخصيات',
      'es': 'Itinerarios VIP seleccionados',
      'fr': 'itinéraires VIP personnalisés',
      'zh_Hans': 'VIP 定制行程',
    },
    'iqo92tnc': {
      'en': 'Go with Premium',
      'ar': 'اختر باقة مميزة',
      'es': 'Elige Premium',
      'fr': 'Optez pour la version Premium',
      'zh_Hans': '选择高级版',
    },
  },
  // Details06SubscriptionPayment
  {
    '1xf49qe9': {
      'en': 'Subscription / Payment',
      'ar': 'الاشتراك / الدفع',
      'es': 'Suscripción / Pago',
      'fr': 'Abonnement / Paiement',
      'zh_Hans': '订阅/支付',
    },
    'rfezcw9z': {
      'en': 'Your Subscription',
      'ar': 'اشتراكك',
      'es': 'Tu suscripción',
      'fr': 'Votre abonnement',
      'zh_Hans': '您的订阅',
    },
    'dqf4wuri': {
      'en': 'Monthly',
      'ar': 'شهريا',
      'es': 'Mensual',
      'fr': 'Mensuel',
      'zh_Hans': '月度',
    },
    '7kfc0kn8': {
      'en': '\$15.99/mo',
      'ar': '15.99 دولارًا شهريًا',
      'es': '\$15.99/mes',
      'fr': '15,99 \$/mois',
      'zh_Hans': '每月 15.99 美元',
    },
    '8g2du99n': {
      'en': 'Gain unlimited access to all the content we have to offer! ',
      'ar': 'احصل على وصول غير محدود إلى جميع المحتويات التي نقدمها!',
      'es':
          '¡Obtén acceso ilimitado a todo el contenido que tenemos para ofrecerte!',
      'fr':
          'Accédez à l\'intégralité du contenu que nous proposons, sans limite !',
      'zh_Hans': '获取我们提供的所有内容的无限访问权限！',
    },
    'le49z89h': {
      'en': 'Other Offers',
      'ar': 'عروض أخرى',
      'es': 'Otras ofertas',
      'fr': 'Autres offres',
      'zh_Hans': '其他优惠',
    },
    'c33t6840': {
      'en': 'Annual (save \$12)',
      'ar': 'سنويًا (وفر 12 دولارًا)',
      'es': 'Anual (ahorre \$12)',
      'fr': 'Annuel (économisez 12 \$)',
      'zh_Hans': '年费（节省 12 美元）',
    },
    'f6428ltq': {
      'en': '\$180/yr',
      'ar': '180 دولارًا سنويًا',
      'es': '\$180/año',
      'fr': '180 \$/an',
      'zh_Hans': '每年180美元',
    },
    '203xsi5d': {
      'en': 'Gain unlimited access to all the content we have to offer! ',
      'ar': 'احصل على وصول غير محدود إلى جميع المحتويات التي نقدمها!',
      'es':
          '¡Obtén acceso ilimitado a todo el contenido que tenemos para ofrecerte!',
      'fr':
          'Accédez à l\'intégralité du contenu que nous proposons, sans limite !',
      'zh_Hans': '获取我们提供的所有内容的无限访问权限！',
    },
    '0gotzc6t': {
      'en': 'Free Limited Access',
      'ar': 'دخول محدود مجاني',
      'es': 'Acceso limitado gratuito',
      'fr': 'Accès limité gratuit',
      'zh_Hans': '免费有限访问',
    },
    'r5ew90gs': {
      'en':
          'Continue with limited access at no cost. Browse blogs and videos aimed to help you in your journey!',
      'ar':
          'استمر في استخدام الوصول المحدود مجانًا. تصفح المدونات ومقاطع الفيديو المصممة لمساعدتك في رحلتك!',
      'es':
          'Continúa con acceso limitado sin costo alguno. ¡Explora blogs y videos diseñados para ayudarte en tu camino!',
      'fr':
          'Continuez avec un accès limité et gratuit. Consultez des blogs et des vidéos conçus pour vous accompagner dans votre parcours !',
      'zh_Hans': '继续享受有限的免费访问权限。浏览旨在帮助您学习的博客和视频！',
    },
    '63szkt0h': {
      'en': 'Change Plan',
      'ar': 'خطة التغيير',
      'es': 'Plan de cambio',
      'fr': 'Plan de changement',
      'zh_Hans': '变更计划',
    },
    'ngh5j1in': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // SubscirptionCheckoutSummary
  {
    'uxcsj298': {
      'en': 'Subscription',
      'ar': 'الاشتراك',
      'es': 'Suscripción',
      'fr': 'Abonnement',
      'zh_Hans': '订阅',
    },
    'ecskpnzn': {
      'en': 'Credit Card',
      'ar': 'بطاقة إئتمان',
      'es': 'Tarjeta de crédito',
      'fr': 'Carte de crédit',
      'zh_Hans': '信用卡',
    },
    'qf5psit4': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'es': 'Su nombre',
      'fr': 'Votre nom',
      'zh_Hans': '你的名字',
    },
    'mh4terp7': {
      'en': 'Paypal',
      'ar': 'باي بال',
      'es': 'PayPal',
      'fr': 'PayPal',
      'zh_Hans': 'PayPal',
    },
    'lxtbkebj': {
      'en': 'Apple Pay',
      'ar': 'أبل باي',
      'es': 'Apple Pay',
      'fr': 'Apple Pay',
      'zh_Hans': 'Apple Pay',
    },
    't9mejqe9': {
      'en': 'Apple Pay',
      'ar': 'أبل باي',
      'es': 'Apple Pay',
      'fr': 'Apple Pay',
      'zh_Hans': 'Apple Pay',
    },
    'phvpo2c9': {
      'en': 'Pay Now',
      'ar': 'ادفع الآن',
      'es': 'Paga ahora',
      'fr': 'Payer maintenant',
      'zh_Hans': '立即支付',
    },
    'gz21lle1': {
      'en': 'Pay w/Paypal',
      'ar': 'ادفع باستخدام باي بال',
      'es': 'Pagar con PayPal',
      'fr': 'Payer avec PayPal',
      'zh_Hans': '使用PayPal付款',
    },
    '5whv739a': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Checkout4
  {
    'o3asj3o5': {
      'en': 'Your Booking Summary',
      'ar': 'ملخص حجزك',
      'es': 'Resumen de su reserva',
      'fr': 'Récapitulatif de votre réservation',
      'zh_Hans': '您的预订摘要',
    },
    '8if090vf': {
      'en': 'Below is the list of items in your cart.',
      'ar': 'فيما يلي قائمة بالعناصر الموجودة في سلة التسوق الخاصة بك.',
      'es': 'A continuación se muestra la lista de artículos en su carrito.',
      'fr': 'Voici la liste des articles de votre panier.',
      'zh_Hans': '以下是您购物车中的商品列表。',
    },
    'lcd7dmbv': {
      'en': 'MGM Grand - Grand Two Queen Room',
      'ar': 'إم جي إم جراند - غرفة جراند بسريرين كوين',
      'es': 'MGM Grand - Habitación Grand con dos camas Queen',
      'fr': 'MGM Grand - Chambre Grand avec deux lits Queen',
      'zh_Hans': '米高梅大酒店 - 豪华双皇后房',
    },
    'ieo3hw74': {
      'en': 'Size: ',
      'ar': 'مقاس:',
      'es': 'Tamaño:',
      'fr': 'Taille:',
      'zh_Hans': '尺寸：',
    },
    'o9exdo3w': {
      'en': '12',
      'ar': '12',
      'es': '12',
      'fr': '12',
      'zh_Hans': '12',
    },
    'dnh6sz53': {
      'en': '\$124.00 x 2',
      'ar': '124.00 دولارًا × 2',
      'es': '\$124.00 x 2',
      'fr': '124,00 \$ x 2',
      'zh_Hans': '124.00 美元 x 2',
    },
    '34mftkb2': {
      'en':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
      'ar':
          'تيشيرت رياضي رجالي بدون أكمام\nرمادي داكن/فضي مطفي/رمادي فاتح/أسود',
      'es': 'Camiseta deportiva sin mangas para hombre',
      'fr':
          'Débardeur de fitness pour homme\n\nGris délavé/Argent mat/Chiné/Noir',
      'zh_Hans': '男士无袖健身T恤\n\n浅灰色/银色/麻灰色/黑色',
    },
    'hb75zhii': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    'vz3f9d7h': {
      'en': 'Southwest - WN5323 PHX to LAS',
      'ar': 'جنوب غرب - WN5323 من فينيكس إلى لاس',
      'es': 'Suroeste - WN5323 PHX a LAS',
      'fr': 'Sud-Ouest - WN5323 PHX à LAS',
      'zh_Hans': '西南航空 - WN5323 凤凰城飞往拉斯维加斯',
    },
    '2f7h7963': {
      'en': 'Size: ',
      'ar': 'مقاس:',
      'es': 'Tamaño:',
      'fr': 'Taille:',
      'zh_Hans': '尺寸：',
    },
    'x6hqbs03': {
      'en': '12',
      'ar': '12',
      'es': '12',
      'fr': '12',
      'zh_Hans': '12',
    },
    'yfqp1t71': {
      'en': '\$117.00 x 2',
      'ar': '117.00 دولارًا × 2',
      'es': '\$117.00 x 2',
      'fr': '117,00 \$ x 2',
      'zh_Hans': '117.00 美元 x 2',
    },
    'eb8qw7cn': {
      'en':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
      'ar':
          'تيشيرت رياضي رجالي بدون أكمام\nرمادي داكن/فضي مطفي/رمادي فاتح/أسود',
      'es': 'Camiseta deportiva sin mangas para hombre',
      'fr':
          'Débardeur de fitness pour homme\n\nGris délavé/Argent mat/Chiné/Noir',
      'zh_Hans': '男士无袖健身T恤\n\n浅灰色/银色/麻灰色/黑色',
    },
    '6yjv5dx3': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    'mn60iizb': {
      'en': 'Neon Museum',
      'ar': 'متحف النيون',
      'es': 'Museo del neón',
      'fr': 'Musée du Néon',
      'zh_Hans': '霓虹灯博物馆',
    },
    'zm0mhufm': {
      'en': 'Size: ',
      'ar': 'مقاس:',
      'es': 'Tamaño:',
      'fr': 'Taille:',
      'zh_Hans': '尺寸：',
    },
    '7itnicha': {
      'en': '12',
      'ar': '12',
      'es': '12',
      'fr': '12',
      'zh_Hans': '12',
    },
    's1678uqr': {
      'en': '\$20.00 x 2',
      'ar': '20.00 دولارًا × 2',
      'es': '\$20.00 x 2',
      'fr': '20,00 \$ x 2',
      'zh_Hans': '20.00 美元 x 2',
    },
    'rlsiqyx7': {
      'en':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
      'ar':
          'تيشيرت رياضي رجالي بدون أكمام\nرمادي داكن/فضي مطفي/رمادي فاتح/أسود',
      'es': 'Camiseta deportiva sin mangas para hombre',
      'fr':
          'Débardeur de fitness pour homme\n\nGris délavé/Argent mat/Chiné/Noir',
      'zh_Hans': '男士无袖健身T恤\n\n浅灰色/银色/麻灰色/黑色',
    },
    'z4x7oyrr': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    'oi2tu9zh': {
      'en': 'Welcome to Faboulous Las Vegas Sign',
      'ar': 'مرحباً بكم في لافتة لاس فيغاس الرائعة',
      'es': 'Bienvenido al fabuloso letrero de Las Vegas',
      'fr': 'Bienvenue à Faboulous Las Vegas',
      'zh_Hans': '欢迎来到拉斯维加斯壮丽的标志',
    },
    'u9mhnb6f': {
      'en': 'Size: ',
      'ar': 'مقاس:',
      'es': 'Tamaño:',
      'fr': 'Taille:',
      'zh_Hans': '尺寸：',
    },
    'fubqsdk2': {
      'en': '12',
      'ar': '12',
      'es': '12',
      'fr': '12',
      'zh_Hans': '12',
    },
    'o8r0npoo': {
      'en': '\$0.00',
      'ar': '0.00 دولار',
      'es': '\$0.00',
      'fr': '0,00 \$',
      'zh_Hans': '0.00 美元',
    },
    '57vznjlz': {
      'en':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
      'ar':
          'تيشيرت رياضي رجالي بدون أكمام\nرمادي داكن/فضي مطفي/رمادي فاتح/أسود',
      'es': 'Camiseta deportiva sin mangas para hombre',
      'fr':
          'Débardeur de fitness pour homme\n\nGris délavé/Argent mat/Chiné/Noir',
      'zh_Hans': '男士无袖健身T恤\n\n浅灰色/银色/麻灰色/黑色',
    },
    'm284tu91': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    'az7jpt5k': {
      'en': 'Blue Man Group',
      'ar': 'فرقة بلو مان',
      'es': 'Grupo Blue Man',
      'fr': 'Groupe Blue Man',
      'zh_Hans': '蓝人组合',
    },
    '0am6ixgr': {
      'en': 'Size: ',
      'ar': 'مقاس:',
      'es': 'Tamaño:',
      'fr': 'Taille:',
      'zh_Hans': '尺寸：',
    },
    '9jyzal63': {
      'en': '12',
      'ar': '12',
      'es': '12',
      'fr': '12',
      'zh_Hans': '12',
    },
    '0v9hxhay': {
      'en': '\$97.00 x 2',
      'ar': '97.00 دولارًا × 2',
      'es': '\$97.00 x 2',
      'fr': '97,00 \$ x 2',
      'zh_Hans': '97.00 美元 x 2',
    },
    'tdun9bud': {
      'en':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
      'ar':
          'تيشيرت رياضي رجالي بدون أكمام\nرمادي داكن/فضي مطفي/رمادي فاتح/أسود',
      'es': 'Camiseta deportiva sin mangas para hombre',
      'fr':
          'Débardeur de fitness pour homme\n\nGris délavé/Argent mat/Chiné/Noir',
      'zh_Hans': '男士无袖健身T恤\n\n浅灰色/银色/麻灰色/黑色',
    },
    'p86ik3d8': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    'lbptnuji': {
      'en': 'Tiesto',
      'ar': 'تيستو',
      'es': 'Tiesto',
      'fr': 'Tiesto',
      'zh_Hans': '铁斯托',
    },
    'tx6ilvvw': {
      'en': 'Size: ',
      'ar': 'مقاس:',
      'es': 'Tamaño:',
      'fr': 'Taille:',
      'zh_Hans': '尺寸：',
    },
    'w5cd3to3': {
      'en': '12',
      'ar': '12',
      'es': '12',
      'fr': '12',
      'zh_Hans': '12',
    },
    'oqjgxrgh': {
      'en': '\$70.00 x 2',
      'ar': '70.00 دولارًا × 2',
      'es': '\$70.00 x 2',
      'fr': '70,00 \$ x 2',
      'zh_Hans': '70.00 美元 x 2',
    },
    '4a8aesuy': {
      'en':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
      'ar':
          'تيشيرت رياضي رجالي بدون أكمام\nرمادي داكن/فضي مطفي/رمادي فاتح/أسود',
      'es': 'Camiseta deportiva sin mangas para hombre',
      'fr':
          'Débardeur de fitness pour homme\n\nGris délavé/Argent mat/Chiné/Noir',
      'zh_Hans': '男士无袖健身T恤\n\n浅灰色/银色/麻灰色/黑色',
    },
    'g3bg6znl': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    '55c4oaz7': {
      'en': 'Booking Summary',
      'ar': 'ملخص الحجز',
      'es': 'Resumen de la reserva',
      'fr': 'Résumé de la réservation',
      'zh_Hans': '预订概要',
    },
    '2p3vzofl': {
      'en': 'Below is a list of your items.',
      'ar': 'فيما يلي قائمة بمحتوياتك.',
      'es': 'A continuación se muestra una lista de sus artículos.',
      'fr': 'Vous trouverez ci-dessous la liste de vos articles.',
      'zh_Hans': '以下是您的物品清单。',
    },
    'dk6fwqj6': {
      'en': 'Price Breakdown',
      'ar': 'تفاصيل السعر',
      'es': 'Desglose de precios',
      'fr': 'Détail des prix',
      'zh_Hans': '价格明细',
    },
    'rbjchubw': {
      'en': 'Base Price',
      'ar': 'السعر الأساسي',
      'es': 'Precio base',
      'fr': 'Prix ​​de base',
      'zh_Hans': '基价',
    },
    'f90buf2y': {
      'en': '\$856.00',
      'ar': '856.00 دولارًا',
      'es': '\$856.00',
      'fr': '856,00 \$',
      'zh_Hans': '856.00美元',
    },
    'ihl83vjl': {
      'en': 'Taxes',
      'ar': 'الضرائب',
      'es': 'impuestos',
      'fr': 'Impôts',
      'zh_Hans': '税收',
    },
    '9voyn6vf': {
      'en': '\$73.62',
      'ar': '73.62 دولارًا',
      'es': '\$73.62',
      'fr': '73,62 \$',
      'zh_Hans': '73.62美元',
    },
    '78tk68c4': {
      'en': 'Service Fee',
      'ar': 'رسوم الخدمة',
      'es': 'Tarifa de servicio',
      'fr': 'Frais de service',
      'zh_Hans': '服务费',
    },
    'omxako27': {
      'en': '\$40.00',
      'ar': '40.00 دولارًا',
      'es': '\$40.00',
      'fr': '40,00 \$',
      'zh_Hans': '40.00美元',
    },
    '8uod81hy': {
      'en': 'Total',
      'ar': 'المجموع',
      'es': 'Total',
      'fr': 'Total',
      'zh_Hans': '全部的',
    },
    '9lxm2whl': {
      'en': '\$969.62',
      'ar': '969.62 دولارًا',
      'es': '\$969.62',
      'fr': '969,62 \$',
      'zh_Hans': '969.62美元',
    },
    '22yxumd1': {
      'en': 'Continue to Book',
      'ar': 'تابع الحجز',
      'es': 'Continuar con el libro',
      'fr': 'Continuer la réservation',
      'zh_Hans': '继续预订',
    },
    '0o2ihhnw': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // PlanYourTrip
  {
    'swet2rlp': {
      'en': 'User1234',
      'ar': 'المستخدم 1234',
      'es': 'Usuario1234',
      'fr': 'Utilisateur1234',
      'zh_Hans': '用户1234',
    },
    'u9mj8ktr': {
      'en': 'Share',
      'ar': 'يشارك',
      'es': 'Compartir',
      'fr': 'Partager',
      'zh_Hans': '分享',
    },
    'ddg734z7': {
      'en': 'Like ChatGPT.\nBut for your Travel needs.',
      'ar': 'مثل ChatGPT.\nولكن لتلبية احتياجاتك أثناء السفر.',
      'es': 'Como ChatGPT.\n\nPero para tus necesidades de viaje.',
      'fr': 'Comme ChatGPT.\n\nMais pour vos besoins de voyage.',
      'zh_Hans': '类似 ChatGPT。\n\n但满足您的旅行需求。',
    },
    'lq3pjf4y': {
      'en': 'Hi, I\'m Kitravia. I will be your AI travel agent.',
      'ar': 'مرحباً، أنا كيترافيا. سأكون وكيل سفرك الآلي.',
      'es':
          'Hola, soy Kitravia. Seré tu agente de viajes con inteligencia artificial.',
      'fr':
          'Bonjour, je suis Kitravia. Je serai votre agent de voyages tout compris.',
      'zh_Hans': '您好，我是Kitravia，我将是您的AI旅行顾问。',
    },
    'adhllusd': {
      'en':
          'Not sure where to start? Tell me where you want to go? What\'s your budget? Is there something specific you\'d like to do? Do you need a rental car? We’ll guide you through the booking process!',
      'ar':
          'لست متأكدًا من أين تبدأ؟ أخبرنا أين تريد الذهاب؟ ما هي ميزانيتك؟ هل هناك شيء محدد ترغب في القيام به؟ هل تحتاج إلى استئجار سيارة؟ سنرشدك خلال عملية الحجز!',
      'es':
          '¿No sabes por dónde empezar? ¿Adónde quieres ir? ¿Cuál es tu presupuesto? ¿Hay algo en particular que te gustaría hacer? ¿Necesitas alquilar un coche? ¡Te guiaremos durante todo el proceso de reserva!',
      'fr':
          'Vous ne savez pas par où commencer ? Dites-nous où vous souhaitez aller. Quel est votre budget ? Avez-vous des envies particulières ? Avez-vous besoin d’une voiture de location ? Nous vous accompagnerons tout au long de la réservation !',
      'zh_Hans': '不知道从哪里开始？告诉我你想去哪里？你的预算是多少？有什么特别想体验的活动吗？需要租车吗？我们会指导你完成预订流程！',
    },
    'f51ejz87': {
      'en':
          'KiTravia can make mistakes. Double check important information before completing booking transaction.',
      'ar':
          'قد يرتكب موقع KiTravia أخطاءً. لذا، يُرجى التحقق من المعلومات المهمة قبل إتمام عملية الحجز.',
      'es':
          'KiTravia puede cometer errores. Verifique cuidadosamente la información importante antes de completar la transacción de reserva.',
      'fr':
          'KiTravia peut commettre des erreurs. Veuillez vérifier attentivement les informations importantes avant de finaliser votre réservation.',
      'zh_Hans': 'KiTravia可能会出错。请在完成预订交易前仔细核对重要信息。',
    },
    '6f0w5wwp': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // PlanYourTripCopy
  {
    'k3ikhuoq': {
      'en': 'User1234',
      'ar': 'المستخدم 1234',
      'es': 'Usuario1234',
      'fr': 'Utilisateur1234',
      'zh_Hans': '用户1234',
    },
    'lv8s4rno': {
      'en': 'Share',
      'ar': 'يشارك',
      'es': 'Compartir',
      'fr': 'Partager',
      'zh_Hans': '分享',
    },
    's3x7omgp': {
      'en': 'Your personalized trip planner for smart travelers.',
      'ar': 'مخطط رحلاتك الشخصي للمسافرين الأذكياء.',
      'es':
          'Tu planificador de viajes personalizado para viajeros inteligentes.',
      'fr':
          'Votre planificateur de voyage personnalisé pour les voyageurs avisés.',
      'zh_Hans': '为精明旅行者量身定制的旅行计划工具。',
    },
    'te91mmyl': {
      'en':
          'Experience stress-free travel planning with Kitravia! Kitravia helps you\nplan incredible local and international trips tailored to your budget',
      'ar':
          'استمتع بتجربة تخطيط سفر خالية من التوتر مع كيترافيا! ​​تساعدك كيترافيا على\n\nتخطيط رحلات محلية ودولية رائعة مصممة خصيصًا لتناسب ميزانيتك',
      'es':
          '¡Planifica tus viajes sin estrés con Kitravia! Kitravia te ayuda a planificar increíbles viajes locales e internacionales adaptados a tu presupuesto.',
      'fr':
          'Planifiez vos voyages en toute sérénité avec Kitravia ! Kitravia vous aide à\norganiser des voyages incroyables, en France et à l\'étranger, adaptés à votre budget.',
      'zh_Hans': 'Kitravia 让您轻松规划旅行！Kitravia 帮助您\n\n规划精彩的本地和国际旅行，并根据您的预算量身定制。',
    },
    'cyzw4tlt': {
      'en':
          'Discover top destinations, cheap flights, accommodations, activities, tour packages, car rentals, and more! Travel like a pro',
      'ar':
          'اكتشف أفضل الوجهات، وأرخص الرحلات الجوية، وأماكن الإقامة، والأنشطة، وباقات الرحلات السياحية، وتأجير السيارات، والمزيد! سافر كالمحترفين',
      'es':
          '¡Descubre los mejores destinos, vuelos baratos, alojamientos, actividades, paquetes turísticos, alquiler de coches y mucho más! Viaja como un profesional.',
      'fr':
          'Découvrez les meilleures destinations, les vols pas chers, les hébergements, les activités, les circuits touristiques, les locations de voitures et bien plus encore ! Voyagez comme un pro !',
      'zh_Hans': '探索热门目的地、特价机票、住宿、活动、旅游套餐、租车服务等等！像专业人士一样旅行',
    },
    '5ctgvaio': {
      'en':
          'KiTravia can make mistakes. Double check important information before completing booking transaction.',
      'ar':
          'قد يرتكب موقع KiTravia أخطاءً. لذا، يُرجى التحقق من المعلومات المهمة قبل إتمام عملية الحجز.',
      'es':
          'KiTravia puede cometer errores. Verifique cuidadosamente la información importante antes de completar la transacción de reserva.',
      'fr':
          'KiTravia peut commettre des erreurs. Veuillez vérifier attentivement les informations importantes avant de finaliser votre réservation.',
      'zh_Hans': 'KiTravia可能会出错。请在完成预订交易前仔细核对重要信息。',
    },
    'xbdnygde': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // HomeCopy
  {
    'fkm40567': {
      'en': 'AI Travel & Booking Platform',
      'ar': 'منصة سفر وحجز تعتمد على الذكاء الاصطناعي',
      'es': 'Plataforma de viajes y reservas con IA',
      'fr': 'Plateforme de voyage et de réservation basée sur l\'IA',
      'zh_Hans': 'AI旅行与预订平台',
    },
    'lc28w8bx': {
      'en': '|     Travel Smarter. Live Freer.     ',
      'ar': 'سافر بذكاء. عش بحرية أكبر.',
      'es': 'Viaja de forma más inteligente. Vive con más libertad.',
      'fr': 'Voyagez plus intelligemment. Vivez plus librement.',
      'zh_Hans': '更智能地旅行，更自由地生活。',
    },
    'b57df2b2': {
      'en':
          'Discover a world designed by AI — where we find \nyour perfect flights, stays, and adventures before anyone else.',
      'ar':
          'اكتشف عالماً صممه الذكاء الاصطناعي — حيث نجد لك رحلاتك وإقاماتك ومغامراتك المثالية قبل أي شخص آخر.',
      'es':
          'Descubre un mundo diseñado por IA, donde encontramos tus vuelos, estancias y aventuras perfectas antes que nadie.',
      'fr':
          'Découvrez un monde conçu par l\'IA — où nous trouvons\n\nvos vols, séjours et aventures parfaits avant tout le monde.',
      'zh_Hans': '探索人工智能设计的世界——我们抢先一步为您找到最完美的航班、住宿和探险之旅。',
    },
    'oy2wzto8': {
      'en': 'Like ChatGPT.\nBut for your Travel needs.',
      'ar': 'مثل ChatGPT.\nلكن لتلبية احتياجاتك أثناء السفر.',
      'es': 'Como ChatGPT.\n\nPero para tus necesidades de viaje.',
      'fr': 'Comme ChatGPT.\n\nMais pour vos besoins de voyage.',
      'zh_Hans': '类似 ChatGPT。\n\n但满足您的旅行需求。',
    },
    'yjvia913': {
      'en': 'Hi, I\'m Kitravia. I will be your AI travel agent.',
      'ar': 'مرحباً، أنا كيترافيا. سأكون وكيل سفرك الآلي.',
      'es':
          'Hola, soy Kitravia. Seré tu agente de viajes con inteligencia artificial.',
      'fr':
          'Bonjour, je suis Kitravia. Je serai votre agent de voyages tout compris.',
      'zh_Hans': '您好，我是Kitravia，我将是您的AI旅行顾问。',
    },
    '5lr3qymt': {
      'en':
          '\nNot sure where to start? Tell me where you want to go? What\'s your budget? Is there something specific you\'d like to do? Do you need a rental car? We’ll guide you through the booking process!',
      'ar':
          'لست متأكدًا من أين تبدأ؟ أخبرنا أين تريد الذهاب؟ ما هي ميزانيتك؟ هل هناك شيء محدد ترغب في القيام به؟ هل تحتاج إلى استئجار سيارة؟ سنرشدك خلال عملية الحجز!',
      'es':
          '¿No sabes por dónde empezar? ¿Adónde quieres ir? ¿Cuál es tu presupuesto? ¿Hay algo en particular que te gustaría hacer? ¿Necesitas alquilar un coche? ¡Te guiaremos durante todo el proceso de reserva!',
      'fr':
          'Vous ne savez pas par où commencer ? Dites-nous où vous souhaitez aller. Quel est votre budget ? Avez-vous des envies particulières ? Avez-vous besoin d’une voiture de location ? Nous vous accompagnerons tout au long de la réservation !',
      'zh_Hans': '不知道从哪里开始？告诉我你想去哪里？你的预算是多少？有什么特别想体验的活动吗？需要租车吗？我们会指导你完成预订流程！',
    },
    'r1lasbuh': {
      'en':
          'Discover smarter travel with Kitravia AI \nand experiences tailored to you, in seconds. \n',
      'ar':
          'اكتشف تجربة سفر أكثر ذكاءً مع تقنية الذكاء الاصطناعي من Kitravia\n\nوتجارب مصممة خصيصاً لك، في ثوانٍ.',
      'es':
          'Descubre viajes más inteligentes con la IA de Kitravia y experiencias personalizadas para ti, en segundos.',
      'fr':
          'Découvrez des voyages plus intelligents grâce à l\'IA de Kitravia\n\net des expériences personnalisées en quelques secondes.',
      'zh_Hans': '借助 Kitravia AI，探索更智能的旅行方式，并在几秒钟内获得为您量身定制的体验。',
    },
    'kuk3kwrd': {
      'en': '🌍 Global Flights & Hotels,\n Perfectly Personalized for You',
      'ar': '🌍 رحلات طيران وفنادق عالمية،\n\nمصممة خصيصاً لك',
      'es':
          '🌍 Vuelos y hoteles internacionales,\n\nPerfectamente personalizados para ti',
      'fr':
          '🌍 Vols et hôtels internationaux,\n\nParfaitement personnalisés pour vous',
      'zh_Hans': '🌍 全球航班和酒店，\n\n为您量身定制',
    },
    'wy8nyb2o': {
      'en':
          'Experience seamless travel with Kitravia’s AI Travel Agent, curating destinations, stays, and adventures that match your unique style.',
      'ar':
          'استمتع بتجربة سفر سلسة مع وكيل السفر المدعوم بالذكاء الاصطناعي من Kitravia، والذي يقوم بتنسيق الوجهات والإقامات والمغامرات التي تتناسب مع أسلوبك الفريد.',
      'es':
          'Disfruta de viajes sin complicaciones con el agente de viajes con IA de Kitravia, que selecciona destinos, alojamientos y aventuras que se adaptan a tu estilo único.',
      'fr':
          'Vivez une expérience de voyage sans faille grâce à l\'agent de voyage IA de Kitravia, qui sélectionne des destinations, des séjours et des aventures correspondant à votre style unique.',
      'zh_Hans': 'Kitravia 的 AI 旅行助手可为您量身定制符合您独特风格的目的地、住宿和探险活动，让您享受无缝旅行体验。',
    },
    '928hnmq1': {
      'en': '✈️ Flights from 500+ Airlines — Found in Seconds',
      'ar': '✈️ رحلات طيران من أكثر من 500 شركة طيران — تجدها في ثوانٍ',
      'es': '✈️ Vuelos de más de 500 aerolíneas: ¡encuéntralos en segundos!',
      'fr':
          '✈️ Vols de plus de 500 compagnies aériennes — Trouvez-les en quelques secondes',
      'zh_Hans': '✈️ 查询来自 500 多家航空公司的航班——秒速找到',
    },
    'odfdp9jn': {
      'en':
          'Our AI Travel Agent scans hundreds of airlines instantly to bring you the best fares, from the most affordable to the fastest routes — all tailored to your travel style.',
      'ar':
          'يقوم وكيل السفر المدعوم بالذكاء الاصطناعي لدينا بمسح مئات شركات الطيران على الفور ليقدم لك أفضل الأسعار، بدءًا من الأقل تكلفة وحتى أسرع الطرق - وكلها مصممة خصيصًا لأسلوب سفرك.',
      'es':
          'Nuestro agente de viajes con inteligencia artificial analiza al instante cientos de aerolíneas para ofrecerte las mejores tarifas, desde las rutas más económicas hasta las más rápidas, todo ello adaptado a tu estilo de viaje.',
      'fr':
          'Notre agent de voyages IA analyse instantanément des centaines de compagnies aériennes pour vous proposer les meilleurs tarifs, des itinéraires les plus abordables aux plus rapides, le tout adapté à votre style de voyage.',
      'zh_Hans':
          '我们的AI旅行代理可立即扫描数百家航空公司，为您提供最优惠的价格，从最经济实惠的航线到最快捷的路线——所有这一切都根据您的旅行方式量身定制。',
    },
    'va26gb7k': {
      'en': '🏨 Stay at 1,000+ Hotels Worldwide',
      'ar': '🏨 أقم في أكثر من 1000 فندق حول العالم',
      'es': '🏨 Hospédese en más de 1000 hoteles en todo el mundo.',
      'fr': '🏨 Séjournez dans plus de 1 000 hôtels à travers le monde',
      'zh_Hans': '🏨 入住全球 1000 多家酒店',
    },
    'sq9z3l1h': {
      'en':
          'Discover a curated selection of luxury, boutique, and budget-friendly stays.\nOur partners with trusted hotels across the globe to offer the perfect stay — for every traveler and every budget.',
      'ar':
          'اكتشف مجموعة مختارة بعناية من أماكن الإقامة الفاخرة، والبوتيكية، والاقتصادية.\nنتعاون مع فنادق موثوقة حول العالم لنقدم لك الإقامة المثالية التي تناسب جميع المسافرين وميزانياتهم.',
      'es':
          'Descubre una cuidada selección de alojamientos de lujo, boutique y económicos.\n\nColaboramos con hoteles de confianza en todo el mundo para ofrecerte la estancia perfecta, para cada viajero y cada presupuesto.',
      'fr':
          'Découvrez une sélection d\'hébergements de luxe, de charme et à prix abordables.\n\nNos partenaires hôteliers de confiance à travers le monde vous proposent le séjour idéal, quel que soit votre budget ou vos envies.',
      'zh_Hans':
          '探索我们精心挑选的豪华、精品和经济型酒店。\n\n我们与全球各地值得信赖的酒店合作，为每位旅行者和每种预算提供完美的住宿体验。',
    },
    'hkiz1a6w': {
      'en': '🚗 Car Rentals Made Effortless',
      'ar': '🚗 تأجير السيارات أصبح سهلاً',
      'es': '🚗 Alquiler de coches sin complicaciones',
      'fr': '🚗 Location de voitures simplifiée',
      'zh_Hans': '🚗 轻松租车',
    },
    'f6pouibs': {
      'en':
          'From city rides to countryside escapes, our smart system compares top car rental providers to ensure the best prices, flexible options, and smooth journeys.',
      'ar':
          'من الرحلات داخل المدينة إلى الرحلات الريفية، يقوم نظامنا الذكي بمقارنة أفضل شركات تأجير السيارات لضمان أفضل الأسعار والخيارات المرنة والرحلات السلسة.',
      'es':
          'Desde trayectos por la ciudad hasta escapadas al campo, nuestro sistema inteligente compara a los principales proveedores de alquiler de coches para garantizar los mejores precios, opciones flexibles y viajes sin contratiempos.',
      'fr':
          'Des trajets en ville aux escapades à la campagne, notre système intelligent compare les meilleurs loueurs de voitures pour vous garantir les meilleurs prix, des options flexibles et des voyages sans encombre.',
      'zh_Hans': '从城市出行到乡村度假，我们的智能系统会比较各大租车供应商，以确保最优惠的价格、灵活的选择和顺畅的旅程。',
    },
    'tc0c11vf': {
      'en': '🛳️ Cruises & Voyages Beyond Imagination',
      'ar': '🛳️ رحلات بحرية ورحلات تتجاوز الخيال',
      'es': '🛳️ Cruceros y viajes que superan la imaginación',
      'fr': '🛳️ Croisières et voyages au-delà de l\'imagination',
      'zh_Hans': '🛳️ 超越想象的邮轮与航行',
    },
    'db6mje12': {
      'en':
          'Set sail with exclusive cruise deals and AI-personalized itineraries across oceans, rivers, and islands — turning your next voyage into an unforgettable experience.',
      'ar':
          'انطلق في رحلة بحرية مع عروض حصرية وخطط رحلات مخصصة بالذكاء الاصطناعي عبر المحيطات والأنهار والجزر - لتحويل رحلتك القادمة إلى تجربة لا تُنسى.',
      'es':
          'Zarpa con ofertas exclusivas de cruceros e itinerarios personalizados mediante inteligencia artificial a través de océanos, ríos e islas, convirtiendo tu próximo viaje en una experiencia inolvidable.',
      'fr':
          'Larguez les amarres grâce à des offres de croisières exclusives et des itinéraires personnalisés par l\'IA à travers les océans, les fleuves et les îles — transformant votre prochain voyage en une expérience inoubliable.',
      'zh_Hans': '扬帆起航，享受专属邮轮优惠和人工智能个性化行程，畅游海洋、河流和岛屿——让您的下一次航行成为一段难忘的体验。',
    },
    'w9a7byzw': {
      'en':
          '🛳️ Cruises & Voyages Beyond Imagination\nSet sail with exclusive cruise deals and AI-personalized itineraries across oceans, rivers, and islands — turning your next voyage into an unforgettable experience.',
      'ar':
          '🛳️ رحلات بحرية تتجاوز الخيال\nانطلق في رحلة بحرية مع عروض حصرية وخطط رحلات مصممة خصيصاً لك بواسطة الذكاء الاصطناعي عبر المحيطات والأنهار والجزر - لتحويل رحلتك القادمة إلى تجربة لا تُنسى.',
      'es':
          '🛳️ Cruceros y viajes que superan la imaginación\nZarpa con ofertas exclusivas de cruceros e itinerarios personalizados con IA a través de océanos, ríos e islas, convirtiendo tu próximo viaje en una experiencia inolvidable.',
      'fr':
          '🛳️ Croisières et voyages au-delà de l\'imagination\n\nLarguez les amarres grâce à des offres de croisières exclusives et des itinéraires personnalisés par l\'IA à travers les océans, les fleuves et les îles — transformant votre prochain voyage en une expérience inoubliable.',
      'zh_Hans':
          '🛳️ 超越想象的邮轮之旅\n\n扬帆起航，享受专属邮轮优惠和人工智能个性化行程，畅游海洋、河流和岛屿——让您的下一次航行成为一段难忘的体验。',
    },
    'zmwpivul': {
      'en': 'Our Partners',
      'ar': 'شركاؤنا',
      'es': 'Nuestros socios',
      'fr': 'Nos partenaires',
      'zh_Hans': '我们的合作伙伴',
    },
    'my1axl9k': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // PrivacyPolicy
  {
    'h21v6let': {
      'en': 'PRIVACY POLICY',
      'ar': 'سياسة الخصوصية',
      'es': 'POLÍTICA DE PRIVACIDAD',
      'fr': 'POLITIQUE DE CONFIDENTIALITÉ',
      'zh_Hans': '隐私政策',
    },
    'v2fov6zp': {
      'en': 'Effective Date: March 2026',
      'ar':
          'تاريخ السريان: مارس 2026 | الجهة المسؤولة: كيترافيا | للتواصل: privacy@kitravia.com',
      'es':
          'Fecha de entrada en vigor: marzo de 2026 | Responsable del tratamiento: Kitravia | Contacto: privacy@kitravia.com',
      'fr':
          'Date d\'entrée en vigueur : mars 2026 | Responsable du traitement : Kitravia | Contact : privacy@kitravia.com',
      'zh_Hans': '生效日期：2026年3月 | 数据控制方：Kitravia | 联系方式：privacy@kitravia.com',
    },
    'etxs43gj': {
      'en': '1. Introduction & Scope',
      'ar': '1. مقدمة ونطاق',
      'es': '1. Introducción y alcance',
      'fr': '1. Introduction et portée',
      'zh_Hans': '1. 引言与范围',
    },
    '7h5bpt1g': {
      'en':
          'Kitravia (\'we\', \'our\', \'us\') is committed to protecting your personal information and your right to privacy. This Privacy Policy applies to all users of the Kitravia platform — Admins, Business Partners, Affiliates, registered Users, and unregistered Visitors — across our web portal, mobile applications (iOS and Android), and API services.',
      'ar':
          'تلتزم شركة Kitravia (\"نحن\"، \"لنا\") بحماية معلوماتك الشخصية وحقك في الخصوصية. تسري سياسة الخصوصية هذه على جميع مستخدمي منصة Kitravia - من مشرفين وشركاء أعمال وشركات تابعة ومستخدمين مسجلين وزوار غير مسجلين - عبر بوابتنا الإلكترونية وتطبيقاتنا للهواتف المحمولة (iOS وAndroid) وخدمات واجهة برمجة التطبيقات (API).',
      'es':
          'Kitravia («nosotros», «nuestro», «nos») se compromete a proteger su información personal y su derecho a la privacidad. Esta Política de Privacidad se aplica a todos los usuarios de la plataforma Kitravia —administradores, socios comerciales, afiliados, usuarios registrados y visitantes no registrados— en nuestro portal web, aplicaciones móviles (iOS y Android) y servicios API.',
      'fr':
          'Kitravia (« nous », « notre », « nos ») s’engage à protéger vos données personnelles et votre droit à la vie privée. La présente Politique de confidentialité s’applique à tous les utilisateurs de la plateforme Kitravia — administrateurs, partenaires commerciaux, affiliés, utilisateurs enregistrés et visiteurs non enregistrés — sur notre portail web, nos applications mobiles (iOS et Android) et nos services API.',
      'zh_Hans':
          'Kitravia（以下简称“我们”）致力于保护您的个人信息和隐私权。本隐私政策适用于Kitravia平台的所有用户，包括管理员、业务合作伙伴、联盟会员、注册用户和非注册访客，涵盖我们的网站门户、移动应用程序（iOS和Android）以及API服务。',
    },
    'b3y2bt88': {
      'en': '2. Data We Collect',
      'ar': '2. البيانات التي نجمعها',
      'es': '2. Datos que recopilamos',
      'fr': '2. Données que nous collectons',
      'zh_Hans': '2. 我们收集的数据',
    },
    'rjl2yjvf': {
      'en': '2.1 Data You Provide',
      'ar': '2.1 البيانات التي تقدمها',
      'es': '2.1 Datos que usted proporciona',
      'fr': '2.1 Données que vous fournissez',
      'zh_Hans': '2.1 您提供的数据',
    },
    'ymu1ncf4': {
      'en':
          '- Account data: name, email, phone, password, and profile preferences (applies to Admin, Business, User profiles).\n- Travel preferences: destinations, dates, budgets, accommodation, dining, and transport preferences.\n- Business data: company name, VAT number, API credentials, and partnership agreement details (Business profile).\n- Payment data: processed securely via PCI DSS-compliant processors. We never store raw card data.\n- Communications: messages to our AI Assistant, support team, or partner managers.\n- User content: photos, reviews, travel journals, and AI eBook materials you create or upload.',
      'ar':
          '- بيانات الحساب: الاسم، البريد الإلكتروني، رقم الهاتف، كلمة المرور، وتفضيلات الملف الشخصي (ينطبق على ملفات تعريف المسؤولين، والشركات، والمستخدمين).\n\n- تفضيلات السفر: الوجهات، التواريخ، الميزانية، أماكن الإقامة، المطاعم، ووسائل النقل المفضلة.\n\n- بيانات الشركات: اسم الشركة، رقم ضريبة القيمة المضافة، بيانات اعتماد واجهة برمجة التطبيقات (API)، وتفاصيل اتفاقية الشراكة (ملف تعريف الشركات).\n\n- بيانات الدفع: تتم معالجتها بأمان عبر معالجات متوافقة مع معايير PCI DSS. لا نقوم بتخزين بيانات البطاقات الخام مطلقًا.\n\n- التواصل: الرسائل الموجهة إلى مساعدنا الذكي، أو فريق الدعم، أو مديري الشركاء.\n\n- محتوى المستخدم: الصور، والتقييمات، ومذكرات السفر، ومواد الكتب الإلكترونية التي تنشئها أو ترفعها.',
      'es':
          '- Datos de la cuenta: nombre, correo electrónico, teléfono, contraseña y preferencias de perfil (aplicable a los perfiles de administrador, empresa y usuario).\n\n- Preferencias de viaje: destinos, fechas, presupuestos, alojamiento, restaurantes y transporte.\n\n- Datos de la empresa: nombre de la empresa, número de IVA, credenciales de API y detalles del acuerdo de colaboración (perfil de empresa).\n\n- Datos de pago: procesados ​​de forma segura mediante procesadores compatibles con PCI DSS. Nunca almacenamos datos brutos de tarjetas.\n\n- Comunicaciones: mensajes a nuestro asistente de IA, equipo de soporte o gestores de socios.\n\n- Contenido del usuario: fotos, reseñas, diarios de viaje y materiales de libros electrónicos de IA que cree o suba.',
      'fr':
          '- Données du compte : nom, adresse e-mail, numéro de téléphone, mot de passe et préférences du profil (pour les profils Administrateur, Entreprise et Utilisateur).\n\n- Préférences de voyage : destinations, dates, budget, hébergement, restauration et transports.\n\n- Données de l’entreprise : nom de l’entreprise, numéro de TVA, identifiants API et détails de l’accord de partenariat (profil Entreprise).\n\n- Données de paiement : traitées de manière sécurisée par des prestataires conformes à la norme PCI DSS. Nous ne conservons jamais les données brutes des cartes bancaires.\n\n- Communications : messages adressés à notre assistant IA, à notre équipe d’assistance ou à nos responsables de partenariat.\n\n- Contenu utilisateur : photos, avis, carnets de voyage et contenus numériques (eBooks) créés ou importés.',
      'zh_Hans':
          '- 账户数据：姓名、邮箱、电话、密码和个人资料偏好（适用于管理员、企业和用户账户）。\n\n- 旅行偏好：目的地、日期、预算、住宿、餐饮和交通偏好。\n\n- 企业数据：公司名称、增值税号、API 凭证和合作协议详情（企业账户）。\n\n- 支付数据：通过符合 PCI DSS 标准的支付处理商安全处理。我们绝不存储原始卡数据。\n\n- 通信：您发送给 AI 助手、支持团队或合作伙伴经理的消息。\n\n- 用户内容：您创建或上传的照片、评论、旅行日志和 AI 电子书资料。',
    },
    'o4fqm90w': {
      'en': '2.2 Data Collected Automatically',
      'ar': '2.2 البيانات التي يتم جمعها تلقائياً',
      'es': '2.2 Datos recopilados automáticamente',
      'fr': '2.2 Données collectées automatiquement',
      'zh_Hans': '2.2 自动收集的数据',
    },
    'ek7hrj1c': {
      'en':
          '- Technical data: IP address, browser type, OS, device identifiers, and session tokens.\n- Usage data: pages visited, features used, search queries, click behavior, booking history.\n- Location data: with your explicit permission, for Smart Radar, local recommendations, and Safety Shield.\n- Affiliate tracking data: referral codes, click-through rates, and conversion data (Business/Affiliate profile).',
      'ar':
          '- البيانات التقنية: عنوان IP، نوع المتصفح، نظام التشغيل، مُعرّفات الجهاز، ورموز الجلسة.\n\n- بيانات الاستخدام: الصفحات التي تمت زيارتها، الميزات المستخدمة، استعلامات البحث، سلوك النقر، سجل الحجوزات.\n\n- بيانات الموقع: بموافقتك الصريحة، لخاصية الرادار الذكي، والتوصيات المحلية، ودرع الأمان.\n\n- بيانات تتبع الشركاء: رموز الإحالة، نسب النقر إلى الظهور، وبيانات التحويل (ملف تعريف النشاط التجاري/الشريك).',
      'es':
          '- Datos técnicos: dirección IP, tipo de navegador, sistema operativo, identificadores de dispositivo y tokens de sesión.\n\n- Datos de uso: páginas visitadas, funciones utilizadas, consultas de búsqueda, comportamiento de clics e historial de reservas.\n\n- Datos de ubicación: con su autorización explícita, para Smart Radar, recomendaciones locales y Safety Shield.\n\n- Datos de seguimiento de afiliados: códigos de referencia, tasas de clics y datos de conversión (perfil de empresa/afiliado).',
      'fr':
          '- Données techniques : adresse IP, type de navigateur, système d’exploitation, identifiants de l’appareil et jetons de session.\n\n- Données d’utilisation : pages consultées, fonctionnalités utilisées, requêtes de recherche, comportement de navigation, historique des réservations.\n\n- Données de géolocalisation : avec votre autorisation explicite, pour Smart Radar, les recommandations locales et Safety Shield.\n\n- Données de suivi des affiliés : codes de parrainage, taux de clics et données de conversion (profil Entreprise/Affilié).',
      'zh_Hans':
          '- 技术数据：IP 地址、浏览器类型、操作系统、设备标识符和会话令牌。\n\n- 使用数据：访问的页面、使用的功能、搜索查询、点击行为、预订历史记录。\n\n- 位置数据：经您明确许可，用于智能雷达、本地推荐和安全防护。\n\n- 联盟营销追踪数据：推荐代码、点击率和转化数据（商家/联盟营销资料）。',
    },
    '6s23j370': {
      'en': '3. How We Use Your Data',
      'ar': '3. كيف نستخدم بياناتك',
      'es': '3. Cómo utilizamos sus datos',
      'fr': '3. Comment nous utilisons vos données',
      'zh_Hans': '3. 我们如何使用您的数据',
    },
    'x1bjhkmi': {
      'en':
          '- Deliver, operate, and improve the Platform and all AI features for all user profiles.\n- Personalize travel recommendations, AI itineraries, error fare alerts, and Smart Radar monitoring.\n- Process bookings, payments, and commission calculations for Business/Affiliate accounts.\n- Send transactional messages, booking confirmations, and service alerts.\n- Provide analytics and performance dashboards to Admin and Business profiles.\n- Comply with legal obligations and enforce our Terms of Service.\n- Detect, prevent, and address fraud, security incidents, and technical issues.',
      'ar':
          '- تقديم وتشغيل وتحسين المنصة وجميع ميزات الذكاء الاصطناعي لجميع ملفات تعريف المستخدمين.\n\n- تخصيص توصيات السفر، وخطط الرحلات المدعومة بالذكاء الاصطناعي، وتنبيهات أخطاء الأسعار، ومراقبة الرادار الذكي.\n\n- معالجة الحجوزات والمدفوعات وحسابات العمولات لحسابات الشركات/الشركاء.\n\n- إرسال رسائل المعاملات وتأكيدات الحجز وتنبيهات الخدمة.\n\n- توفير لوحات معلومات التحليلات والأداء لملفات تعريف المسؤولين والشركات.\n\n- الالتزام بالمتطلبات القانونية وإنفاذ شروط الخدمة.\n\n- اكتشاف ومنع ومعالجة الاحتيال والحوادث الأمنية والمشاكل التقنية.',
      'es':
          '- Implementar, operar y mejorar la plataforma y todas las funciones de IA para todos los perfiles de usuario.\n\n- Personalizar las recomendaciones de viaje, los itinerarios generados por IA, las alertas de errores en las tarifas y el monitoreo del radar inteligente.\n\n- Procesar reservas, pagos y cálculos de comisiones para cuentas de empresas y afiliados.\n\n- Enviar mensajes transaccionales, confirmaciones de reserva y alertas de servicio.\n\n- Proporcionar análisis y paneles de rendimiento a los perfiles de administrador y empresa.\n\n- Cumplir con las obligaciones legales y hacer cumplir nuestros Términos de Servicio.\n\n- Detectar, prevenir y abordar el fraude, los incidentes de seguridad y los problemas técnicos.',
      'fr':
          '- Fournir, exploiter et améliorer la plateforme et toutes les fonctionnalités d\'IA pour tous les profils utilisateurs.\n\n- Personnaliser les recommandations de voyage, les itinéraires IA, les alertes de prix erronés et la surveillance Smart Radar.\n\n- Traiter les réservations, les paiements et les calculs de commissions pour les comptes Business/Affiliés.\n\n- Envoyer des messages transactionnels, des confirmations de réservation et des alertes de service.\n\n- Fournir des tableaux de bord analytiques et de performance aux profils Administrateur et Business.\n\n- Respecter les obligations légales et faire respecter nos Conditions d\'utilisation.\n\n- Détecter, prévenir et résoudre les fraudes, les incidents de sécurité et les problèmes techniques.',
      'zh_Hans':
          '- 为所有用户提供、运营和改进平台及所有人工智能功能。\n\n- 提供个性化的旅行推荐、人工智能行程规划、错误票价提醒和智能雷达监控。\n\n- 处理企业/联盟账户的预订、付款和佣金计算。\n\n- 发送交易信息、预订确认和服务提醒。\n\n- 为管理员和企业账户提供分析和绩效仪表盘。\n\n- 遵守法律义务并执行我们的服务条款。\n\n- 检测、预防和处理欺诈、安全事件和技术问题。',
    },
    'mkiyfbuf': {
      'en': '4. Legal Basis for Processing (GDPR)',
      'ar': '4. الأساس القانوني للمعالجة (اللائحة العامة لحماية البيانات)',
      'es': '4. Base jurídica para el tratamiento de datos (RGPD)',
      'fr': '4. Base juridique du traitement (RGPD)',
      'zh_Hans': '4. 处理的法律依据（GDPR）',
    },
    'hgle26x1': {
      'en': '5. Data Sharing',
      'ar': '5. مشاركة البيانات',
      'es': '5. Intercambio de datos',
      'fr': '5. Partage de données',
      'zh_Hans': '5. 数据共享',
    },
    'ymkfcde9': {
      'en':
          'We do not sell your personal data. We share data only with:\n- Travel suppliers (airlines, hotels, car rental companies, cruise operators) to fulfill bookings.\n- Payment processors for secure transaction processing.\n- Technology partners (cloud, AI, analytics) bound by Data Processing Agreements (DPAs).\n- Business partners and affiliates — only aggregated, anonymized performance data.\n- Legal and regulatory authorities when required by applicable law.',
      'ar':
          'نحن لا نبيع بياناتك الشخصية. نشارك البيانات فقط مع:\n\n- مزودي خدمات السفر (شركات الطيران، الفنادق، شركات تأجير السيارات، منظمي الرحلات البحرية) لإتمام الحجوزات.\n\n- جهات معالجة المدفوعات لضمان معالجة آمنة للمعاملات.\n\n- شركاء التكنولوجيا (الحوسبة السحابية، الذكاء الاصطناعي، التحليلات) الملتزمين باتفاقيات معالجة البيانات.\n\n- شركاء الأعمال والشركات التابعة - بيانات الأداء المجمعة والمجهولة المصدر فقط.\n\n- السلطات القانونية والتنظيمية عند الاقتضاء بموجب القانون المعمول به.',
      'es':
          'No vendemos sus datos personales. Solo compartimos datos con:\n- Proveedores de viajes (aerolíneas, hoteles, empresas de alquiler de coches, operadores de cruceros) para gestionar las reservas.\n\n- Procesadores de pagos para garantizar la seguridad de las transacciones.\n\n- Socios tecnológicos (computación en la nube, IA, análisis de datos) sujetos a acuerdos de procesamiento de datos (APD).\n\n- Socios comerciales y afiliados: solo datos de rendimiento agregados y anonimizados.\n\n- Autoridades legales y reguladoras cuando así lo exija la legislación aplicable.',
      'fr':
          'Nous ne vendons pas vos données personnelles. Nous les partageons uniquement avec :\n\n- Les prestataires de voyages (compagnies aériennes, hôtels, loueurs de voitures, croisiéristes) pour le traitement des réservations.\n\n- Les prestataires de paiement pour la sécurité des transactions.\n\n- Nos partenaires technologiques (cloud, IA, analytique) liés par des accords de traitement des données (ATD).\n\n- Nos partenaires commerciaux et affiliés — uniquement des données de performance agrégées et anonymisées.\n\n- Les autorités légales et réglementaires lorsque la loi applicable l’exige.',
      'zh_Hans':
          '我们不会出售您的个人数据。我们仅与以下各方共享数据：\n\n- 旅行供应商（航空公司、酒店、租车公司、邮轮运营商），用于完成预订。\n\n- 支付处理商，用于安全处理交易。\n\n- 受数据处理协议 (DPA) 约束的技术合作伙伴（云服务、人工智能、分析）。\n\n- 业务合作伙伴和关联公司——仅共享汇总的匿名化绩效数据。\n\n- 根据适用法律的要求，与法律和监管机构共享数据。',
    },
    '1kit5860': {
      'en': '6. Your Rights',
      'ar': '6. حقوقك',
      'es': '6. Sus derechos',
      'fr': '6. Vos droits',
      'zh_Hans': '6. 你的权利',
    },
    '6qaev9l1': {
      'en':
          '- Access: Request a copy of your personal data.\n- Rectification: Correct inaccurate or incomplete data.\n- Erasure (\'Right to be Forgotten\'): Request deletion of your data.\n- Portability: Receive your data in a structured, machine-readable format.\n- Objection / Restriction: Object to or restrict certain processing activities.\n- Withdraw Consent: Revoke consent for marketing, location tracking, or cookies at any time.\n\nSubmit requests to privacy@kitravia.com. We respond within 30 days. EU residents may also lodge a complaint with their national Data Protection Authority.',
      'ar':
          '- الوصول: اطلب نسخة من بياناتك الشخصية.\n\n- التصحيح: صحّح البيانات غير الدقيقة أو الناقصة.\n\n- الحذف (\"الحق في النسيان\"): اطلب حذف بياناتك.\n\n- النقل: استلم بياناتك بصيغة منظمة قابلة للقراءة آليًا.\n\n- الاعتراض/التقييد: اعترض على بعض عمليات المعالجة أو قيّدها.\n\n- سحب الموافقة: اسحب موافقتك على التسويق، أو تتبع الموقع، أو ملفات تعريف الارتباط في أي وقت.\n\nأرسل طلباتك إلى privacy@kitravia.com. نرد خلال 30 يومًا. يحق لسكان الاتحاد الأوروبي أيضًا تقديم شكوى إلى هيئة حماية البيانات الوطنية في بلدهم.',
      'es':
          '- Acceso: Solicite una copia de sus datos personales.\n\n- Rectificación: Corrija datos inexactos o incompletos.\n\n- Supresión («Derecho al olvido»): Solicite la eliminación de sus datos.\n\n- Portabilidad: Reciba sus datos en un formato estructurado y legible por máquina.\n\n- Oposición/Restricción: Opóngase o restrinja determinadas actividades de tratamiento de datos.\n\n- Revocación del consentimiento: Revoque su consentimiento para fines de marketing, seguimiento de ubicación o cookies en cualquier momento.\n\nEnvíe sus solicitudes a privacy@kitravia.com. Le responderemos en un plazo de 30 días. Los residentes de la UE también pueden presentar una reclamación ante su autoridad nacional de protección de datos.',
      'fr':
          '- Accès : Demandez une copie de vos données personnelles.\n\n- Rectification : Corrigez les données inexactes ou incomplètes.\n\n- Effacement (« Droit à l’oubli ») : Demandez la suppression de vos données.\n\n- Portabilité : Recevez vos données dans un format structuré et lisible par machine.\n\n- Opposition / Limitation : Opposez-vous à certains traitements ou limitez-en le traitement.\n\n- Retrait du consentement : Retirez votre consentement au marketing, au suivi de localisation et aux cookies à tout moment.\n\nEnvoyez vos demandes à privacy@kitravia.com. Nous vous répondrons sous 30 jours. Les résidents de l’UE peuvent également déposer une plainte auprès de leur autorité nationale de protection des données.',
      'zh_Hans':
          '- 访问权：请求获取您的个人数据副本。\n\n- 更正权：更正不准确或不完整的数据。\n\n- 删除权（“被遗忘权”）：请求删除您的数据。\n\n- 数据可移植权：以结构化、机器可读格式接收您的数据。\n\n- 反对/限制：反对或限制某些数据处理活动。\n\n- 撤回同意：随时撤回您对营销、位置跟踪或 Cookie 的同意。\n\n请将请求发送至 privacy@kitravia.com。我们将在 30 天内回复。欧盟居民也可向其所在国家/地区的数据保护机构提出投诉。',
    },
    'zp872koz': {
      'en': '7. Data Retention',
      'ar': '7. الاحتفاظ بالبيانات',
      'es': '7. Retención de datos',
      'fr': '7. Conservation des données',
      'zh_Hans': '7. 数据保留',
    },
    'rv9jtqcr': {
      'en':
          'We retain data as long as your account is active or as needed to provide services. Booking data is retained for 7 years for legal/tax compliance. Inactive accounts are deleted after 3 years. You may request earlier deletion at any time.',
      'ar':
          'نحتفظ بالبيانات طالما كان حسابك نشطًا أو حسب الحاجة لتقديم الخدمات. تُحفظ بيانات الحجوزات لمدة 7 سنوات لأغراض الامتثال القانوني والضريبي. تُحذف الحسابات غير النشطة بعد 3 سنوات. يمكنك طلب حذف حسابك قبل ذلك في أي وقت.',
      'es':
          'Conservamos los datos mientras su cuenta esté activa o según sea necesario para prestarle nuestros servicios. Los datos de reserva se conservan durante 7 años por motivos legales y fiscales. Las cuentas inactivas se eliminan después de 3 años. Puede solicitar la eliminación anticipada en cualquier momento.',
      'fr':
          'Nous conservons vos données tant que votre compte est actif ou aussi longtemps que nécessaire pour vous fournir nos services. Les données de réservation sont conservées pendant 7 ans à des fins de conformité légale et fiscale. Les comptes inactifs sont supprimés après 3 ans. Vous pouvez demander une suppression anticipée à tout moment.',
      'zh_Hans':
          '只要您的账户处于活跃状态或为提供服务所必需，我们就会保留您的数据。出于法律/税务合规目的，预订数据将保留 7 年。不活跃账户将在 3 年后删除。您可以随时申请提前删除。',
    },
    'xwvef5d6': {
      'en': '8. International Transfers',
      'ar': '8. التحويلات الدولية',
      'es': '8. Transferencias internacionales',
      'fr': '8. Transferts internationaux',
      'zh_Hans': '8. 国际转账',
    },
    'h1so7kja': {
      'en':
          'Kitravia operates globally. Data may be processed in countries outside your own. For EEA data subjects, we rely on Standard Contractual Clauses (SCCs) approved by the European Commission for international transfers.',
      'ar':
          'تعمل شركة كيترافيا على مستوى العالم. قد تتم معالجة البيانات في دول خارج بلدك. بالنسبة للأفراد الخاضعين لقانون المنطقة الاقتصادية الأوروبية، نعتمد على البنود التعاقدية القياسية المعتمدة من قبل المفوضية الأوروبية فيما يتعلق بعمليات نقل البيانات الدولية.',
      'es':
          'Kitravia opera a nivel global. Los datos pueden procesarse en países fuera del suyo. Para los interesados ​​del EEE, utilizamos las Cláusulas Contractuales Tipo (CCT) aprobadas por la Comisión Europea para transferencias internacionales.',
      'fr':
          'Kitravia opère à l\'échelle mondiale. Vos données peuvent être traitées dans des pays autres que le vôtre. Pour les personnes concernées résidant dans l\'EEE, nous utilisons les clauses contractuelles types (CCT) approuvées par la Commission européenne pour les transferts internationaux.',
      'zh_Hans':
          'Kitravia是一家全球性企业。您的数据可能会在您所在国家/地区以外的国家/地区进行处理。对于欧洲经济区 (EEA) 的数据主体，我们采用欧盟委员会批准的标准合同条款 (SCC) 进行国际数据传输。',
    },
    'ce8zt7v0': {
      'en': '9. Security',
      'ar': '9. الأمن',
      'es': '9. Seguridad',
      'fr': '9. Sécurité',
      'zh_Hans': '9. 安全性',
    },
    'awmw8gff': {
      'en':
          'We implement SSL/TLS encryption, role-based access controls (RBAC for Admin levels), multi-factor authentication, regular penetration testing, and continuous security monitoring. \nDespite these measures, no system is 100% secure. Report suspected security incidents to security@kitravia.com.',
      'ar':
          'نُطبّق تشفير SSL/TLS، وضوابط الوصول القائمة على الأدوار (RBAC لمستويات الإدارة)، والمصادقة متعددة العوامل، واختبارات الاختراق الدورية، والمراقبة الأمنية المستمرة.\n\nمع ذلك، لا يوجد نظام آمن بنسبة 100%. يُرجى الإبلاغ عن أي حوادث أمنية مشتبه بها إلى security@kitravia.com.',
      'es':
          'Implementamos cifrado SSL/TLS, control de acceso basado en roles (RBAC para administradores), autenticación multifactor, pruebas de penetración periódicas y monitorización continua de la seguridad.\nA pesar de estas medidas, ningún sistema es 100% seguro. Informe cualquier incidente de seguridad sospechoso a security@kitravia.com.',
      'fr':
          'Nous utilisons le chiffrement SSL/TLS, le contrôle d\'accès basé sur les rôles (RBAC pour les administrateurs), l\'authentification multifacteur, des tests d\'intrusion réguliers et une surveillance de sécurité continue.\n\nMalgré ces mesures, aucun système n\'est infaillible. Veuillez signaler tout incident de sécurité suspecté à security@kitravia.com.',
      'zh_Hans':
          '我们实施了 SSL/TLS 加密、基于角色的访问控制（管理员级别采用 RBAC）、多因素身份验证、定期渗透测试和持续安全监控。\n\n尽管采取了这些措施，但没有任何系统能够做到 100% 安全。请将可疑的安全事件报告至 security@kitravia.com。',
    },
    'gjjrzsaf': {
      'en': '10.  Children\'s Privacy',
      'ar': '10. خصوصية الأطفال',
      'es': '10. Privacidad de los niños',
      'fr': '10. Protection de la vie privée des enfants',
      'zh_Hans': '10. 儿童隐私',
    },
    'demn9c9t': {
      'en':
          'Kitravia does not knowingly collect data from children under 13 (16 in the EU). If you believe we have collected data from a minor, contact privacy@kitravia.com immediately for prompt deletion.',
      'ar':
          'لا تقوم شركة كيترافيا بجمع بيانات من الأطفال دون سن 13 عامًا (16 عامًا في الاتحاد الأوروبي) عن قصد. إذا كنت تعتقد أننا جمعنا بيانات من قاصر، فيُرجى التواصل معنا فورًا عبر البريد الإلكتروني privacy@kitravia.com لحذفها على الفور.',
      'es':
          'Kitravia no recopila datos de menores de 13 años (16 en la UE) de forma intencionada. Si cree que hemos recopilado datos de un menor, póngase en contacto con privacy@kitravia.com inmediatamente para que los eliminemos lo antes posible.',
      'fr':
          'Kitravia ne collecte pas sciemment de données auprès d\'enfants de moins de 13 ans (16 ans dans l\'UE). Si vous pensez que nous avons collecté des données concernant un mineur, veuillez contacter immédiatement privacy@kitravia.com pour qu\'elles soient supprimées au plus vite.',
      'zh_Hans':
          'Kitravia不会故意收集13岁以下（欧盟为16岁以下）儿童的数据。如果您认为我们收集了未成年人的数据，请立即联系privacy@kitravia.com，以便我们尽快删除。',
    },
    'britsftz': {
      'en': '11. Policy Updates',
      'ar': '11. تحديثات السياسة',
      'es': '11. Actualizaciones de políticas',
      'fr': '11. Mises à jour des politiques',
      'zh_Hans': '11. 政策更新',
    },
    '5korsj96': {
      'en':
          'We notify users of material changes via email and in-app notification with at least 14 days\' notice. Continued use after the effective date constitutes acceptance of the updated policy.',
      'ar':
          'نُخطر المستخدمين بالتغييرات الجوهرية عبر البريد الإلكتروني والإشعارات داخل التطبيق قبل 14 يومًا على الأقل. ويُعدّ استمرار استخدام التطبيق بعد تاريخ سريان التغييرات بمثابة قبول للسياسة المُحدَّثة.',
      'es':
          'Notificamos a los usuarios sobre cambios importantes por correo electrónico y mediante notificaciones en la aplicación con al menos 14 días de antelación. El uso continuado después de la fecha de entrada en vigor implica la aceptación de la política actualizada.',
      'fr':
          'Nous informons les utilisateurs des modifications importantes par e-mail et via une notification intégrée à l\'application, avec un préavis d\'au moins 14 jours. La poursuite de l\'utilisation après la date d\'entrée en vigueur vaut acceptation de la politique mise à jour.',
      'zh_Hans': '我们会通过电子邮件和应用内通知的方式，至少提前 14 天告知用户重大变更。在生效日期后继续使用即表示您接受更新后的政策。',
    },
    'wirmcawt': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // TermsConditions
  {
    'ypsm3ep8': {
      'en': 'TERMS & CONDITIONS',
      'ar': 'الشروط والأحكام',
      'es': 'TÉRMINOS Y CONDICIONES',
      'fr': 'CONDITIONS GÉNÉRALES',
      'zh_Hans': '条款及细则',
    },
    'cra8cv52': {
      'en': 'Effective Date: March 2026',
      'ar':
          'تاريخ السريان: مارس 2026 | الجهة المسؤولة: كيترافيا | للتواصل: privacy@kitravia.com',
      'es':
          'Fecha de entrada en vigor: marzo de 2026 | Responsable del tratamiento: Kitravia | Contacto: privacy@kitravia.com',
      'fr':
          'Date d\'entrée en vigueur : mars 2026 | Responsable du traitement : Kitravia | Contact : privacy@kitravia.com',
      'zh_Hans': '生效日期：2026年3月 | 数据控制方：Kitravia | 联系方式：privacy@kitravia.com',
    },
    'eba8ju5x': {
      'en': '1. Acceptance',
      'ar': '1. القبول',
      'es': '1. Aceptación',
      'fr': '1. Acceptation',
      'zh_Hans': '1. 接受',
    },
    'jbdnfliq': {
      'en':
          'By accessing or using the Kitravia platform (web, mobile, or API), you agree to these Terms & Conditions and our Privacy Policy. If you do not agree, you may not use the Platform.',
      'ar':
          'بالوصول إلى منصة Kitravia أو استخدامها (عبر الويب أو الهاتف المحمول أو واجهة برمجة التطبيقات)، فإنك توافق على هذه الشروط والأحكام وسياسة الخصوصية الخاصة بنا. إذا كنت لا توافق، فلا يجوز لك استخدام المنصة.',
      'es':
          'Al acceder o utilizar la plataforma Kitravia (web, móvil o API), usted acepta estos Términos y Condiciones y nuestra Política de Privacidad. Si no está de acuerdo, no podrá utilizar la plataforma.',
      'fr':
          'En accédant à la plateforme Kitravia (web, mobile ou API) ou en l\'utilisant, vous acceptez les présentes Conditions générales et notre Politique de confidentialité. Si vous n\'acceptez pas ces conditions, vous ne pouvez pas utiliser la plateforme.',
      'zh_Hans':
          '访问或使用 Kitravia 平台（网页、移动端或 API）即表示您同意这些条款和条件以及我们的隐私政策。如果您不同意，则不得使用该平台。',
    },
    'baqvh72w': {
      'en': '2. User Profiles & Eligibility',
      'ar': '2. ملفات تعريف المستخدمين وشروط الأهلية',
      'es': '2. Perfiles de usuario y requisitos de elegibilidad',
      'fr': '2. Profils et critères d\'admissibilité des utilisateurs',
      'zh_Hans': '2. 用户资料和资格',
    },
    'j3mgjl01': {
      'en':
          'Users must be at least 18 years old to create an account and book travel services. The platform serves four profiles — Admin, Business, User, and No User (Visitor) — each with specific rights and obligations as defined in the User Profile Structure above. Business Partners and Affiliates must additionally agree to the Partner Agreement.',
      'ar':
          'يجب ألا يقل عمر المستخدمين عن 18 عامًا لإنشاء حساب وحجز خدمات السفر. توفر المنصة أربعة أنواع من الملفات الشخصية: المدير، ورجل الأعمال، والمستخدم، والزائر (بدون مستخدم)، ولكل منها حقوق والتزامات محددة كما هو موضح في هيكل ملف تعريف المستخدم أعلاه. يجب على شركاء الأعمال والشركات التابعة الموافقة على اتفاقية الشراكة.',
      'es':
          'Para crear una cuenta y reservar servicios de viaje, los usuarios deben tener al menos 18 años. La plataforma ofrece cuatro perfiles: Administrador, Empresa, Usuario y No Usuario (Visitante), cada uno con derechos y obligaciones específicos, tal como se define en la Estructura de Perfiles de Usuario mencionada anteriormente. Los Socios Comerciales y Afiliados deben aceptar, además, el Acuerdo de Socio.',
      'fr':
          'Pour créer un compte et réserver des services de voyage, les utilisateurs doivent être âgés d\'au moins 18 ans. La plateforme propose quatre profils : Administrateur, Entreprise, Utilisateur et Visiteur. Chaque profil possède des droits et obligations spécifiques, définis dans la structure des profils utilisateurs ci-dessus. Les partenaires commerciaux et les affiliés doivent également accepter le contrat de partenariat.',
      'zh_Hans':
          '用户必须年满18周岁才能创建账户并预订旅行服务。该平台提供四种用户类型——管理员、企业、用户和非用户（访客）——每种类型都拥有特定的权利和义务，具体内容请参见上文“用户类型结构”。商业伙伴和联盟伙伴还必须同意“合作伙伴协议”。',
    },
    '06myiffl': {
      'en': '3. Account Responsibilities',
      'ar': '3. مسؤوليات الحساب',
      'es': '3. Responsabilidades de la cuenta',
      'fr': '3. Responsabilités liées au compte',
      'zh_Hans': '3. 账户职责',
    },
    'vtt3ok5u': {
      'en':
          'You are responsible for maintaining confidentiality of your credentials and all activities under your account. Notify support@kitravia.com immediately of any unauthorized access. Kitravia reserves the right to suspend accounts that violate these Terms, with or without notice.',
      'ar':
          'أنت مسؤول عن الحفاظ على سرية بيانات اعتمادك وجميع الأنشطة التي تتم عبر حسابك. يُرجى إبلاغ فريق الدعم عبر البريد الإلكتروني support@kitravia.com فورًا في حال حدوث أي وصول غير مصرح به. تحتفظ Kitravia بحقها في تعليق الحسابات التي تخالف هذه الشروط، سواءً تم إخطارك بذلك أم لا.',
      'es':
          'Usted es responsable de mantener la confidencialidad de sus credenciales y de todas las actividades realizadas con su cuenta. Notifique inmediatamente a support@kitravia.com cualquier acceso no autorizado. Kitravia se reserva el derecho de suspender las cuentas que infrinjan estos Términos, con o sin previo aviso.',
      'fr':
          'Vous êtes responsable de la confidentialité de vos identifiants et de toutes les activités effectuées sur votre compte. Veuillez signaler immédiatement tout accès non autorisé à support@kitravia.com. Kitravia se réserve le droit de suspendre les comptes qui enfreignent les présentes conditions d\'utilisation, avec ou sans préavis.',
      'zh_Hans':
          '您有责任对您的凭证和账户下的所有活动保密。如有任何未经授权的访问，请立即通知 support@kitravia.com。Kitravia 保留暂停违反本条款的账户的权利，无论是否事先通知。',
    },
    'kezoyyck': {
      'en': '4. Platform Services',
      'ar': '4. خدمات المنصة',
      'es': '4. Servicios de plataforma',
      'fr': '4. Services de plateforme',
      'zh_Hans': '4. 平台服务',
    },
    't67e1gvz': {
      'en':
          'Kitravia provides a technology intermediary platform connecting users with third-party travel suppliers. Kitravia is not itself a travel agency, airline, hotel, or transportation provider. Booking contracts are between you and the relevant supplier.',
      'ar':
          'توفر كيترافيا منصة وساطة تقنية تربط المستخدمين بموردي خدمات السفر الخارجيين. كيترافيا ليست وكالة سفر أو شركة طيران أو فندق أو شركة نقل. عقود الحجز تتم بينك وبين المورد المعني.',
      'es':
          'Kitravia ofrece una plataforma tecnológica intermediaria que conecta a los usuarios con proveedores de viajes externos. Kitravia no es una agencia de viajes, aerolínea, hotel ni empresa de transporte. Los contratos de reserva se establecen entre usted y el proveedor correspondiente.',
      'fr':
          'Kitravia est une plateforme technologique qui met en relation les utilisateurs avec des prestataires de voyage tiers. Kitravia n\'est ni une agence de voyages, ni une compagnie aérienne, ni un hôtel, ni un transporteur. Les contrats de réservation sont conclus directement entre vous et le prestataire concerné.',
      'zh_Hans':
          'Kitravia 提供一个技术中介平台，连接用户与第三方旅游供应商。Kitravia 本身并非旅行社、航空公司、酒店或交通运输供应商。预订合同由您与相关供应商直接签订。',
    },
    'umx7rmy9': {
      'en': '5. Business Partners & Affiliates',
      'ar': '5. الشركاء التجاريون والشركات التابعة',
      'es': '5. Socios comerciales y afiliados',
      'fr': '5. Partenaires commerciaux et affiliés',
      'zh_Hans': '5. 商业伙伴及附属公司',
    },
    'sk071xdv': {
      'en':
          'Business Partners and Affiliates must comply with Kitravia\'s Partner Code of Conduct, applicable advertising standards, and anti-spam regulations. Commission fraud, artificial traffic generation, or misrepresentation of Kitravia\'s services will result in immediate account termination and forfeiture of earned commissions.',
      'ar':
          'يجب على الشركاء التجاريين والشركات التابعة الالتزام بمدونة قواعد سلوك الشركاء الخاصة بشركة كيترافيا، ومعايير الإعلان المعمول بها، ولوائح مكافحة البريد العشوائي. سيؤدي الاحتيال في العمولات، أو توليد زيارات وهمية، أو تحريف خدمات كيترافيا إلى إغلاق الحساب فورًا ومصادرة العمولات المكتسبة.',
      'es':
          'Los socios comerciales y afiliados deben cumplir con el Código de Conducta para Socios de Kitravia, las normas publicitarias aplicables y la normativa antispam. El fraude en las comisiones, la generación artificial de tráfico o la tergiversación de los servicios de Kitravia conllevarán la cancelación inmediata de la cuenta y la pérdida de las comisiones obtenidas.',
      'fr':
          'Les partenaires commerciaux et les affiliés doivent respecter le Code de conduite des partenaires de Kitravia, les normes publicitaires applicables et la réglementation anti-spam. Toute fraude aux commissions, génération de trafic artificiel ou présentation trompeuse des services de Kitravia entraînera la fermeture immédiate du compte et la perte des commissions acquises.',
      'zh_Hans':
          '商业伙伴和联盟伙伴必须遵守 Kitravia 的合作伙伴行为准则、适用的广告标准和反垃圾邮件法规。佣金欺诈、人为制造流量或歪曲 Kitravia 的服务将导致账户立即终止，且已赚取的佣金不予退还。',
    },
    'y9pu24mj': {
      'en': '6. Bookings & Payments',
      'ar': '6. الحجوزات والمدفوعات',
      'es': '6. Reservas y pagos',
      'fr': '6. Réservations et paiements',
      'zh_Hans': '6. 预订与付款',
    },
    'x7i3bc04': {
      'en':
          'Prices are subject to availability and may change until confirmation. All bookings are subject to the supplier\'s terms and cancellation policies. Payment is processed via PCI DSS-compliant processors. Kitravia is not responsible for supplier pricing errors but will make reasonable efforts to notify users and offer alternatives.',
      'ar':
          'الأسعار رهنٌ بالتوافر وقابلة للتغيير حتى تأكيد الحجز. جميع الحجوزات خاضعة لشروط المورّد وسياسات الإلغاء الخاصة به. تتم معالجة المدفوعات عبر معالجات متوافقة مع معايير PCI DSS. لا تتحمل Kitravia مسؤولية أخطاء التسعير من جانب المورّد، ولكنها ستبذل قصارى جهدها لإخطار المستخدمين وتقديم بدائل.',
      'es':
          'Los precios están sujetos a disponibilidad y pueden variar hasta su confirmación. Todas las reservas están sujetas a los términos y condiciones y a la política de cancelación del proveedor. El pago se procesa mediante plataformas compatibles con PCI DSS. Kitravia no se responsabiliza de los errores de precios del proveedor, pero hará todo lo posible por notificar a los usuarios y ofrecer alternativas.',
      'fr':
          'Les prix sont indiqués sous réserve de disponibilité et peuvent être modifiés jusqu\'à confirmation. Toutes les réservations sont soumises aux conditions générales et à la politique d\'annulation du fournisseur. Le paiement est traité par des plateformes conformes à la norme PCI DSS. Kitravia décline toute responsabilité en cas d\'erreur de prix de la part du fournisseur, mais s\'efforcera d\'en informer les utilisateurs et de leur proposer des solutions alternatives.',
      'zh_Hans':
          '价格视供应情况而定，并可能在确认前发生变动。所有预订均受供应商条款和取消政策的约束。付款通过符合PCI DSS标准的支付处理商进行处理。Kitravia不对供应商的定价错误负责，但会尽合理努力通知用户并提供替代方案。',
    },
    'v10uzn7n': {
      'en': '7. AI Features & Accuracy Disclaimer',
      'ar': '7. إخلاء مسؤولية بشأن ميزات الذكاء الاصطناعي ودقته',
      'es':
          '7. Descargo de responsabilidad sobre las características y la precisión de la IA',
      'fr':
          '7. Avertissement concernant les fonctionnalités et la précision de l\'IA',
      'zh_Hans': '7. AI功能及准确性免责声明',
    },
    '3nfzo64q': {
      'en':
          'AI-generated itineraries, recommendations, fare predictions, eBooks, and Smart Radar alerts are provided for informational and planning purposes. Kitravia does not guarantee the accuracy of AI outputs. Users should independently verify critical travel information before booking.',
      'ar':
          'تُقدَّم مسارات الرحلات والتوصيات وتوقعات الأسعار والكتب الإلكترونية وتنبيهات الرادار الذكي المُولَّدة بواسطة الذكاء الاصطناعي لأغراض المعلومات والتخطيط. لا تضمن Kitravia دقة مخرجات الذكاء الاصطناعي. يجب على المستخدمين التحقق بشكل مستقل من معلومات السفر المهمة قبل الحجز.',
      'es':
          'Los itinerarios, recomendaciones, predicciones de precios, libros electrónicos y alertas de radar inteligente generados por IA se proporcionan con fines informativos y de planificación. Kitravia no garantiza la exactitud de los resultados de la IA. Los usuarios deben verificar de forma independiente la información de viaje importante antes de reservar.',
      'fr':
          'Les itinéraires, recommandations, estimations de tarifs, livres numériques et alertes Smart Radar générés par l\'IA sont fournis à titre informatif et pour vous aider à planifier votre voyage. Kitravia ne garantit pas l\'exactitude des résultats de l\'IA. Il est conseillé aux utilisateurs de vérifier indépendamment les informations de voyage essentielles avant de réserver.',
      'zh_Hans':
          'Kitravia提供的AI生成的行程、推荐、票价预测、电子书和智能雷达警报仅供参考和规划之用。Kitravia不保证AI输出结果的准确性。用户在预订前应自行核实重要的旅行信息。',
    },
    'm25nl7er': {
      'en': '8. Intellectual Property',
      'ar': '8. الملكية الفكرية',
      'es': '8. Propiedad intelectual',
      'fr': '8. Propriété intellectuelle',
      'zh_Hans': '8. 知识产权',
    },
    'tof6ntqo': {
      'en':
          'All content, trademarks, logos, software, algorithms, and features are the exclusive property of Kitravia Inc. or its licensors. You may not copy, reproduce, modify, reverse-engineer, or distribute any part of the Platform without express written consent.',
      'ar':
          'جميع المحتويات والعلامات التجارية والشعارات والبرامج والخوارزميات والميزات هي ملكية حصرية لشركة Kitravia Inc. أو الجهات المرخصة لها. لا يجوز لك نسخ أو إعادة إنتاج أو تعديل أو فك شفرة أو توزيع أي جزء من المنصة دون موافقة خطية صريحة.',
      'es':
          'Todo el contenido, las marcas comerciales, los logotipos, el software, los algoritmos y las funciones son propiedad exclusiva de Kitravia Inc. o de sus licenciantes. Queda prohibida la copia, reproducción, modificación, ingeniería inversa o distribución de cualquier parte de la Plataforma sin el consentimiento expreso por escrito.',
      'fr':
          'L\'ensemble du contenu, des marques, des logos, des logiciels, des algorithmes et des fonctionnalités sont la propriété exclusive de Kitravia Inc. ou de ses concédants de licence. Toute copie, reproduction, modification, ingénierie inverse ou distribution de la Plateforme, en tout ou en partie, est interdite sans autorisation écrite expresse.',
      'zh_Hans':
          '所有内容、商标、标识、软件、算法和功能均为 Kitravia Inc. 或其许可方的专属财产。未经明确书面许可，您不得复制、重制、修改、反向工程或分发平台的任何部分。',
    },
    'jlplfdo7': {
      'en': '9. User Content License',
      'ar': '9. ترخيص محتوى المستخدم',
      'es': '9. Licencia de contenido del usuario',
      'fr': '9. Licence relative au contenu utilisateur',
      'zh_Hans': '9. 用户内容许可',
    },
    'srouaxkq': {
      'en':
          'By submitting content (reviews, photos, eBooks) to the Platform, you grant Kitravia a non-exclusive, royalty-free, worldwide license to use, display, and distribute such content in connection with our services. You retain ownership of your content and are responsible for ensuring it does not violate third-party rights.',
      'ar':
          'بتقديمك للمحتوى (التقييمات، الصور، الكتب الإلكترونية) إلى المنصة، فإنك تمنح كيترافيا ترخيصًا غير حصري، مجاني، وعالمي لاستخدام هذا المحتوى وعرضه وتوزيعه فيما يتعلق بخدماتنا. أنت تحتفظ بملكية محتواك وتتحمل مسؤولية ضمان عدم انتهاكه لحقوق الغير.',
      'es':
          'Al enviar contenido (reseñas, fotos, libros electrónicos) a la Plataforma, usted otorga a Kitravia una licencia mundial, no exclusiva y libre de regalías para usar, mostrar y distribuir dicho contenido en relación con nuestros servicios. Usted conserva la propiedad de su contenido y es responsable de garantizar que no infrinja los derechos de terceros.',
      'fr':
          'En soumettant du contenu (avis, photos, livres numériques) à la Plateforme, vous accordez à Kitravia une licence non exclusive, gratuite et mondiale d\'utilisation, d\'affichage et de distribution de ce contenu dans le cadre de nos services. Vous conservez la propriété de votre contenu et êtes responsable du respect des droits des tiers.',
      'zh_Hans':
          '您通过向平台提交内容（评论、照片、电子书）即表示您授予 Kitravia 一项非独占的、免版税的、全球范围内的许可，允许 Kitravia 将此类内容用于与我们的服务相关的用途，包括使用、展示和分发。您保留对内容的所有权，并有责任确保其不侵犯任何第三方的权利。',
    },
    'e6pde1h2': {
      'en': '10. Prohibited Uses',
      'ar': '10. الاستخدامات المحظورة',
      'es': '10. Usos prohibidos',
      'fr': '10. Utilisations interdites',
      'zh_Hans': '10. 禁止用途',
    },
    '7avci3bk': {
      'en':
          'You must not: use the Platform for unlawful purposes; attempt unauthorized access to Platform systems; scrape or extract data without permission; impersonate any person or entity; generate artificial affiliate traffic; submit false information; or use bots or automation tools against Platform integrity.',
      'ar':
          'يجب عليك عدم القيام بما يلي: استخدام المنصة لأغراض غير قانونية؛ محاولة الوصول غير المصرح به إلى أنظمة المنصة؛ استخراج البيانات أو جمعها دون إذن؛ انتحال شخصية أي فرد أو كيان؛ توليد حركة مرور تابعة مصطنعة؛ تقديم معلومات خاطئة؛ أو استخدام برامج الروبوت أو أدوات التشغيل الآلي ضد سلامة المنصة.',
      'es':
          'No debe: utilizar la Plataforma con fines ilícitos; intentar acceder sin autorización a los sistemas de la Plataforma; extraer datos sin permiso; hacerse pasar por otra persona o entidad; generar tráfico de afiliados artificial; enviar información falsa; ni utilizar bots o herramientas de automatización que atenten contra la integridad de la Plataforma.',
      'fr':
          'Vous ne devez pas : utiliser la Plateforme à des fins illégales ; tenter d’accéder sans autorisation aux systèmes de la Plateforme ; extraire des données sans autorisation ; usurper l’identité d’une personne ou d’une entité ; générer du trafic d’affiliation artificiel ; soumettre de fausses informations ; ou utiliser des robots ou des outils d’automatisation contraires à l’intégrité de la Plateforme.',
      'zh_Hans':
          '您不得：将平台用于非法目的；试图未经授权访问平台系统；未经许可抓取或提取数据；冒充任何个人或实体；生成虚假联盟流量；提交虚假信息；或使用机器人或自动化工具破坏平台完整性。',
    },
    '562zahnc': {
      'en': '11. Limitation of Liability',
      'ar': '11. تحديد المسؤولية',
      'es': '11. Limitación de responsabilidad',
      'fr': '11. Limitation de responsabilité',
      'zh_Hans': '11. 责任限制',
    },
    'lblnixvr': {
      'en':
          'To the maximum extent permitted by law, Kitravia\'s total liability in any circumstance shall not exceed the amount paid by you in the 12 months preceding the claim. Kitravia is not liable for indirect, incidental, special, or consequential damages arising from use of the Platform or third-party travel services.',
      'ar':
          'إلى أقصى حد يسمح به القانون، لن تتجاوز مسؤولية كيترافيا الإجمالية في أي ظرف من الظروف المبلغ الذي دفعته خلال الاثني عشر شهرًا السابقة للمطالبة. ولا تتحمل كيترافيا مسؤولية الأضرار غير المباشرة أو العرضية أو الخاصة أو التبعية الناجمة عن استخدام المنصة أو خدمات السفر المقدمة من جهات خارجية.',
      'es':
          'En la máxima medida permitida por la ley, la responsabilidad total de Kitravia, en cualquier circunstancia, no excederá el monto que usted haya pagado en los 12 meses anteriores a la reclamación. Kitravia no se hace responsable de los daños indirectos, incidentales, especiales o consecuenciales que surjan del uso de la Plataforma o de servicios de viaje de terceros.',
      'fr':
          'Dans toute la mesure permise par la loi, la responsabilité totale de Kitravia, quelles que soient les circonstances, ne saurait excéder le montant que vous avez versé au cours des 12 mois précédant la réclamation. Kitravia décline toute responsabilité pour les dommages indirects, accessoires, spéciaux ou consécutifs résultant de l\'utilisation de la Plateforme ou des services de voyage de tiers.',
      'zh_Hans':
          '在法律允许的最大范围内，Kitravia在任何情况下承担的全部责任均不得超过您在提出索赔前12个月内支付的金额。Kitravia对因使用平台或第三方旅行服务而引起的间接、附带、特殊或后果性损害不承担责任。',
    },
    'phlprkaq': {
      'en': '12. Governing Law',
      'ar': '12. القانون الحاكم',
      'es': '12. Ley aplicable',
      'fr': '12. Droit applicable',
      'zh_Hans': '12. 适用法律',
    },
    'nwizr1cd': {
      'en':
          'These Terms are governed by the laws of the jurisdiction of incorporation. Disputes will first be addressed through good-faith negotiation, then binding arbitration or courts of competent jurisdiction if unresolved.',
      'ar':
          'تخضع هذه الشروط لقوانين الولاية القضائية التي تأسست فيها الشركة. تُحل النزاعات أولاً عن طريق التفاوض بحسن نية، ثم عن طريق التحكيم الملزم أو المحاكم المختصة إذا لم يتم التوصل إلى حل.',
      'es':
          'Estos Términos se rigen por las leyes de la jurisdicción de constitución. Las controversias se abordarán primero mediante negociación de buena fe y, si no se resuelven, mediante arbitraje vinculante o ante los tribunales competentes.',
      'fr':
          'Les présentes conditions générales sont régies par le droit du lieu d\'immatriculation. Tout différend sera d\'abord tenté de parvenir à un accord amiable, puis, en cas d\'échec, soumis à un arbitrage contraignant ou aux tribunaux compétents.',
      'zh_Hans': '本条款受公司注册地法律管辖。争议应首先通过善意协商解决，如协商不成，则提交具有约束力的仲裁或有管辖权的法院审理。',
    },
    '9r1wef7g': {
      'en': '13. Contact',
      'ar': '13. الاتصال',
      'es': '13. Contacto',
      'fr': '13. Contact',
      'zh_Hans': '13. 联系方式',
    },
    'bmskhjwe': {
      'en':
          'Legal: legal@kitravia.com | Support: support@kitravia.com | Partners: partners@kitravia.com | Privacy: privacy@kitravia.com',
      'ar':
          'الشؤون القانونية: legal@kitravia.com | الدعم الفني: support@kitravia.com | الشركاء: partners@kitravia.com | الخصوصية: privacy@kitravia.com',
      'es':
          'Legal: legal@kitravia.com | Soporte: support@kitravia.com | Socios: partners@kitravia.com | Privacidad: privacy@kitravia.com',
      'fr':
          'Service juridique : legal@kitravia.com | Assistance : support@kitravia.com | Partenaires : partners@kitravia.com | Confidentialité : privacy@kitravia.com',
      'zh_Hans':
          '法律事务：legal@kitravia.com | 技术支持：support@kitravia.com | 合作伙伴：partners@kitravia.com | 隐私政策：privacy@kitravia.com',
    },
    'lxb6afcm': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // CookiePolicy
  {
    'gbggs9xz': {
      'en': 'COOKIE POLICY',
      'ar': 'سياسة ملفات تعريف الارتباط',
      'es': 'POLÍTICA DE COOKIES',
      'fr': 'POLITIQUE RELATIVE AUX COOKIES',
      'zh_Hans': 'Cookie政策',
    },
    'wxwd7f40': {
      'en': 'Effective Date: March 2026',
      'ar': 'تاريخ السريان: مارس 2026 | المراقب: كيترافيا.',
      'es': 'Fecha de entrada en vigor: marzo de 2026 | Controlador: Kitravia.',
      'fr': 'Date d\'entrée en vigueur : mars 2026 | Contrôleur : Kitravia.',
      'zh_Hans': '生效日期：2026 年 3 月 | 控制人：Kitravia。',
    },
    'iiuaj8sj': {
      'en': 'Types of Cookies',
      'ar': 'أنواع ملفات تعريف الارتباط',
      'es': 'Tipos de cookies',
      'fr': 'Types de cookies',
      'zh_Hans': 'Cookie 的类型',
    },
    '57yhawp8': {
      'en':
          'Manage preferences via your browser settings or the Kitravia Cookie Preference Center. Full details at www.kitravia.com/cookies.',
      'ar':
          'يمكنك إدارة تفضيلاتك عبر إعدادات متصفحك أو مركز تفضيلات ملفات تعريف الارتباط الخاص بـ Kitravia. تجد التفاصيل الكاملة على الموقع www.kitravia.com/cookies.',
      'es':
          'Gestiona tus preferencias a través de la configuración de tu navegador o del Centro de preferencias de cookies de Kitravia. Encontrarás toda la información en www.kitravia.com/cookies.',
      'fr':
          'Gérez vos préférences via les paramètres de votre navigateur ou le Centre de préférences des cookies de Kitravia. Plus d\'informations sur www.kitravia.com/cookies.',
      'zh_Hans':
          '您可以通过浏览器设置或 Kitravia Cookie 偏好设置中心管理您的偏好设置。详情请访问 www.kitravia.com/cookies。',
    },
    '9sh1jmar': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // RefundandCancellationPolicy
  {
    '8nnwqwid': {
      'en': 'REFUND & CANCELLATION POLICY',
      'ar': 'سياسة الاسترداد والإلغاء',
      'es': 'POLÍTICA DE REEMBOLSO Y CANCELACIÓN',
      'fr': 'POLITIQUE DE REMBOURSEMENT ET D\'ANNULATION',
      'zh_Hans': '退款和取消政策',
    },
    'n2vbmi4s': {
      'en': 'Effective Date: March 2026',
      'ar': 'تاريخ السريان: مارس 2026 | المراقب: كيترافيا.',
      'es': 'Fecha de entrada en vigor: marzo de 2026 | Controlador: Kitravia.',
      'fr': 'Date d\'entrée en vigueur : mars 2026 | Contrôleur : Kitravia.',
      'zh_Hans': '生效日期：2026 年 3 月 | 控制人：Kitravia。',
    },
    '4y5imr9p': {
      'en': 'Travel Bookings',
      'ar': 'حجوزات السفر',
      'es': 'Reservas de viajes',
      'fr': 'Réservations de voyage',
      'zh_Hans': '旅行预订',
    },
    '3jbraldp': {
      'en':
          'Cancellation and refund eligibility for flights, hotels, car rentals, cruises, and other travel services are governed by the individual supplier\'s policies, which Kitravia clearly displays at checkout. Kitravia\'s service and processing fees are generally non-refundable.',
      'ar':
          'تخضع شروط الإلغاء واسترداد الأموال للرحلات الجوية والفنادق وتأجير السيارات والرحلات البحرية وغيرها من خدمات السفر لسياسات كل مزود خدمة على حدة، والتي تعرضها كيترافيا بوضوح عند إتمام عملية الدفع. رسوم الخدمة والمعالجة لدى كيترافيا غير قابلة للاسترداد عمومًا.',
      'es':
          'Las condiciones de cancelación y reembolso para vuelos, hoteles, alquiler de coches, cruceros y otros servicios de viaje se rigen por las políticas de cada proveedor, que Kitravia muestra claramente al finalizar la compra. Las tarifas de servicio y procesamiento de Kitravia generalmente no son reembolsables.',
      'fr':
          'Les conditions d\'annulation et de remboursement des vols, hôtels, locations de voitures, croisières et autres services de voyage sont définies par chaque fournisseur, que Kitravia affiche clairement au moment du paiement. Les frais de service et de traitement de Kitravia ne sont généralement pas remboursables.',
      'zh_Hans':
          '航班、酒店、租车、邮轮和其他旅行服务的取消和退款资格由各供应商的具体政策规定，Kitravia 会在结账页面清晰显示这些政策。Kitravia 的服务费和手续费通常不予退还。',
    },
    'ic2rkqqw': {
      'en': 'Premium Subscription',
      'ar': 'اشتراك مميز',
      'es': 'Suscripción Premium',
      'fr': 'Abonnement Premium',
      'zh_Hans': '高级订阅',
    },
    'ozuchu5r': {
      'en':
          'New Premium subscribers receive a full refund within 60 days of first payment. After this period, refunds are provided only where required by applicable consumer protection law. Cancel anytime via your account dashboard. Contact support@kitravia.com for refund requests.',
      'ar':
          'يحصل المشتركون الجدد في باقة Premium على استرداد كامل المبلغ خلال 60 يومًا من تاريخ الدفعة الأولى. بعد هذه المدة، لا تُقدّم المبالغ المستردة إلا وفقًا لما يقتضيه قانون حماية المستهلك المعمول به. يمكنك إلغاء الاشتراك في أي وقت عبر لوحة تحكم حسابك. للتواصل بشأن طلبات الاسترداد، يُرجى مراسلة support@kitravia.com.',
      'es':
          'Los nuevos suscriptores Premium reciben un reembolso completo dentro de los 60 días posteriores al primer pago. Transcurrido este plazo, los reembolsos solo se otorgan cuando así lo exige la legislación vigente en materia de protección al consumidor. Puede cancelar su suscripción en cualquier momento a través del panel de control de su cuenta. Para solicitar un reembolso, póngase en contacto con support@kitravia.com.',
      'fr':
          'Les nouveaux abonnés Premium bénéficient d\'un remboursement intégral dans les 60 jours suivant leur premier paiement. Passé ce délai, les remboursements ne sont accordés que si la législation applicable en matière de protection des consommateurs l\'exige. Vous pouvez résilier votre abonnement à tout moment depuis votre tableau de bord. Pour toute demande de remboursement, veuillez contacter support@kitravia.com.',
      'zh_Hans':
          '新加入高级会员的用户可在首次付款后 60 天内获得全额退款。此期限过后，仅在适用消费者保护法规定的情况下才会提供退款。您可随时通过账户控制面板取消订阅。如有退款申请，请联系 support@kitravia.com。',
    },
    '8hcooaig': {
      'en': 'Affiliate Commissions',
      'ar': 'عمولات التسويق بالعمولة',
      'es': 'Comisiones de afiliados',
      'fr': 'Commissions d\'affiliation',
      'zh_Hans': '联盟佣金',
    },
    'v6s5yz71': {
      'en':
          'Commissions are paid net of cancellations and chargebacks. Fraudulent traffic, self-referrals, or policy violations result in commission forfeiture. Payment cycle and minimum thresholds are defined in the Partner Agreement.',
      'ar':
          'تُدفع العمولات بعد خصم رسوم الإلغاء والمبالغ المستردة. يؤدي استخدام الزيارات الاحتيالية أو الإحالات الذاتية أو مخالفة السياسات إلى فقدان العمولات. يتم تحديد دورة الدفع والحد الأدنى في اتفاقية الشراكة.',
      'es':
          'Las comisiones se abonan netas de cancelaciones y contracargos. El tráfico fraudulento, las autorreferencias o las infracciones de las políticas conllevan la pérdida de la comisión. El ciclo de pago y los umbrales mínimos se definen en el Acuerdo de Socio.',
      'fr':
          'Les commissions sont versées nettes d\'annulations et de rejets de paiement. Tout trafic frauduleux, auto-parrainage ou violation des règles entraîne la perte de la commission. Le cycle de paiement et les seuils minimums sont définis dans le contrat de partenariat.',
      'zh_Hans':
          '佣金在扣除取消订单和退款后支付。欺诈性流量、自我推荐或违反政策的行为将导致佣金没收。付款周期和最低门槛在合作伙伴协议中规定。',
    },
    'mm3jli0p': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Createaccount
  {
    '80ow1y40': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
      'zh_Hans': '创建账户',
    },
    '1q2qowrv': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
      'zh_Hans': '创建账户',
    },
    'updpmw9s': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': 'لنبدأ بملء النموذج أدناه.',
      'es': 'Comencemos rellenando el formulario que aparece a continuación.',
      'fr': 'Commençons par remplir le formulaire ci-dessous.',
      'zh_Hans': '请先填写下面的表格。',
    },
    'k5wdn8ol': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'zh_Hans': '电子邮件',
    },
    '1ox6kn0n': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'zh_Hans': '密码',
    },
    '6w7v8p6b': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
      'zh_Hans': '确认密码',
    },
    'ci65iiqc': {
      'en': 'I agree to the Terms & Conditions and Privacy Policy',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9q5jddla': {
      'en': 'Get Started',
      'ar': 'ابدأ الآن',
      'es': 'Comience',
      'fr': 'Commencer',
      'zh_Hans': '开始使用',
    },
    'unaoec8z': {
      'en': 'Or sign up with',
      'ar': 'أو سجل مع',
      'es': 'O regístrese con',
      'fr': 'Ou inscrivez-vous avec',
      'zh_Hans': '或者注册',
    },
    '0gc0tkmx': {
      'en': 'Continue with Google',
      'ar': 'تابع مع جوجل',
      'es': 'Continuar con Google',
      'fr': 'Continuer avec Google',
      'zh_Hans': '继续使用 Google',
    },
    'qfdj4up9': {
      'en': 'Continue with Apple',
      'ar': 'تابع مع أبل',
      'es': 'Continuar con Apple',
      'fr': 'Continuez avec Apple',
      'zh_Hans': '继续使用 Apple',
    },
    'om18w09i': {
      'en': 'Log In',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'zh_Hans': '登录',
    },
    'py0buevq': {
      'en': 'Welcome Back',
      'ar': 'مرحبًا بعودتك',
      'es': 'Bienvenido de nuevo',
      'fr': 'Content de te revoir',
      'zh_Hans': '欢迎回来',
    },
    '72d0bjpq': {
      'en': 'Fill out the information below in order to access your account.',
      'ar': 'املأ المعلومات أدناه للوصول إلى حسابك.',
      'es': 'Complete la información a continuación para acceder a su cuenta.',
      'fr':
          'Veuillez compléter les informations ci-dessous pour accéder à votre compte.',
      'zh_Hans': '请填写以下信息以访问您的帐户。',
    },
    'i1bvrc9h': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'zh_Hans': '电子邮件',
    },
    'gju7t3oo': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'zh_Hans': '密码',
    },
    '5rtzmgv5': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'zh_Hans': '登入',
    },
    '5qewfpey': {
      'en': 'Or sign in with',
      'ar': 'أو سجل الدخول باستخدام',
      'es': 'O inicia sesión con',
      'fr': 'Ou connectez-vous avec',
      'zh_Hans': '或者登录',
    },
    '666jvrrf': {
      'en': 'Continue with Google',
      'ar': 'تابع مع جوجل',
      'es': 'Continuar con Google',
      'fr': 'Continuer avec Google',
      'zh_Hans': '继续使用 Google',
    },
    'g9m7gx52': {
      'en': 'Continue with Apple',
      'ar': 'تابع مع أبل',
      'es': 'Continuar con Apple',
      'fr': 'Continuez avec Apple',
      'zh_Hans': '继续使用 Apple',
    },
    'h4nxzo12': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié ?',
      'zh_Hans': '忘记密码？',
    },
    'wdioxdvr': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // SearchResultsCopyCopy
  {
    '7996xaaw': {
      'en': 'Flights',
      'ar': 'رحلات جوية',
      'es': 'Vuelos',
      'fr': 'Vols',
      'zh_Hans': '航班',
    },
    'w754g8ia': {
      'en': 'Delta Airlines',
      'ar': 'خطوط دلتا الجوية',
      'es': 'Delta Airlines',
      'fr': 'Delta Airlines',
      'zh_Hans': '达美航空',
    },
    'hv128t2y': {
      'en': 'DL 2156',
      'ar': 'DL 2156',
      'es': 'DL 2156',
      'fr': 'DL 2156',
      'zh_Hans': 'DL 2156',
    },
    '387a3k67': {
      'en': '\$325',
      'ar': '325 دولارًا',
      'es': '\$325',
      'fr': '325 \$',
      'zh_Hans': '325美元',
    },
    'zou5k4vh': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'clkh3pdu': {
      'en': '1h 25m • Direct',
      'ar': 'ساعة و25 دقيقة • مباشر',
      'es': '1h 25m • Direct',
      'fr': '1 h 25 min • Direct',
      'zh_Hans': '1小时25分钟 • 直达',
    },
    '7qyhjuzs': {
      'en': '2:15 PM',
      'ar': '2:15 مساءً',
      'es': '14:15',
      'fr': '14h15',
      'zh_Hans': '下午2:15',
    },
    'rbibodv7': {
      'en': 'Dec 15',
      'ar': '15 ديسمبر',
      'es': '15 de diciembre',
      'fr': '15 décembre',
      'zh_Hans': '12月15日',
    },
    'l4n25yws': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'brm8m7uy': {
      'en': 'Southwest',
      'ar': 'جنوب غرب',
      'es': 'Suroeste',
      'fr': 'Sud-ouest',
      'zh_Hans': '西南',
    },
    'yncae7zd': {
      'en': 'WN 3421',
      'ar': 'WN 3421',
      'es': 'WN 3421',
      'fr': 'WN 3421',
      'zh_Hans': 'WN 3421',
    },
    'uzxuclyh': {
      'en': '\$199',
      'ar': '199 دولارًا',
      'es': '\$199',
      'fr': '199 \$',
      'zh_Hans': '199美元',
    },
    'rsjshf18': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    '6mdlds67': {
      'en': '1h 10m • Direct',
      'ar': 'ساعة و10 دقائق • مباشر',
      'es': '1h 10m • Direct',
      'fr': '1 h 10 min • Direct',
      'zh_Hans': '1小时10分钟 • 直达',
    },
    'f57jhv0q': {
      'en': '5:45 PM',
      'ar': '5:45 مساءً',
      'es': '17:45',
      'fr': '17h45',
      'zh_Hans': '下午5:45',
    },
    'zwcwp35o': {
      'en': 'Dec 15',
      'ar': '15 ديسمبر',
      'es': '15 de diciembre',
      'fr': '15 décembre',
      'zh_Hans': '12月15日',
    },
    '8j7exay2': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'p72h1gju': {
      'en': 'Southwest',
      'ar': 'جنوب غرب',
      'es': 'Suroeste',
      'fr': 'Sud-ouest',
      'zh_Hans': '西南',
    },
    '2cy5125w': {
      'en': 'WN 3421',
      'ar': 'WN 3421',
      'es': 'WN 3421',
      'fr': 'WN 3421',
      'zh_Hans': 'WN 3421',
    },
    '2o0cvcvh': {
      'en': '\$199',
      'ar': '199 دولارًا',
      'es': '\$199',
      'fr': '199 \$',
      'zh_Hans': '199美元',
    },
    '1or6oitl': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'sicactji': {
      'en': '1h 10m • Direct',
      'ar': 'ساعة و10 دقائق • مباشر',
      'es': '1h 10m • Direct',
      'fr': '1 h 10 min • Direct',
      'zh_Hans': '1小时10分钟 • 直达',
    },
    'dsni8as5': {
      'en': '5:45 PM',
      'ar': '5:45 مساءً',
      'es': '17:45',
      'fr': '17h45',
      'zh_Hans': '下午5:45',
    },
    '43tmba4z': {
      'en': 'Dec 15',
      'ar': '15 ديسمبر',
      'es': '15 de diciembre',
      'fr': '15 décembre',
      'zh_Hans': '12月15日',
    },
    '8912ngki': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'rla6t0eh': {
      'en': 'Southwest',
      'ar': 'جنوب غرب',
      'es': 'Suroeste',
      'fr': 'Sud-ouest',
      'zh_Hans': '西南',
    },
    'uakc6887': {
      'en': 'WN 3421',
      'ar': 'WN 3421',
      'es': 'WN 3421',
      'fr': 'WN 3421',
      'zh_Hans': 'WN 3421',
    },
    'czrqs4iz': {
      'en': '\$199',
      'ar': '199 دولارًا',
      'es': '\$199',
      'fr': '199 \$',
      'zh_Hans': '199美元',
    },
    '8tn4mero': {
      'en': 'PHX → LAS',
      'ar': 'فينيكس → لاس',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'oq5x82zs': {
      'en': '1h 10m • Direct',
      'ar': 'ساعة و10 دقائق • مباشر',
      'es': '1h 10m • Direct',
      'fr': '1 h 10 min • Direct',
      'zh_Hans': '1小时10分钟 • 直达',
    },
    'h8c3xk3l': {
      'en': '5:45 PM',
      'ar': '5:45 مساءً',
      'es': '17:45',
      'fr': '17h45',
      'zh_Hans': '下午5:45',
    },
    'h1zugaoj': {
      'en': 'Dec 15',
      'ar': '15 ديسمبر',
      'es': '15 de diciembre',
      'fr': '15 décembre',
      'zh_Hans': '12月15日',
    },
    'ornx3wol': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    '2rxe9o9g': {
      'en': 'Southwest',
      'ar': 'جنوب غرب',
      'es': 'Suroeste',
      'fr': 'Sud-ouest',
      'zh_Hans': '西南',
    },
    'h2ewzoej': {
      'en': 'WN 3421',
      'ar': 'WN 3421',
      'es': 'WN 3421',
      'fr': 'WN 3421',
      'zh_Hans': 'WN 3421',
    },
    'sj2ushay': {
      'en': '\$199',
      'ar': '199 دولارًا',
      'es': '\$199',
      'fr': '199 \$',
      'zh_Hans': '199美元',
    },
    'vh336tzz': {
      'en': 'PHX → LAS',
      'ar': 'فينيكس → لاس',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    '61fc5ilg': {
      'en': '1h 10m • Direct',
      'ar': 'ساعة و10 دقائق • مباشر',
      'es': '1h 10m • Direct',
      'fr': '1 h 10 min • Direct',
      'zh_Hans': '1小时10分钟 • 直达',
    },
    'hu7bqw1y': {
      'en': '5:45 PM',
      'ar': '5:45 مساءً',
      'es': '17:45',
      'fr': '17h45',
      'zh_Hans': '下午5:45',
    },
    'rwy6vn8i': {
      'en': 'Dec 15',
      'ar': '15 ديسمبر',
      'es': '15 de diciembre',
      'fr': '15 décembre',
      'zh_Hans': '12月15日',
    },
    '4bdbv48i': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'z8ff7g3l': {
      'en': 'Hotels',
      'ar': 'الفنادق',
      'es': 'Hoteles',
      'fr': 'Hôtels',
      'zh_Hans': '酒店',
    },
    'vugpjxjh': {
      'en': 'MGM Grand',
      'ar': 'إم جي إم جراند',
      'es': 'MGM Grand',
      'fr': 'MGM Grand',
      'zh_Hans': '米高梅大酒店',
    },
    'ho0nahth': {
      'en': '★★★★★ 4.8',
      'ar': '★★★★★ 4.8',
      'es': '★★★★★ 4.8',
      'fr': '★★★★★ 4,8',
      'zh_Hans': '★★★★★ 4.8',
    },
    'lj1zl10y': {
      'en': 'The Strip',
      'ar': 'الشريط',
      'es': 'La Franja',
      'fr': 'La bande',
      'zh_Hans': '拉斯维加斯大道',
    },
    '47dkb31s': {
      'en': '\$189/night',
      'ar': '189 دولارًا في الليلة',
      'es': '\$189 por noche',
      'fr': '189 \$ la nuit',
      'zh_Hans': '每晚189美元',
    },
    'ba3wn7c5': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'es': 'Detalles',
      'fr': 'Détails',
      'zh_Hans': '细节',
    },
    'kti8rb51': {
      'en': 'Bellagio Hotel',
      'ar': 'فندق بيلاجيو',
      'es': 'Hotel Bellagio',
      'fr': 'Hôtel Bellagio',
      'zh_Hans': '百乐宫酒店',
    },
    '9m2333w9': {
      'en': '★★★★★ 4.8',
      'ar': '★★★★★ 4.8',
      'es': '★★★★★ 4.8',
      'fr': '★★★★★ 4,8',
      'zh_Hans': '★★★★★ 4.8',
    },
    'n9x3ess9': {
      'en': 'The Strip',
      'ar': 'الشريط',
      'es': 'La Franja',
      'fr': 'La bande',
      'zh_Hans': '拉斯维加斯大道',
    },
    '4blyammi': {
      'en': '\$189/night',
      'ar': '189 دولارًا في الليلة',
      'es': '\$189 por noche',
      'fr': '189 \$ la nuit',
      'zh_Hans': '每晚189美元',
    },
    'uh4q02qj': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'es': 'Detalles',
      'fr': 'Détails',
      'zh_Hans': '细节',
    },
    'f879omax': {
      'en': 'Caesars Palace',
      'ar': 'قصر سيزرز',
      'es': 'Palacio de César',
      'fr': 'Palais de César',
      'zh_Hans': '凯撒宫',
    },
    'cpnjtifw': {
      'en': '★★★★★ 4.6',
      'ar': '★★★★★ 4.6',
      'es': '★★★★★ 4.6',
      'fr': '★★★★★ 4,6',
      'zh_Hans': '★★★★★ 4.6',
    },
    '47xlnqsx': {
      'en': 'The Strip',
      'ar': 'الشريط',
      'es': 'La Franja',
      'fr': 'La bande',
      'zh_Hans': '拉斯维加斯大道',
    },
    'li46vxht': {
      'en': '\$159/night',
      'ar': '159 دولارًا في الليلة',
      'es': '\$159 por noche',
      'fr': '159 \$ la nuit',
      'zh_Hans': '每晚159美元',
    },
    'n2mgyt24': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'es': 'Detalles',
      'fr': 'Détails',
      'zh_Hans': '细节',
    },
    '3tz2qtku': {
      'en': 'The Venetian',
      'ar': 'فندق البندقية',
      'es': 'El veneciano',
      'fr': 'Le Vénitien',
      'zh_Hans': '威尼斯人',
    },
    'eognvw65': {
      'en': '★★★★★ 4.7',
      'ar': '★★★★★ 4.7',
      'es': '★★★★★ 4.7',
      'fr': '★★★★★ 4,7',
      'zh_Hans': '★★★★★ 4.7',
    },
    'ypb7yhc9': {
      'en': 'The Strip',
      'ar': 'الشريط',
      'es': 'La Franja',
      'fr': 'La bande',
      'zh_Hans': '拉斯维加斯大道',
    },
    '5biyyl1i': {
      'en': '\$225/night',
      'ar': '225 دولارًا في الليلة',
      'es': '\$225 por noche',
      'fr': '225 \$/nuit',
      'zh_Hans': '每晚225美元',
    },
    'lz8ndx26': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'es': 'Detalles',
      'fr': 'Détails',
      'zh_Hans': '细节',
    },
    '5xhxqama': {
      'en': 'Paris Las Vegas',
      'ar': 'باريس لاس فيغاس',
      'es': 'París Las Vegas',
      'fr': 'Paris Las Vegas',
      'zh_Hans': '巴黎拉斯维加斯',
    },
    'cjwq0x1e': {
      'en': '★★★★★ 4.7',
      'ar': '★★★★★ 4.7',
      'es': '★★★★★ 4.7',
      'fr': '★★★★★ 4,7',
      'zh_Hans': '★★★★★ 4.7',
    },
    'pqv12v7h': {
      'en': 'The Strip',
      'ar': 'الشريط',
      'es': 'La Franja',
      'fr': 'La bande',
      'zh_Hans': '拉斯维加斯大道',
    },
    '4oz57rbu': {
      'en': '\$225/night',
      'ar': '225 دولارًا في الليلة',
      'es': '\$225 por noche',
      'fr': '225 \$/nuit',
      'zh_Hans': '每晚225美元',
    },
    'pucupjgz': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'es': 'Detalles',
      'fr': 'Détails',
      'zh_Hans': '细节',
    },
    'aphsz63t': {
      'en': 'Mandalay Bay',
      'ar': 'خليج ماندالاي',
      'es': 'Mandalay Bay',
      'fr': 'Baie de Mandalay',
      'zh_Hans': '曼德勒海湾',
    },
    'ml11eryl': {
      'en': '★★★★★ 4.7',
      'ar': '★★★★★ 4.7',
      'es': '★★★★★ 4.7',
      'fr': '★★★★★ 4,7',
      'zh_Hans': '★★★★★ 4.7',
    },
    'vj6ejdex': {
      'en': 'The Strip',
      'ar': 'الشريط',
      'es': 'La Franja',
      'fr': 'La bande',
      'zh_Hans': '拉斯维加斯大道',
    },
    'iysuw3lj': {
      'en': '\$225/night',
      'ar': '225 دولارًا في الليلة',
      'es': '\$225 por noche',
      'fr': '225 \$/nuit',
      'zh_Hans': '每晚225美元',
    },
    '4xwckqj5': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'es': 'Detalles',
      'fr': 'Détails',
      'zh_Hans': '细节',
    },
    '5kbfu35r': {
      'en': 'The LINQ',
      'ar': 'لينك',
      'es': 'El LINQ',
      'fr': 'Le LINQ',
      'zh_Hans': 'LINQ',
    },
    '5hi1cavp': {
      'en': '★★★★★ 4.7',
      'ar': '★★★★★ 4.7',
      'es': '★★★★★ 4.7',
      'fr': '★★★★★ 4,7',
      'zh_Hans': '★★★★★ 4.7',
    },
    '79zq8sdf': {
      'en': 'The Strip',
      'ar': 'الشريط',
      'es': 'La Franja',
      'fr': 'La bande',
      'zh_Hans': '拉斯维加斯大道',
    },
    'rkvilz8t': {
      'en': '\$225/night',
      'ar': '225 دولارًا في الليلة',
      'es': '\$225 por noche',
      'fr': '225 \$/nuit',
      'zh_Hans': '每晚225美元',
    },
    'qf7839xs': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'es': 'Detalles',
      'fr': 'Détails',
      'zh_Hans': '细节',
    },
    '5t7v0f8n': {
      'en': 'Flamingo Las Vegas',
      'ar': 'فلامنجو لاس فيغاس',
      'es': 'Flamingo Las Vegas',
      'fr': 'Flamingo Las Vegas',
      'zh_Hans': '拉斯维加斯弗拉明戈酒店',
    },
    'f60trbf1': {
      'en': '★★★★★ 4.7',
      'ar': '★★★★★ 4.7',
      'es': '★★★★★ 4.7',
      'fr': '★★★★★ 4,7',
      'zh_Hans': '★★★★★ 4.7',
    },
    '4prhuqmh': {
      'en': 'The Strip',
      'ar': 'الشريط',
      'es': 'La Franja',
      'fr': 'La bande',
      'zh_Hans': '拉斯维加斯大道',
    },
    '7lsw9odm': {
      'en': '\$225/night',
      'ar': '225 دولارًا في الليلة',
      'es': '\$225 por noche',
      'fr': '225 \$/nuit',
      'zh_Hans': '每晚225美元',
    },
    'ryzp38ca': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'es': 'Detalles',
      'fr': 'Détails',
      'zh_Hans': '细节',
    },
    'pnaes072': {
      'en': 'Landmarks',
      'ar': 'المعالم',
      'es': 'Monumentos',
      'fr': 'Monuments',
      'zh_Hans': '地标',
    },
    'rv1eroa1': {
      'en': 'Bellagio Fountains',
      'ar': 'نوافير بيلاجيو',
      'es': 'Fuentes del Bellagio',
      'fr': 'Fontaines du Bellagio',
      'zh_Hans': '百乐宫喷泉',
    },
    '4kqzn67z': {
      'en': 'Iconic water show',
      'ar': 'عرض مائي مميز',
      'es': 'Espectáculo acuático emblemático',
      'fr': 'Spectacle aquatique emblématique',
      'zh_Hans': '标志性水舞表演',
    },
    'sk33r6ob': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'w7o3b3a9': {
      'en': 'Welcome to Faboulous Las Vegas sign',
      'ar': 'مرحباً بكم في لاس فيغاس الرائعة',
      'es': 'Letrero de bienvenida a la fabulosa Las Vegas',
      'fr': 'Bienvenue à Fabulous Las Vegas',
      'zh_Hans': '欢迎来到拉斯维加斯绝妙标志',
    },
    'rkhktbyj': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    '637gytwa': {
      'en': 'Freemont Street',
      'ar': 'شارع فريمونت',
      'es': 'Calle Freemont',
      'fr': 'Rue Freemont',
      'zh_Hans': '弗里蒙特街',
    },
    'slw765fi': {
      'en': 'Iconic water show',
      'ar': 'عرض مائي مميز',
      'es': 'Espectáculo acuático emblemático',
      'fr': 'Spectacle aquatique emblématique',
      'zh_Hans': '标志性水舞表演',
    },
    'bs33jl9e': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'cdrnyp3w': {
      'en': 'The SRAT Tower',
      'ar': 'برج إس آر إيه تي',
      'es': 'La torre SRAT',
      'fr': 'La tour SRAT',
      'zh_Hans': 'SRAT塔',
    },
    '56femztm': {
      'en': 'Iconic water show',
      'ar': 'عرض مائي مميز',
      'es': 'Espectáculo acuático emblemático',
      'fr': 'Spectacle aquatique emblématique',
      'zh_Hans': '标志性水舞表演',
    },
    'bmbztfx0': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    '9qn9pezy': {
      'en': 'Neon Museum',
      'ar': 'متحف النيون',
      'es': 'Museo del neón',
      'fr': 'Musée du Néon',
      'zh_Hans': '霓虹灯博物馆',
    },
    'ex2jpfx8': {
      'en': 'Iconic water show',
      'ar': 'عرض مائي مميز',
      'es': 'Espectáculo acuático emblemático',
      'fr': 'Spectacle aquatique emblématique',
      'zh_Hans': '标志性水舞表演',
    },
    '6tg1f7lg': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    '7vauta66': {
      'en': 'Luxur Sphinx  & Pyramid',
      'ar': 'أبو الهول والهرم الفاخر',
      'es': 'Esfinge y Pirámide de Lujo',
      'fr': 'Luxur Sphinx et Pyramide',
      'zh_Hans': '豪华狮身人面像和金字塔',
    },
    'pue4bm2c': {
      'en': 'Iconic water show',
      'ar': 'عرض مائي مميز',
      'es': 'Espectáculo acuático emblemático',
      'fr': 'Spectacle aquatique emblématique',
      'zh_Hans': '标志性水舞表演',
    },
    'e9pbamh9': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'mrzyls4e': {
      'en': 'Eiffel Tower Replica',
      'ar': 'نسخة طبق الأصل من برج إيفل',
      'es': 'Réplica de la Torre Eiffel',
      'fr': 'Réplique de la Tour Eiffel',
      'zh_Hans': '埃菲尔铁塔复制品',
    },
    'boc2bw2v': {
      'en': 'Iconic water show',
      'ar': 'عرض مائي مميز',
      'es': 'Espectáculo acuático emblemático',
      'fr': 'Spectacle aquatique emblématique',
      'zh_Hans': '标志性水舞表演',
    },
    'c17b9aj9': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'qqbeb3ld': {
      'en': 'Events',
      'ar': 'الفعاليات',
      'es': 'Eventos',
      'fr': 'Événements',
      'zh_Hans': '活动',
    },
    'kcgogctv': {
      'en': 'Tiesto',
      'ar': 'تيستو',
      'es': 'Tiesto',
      'fr': 'Tiesto',
      'zh_Hans': '铁斯托',
    },
    'd9i0ax0o': {
      'en': 'OMNIA Nightclub, Ceasers Palace',
      'ar': 'ملهى أومنيا الليلي، قصر سيزرز',
      'es': 'Discoteca OMNIA, Caesars Palace',
      'fr': 'Boîte de nuit OMNIA, Caesars Palace',
      'zh_Hans': 'OMNIA 夜总会，凯撒宫',
    },
    '485echth': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'm5nj5vfp': {
      'en': 'David Copperfield',
      'ar': 'ديفيد كوبرفيلد',
      'es': 'David Copperfield',
      'fr': 'David Copperfield',
      'zh_Hans': '大卫·科波菲尔',
    },
    'ertuaqhk': {
      'en': 'David Copperfield Theater, MGM Grand',
      'ar': 'مسرح ديفيد كوبرفيلد، إم جي إم جراند',
      'es': 'Teatro David Copperfield, MGM Grand',
      'fr': 'Théâtre David Copperfield, MGM Grand',
      'zh_Hans': '米高梅大酒店的大卫·科波菲尔剧院',
    },
    'nwl0dai9': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    '624ddwau': {
      'en': 'Cirque du Soleil',
      'ar': 'سيرك دو سوليه',
      'es': 'Cirque du Soleil',
      'fr': 'Cirque du Soleil',
      'zh_Hans': '太阳马戏团',
    },
    '82qqwbfo': {
      'en': 'Mystère Theatre, Treasure Island',
      'ar': 'مسرح ميستير، جزيرة الكنز',
      'es': 'Teatro Mystère, La Isla del Tesoro',
      'fr': 'Théâtre Mystère, Île au Trésor',
      'zh_Hans': '金银岛神秘剧院',
    },
    'kukr7saa': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'ashgyoii': {
      'en': 'Blue Man Group',
      'ar': 'فرقة بلو مان',
      'es': 'Grupo Blue Man',
      'fr': 'Groupe Blue Man',
      'zh_Hans': '蓝人组合',
    },
    'nybdup6r': {
      'en': 'Blue Man Theater, The Luxor Hotel',
      'ar': 'مسرح بلو مان، فندق لوكسور',
      'es': 'Teatro Blue Man, Hotel Luxor',
      'fr': 'Théâtre Blue Man, Hôtel Luxor',
      'zh_Hans': '蓝人剧院，卢克索酒店',
    },
    'tdxs6bfh': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'byed13a4': {
      'en': 'OMNIA Nightclub',
      'ar': 'ملهى أومنيا الليلي',
      'es': 'Discoteca OMNIA',
      'fr': 'Boîte de nuit OMNIA',
      'zh_Hans': 'OMNIA 夜总会',
    },
    'i0r7uf4a': {
      'en': 'Tiesto',
      'ar': 'تيستو',
      'es': 'Tiesto',
      'fr': 'Tiesto',
      'zh_Hans': '铁斯托',
    },
    'fj5zwd56': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'vlnj50pa': {
      'en': 'Dom Dolla w/ Justin Mylo',
      'ar': 'دوم دولا مع جاستن مايلو',
      'es': 'Dom Dolla con Justin Mylo',
      'fr': 'Dom Dolla avec Justin Mylo',
      'zh_Hans': 'Dom Dolla 与 Justin Mylo',
    },
    'znz1xewn': {
      'en': 'OMNIA Nightclub, Ceasers Palace',
      'ar': 'ملهى أومنيا الليلي، قصر سيزرز',
      'es': 'Discoteca OMNIA, Caesars Palace',
      'fr': 'Boîte de nuit OMNIA, Caesars Palace',
      'zh_Hans': 'OMNIA 夜总会，凯撒宫',
    },
    'cpuck9ga': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'vpmryqhh': {
      'en': 'Meduza',
      'ar': 'ميدوزا',
      'es': 'Medusa',
      'fr': 'Méduza',
      'zh_Hans': '美杜莎',
    },
    '5kr52pes': {
      'en': 'Zouk Nightclub',
      'ar': 'ملهى زوك الليلي',
      'es': 'Discoteca Zouk',
      'fr': 'Boîte de nuit Zouk',
      'zh_Hans': 'Zouk夜总会',
    },
    'pikkhurj': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'xkfs0oop': {
      'en': 'Book',
      'ar': 'كتاب',
      'es': 'Libro',
      'fr': 'Livre',
      'zh_Hans': '书',
    },
  },
  // FAQs
  {
    'p8eghbs9': {
      'en': 'FREQUENTLY ASKED QUESTIONS',
      'ar': 'الأسئلة الشائعة',
      'es': 'PREGUNTAS FRECUENTES',
      'fr': 'QUESTIONS FRÉQUEMMENT POSÉES',
      'zh_Hans': '常见问题解答',
    },
    '4bkezgr2': {
      'en':
          'About Kitravia\n\nQ1: What is Kitravia?\nKitravia is an AI-powered travel planning and booking platform that helps users discover, plan, and book their trips smarter and faster. It combines real-time flight, hotel, cruise, and car rental search with AI-driven personalized itinerary creation — available on web, Google Play, and the App Store. The platform serves four distinct profiles: Admins, Business partners/affiliates, registered Users, and unregistered Visitors.\n\nQ2: How does Kitravia use Artificial Intelligence?\nOur AI Travel Assistant learns from your travel preferences, budget, and history to create custom itineraries, recommend destinations, and suggest real-time deals. It features conversational AI, voice-to-text input, predictive pricing, error fare detection, and a Smart Radar live tracking system — all powered by our proprietary Quantum Metrics Engine.\n\nQ3: What makes Kitravia different from other travel platforms?\nKitravia integrates multi-modal smart booking, AI price tracking, error fare detection, a Predictive AI Travel Oracle, AR/VR destination previews, AI eBook Studio, tokenized loyalty rewards (KTVA), and a B2B API ecosystem — all in one unified intelligent platform. Our four-profile ecosystem (Admin, Business, User, Visitor) ensures the right experience for every stakeholder.\n\nUser Accounts & Profiles\n\nQ4: What is the difference between a free and premium user?\nFree Users access basic search, destination guides, and approximately 30% of AI travel deals at no cost. Premium Users (\$9.99/month or \$120/year) unlock 100% of deals, error fare alerts, AI Dynamic Packages, Smart Radar live tracking, the AI eBook Studio, and priority customer support. All plans include a 60-day money-back guarantee.\n\nQ5: How do I become a Business Partner or Affiliate?\nPartners are businesses, travel agencies, DMCs, or Expert Agents who integrate their services into Kitravia via API or the Partner Dashboard. Affiliates are content creators or individuals who earn performance-based commissions by promoting Kitravia through tracking links. Apply at partners@kitravia.com.\n\nQ6: Can I use Kitravia without creating an account?\nYes. Unregistered Visitors (No User profile) can explore destination content, read travel guides, and discover Kitravia\'s services in view-only mode. To plan trips, book travel, or access AI features, you must create a free account.\n\nBooking & Search\n\nQ7: What types of bookings can I make with Kitravia?\nYou can book flights, hotels, cruises, car rentals, holiday packages, adventure safaris, and local activities — individually or as part of an AI-generated dynamic package tailored to your preferences and budget.\n\nQ8: How does Kitravia find cheap flights and hidden deals?\nOur AI Error Fare Finder continuously scans global airline pricing APIs to detect pricing anomalies — sometimes up to 90% off standard fares. It displays a confidence score and, for Premium members, offers an auto-book-on-confirm option. The Predictive AI Travel Oracle also forecasts price drops before they happen.\n\nQ9: Does Kitravia support last-minute bookings?\nYes. The platform updates in real time. Smart Radar also monitors live availability, delays, and alternatives so travelers can rebook instantly in case of disruption.\n\nSmart Travel Tools\n\nQ10: What is Smart Radar?\nSmart Radar is your live journey intelligence dashboard. It monitors flight statuses, boarding gates, delays, cruise schedules, car rental pickups, and even luggage (via AirTag/GPS integration). Safety Shield provides live weather and incident rerouting. Trip Pulse visualizes your full journey on an animated map. Friends & Family View lets loved ones track your trip securely.\n\nQ11: What is the AI eBook Studio?\nThe AI eBook Studio automatically generates a personalized travel book or expedition journal using your past or planned trips, uploaded photos, maps, and notes. Choose a theme (Adventure, Cultural, Romantic, Historical), export as PDF/ePub, or share with the Kitravia Community Gallery. Available to Premium users.\n\nQ12: What is the Kitravia Rewards Protocol (KTVA)?\nEvery booking, share, or review earns Kitravia Points (KTVA). Points can be redeemed for future bookings, premium AI features, or exclusive NFT-based travel collectibles. The system optionally integrates with blockchain (Polygon/Solana) for full transparency and portability.\n\nPrivacy, Security & Support\n\nQ13: Is my personal data protected?\nYes. Kitravia complies with GDPR, CCPA, and COPPA. Your data is used solely to improve your personalized experience and is never sold or shared with third parties. You may request access, correction, or deletion of your data at any time via privacy@kitravia.com.\n\nQ14: Is my payment information safe?\nAbsolutely. We use SSL/TLS encryption and PCI DSS-compliant payment processors. Raw card data is never stored on Kitravia servers.\n\nQ15: How do I contact Kitravia support?\nOur AI Support Assistant is available 24/7. Human support is available via: Email: support@kitravia.com | Live Chat on web and mobile app | Community channels on Facebook, Instagram, LinkedIn, and Pinterest. Business partners have a dedicated Partner Success Manager.\n\nQ16: Where can I download Kitravia?\nWeb: www.kitravia.com | Android: Google Play Store | iOS: Apple App Store. Your account syncs seamlessly across all devices.\n',
      'ar':
          'نبذة عن كيترافيا\n\nس1: ما هي كيترافيا؟\nكيترافيا هي منصة لتخطيط وحجز السفر مدعومة بالذكاء الاصطناعي، تساعد المستخدمين على اكتشاف رحلاتهم وتخطيطها وحجزها بذكاء وسرعة أكبر. تجمع المنصة بين البحث الفوري عن رحلات الطيران والفنادق والرحلات البحرية وتأجير السيارات، مع إنشاء مسارات رحلات مخصصة مدعومة بالذكاء الاصطناعي، وهي متاحة على الويب ومتجر جوجل بلاي ومتجر آب ستور. تخدم المنصة أربعة فئات رئيسية: المديرون، وشركاء الأعمال/الشركات التابعة، والمستخدمون المسجلون، والزوار غير المسجلين.\n\nس2: كيف تستخدم كيترافيا الذكاء الاصطناعي؟\nيتعلم مساعد السفر المدعوم بالذكاء الاصطناعي من تفضيلاتك في السفر وميزانيتك وسجل رحلاتك لإنشاء مسارات رحلات مخصصة، واقتراح وجهات، وعرض عروض فورية. يتميز المساعد بذكاء اصطناعي تفاعلي، وإمكانية تحويل الصوت إلى نص، وتسعير تنبؤي، وكشف أخطاء الأسعار، ونظام تتبع ذكي مباشر - وكل ذلك مدعوم بمحرك كوانتوم متريكس الخاص بنا.\n\nس3: ما الذي يميز كيترافيا عن منصات السفر الأخرى؟\n\nتُدمج Kitravia الحجز الذكي متعدد الوسائط، وتتبع الأسعار بالذكاء الاصطناعي، وكشف أخطاء الأسعار، ونظام التنبؤ بالسفر بالذكاء الاصطناعي، ومعاينات الوجهات بتقنيتي الواقع المعزز والواقع الافتراضي، واستوديو الكتب الإلكترونية بالذكاء الاصطناعي، ومكافآت الولاء المُرمّزة (KTVA)، ونظام واجهة برمجة تطبيقات B2B - كل ذلك في منصة ذكية موحدة. يضمن نظامنا ذو الملفات الشخصية الأربعة (المسؤول، الأعمال، المستخدم، الزائر) تجربة مثالية لكل مستخدم.\n\nحسابات المستخدمين وملفاتهم الشخصية\n\nس4: ما الفرق بين المستخدم المجاني والمستخدم المميز؟\n\nيتمتع المستخدمون المجانيون بإمكانية الوصول إلى البحث الأساسي، وأدلة الوجهات، وحوالي 30% من عروض السفر المدعومة بالذكاء الاصطناعي مجانًا. أما المستخدمون المميزون (9.99 دولارًا أمريكيًا شهريًا أو 120 دولارًا أمريكيًا سنويًا) فيتمتعون بإمكانية الوصول إلى جميع العروض، وتنبيهات أخطاء الأسعار، وباقات الذكاء الاصطناعي الديناميكية، والتتبع المباشر للرادار الذكي، واستوديو الكتب الإلكترونية بالذكاء الاصطناعي، ودعم عملاء ذي أولوية. جميع الباقات تشمل ضمان استرداد الأموال لمدة 60 يومًا.\n\nس5: كيف أصبح شريكًا تجاريًا أو مسوّقًا بالعمولة؟\n\nالشركاء هم شركات، ووكالات سفر، وشركات إدارة وجهات سياحية، أو وكلاء سفر خبراء، يقومون بدمج خدماتهم في منصة Kitravia عبر واجهة برمجة التطبيقات (API) أو لوحة تحكم الشركاء. أما المسوّقون بالعمولة فهم منشئو محتوى أو أفراد يحصلون على عمولات بناءً على الأداء من خلال الترويج لمنصة Kitravia عبر روابط التتبع. للتقديم، يُرجى التواصل عبر البريد الإلكتروني partners@kitravia.com.\n\n\nس6: هل يُمكنني استخدام Kitravia دون إنشاء حساب؟\n\n\nنعم. يُمكن للزوار غير المسجلين (بدون ملف تعريف) استكشاف محتوى الوجهات، وقراءة أدلة السفر، والتعرف على خدمات Kitravia في وضع العرض فقط. لتخطيط الرحلات، أو حجز السفر، أو الوصول إلى ميزات الذكاء الاصطناعي، يجب عليك إنشاء حساب مجاني.\n\n\nالحجز والبحث\n\n\nس7: ما أنواع الحجوزات التي يُمكنني إجراؤها عبر Kitravia؟\n\nيُمكنك حجز رحلات طيران، وفنادق، ورحلات بحرية، وتأجير سيارات، وباقات عطلات، ورحلات سفاري، وأنشطة محلية - بشكل فردي أو كجزء من باقة ديناميكية مُولّدة بواسطة الذكاء الاصطناعي ومُصممة خصيصًا لتناسب تفضيلاتك وميزانيتك.\n\n\nس8: كيف تجد Kitravia رحلات طيران رخيصة وعروضًا مميزة؟\n\n\n\nس8: كيف تجد Kitravia رحلات طيران رخيصة وعروضًا حصرية؟ يقوم نظامنا الذكي لاكتشاف أخطاء الأسعار، المدعوم بالذكاء الاصطناعي، بمسح واجهات برمجة تطبيقات أسعار شركات الطيران العالمية باستمرار للكشف عن أي خلل في الأسعار، والذي قد يصل أحيانًا إلى 90% من الأسعار القياسية. يعرض النظام درجة ثقة، ويُتيح للأعضاء المميزين خيار الحجز التلقائي عند التأكيد. كما يتوقع نظامنا الذكي للتنبؤ بانخفاض الأسعار قبل حدوثه.\n\n\nس9: هل يدعم Kitravia الحجوزات في اللحظات الأخيرة؟\n\n\nنعم. يتم تحديث المنصة في الوقت الفعلي. كما يراقب نظام Smart Radar التوافر المباشر، والتأخيرات، والبدائل المتاحة، مما يُمكّن المسافرين من إعادة الحجز فورًا في حال حدوث أي اضطراب.\n\n\n\nأدوات السفر الذكية\n\n\nس10: ما هو نظام Smart Radar؟\n\n\nنظام Smart Radar هو لوحة معلومات رحلتك الذكية المباشرة. يراقب النظام حالة الرحلات، وبوابات الصعود إلى الطائرة، والتأخيرات، وجداول الرحلات البحرية، ومواعيد استلام السيارات المستأجرة، وحتى الأمتعة (عبر التكامل مع AirTag/GPS). يوفر نظام Safety Shield معلومات مباشرة عن حالة الطقس وإعادة توجيه الرحلات في حالات الطوارئ. يعرض نظام Trip Pulse رحلتك كاملة على خريطة متحركة. تتيح ميزة Friends & Family View لأحبائك تتبع رحلتك بأمان.\n\n\n\nس11: ما هو AI eBook Studio؟ يُنشئ استوديو الكتب الإلكترونية المدعوم بالذكاء الاصطناعي تلقائيًا كتاب سفر أو مذكرات رحلات شخصية باستخدام رحلاتك السابقة أو المخطط لها، والصور والخرائط والملاحظات التي قمت بتحميلها. اختر موضوعًا (مغامرة، ثقافي، رومانسي، تاريخي)، وصدّره بصيغة PDF/ePub، أو شاركه مع معرض مجتمع Kitravia. متاح لمستخدمي Premium.\n\n\nس١٢: ما هو بروتوكول مكافآت Kitravia (KTVA)؟\n\nكل حجز أو مشاركة أو تقييم يُكسبك نقاط Kitravia (KTVA). يُمكن استبدال النقاط بحجوزات مستقبلية، أو بميزات الذكاء الاصطناعي المميزة، أو بمقتنيات سفر حصرية قائمة على تقنية NFT. يتكامل النظام اختياريًا مع تقنية البلوك تشين (Polygon/Solana) لضمان الشفافية الكاملة وسهولة النقل.\n\n\nالخصوصية والأمان والدعم\n\n\nس١٣: هل بياناتي الشخصية محمية؟\n\nنعم. تلتزم Kitravia بلوائح حماية البيانات العامة (GDPR) وقانون خصوصية المستهلك في كاليفورنيا (CCPA) وقانون حماية خصوصية الأطفال على الإنترنت (COPPA). تُستخدم بياناتك فقط لتحسين تجربتك الشخصية، ولا يتم بيعها أو مشاركتها مع أي جهات خارجية. يمكنك طلب الوصول إلى بياناتك أو تصحيحها أو حذفها في أي وقت عبر البريد الإلكتروني privacy@kitravia.com.\n\nس14: هل معلومات الدفع الخاصة بي آمنة؟\n\nبالتأكيد. نستخدم تشفير SSL/TLS ومعالجات دفع متوافقة مع معايير PCI DSS. لا يتم تخزين بيانات البطاقة الخام على خوادم Kitravia مطلقًا.\n\nس15: كيف أتواصل مع دعم Kitravia؟\n\nمساعد الدعم المدعوم بالذكاء الاصطناعي متوفر على مدار الساعة. يتوفر الدعم البشري عبر: البريد الإلكتروني: support@kitravia.com | الدردشة المباشرة على الموقع الإلكتروني وتطبيق الهاتف | قنوات التواصل على فيسبوك، إنستغرام، لينكدإن، وبينترست. يُخصص لكل شريك تجاري مدير نجاح شركاء.\n\nس16: أين يمكنني تحميل Kitravia؟\nالموقع الإلكتروني: www.kitravia.com | أندرويد: متجر جوجل بلاي | iOS: متجر تطبيقات أبل. تتم مزامنة حسابك بسلاسة عبر جميع أجهزتك.',
      'es':
          'Acerca de Kitravia\n\nP1: ¿Qué es Kitravia?\n\nKitravia es una plataforma de planificación y reserva de viajes con inteligencia artificial que ayuda a los usuarios a descubrir, planificar y reservar sus viajes de forma más inteligente y rápida. Combina la búsqueda en tiempo real de vuelos, hoteles, cruceros y alquiler de coches con la creación de itinerarios personalizados mediante IA, disponible en la web, Google Play y la App Store. La plataforma ofrece cuatro perfiles distintos: administradores, socios comerciales/afiliados, usuarios registrados y visitantes no registrados.\n\nP2: ¿Cómo utiliza Kitravia la inteligencia artificial?\n\nNuestro asistente de viajes con IA aprende de tus preferencias de viaje, presupuesto e historial para crear itinerarios personalizados, recomendar destinos y sugerir ofertas en tiempo real. Incluye IA conversacional, entrada de voz a texto, precios predictivos, detección de errores en las tarifas y un sistema de seguimiento en vivo Smart Radar, todo ello impulsado por nuestro motor de métricas cuánticas patentado.\n\nP3: ¿Qué diferencia a Kitravia de otras plataformas de viajes?\nKitravia integra reservas inteligentes multimodales, seguimiento de precios con IA, detección de errores en las tarifas, un oráculo predictivo de viajes con IA, vistas previas de destinos en realidad aumentada/virtual, un estudio de libros electrónicos con IA, recompensas de fidelización tokenizadas (KTVA) y un ecosistema API B2B, todo en una plataforma inteligente unificada. Nuestro ecosistema de cuatro perfiles (Administrador, Empresa, Usuario y Visitante) garantiza la experiencia adecuada para cada usuario.\n\nCuentas y perfiles de usuario\n\nP4: ¿Cuál es la diferencia entre un usuario gratuito y uno premium?\n\nLos usuarios gratuitos acceden a la búsqueda básica, guías de destinos y aproximadamente el 30 % de las ofertas de viajes con IA sin coste alguno. Los usuarios premium (9,99 \$/mes o 120 \$/año) desbloquean el 100 % de las ofertas, alertas de errores en las tarifas, paquetes dinámicos con IA, seguimiento en tiempo real con Smart Radar, el estudio de libros electrónicos con IA y atención al cliente prioritaria. Todos los planes incluyen una garantía de reembolso de 60 días.\n\nP5: ¿Cómo puedo convertirme en socio comercial o afiliado?\nLos socios son empresas, agencias de viajes, DMC o agentes expertos que integran sus servicios en Kitravia mediante API o el Panel de Socios. Los afiliados son creadores de contenido o particulares que obtienen comisiones por rendimiento al promocionar Kitravia a través de enlaces de seguimiento. Para solicitarlo, escribe a partners@kitravia.com.\n\nP6: ¿Puedo usar Kitravia sin crear una cuenta?\n\nSí. Los visitantes no registrados (sin perfil de usuario) pueden explorar el contenido de los destinos, leer guías de viaje y descubrir los servicios de Kitravia en modo de solo lectura. Para planificar viajes, reservar o acceder a las funciones de IA, debes crear una cuenta gratuita.\n\nReservas y búsqueda\n\nP7: ¿Qué tipos de reservas puedo hacer con Kitravia?\n\nPuedes reservar vuelos, hoteles, cruceros, alquiler de coches, paquetes vacacionales, safaris de aventura y actividades locales, individualmente o como parte de un paquete dinámico generado por IA, adaptado a tus preferencias y presupuesto.\n\nP8: ¿Cómo encuentra Kitravia vuelos baratos y ofertas ocultas?\nNuestro buscador de tarifas con IA analiza continuamente las API de precios de las aerolíneas globales para detectar anomalías, a veces con descuentos de hasta el 90 % sobre las tarifas estándar. Muestra un índice de confianza y, para los miembros Premium, ofrece la opción de reserva automática al confirmar la reserva. El Oráculo de Viajes con IA Predictiva también pronostica bajadas de precio antes de que ocurran.\n\nP9: ¿Kitravia admite reservas de última hora?\n\nSí. La plataforma se actualiza en tiempo real. Smart Radar también monitoriza la disponibilidad, los retrasos y las alternativas en directo para que los viajeros puedan reprogramar su viaje al instante en caso de incidencias.\n\nHerramientas de Viaje Inteligentes\n\nP10: ¿Qué es Smart Radar?\n\nSmart Radar es tu panel de control con información de viaje en tiempo real. Monitoriza el estado de los vuelos, las puertas de embarque, los retrasos, los horarios de los cruceros, la recogida de coches de alquiler e incluso el equipaje (mediante la integración de AirTag/GPS). Safety Shield proporciona información meteorológica en tiempo real y desvíos por incidentes. Trip Pulse visualiza tu viaje completo en un mapa animado. La Vista para Amigos y Familiares permite a tus seres queridos seguir tu viaje de forma segura.\n\nP11: ¿Qué es el Estudio de Libros Electrónicos con IA?\n\nEl Estudio de Libros Electrónicos con IA genera automáticamente un libro de viajes o diario de expedición personalizado utilizando tus viajes pasados ​​o planeados, fotos, mapas y notas subidas. Elige un tema (Aventura, Cultural, Romántico, Histórico), expórtalo como PDF/ePub o compártelo en la Galería de la Comunidad de Kitravia. Disponible para usuarios Premium.\n\nP12: ¿Qué es el Protocolo de Recompensas de Kitravia (KTVA)?\n\nCada reserva, publicación o reseña te otorga Puntos Kitravia (KTVA). Los puntos se pueden canjear por futuras reservas, funciones premium de IA o coleccionables de viaje exclusivos basados ​​en NFT. El sistema se integra opcionalmente con blockchain (Polygon/Solana) para una total transparencia y portabilidad.\n\nPrivacidad, Seguridad y Soporte\n\nP13: ¿Están protegidos mis datos personales?\n\nSí. Kitravia cumple con el RGPD, la CCPA y la COPPA. Tus datos se utilizan exclusivamente para mejorar tu experiencia personalizada y nunca se venden ni se comparten con terceros. Puedes solicitar acceso, corrección o eliminación de tus datos en cualquier momento a través de privacy@kitravia.com.\n\nP14: ¿Mi información de pago está segura?\n\nPor supuesto. Utilizamos cifrado SSL/TLS y procesadores de pago compatibles con PCI DSS. Los datos brutos de la tarjeta nunca se almacenan en los servidores de Kitravia.\n\nP15: ¿Cómo puedo contactar con el soporte de Kitravia?\n\nNuestro Asistente de Soporte con IA está disponible las 24 horas, los 7 días de la semana. También puedes contactar con un agente a través de: Correo electrónico: support@kitravia.com | Chat en vivo en la web y la aplicación móvil | Canales de la comunidad en Facebook, Instagram, LinkedIn y Pinterest. Los socios comerciales cuentan con un Gestor de Éxito de Socios dedicado.\n\nP16: ¿Dónde puedo descargar Kitravia?\n\nWeb: www.kitravia.com | Android: Google Play Store | iOS: Apple App Store. Tu cuenta se sincroniza automáticamente en todos tus dispositivos.',
      'fr':
          'À propos de Kitravia\n\nQ1 : Qu’est-ce que Kitravia ?\n\nKitravia est une plateforme de planification et de réservation de voyages basée sur l’IA qui aide les utilisateurs à découvrir, planifier et réserver leurs voyages plus intelligemment et plus rapidement. Elle combine la recherche en temps réel de vols, d’hôtels, de croisières et de locations de voitures avec la création d’itinéraires personnalisés par l’IA. Disponible sur le web, Google Play et l’App Store, la plateforme s’adresse à quatre profils distincts : administrateurs, partenaires commerciaux/affiliés, utilisateurs enregistrés et visiteurs non enregistrés.\n\nQ2 : Comment Kitravia utilise-t-elle l’intelligence artificielle ?\n\nNotre assistant de voyage IA apprend de vos préférences de voyage, de votre budget et de votre historique pour créer des itinéraires personnalisés, recommander des destinations et suggérer des offres en temps réel. Il intègre une IA conversationnelle, la saisie vocale, la tarification prédictive, la détection des erreurs de prix et un système de suivi en direct Smart Radar, le tout grâce à notre moteur propriétaire Quantum Metrics Engine.\n\nQ3 : Qu’est-ce qui différencie Kitravia des autres plateformes de voyage ? Kitravia intègre la réservation intelligente multimodale, le suivi des prix par IA, la détection des erreurs de prix, un système prédictif de réservation de voyage par IA, des aperçus de destinations en réalité augmentée/réalité virtuelle, un studio de création d\'e-books par IA, un programme de fidélité tokenisé (KTVA) et un écosystème d\'API B2B, le tout sur une plateforme intelligente unifiée. Notre écosystème à quatre profils (Administrateur, Entreprise, Utilisateur, Visiteur) garantit une expérience optimale à chaque acteur.\n\nComptes et profils utilisateurs\n\nQ4 : Quelle est la différence entre un utilisateur gratuit et un utilisateur premium ?\n\nLes utilisateurs gratuits ont accès à la recherche de base, aux guides de destination et à environ 30 % des offres de voyage générées par IA, sans frais. Les utilisateurs premium (9,99 \$/mois ou 120 \$/an) bénéficient de l\'accès à 100 % des offres, aux alertes en cas d\'erreur de prix, aux forfaits dynamiques par IA, au suivi en direct Smart Radar, au studio de création d\'e-books par IA et à une assistance client prioritaire. Tous les abonnements incluent une garantie de remboursement de 60 jours.\n\nQ5 : Comment devenir partenaire commercial ou affilié ? Les partenaires sont des entreprises, des agences de voyages, des DMC ou des agents experts qui intègrent leurs services à Kitravia via l\'API ou le tableau de bord partenaires. Les affiliés sont des créateurs de contenu ou des particuliers qui perçoivent des commissions à la performance en faisant la promotion de Kitravia via des liens de suivi. Postulez à partners@kitravia.com.\n\nQ6 : Puis-je utiliser Kitravia sans créer de compte ?\n\nOui. Les visiteurs non enregistrés (sans profil utilisateur) peuvent explorer le contenu des destinations, lire des guides de voyage et découvrir les services de Kitravia en mode consultation seule. Pour planifier des voyages, réserver des voyages ou accéder aux fonctionnalités d\'IA, vous devez créer un compte gratuit.\n\nRéservation et recherche\n\nQ7 : Quels types de réservations puis-je effectuer avec Kitravia ?\n\nVous pouvez réserver des vols, des hôtels, des croisières, des locations de voitures, des forfaits vacances, des safaris et des activités locales, individuellement ou dans le cadre d\'un forfait dynamique généré par l\'IA et adapté à vos préférences et à votre budget.\n\nQ8 : Comment Kitravia trouve-t-il les vols pas chers et les offres cachées ? Notre outil de détection des erreurs de prix par IA analyse en continu les API de tarification des compagnies aériennes du monde entier afin de repérer les anomalies tarifaires, offrant parfois des réductions allant jusqu\'à 90 % sur les tarifs standards. Il affiche un score de confiance et propose, pour les membres Premium, une option de réservation automatique dès confirmation. Notre système prédictif d\'IA pour les voyages anticipe également les baisses de prix.\n\nQ9 : Kitravia prend-il en charge les réservations de dernière minute ?\n\nOui. La plateforme est mise à jour en temps réel. Smart Radar surveille également en direct la disponibilité, les retards et les alternatives afin que les voyageurs puissent réserver à nouveau instantanément en cas de perturbation.\n\nOutils de voyage intelligents\n\nQ10 : Qu\'est-ce que Smart Radar ?\n\nSmart Radar est votre tableau de bord interactif d\'informations sur votre voyage. Il surveille le statut des vols, les portes d\'embarquement, les retards, les horaires de croisière, la prise en charge des voitures de location et même les bagages (via l\'intégration AirTag/GPS). Safety Shield fournit des informations météorologiques en temps réel et des suggestions de réitinéraire en cas d\'incident. Trip Pulse visualise l\'intégralité de votre voyage sur une carte animée. L\'option « Amis et Famille » permet à vos proches de suivre votre voyage en toute sécurité.\n\nQ11 : Qu\'est-ce que l\'AI eBook Studio ?\n\nL\'Atelier d\'eBooks IA génère automatiquement un carnet de voyage ou un journal d\'expédition personnalisé à partir de vos voyages passés ou à venir, de vos photos, cartes et notes. Choisissez un thème (Aventure, Culture, Romantisme, Historique), exportez au format PDF/ePub ou partagez-le avec la Galerie de la communauté Kitravia. Disponible pour les utilisateurs Premium.\n\nQ12 : Qu\'est-ce que le Protocole de Récompenses Kitravia (KTVA) ?\n\nChaque réservation, partage ou avis vous permet de gagner des Points Kitravia (KTVA). Ces points peuvent être échangés contre de futures réservations, des fonctionnalités IA premium ou des objets de collection de voyage exclusifs basés sur la technologie NFT. Le système s\'intègre en option à la blockchain (Polygon/Solana) pour une transparence et une portabilité totales.\n\nConfidentialité, Sécurité et Assistance\n\nQ13 : Mes données personnelles sont-elles protégées ?\n\nOui. Kitravia est conforme au RGPD, au CCPA et au COPPA. Vos données sont utilisées uniquement pour améliorer votre expérience personnalisée et ne sont jamais vendues ni partagées avec des tiers. Vous pouvez demander à tout moment l\'accès, la rectification ou la suppression de vos données à l\'adresse privacy@kitravia.com.\n\nQ14 : Mes informations de paiement sont-elles sécurisées ?\n\nAbsolument. Nous utilisons le chiffrement SSL/TLS et des processeurs de paiement conformes à la norme PCI DSS. Les données brutes de votre carte ne sont jamais stockées sur les serveurs de Kitravia.\n\nQ15 : Comment contacter l’assistance Kitravia ?\n\nNotre assistant d’assistance IA est disponible 24 h/24 et 7 j/7. Vous pouvez également nous contacter par : Courriel : support@kitravia.com | Chat en direct sur le site web et l’application mobile | Forums sur Facebook, Instagram, LinkedIn et Pinterest. Nos partenaires commerciaux bénéficient d’un responsable de la réussite client dédié.\n\nQ16 : Où puis-je télécharger Kitravia ?\n\nSite web : www.kitravia.com | Android : Google Play Store | iOS : Apple App Store. Votre compte se synchronise automatiquement sur tous vos appareils.',
      'zh_Hans':
          '关于 Kitravia\n\n问题 1：什么是 Kitravia？\n\nKitravia 是一个人工智能驱动的旅行规划和预订平台，帮助用户更智能、更快捷地发现、规划和预订行程。它结合了实时航班、酒店、邮轮和租车搜索以及人工智能驱动的个性化行程创建功能，用户可通过网页、Google Play 和 App Store 使用。该平台服务于四种不同的用户群体：管理员、商业伙伴/联盟会员、注册用户和非注册访客。\n\n问题 2：Kitravia 如何使用人工智能？\n\n我们的人工智能旅行助手会学习您的旅行偏好、预算和历史记录，从而创建定制行程、推荐目的地并提供实时优惠。它具备对话式人工智能、语音转文本输入、预测定价、错误票价检测和智能雷达实时跟踪系统等功能——所有这些都由我们自主研发的 Quantum Metrics Engine 提供支持。\n\n问题 3：Kitravia 与其他旅行平台有何不同？\n\nKitravia 将多模式智能预订、AI 价格追踪、错误票价检测、预测性 AI 旅行预言机、AR/VR 目的地预览、AI 电子书工作室、代币化忠诚度奖励 (KTVA) 以及 B2B API 生态系统整合到一个统一的智能平台中。我们四种用户角色（管理员、企业、用户、访客）的生态系统确保每位利益相关者都能获得最佳体验。\n\n用户账户和个人资料\n\n问 4：免费用户和高级用户有什么区别？\n\n免费用户可以免费使用基本搜索、目的地指南以及大约 30% 的 AI 旅行优惠。高级用户（每月 9.99 美元或每年 120 美元）可以解锁 100% 的优惠、错误票价提醒、AI 动态套餐、智能雷达实时追踪、AI 电子书工作室以及优先客户支持。所有套餐均包含 60 天退款保证。\n\n问 5：如何成为业务合作伙伴或联盟会员？\n\n合作伙伴是指通过 API 或合作伙伴控制面板将自身服务集成到 Kitravia 的企业、旅行社、目的地管理公司 (DMC) 或专业代理。联盟伙伴是指通过推广 Kitravia 并点击追踪链接赚取佣金的内容创作者或个人。请发送邮件至 partners@kitravia.com 申请合作。\n\n问 6：我可以不创建账户就使用 Kitravia 吗？\n\n可以。未注册的访客（无用户个人资料）可以浏览目的地内容、阅读旅行指南，并以只读模式了解 Kitravia 的服务。要规划行程、预订旅行或使用 AI 功能，您必须创建一个免费账户。\n\n预订与搜索\n\n问 7：我可以通过 Kitravia 预订哪些类型的行程？\n\n您可以预订机票、酒店、邮轮、租车、度假套餐、探险之旅和当地活动——既可以单独预订，也可以预订由 AI 根据您的偏好和预算生成的动态套餐。\n\n问 8：Kitravia 如何找到特价机票和隐藏优惠？\n\n我们的AI错误票价查找器持续扫描全球航空公司定价API，以检测价格异常——有时甚至能找到比标准票价低90%的折扣。它会显示置信度评分，并为高级会员提供确认后自动预订选项。预测型AI旅行预言机还能在价格下跌发生前进行预测。\n\n问9：Kitravia支持最后一刻预订吗？\n\n是的。平台实时更新。智能雷达还会监控实时航班信息、延误情况和替代方案，以便旅客在航班中断时能够立即重新预订。\n\n智能旅行工具\n\n问10：什么是智能雷达？\n\n智能雷达是您的实时旅程智能仪表盘。它可以监控航班状态、登机口、延误情况、邮轮时刻表、租车取车点，甚至行李（通过AirTag/GPS集成）。安全盾提供实时天气和事故路线重划服务。行程脉搏以动画地图的形式可视化您的完整旅程。亲友视图让亲人可以安全地追踪您的行程。\n\n问11：什么是AI电子书工作室？人工智能电子书工作室可根据您过往或计划的旅行、上传的照片、地图和笔记，自动生成个性化的旅行书籍或探险日志。您可以选择主题（冒险、文化、浪漫、历史），导出为 PDF/ePub 格式，或分享到 Kitravia 社区画廊。高级用户可使用此功能。\n\nQ12：什么是 Kitravia 奖励协议 (KTVA)？\n\n每次预订、分享或评论均可赚取 Kitravia 积分 (KTVA)。积分可用于兑换未来的预订、高级人工智能功能或专属的基于 NFT 的旅行收藏品。该系统可选择与区块链（Polygon/Solana）集成，以实现完全透明和可移植性。\n\n隐私、安全与支持\n\nQ13：我的个人数据是否受到保护？\n\n是的。Kitravia 遵守 GDPR、CCPA 和 COPPA 法规。您的数据仅用于改善您的个性化体验，绝不会出售或与第三方共享。您可以随时通过 privacy@kitravia.com 请求访问、更正或删除您的数据。\n\n问14：我的支付信息安全吗？\n\n绝对安全。我们使用 SSL/TLS 加密和符合 PCI DSS 标准的支付处理商。原始卡片数据绝不会存储在 Kitravia 服务器上。\n\n问15：如何联系 Kitravia 客服？\n\n我们的 AI 客服助手全天候 24 小时在线。您也可以通过以下方式联系人工客服：电子邮件：support@kitravia.com | 网页和移动应用上的在线聊天 | Facebook、Instagram、LinkedIn 和 Pinterest 上的社区频道。商业合作伙伴拥有专属的合作伙伴成功经理。\n\n问16：在哪里可以下载 Kitravia？\n\n网页：www.kitravia.com | 安卓：Google Play 商店 | iOS：Apple App Store。您的帐户可在所有设备上无缝同步。',
    },
    'zy48bf8b': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // FlightSearchPage
  {
    'gz0jfppr': {
      'en': 'Travel Smarter',
      'ar': 'سافر بذكاء',
      'es': 'Viaja de forma más inteligente',
      'fr': 'Voyagez plus intelligemment',
      'zh_Hans': '更智能的旅行',
    },
    'raochmi0': {
      'en': 'Kitravia',
      'ar': 'كيترافيا',
      'es': 'Kitravia',
      'fr': 'Kitravia',
      'zh_Hans': '基特拉维亚',
    },
    'z31qqwd8': {
      'en':
          'Search hotel stays with a clean, simple experience that matches your flight search',
      'ar':
          'ابحث عن أماكن إقامة فندقية بتجربة سلسة وبسيطة تتناسب مع بحثك عن رحلات الطيران.',
      'es':
          'Busca estancias en hoteles con una experiencia limpia y sencilla que se ajuste a tu búsqueda de vuelos.',
      'fr':
          'Recherchez des séjours hôteliers offrant une expérience simple et agréable, en adéquation avec votre recherche de vols.',
      'zh_Hans': '搜索与您的航班搜索结果相匹配的、体验简洁干净的酒店住宿。',
    },
    'p1x7kmyj': {
      'en': 'Flights     Hotel Cars     Packages     Things to do      Cruises',
      'ar': 'رحلات طيران، فنادق، سيارات، باقات سياحية، أنشطة، رحلات بحرية',
      'es': 'Vuelos Hoteles Coches Paquetes Cosas que hacer Cruceros',
      'fr': 'Vols Hôtels Voitures Forfaits Activités Croisières',
      'zh_Hans': '机票 酒店 租车 旅行套餐 景点 邮轮',
    },
    '7t4iicch': {
      'en': 'Flight Search',
      'ar': 'البحث عن الرحلات',
      'es': 'Búsqueda de vuelos',
      'fr': 'Recherche de vols',
      'zh_Hans': '航班搜索',
    },
    'v4bo06s3': {
      'en': 'Reset Filter',
      'ar': 'إعادة ضبط الفلتر',
      'es': 'Restablecer filtro',
      'fr': 'Réinitialiser le filtre',
      'zh_Hans': '重置筛选器',
    },
    'j73go5xx': {
      'en': 'One-Way',
      'ar': 'طريقة واحدة',
      'es': 'De una sola mano',
      'fr': 'Sens Unique',
      'zh_Hans': '单程',
    },
    'po8ksokz': {
      'en': 'Select Flight Hotel',
      'ar': 'اختر رحلة الطيران الفندق',
      'es': 'Seleccione vuelo y hotel',
      'fr': 'Sélectionner le vol et l\'hôtel',
      'zh_Hans': '选择航班酒店',
    },
    'oaai30id': {
      'en': 'Search...',
      'ar': 'يبحث...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'zh_Hans': '搜索...',
    },
    'aw9hl1zm': {
      'en': 'One-Way',
      'ar': 'طريقة واحدة',
      'es': 'De una sola mano',
      'fr': 'Sens Unique',
      'zh_Hans': '单程',
    },
    'p253cf8q': {
      'en': 'Round-Trip',
      'ar': 'رحلة ذهاب وعودة',
      'es': 'Ida y vuelta',
      'fr': 'Aller-retour',
      'zh_Hans': '往返',
    },
    'tizelgen': {
      'en': 'From',
      'ar': 'من',
      'es': 'De',
      'fr': 'Depuis',
      'zh_Hans': '从',
    },
    'kvtoj0t1': {
      'en': 'To',
      'ar': 'ل',
      'es': 'A',
      'fr': 'À',
      'zh_Hans': '到',
    },
    'eou3bpbc': {
      'en': 'Date',
      'ar': 'تاريخ',
      'es': 'Fecha',
      'fr': 'Date',
      'zh_Hans': '日期',
    },
    'w395g8ag': {
      'en': 'Number of people',
      'ar': 'عدد الأشخاص',
      'es': 'Número de personas',
      'fr': 'Nombre de personnes',
      'zh_Hans': '人数',
    },
    'ue768kuz': {
      'en': 'Button',
      'ar': 'زر',
      'es': 'Botón',
      'fr': 'Bouton',
      'zh_Hans': '按钮',
    },
    'gpphe84h': {
      'en': 'Results appear here',
      'ar': 'تظهر النتائج هنا',
      'es': 'Los resultados aparecen aquí.',
      'fr': 'Les résultats apparaissent ici',
      'zh_Hans': '结果显示在此处',
    },
    '9vt8h21c': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // ResultsPage
  {
    'yvlbmtf9': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // ResultsPageSidebar
  {
    'qn1sz1ue': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // TripPlanSearch
  {
    'o9twcwl2': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // TripRequestPage
  {
    'hw0wppeg': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // BookingForm
  {
    '6qxymb4m': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // BookingSummaryPage
  {
    'u8ata7rd': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // BookingConfirmationPage
  {
    '57d0wocl': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // TripItinerary
  {
    'a6kp4h10': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // BookItinerary
  {
    '2wcbbqxq': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // AboutUsPage
  {
    '3myz9sny': {
      'en': 'ABOUT',
      'ar': 'معلومات عنا',
      'es': 'SOBRE NOSOTROS',
      'fr': 'À PROPOS DE NOUS',
      'zh_Hans': '关于我们',
    },
    'qc96f6ij': {
      'en':
          'Kitravia is an innovative AI-powered travel planning and booking platform designed to transform how people discover, plan, and experience travel around the world.\n\nBy combining advanced artificial intelligence, real-time travel data, and powerful booking technology, Kitravia allows travelers to seamlessly search, compare, and book their entire journey — all in one place.\n\nFrom flights and hotels to cruises, adventures, and car rentals, Kitravia delivers a smarter, faster, and more personalized travel experience. Our mission is simple: to make travel planning effortless and intelligent for everyone.\n\nKitravia was built to go beyond traditional booking platforms. While most travel websites only display search results, Kitravia introduces a next-generation AI travel ecosystem that acts as a digital travel assistant available 24/7 — helping travelers discover destinations, build personalized itineraries, compare options, track trips in real time, and book complete journeys instantly.\n',
      'ar':
          'كيترافيا منصة مبتكرة لتخطيط وحجز الرحلات مدعومة بالذكاء الاصطناعي، مصممة لإحداث نقلة نوعية في كيفية اكتشاف المسافرين لرحلاتهم حول العالم، وتخطيطها، والاستمتاع بها.\n\nبفضل دمج الذكاء الاصطناعي المتقدم، وبيانات السفر الآنية، وتقنية الحجز المتطورة، تتيح كيترافيا للمسافرين البحث والمقارنة والحجز بسلاسة تامة، كل ذلك في مكان واحد.\n\nمن رحلات الطيران والفنادق إلى الرحلات البحرية والمغامرات وتأجير السيارات، تقدم كيترافيا تجربة سفر أذكى وأسرع وأكثر تخصيصًا. مهمتنا بسيطة: جعل تخطيط السفر سهلاً وذكيًا للجميع.\n\nصُممت كيترافيا لتتجاوز منصات الحجز التقليدية. فبينما تكتفي معظم مواقع السفر بعرض نتائج البحث فقط، تقدم كيترافيا نظامًا بيئيًا متطورًا للسفر مدعومًا بالذكاء الاصطناعي، يعمل كمساعد سفر رقمي متاح على مدار الساعة، لمساعدة المسافرين على اكتشاف الوجهات، وإنشاء برامج سفر مخصصة، ومقارنة الخيارات، وتتبع الرحلات آنيًا، وحجز الرحلات كاملةً فورًا.',
      'es':
          'Kitravia es una innovadora plataforma de planificación y reserva de viajes impulsada por IA, diseñada para transformar la forma en que las personas descubren, planifican y disfrutan de sus viajes por todo el mundo.\n\nAl combinar inteligencia artificial avanzada, datos de viaje en tiempo real y una potente tecnología de reservas, Kitravia permite a los viajeros buscar, comparar y reservar todo su viaje sin complicaciones, todo en un solo lugar.\n\nDesde vuelos y hoteles hasta cruceros, aventuras y alquiler de coches, Kitravia ofrece una experiencia de viaje más inteligente, rápida y personalizada. Nuestra misión es simple: hacer que planificar viajes sea fácil e inteligente para todos.\n\nKitravia se creó para ir más allá de las plataformas de reserva tradicionales. Mientras que la mayoría de los sitios web de viajes solo muestran resultados de búsqueda, Kitravia presenta un ecosistema de viajes con IA de última generación que actúa como un asistente de viajes digital disponible las 24 horas, los 7 días de la semana, ayudando a los viajeros a descubrir destinos, crear itinerarios personalizados, comparar opciones, realizar un seguimiento de los viajes en tiempo real y reservar viajes completos al instante.',
      'fr':
          'Kitravia est une plateforme innovante de planification et de réservation de voyages, basée sur l\'intelligence artificielle, conçue pour transformer la façon dont les voyageurs découvrent, planifient et vivent leurs voyages à travers le monde.\n\nEn combinant une intelligence artificielle avancée, des données de voyage en temps réel et une technologie de réservation performante, Kitravia permet aux voyageurs de rechercher, comparer et réserver facilement l\'intégralité de leur voyage, le tout sur une seule et même plateforme.\n\nVols, hôtels, croisières, aventures, locations de voitures : Kitravia offre une expérience de voyage plus intelligente, plus rapide et plus personnalisée. Notre mission est simple : rendre la planification de voyages simple et intelligente pour tous.\n\nKitravia a été conçue pour aller au-delà des plateformes de réservation traditionnelles. Alors que la plupart des sites web de voyage se contentent d\'afficher des résultats de recherche, Kitravia introduit un écosystème de voyage IA de nouvelle génération qui agit comme un assistant de voyage numérique disponible 24 h/24 et 7 j/7. Il aide les voyageurs à découvrir des destinations, à créer des itinéraires personnalisés, à comparer les options, à suivre leurs voyages en temps réel et à réserver des voyages complets instantanément.',
      'zh_Hans':
          'Kitravia 是一个创新的 AI 旅行规划和预订平台，旨在革新人们发现、规划和体验全球旅行的方式。\n\nKitravia 融合了先进的人工智能、实时旅行数据和强大的预订技术，让旅行者能够在一个平台上轻松搜索、比较和预订整个旅程。\n\n从机票、酒店到邮轮、探险活动和租车，Kitravia 提供更智能、更快捷、更个性化的旅行体验。我们的使命很简单：让每个人都能轻松智能地规划旅行。\n\nKitravia 的设计理念超越了传统的预订平台。大多数旅行网站仅展示搜索结果，而 Kitravia 则引入了新一代 AI 旅行生态系统，它如同一个全天候在线的数字旅行助手，帮助旅行者发现目的地、制定个性化行程、比较选项、实时追踪行程并即时预订整个旅程。',
    },
    'vviwx2ik': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // OurVisionEthics
  {
    'yto261s0': {
      'en': 'OUR VISION & ETHICS',
      'ar': 'رؤيتنا وأخلاقياتنا',
      'es': 'NUESTRA VISIÓN Y ÉTICA',
      'fr': 'NOTRE VISION ET NOTRE ÉTHIQUE',
      'zh_Hans': '我们的愿景与道德准则',
    },
    'i0j08h0k': {
      'en': 'Effective Date: April 2026 | Controller: Kitravia.',
      'ar': 'تاريخ السريان: أبريل 2026 | المراقب: كيترافيا.',
      'es': 'Fecha de entrada en vigor: abril de 2026 | Controlador: Kitravia.',
      'fr': 'Date d\'entrée en vigueur : avril 2026 | Contrôleur : Kitravia.',
      'zh_Hans': '生效日期：2026 年 4 月 | 控制人：Kitravia。',
    },
    '4cxjuqp8': {
      'en': 'Our Core Values',
      'ar': 'قيمنا الأساسية',
      'es': 'Nuestros valores fundamentales',
      'fr': 'Nos valeurs fondamentales',
      'zh_Hans': '我们的核心价值观',
    },
    'qs3tfzje': {
      'en': 'Our Ethical Commitments',
      'ar': 'التزاماتنا الأخلاقية',
      'es': 'Nuestros compromisos éticos',
      'fr': 'Nos engagements éthiques',
      'zh_Hans': '我们的道德承诺',
    },
    'wl31se33': {
      'en':
          '- Data privacy by design — user data is never sold to third parties\n- Transparent pricing with all taxes and fees displayed upfront\n- Fair AI — recommendations based on relevance, never paid placement\n- Inclusive design — accessible to travelers with disabilities\n- Environmental responsibility — carbon offset options on all bookings\n- Strict anti-fraud controls protecting every traveler on the platform\n',
      'ar':
          '- خصوصية البيانات مُصممة خصيصًا - لا تُباع بيانات المستخدمين لأي جهة خارجية\n\n- أسعار شفافة مع عرض جميع الضرائب والرسوم مُسبقًا\n\n- ذكاء اصطناعي عادل - توصيات مبنية على الملاءمة، بدون أي إعلانات مدفوعة\n\n- تصميم شامل - مُتاح للمسافرين ذوي الإعاقة\n\n- مسؤولية بيئية - خيارات تعويض انبعاثات الكربون لجميع الحجوزات\n\n- ضوابط صارمة لمكافحة الاحتيال لحماية جميع المسافرين على المنصة',
      'es':
          '- Privacidad de datos desde el diseño: los datos de los usuarios nunca se venden a terceros.\n- Precios transparentes con todos los impuestos y cargos mostrados por adelantado.\n- IA justa: recomendaciones basadas en la relevancia, sin publicidad pagada.\n- Diseño inclusivo: accesible para viajeros con discapacidad.\n- Responsabilidad ambiental: opciones de compensación de carbono en todas las reservas.\n- Estrictos controles antifraude que protegen a todos los viajeros en la plataforma.',
      'fr':
          '- Protection des données dès la conception : les données utilisateur ne sont jamais vendues à des tiers.\n\n- Tarification transparente : toutes les taxes et tous les frais sont affichés clairement.\n\n- IA équitable : recommandations basées sur la pertinence, aucun placement payant.\n\n- Conception inclusive : accessible aux voyageurs en situation de handicap.\n\n- Responsabilité environnementale : options de compensation carbone pour toutes les réservations.\n\n- Contrôles antifraude stricts protégeant chaque voyageur sur la plateforme.',
      'zh_Hans':
          '- 数据隐私保护设计——用户数据绝不出售给第三方\n\n- 价格透明，所有税费均提前显示\n\n- 公平的AI推荐——基于相关性进行推荐，绝不付费推广\n\n- 包容性设计——方便残障人士使用\n\n- 环境责任——所有预订均提供碳补偿选项\n\n- 严格的反欺诈控制，保护平台上的每一位旅客',
    },
    'etkt0suo': {
      'en':
          'Kitravia is committed to building technology that travelers can trust unconditionally.',
      'ar':
          'تلتزم شركة Kitravia بتطوير تكنولوجيا يمكن للمسافرين الوثوق بها بشكل مطلق.',
      'es':
          'Kitravia se compromete a desarrollar tecnología en la que los viajeros puedan confiar incondicionalmente.',
      'fr':
          'Kitravia s\'engage à développer une technologie à laquelle les voyageurs peuvent faire une confiance absolue.',
      'zh_Hans': 'Kitravia致力于打造旅行者可以完全信赖的技术。',
    },
    '655qbjcj': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // TeamMembers
  {
    'l58fzi33': {
      'en': 'TEAM MEMBERS',
      'ar': 'أعضاء الفريق',
      'es': 'MIEMBROS DEL EQUIPO',
      'fr': 'MEMBRES DE L\'ÉQUIPE',
      'zh_Hans': '团队成员',
    },
    '0yct7qlb': {
      'en': 'Effective Date: April 2026 | Controller: Kitravia.',
      'ar': 'تاريخ السريان: أبريل 2026 | المراقب: كيترافيا.',
      'es': 'Fecha de entrada en vigor: abril de 2026 | Controlador: Kitravia.',
      'fr': 'Date d\'entrée en vigueur : avril 2026 | Contrôleur : Kitravia.',
      'zh_Hans': '生效日期：2026 年 4 月 | 控制人：Kitravia。',
    },
    'rttgllti': {
      'en': 'Key Leadership',
      'ar': 'القيادة الرئيسية',
      'es': 'Liderazgo clave',
      'fr': 'Direction clé',
      'zh_Hans': '关键领导层',
    },
    'p72t30e9': {
      'en':
          'Kitravia is led by a multidisciplinary leadership team combining deep expertise in travel technology, artificial intelligence, product design, and global business development.',
      'ar':
          'تتولى قيادة شركة Kitravia فريق قيادي متعدد التخصصات يجمع بين الخبرة العميقة في تكنولوجيا السفر والذكاء الاصطناعي وتصميم المنتجات وتطوير الأعمال العالمية.',
      'es':
          'Kitravia está dirigida por un equipo de liderazgo multidisciplinario que combina una amplia experiencia en tecnología de viajes, inteligencia artificial, diseño de productos y desarrollo de negocios globales.',
      'fr':
          'Kitravia est dirigée par une équipe de direction multidisciplinaire combinant une expertise approfondie dans les technologies du voyage, l\'intelligence artificielle, la conception de produits et le développement commercial international.',
      'zh_Hans': 'Kitravia 由一支跨学科的领导团队领导，该团队在旅游技术、人工智能、产品设计和全球业务发展方面拥有深厚的专业知识。',
    },
    'yrchne5e': {
      'en':
          'Kitravia’s leadership brings together expertise from the world’s leading travel companies, AI research institutions, and global technology firms.',
      'ar':
          'تجمع قيادة شركة Kitravia بين الخبرات من شركات السفر الرائدة في العالم، ومؤسسات أبحاث الذكاء الاصطناعي، وشركات التكنولوجيا العالمية.',
      'es':
          'El equipo directivo de Kitravia reúne la experiencia de las principales empresas de viajes del mundo, instituciones de investigación en IA y empresas tecnológicas globales.',
      'fr':
          'L’équipe dirigeante de Kitravia réunit l’expertise des plus grandes entreprises de voyage au monde, des instituts de recherche en IA et des sociétés technologiques internationales.',
      'zh_Hans': 'Kitravia 的领导团队汇集了世界领先的旅游公司、人工智能研究机构和全球科技公司的专业知识。',
    },
    'q0nft9r6': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // AllinOnePlatform
  {
    't2ci0tfu': {
      'en': 'ALL in ONE PLATFORM',
      'ar': 'كل شيء في منصة واحدة',
      'es': 'TODO EN UNA SOLA PLATAFORMA',
      'fr': 'TOUT EN UNE SEULE PLATEFORME',
      'zh_Hans': '一体化平台',
    },
    '75ikfw63': {
      'en': 'Effective Date: April 2026 | Controller: Kitravia.',
      'ar': 'تاريخ السريان: أبريل 2026 | المراقب: كيترافيا.',
      'es': 'Fecha de entrada en vigor: abril de 2026 | Controlador: Kitravia.',
      'fr': 'Date d\'entrée en vigueur : avril 2026 | Contrôleur : Kitravia.',
      'zh_Hans': '生效日期：2026 年 4 月 | 控制人：Kitravia。',
    },
    '3169nmzf': {
      'en':
          'Kitravia is the only travel platform that unifies every element of trip planning and booking into a single, seamless experience — powered by artificial intelligence from search to arrival.\n\nNo more switching between multiple apps, comparing prices across ten websites, or losing booking confirmations in email threads. Kitravia brings everything together.',
      'ar':
          'كيترافيا هي منصة السفر الوحيدة التي تجمع كل عناصر تخطيط الرحلات وحجزها في تجربة واحدة سلسة، مدعومة بالذكاء الاصطناعي من البحث وحتى الوصول.\n\nوداعاً للتنقل بين تطبيقات متعددة، ومقارنة الأسعار عبر عشرات المواقع، وفقدان تأكيدات الحجز في سلاسل البريد الإلكتروني. كيترافيا تجمع كل شيء في مكان واحد.',
      'es':
          'Kitravia es la única plataforma de viajes que unifica todos los aspectos de la planificación y reserva de viajes en una experiencia fluida e integrada, impulsada por inteligencia artificial desde la búsqueda hasta la llegada.\n\nOlvídate de cambiar entre múltiples aplicaciones, comparar precios en diez sitios web o perder confirmaciones de reserva entre correos electrónicos. Kitravia lo reúne todo.',
      'fr':
          'Kitravia est la seule plateforme de voyage qui réunit tous les aspects de la planification et de la réservation de voyages en une expérience unique et fluide, grâce à l\'intelligence artificielle, de la recherche à l\'arrivée.\n\nFini les allers-retours entre plusieurs applications, les comparaisons de prix sur une dizaine de sites web et les confirmations de réservation perdues dans les échanges d\'e-mails. Kitravia centralise tout.',
      'zh_Hans':
          'Kitravia 是唯一一个将旅行计划和预订的各个环节整合到一个无缝体验中的旅行平台——从搜索到抵达，全程由人工智能驱动。\n\n无需再在多个应用程序之间切换，无需在十几个网站上比较价格，也无需在电子邮件往来中丢失预订确认信息。Kitravia 将所有信息整合在一起。',
    },
    'qxkldj5y': {
      'en':
          '- Available on Web, Android (Google Play), and iOS (App Store)\n- One account — plan on desktop, book on mobile, track on any device\n- AI Travel Assistant available 24/7 with voice-to-text capability\n- Integrated Kitravia Wallet for credits, rewards, and payment management\n',
      'ar':
          '- متوفر على الويب، وأجهزة أندرويد (متجر جوجل بلاي)، وأجهزة iOS (متجر آب ستور)\n\n- حساب واحد - خطط على الكمبيوتر، احجز على الهاتف، وتتبع رحلتك على أي جهاز\n\n- مساعد سفر ذكي يعمل بالذكاء الاصطناعي، متوفر على مدار الساعة طوال أيام الأسبوع، مع ميزة تحويل الصوت إلى نص\n\n- محفظة Kitravia مدمجة لإدارة الرصيد والمكافآت والمدفوعات',
      'es':
          '- Disponible en web, Android (Google Play) e iOS (App Store)\n- Una sola cuenta: planifica desde tu ordenador, reserva desde tu móvil y realiza el seguimiento desde cualquier dispositivo\n- Asistente de viajes con IA disponible las 24 horas, los 7 días de la semana, con función de dictado por voz\n- Monedero Kitravia integrado para gestionar créditos, recompensas y pagos',
      'fr':
          '- Disponible sur le Web, Android (Google Play) et iOS (App Store)\n\n- Un seul compte : planifiez sur ordinateur, réservez sur mobile, suivez votre voyage sur tous vos appareils\n\n- Assistant de voyage IA disponible 24 h/24 et 7 j/7 avec transcription vocale\n\n- Portefeuille Kitravia intégré pour la gestion des crédits, des récompenses et des paiements',
      'zh_Hans':
          '- 可在网页、安卓（Google Play）和 iOS（App Store）平台使用\n\n- 一个账户即可完成行程规划，在电脑端规划行程，在手机端预订，在任何设备上追踪行程\n\n- 全天候 24 小时 AI 旅行助手，支持语音转文字功能\n\n- 集成 Kitravia 钱包，方便管理积分、奖励和支付',
    },
    '11px9ncb': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // FlightHotelCar
  {
    'eqxiqbmo': {
      'en': 'Flight, Hotel & Car Booking',
      'ar': 'حجز الرحلات الجوية والفنادق والسيارات',
      'es': 'Reserva de vuelos, hoteles y coches',
      'fr': 'Réservation de vols, d\'hôtels et de voitures',
      'zh_Hans': '机票、酒店和租车预订',
    },
    'iruw7asq': {
      'en': 'Effective Date: April 2026 | Controller: Kitravia.',
      'ar': 'تاريخ السريان: أبريل 2026 | المراقب: كيترافيا.',
      'es': 'Fecha de entrada en vigor: abril de 2026 | Controlador: Kitravia.',
      'fr': 'Date d\'entrée en vigueur : avril 2026 | Contrôleur : Kitravia.',
      'zh_Hans': '生效日期：2026 年 4 月 | 控制人：Kitravia。',
    },
    'ut5k88b2': {
      'en':
          'Kitravia integrates real-time global inventory for flights, accommodations, and ground transport, delivering best-in-class search with transparent pricing and one-click booking.',
      'ar':
          'تدمج Kitravia المخزون العالمي في الوقت الفعلي للرحلات الجوية والإقامة والنقل البري، مما يوفر أفضل بحث في فئته مع تسعير شفاف وحجز بنقرة واحدة.',
      'es':
          'Kitravia integra un inventario global en tiempo real de vuelos, alojamiento y transporte terrestre, ofreciendo la mejor búsqueda de su clase con precios transparentes y reserva con un solo clic.',
      'fr':
          'Kitravia intègre un inventaire mondial en temps réel pour les vols, les hébergements et les transports terrestres, offrant une recherche de pointe avec une tarification transparente et une réservation en un clic.',
      'zh_Hans': 'Kitravia 整合了航班、住宿和地面交通的实时全球库存，提供一流的搜索功能、透明的价格和一键预订。',
    },
    'xtios2wi': {
      'en': 'Flights',
      'ar': 'رحلات جوية',
      'es': 'Vuelos',
      'fr': 'Vols',
      'zh_Hans': '航班',
    },
    'hvp8iwqd': {
      'en':
          '- 500+ airline partners — full-service, low-cost, and regional carriers\n- AI Error Fare Finder — alerts for pricing errors up to 90% below standard\n- Smart calendar view showing lowest fares across flexible dates\n- Multi-city, open-jaw, and round-the-world itinerary support\n',
      'ar':
          '- أكثر من 500 شريك من شركات الطيران - شركات طيران كاملة الخدمات، وشركات طيران منخفضة التكلفة، وشركات طيران إقليمية\n\n- خاصية البحث عن أخطاء الأسعار بالذكاء الاصطناعي - تنبيهات لأخطاء التسعير التي تصل إلى 90% أقل من السعر القياسي\n\n- عرض تقويم ذكي يُظهر أقل الأسعار المتاحة لتواريخ مرنة\n\n- دعم مسارات الرحلات متعددة المدن، والرحلات ذات الوجهات المفتوحة، والرحلات حول العالم',
      'es':
          '- Más de 500 aerolíneas asociadas: aerolíneas de servicio completo, de bajo costo y regionales.\n- Buscador de tarifas con IA: alertas de errores de precios hasta un 90 % por debajo del estándar.\n- Calendario inteligente que muestra las tarifas más bajas en fechas flexibles.\n- Compatibilidad con itinerarios multidestino, con escalas abiertas y de vuelta al mundo.',
      'fr':
          '- Plus de 500 compagnies aériennes partenaires : compagnies traditionnelles, low-cost et régionales\n\n- Détecteur d\'erreurs tarifaires par IA : alertes en cas d\'erreurs de prix jusqu\'à 90 % inférieures au prix standard\n\n- Calendrier intelligent affichant les tarifs les plus bas sur des dates flexibles\n\n- Prise en charge des itinéraires multi-destinations, multi-destinations et tours du monde',
      'zh_Hans':
          '- 500 多家航空公司合作伙伴——涵盖全服务航空公司、低成本航空公司和区域性航空公司\n\n- AI 票价错误查找器——可识别低于标准价格 90% 的票价错误并发出警报\n\n- 智能日历视图，显示灵活日期范围内的最低票价\n\n- 支持多城市、开口行程和环球行程',
    },
    '1mfk9g6r': {
      'en': 'Hotels & Accommmodation',
      'ar': 'الفنادق وأماكن الإقامة',
      'es': 'Hoteles y alojamiento',
      'fr': 'Hôtels et hébergements',
      'zh_Hans': '酒店及住宿',
    },
    'fghds9fc': {
      'en':
          '- 2,000,000+ properties worldwide — hotels, resorts, boutique, villa, hostel\n- AI-powered recommendation engine matching traveler preferences\n- Real-time availability and instant confirmation\n- Best-price guarantee with transparent total pricing\n',
      'ar':
          '- أكثر من مليوني عقار حول العالم - فنادق، منتجعات، شقق فندقية، فلل، نُزُل\n\n- نظام توصيات مدعوم بالذكاء الاصطناعي يُطابق تفضيلات المسافرين\n\n- توفر فوري وتأكيد فوري\n\n- ضمان أفضل سعر مع تسعير شامل وشفاف',
      'es':
          '- Más de 2.000.000 de alojamientos en todo el mundo: hoteles, resorts, hoteles boutique, villas y hostales.\n- Sistema de recomendaciones con IA que se adapta a las preferencias del viajero.\n- Disponibilidad en tiempo real y confirmación instantánea.\n- Garantía del mejor precio con precios totales transparentes.',
      'fr':
          '- Plus de 2 000 000 d\'établissements dans le monde entier : hôtels, complexes hôteliers, boutiques-hôtels, villas, auberges de jeunesse\n\n- Système de recommandation basé sur l\'IA et adapté aux préférences des voyageurs\n\n- Disponibilité en temps réel et confirmation instantanée\n\n- Garantie du meilleur prix avec une tarification totale transparente',
      'zh_Hans':
          '- 全球超过 200 万家房源——酒店、度假村、精品酒店、别墅、青年旅舍\n\n- 人工智能推荐引擎，精准匹配旅行者偏好\n\n- 实时查询房源信息，即时确认\n\n- 最优价格保证，价格透明透明',
    },
    'lws647s1': {
      'en': 'Car Rental',
      'ar': 'تأجير سيارات',
      'es': 'Alquiler de coches',
      'fr': 'Location de voitures',
      'zh_Hans': '租车',
    },
    'jiyrufn4': {
      'en':
          '- Partnerships with major global rental providers\n- Coverage at 10,000+ airport and city locations\n- Smart Radar alerts for rental status and vehicle readiness\n',
      'ar':
          '- شراكات مع كبرى شركات تأجير السيارات العالمية\n\n- تغطية في أكثر من 10,000 موقع في المطارات والمدن\n\n- تنبيهات رادار ذكية لحالة التأجير وجاهزية المركبة',
      'es':
          '- Alianzas con los principales proveedores de alquiler a nivel mundial\n- Cobertura en más de 10 000 ubicaciones en aeropuertos y ciudades\n- Alertas de radar inteligente sobre el estado del alquiler y la disponibilidad del vehículo',
      'fr':
          '- Partenariats avec les principaux loueurs internationaux\n\n- Couverture dans plus de 10 000 aéroports et villes\n\n- Alertes Smart Radar sur la disponibilité des véhicules et leur statut de location',
      'zh_Hans':
          '- 与全球主要租赁供应商建立合作关系\n\n- 覆盖超过 10,000 个机场和城市地点\n\n- 提供租赁状态和车辆准备情况的智能雷达警报',
    },
    'b8is3029': {
      'en': 'Continue to Booking Page',
      'ar': 'انتقل إلى صفحة الحجز',
      'es': 'Continuar a la página de reservas',
      'fr': 'Continuer vers la page de réservation',
      'zh_Hans': '继续前往预订页面',
    },
    'l8xej7ef': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // AllPackagesPage
  {
    'byubbbui': {
      'en': 'ALL PACKAGES',
      'ar': 'جميع الباقات',
      'es': 'TODOS LOS PAQUETES',
      'fr': 'TOUS LES FORFAITS',
      'zh_Hans': '所有套餐',
    },
    'ikiydeip': {
      'en': 'Effective Date: April 2026 | Controller: Kitravia.',
      'ar': 'تاريخ السريان: أبريل 2026 | المراقب: كيترافيا.',
      'es': 'Fecha de entrada en vigor: abril de 2026 | Controlador: Kitravia.',
      'fr': 'Date d\'entrée en vigueur : avril 2026 | Contrôleur : Kitravia.',
      'zh_Hans': '生效日期：2026 年 4 月 | 控制人：Kitravia。',
    },
    'gvnnv2c9': {
      'en':
          'Kitravia Packages combine flights, hotels, transfers, and activities into curated complete holiday bundles — delivering better value and a fully managed booking experience.\n',
      'ar':
          'تجمع باقات Kitravia بين الرحلات الجوية والفنادق وخدمات النقل والأنشطة في باقات عطلات كاملة منسقة بعناية - مما يوفر قيمة أفضل وتجربة حجز مُدارة بالكامل.',
      'es':
          'Los paquetes de Kitravia combinan vuelos, hoteles, traslados y actividades en conjuntos vacacionales completos y cuidadosamente seleccionados, lo que ofrece una mejor relación calidad-precio y una experiencia de reserva totalmente gestionada.',
      'fr':
          'Les forfaits Kitravia combinent vols, hôtels, transferts et activités en formules vacances complètes et soigneusement sélectionnées, offrant un meilleur rapport qualité-prix et une expérience de réservation entièrement gérée.',
      'zh_Hans':
          'Kitravia Packages 将航班、酒店、接送和活动组合成精心策划的完整度假套餐，提供更高的价值和全方位的预订体验。',
    },
    'wi56hhtd': {
      'en':
          '- Beach, city-break, adventure, cultural, and luxury package categories\n- Dynamic package builder: mix and match any flight + hotel combination\n- Exclusive package deals available to Kitravia Premium members first\n- Group and family packages with single-reference booking management\n- All-inclusive resort packages with full board options\n',
      'ar':
          '- باقات متنوعة تشمل الشاطئ، والرحلات القصيرة في المدن، والمغامرات، والفعاليات الثقافية، والرحلات الفاخرة\n\n- أداة تصميم باقات ديناميكية: اختر أي مزيج من رحلات الطيران والفنادق\n\n- عروض باقات حصرية متاحة أولاً لأعضاء Kitravia Premium\n\n- باقات للمجموعات والعائلات مع إدارة حجز موحدة\n\n- باقات منتجعات شاملة كلياً مع خيارات إقامة كاملة',
      'es':
          '- Categorías de paquetes: playa, escapada urbana, aventura, cultura y lujo\n- Creador de paquetes dinámico: combina vuelos y hoteles a tu gusto\n- Ofertas exclusivas disponibles primero para miembros Kitravia Premium\n- Paquetes para grupos y familias con gestión de reservas centralizada\n- Paquetes todo incluido en resorts con pensión completa',
      'fr':
          '- Catégories de forfaits : plage, escapade citadine, aventure, culture et luxe\n\n- Créateur de forfaits dynamique : combinez vol et hôtel à votre guise\n\n- Offres exclusives réservées aux membres Kitravia Premium\n\n- Forfaits groupe et famille avec gestion centralisée des réservations\n\n- Forfaits tout compris avec options pension complète',
      'zh_Hans':
          '- 海滩度假、城市之旅、探险之旅、文化之旅和豪华之旅等多种套餐类别\n\n- 动态套餐组合：自由搭配任意航班和酒店\n\n- Kitravia Premium 会员优先享受专属优惠套餐\n\n- 团体和家庭套餐，支持单一预订管理\n\n- 全包式度假村套餐，提供全膳选择',
    },
    'gu9hf5fc': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Booking_For_Visa
  {
    'oj233y16': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // CruiseBookingUtilityPage
  {
    'bnn0am47': {
      'en': 'Cruise Booking',
      'ar': 'حجز رحلة بحرية',
      'es': 'Reserva de cruceros',
      'fr': 'Réservation de croisière',
      'zh_Hans': '邮轮预订',
    },
    'j740wz82': {
      'en': 'Effective Date: April 2026 | Controller: Kitravia.',
      'ar': 'تاريخ السريان: أبريل 2026 | المراقب: كيترافيا.',
      'es': 'Fecha de entrada en vigor: abril de 2026 | Controlador: Kitravia.',
      'fr': 'Date d\'entrée en vigueur : avril 2026 | Contrôleur : Kitravia.',
      'zh_Hans': '生效日期：2026 年 4 月 | 控制人：Kitravia。',
    },
    'ts0tb9eq': {
      'en':
          'Kitravia’s cruise booking platform gives travelers access to a curated selection of ocean, river, and expedition cruises worldwide — with intelligent filtering and expert guidance.',
      'ar':
          'تتيح منصة حجز الرحلات البحرية من Kitravia للمسافرين الوصول إلى مجموعة مختارة من الرحلات البحرية في المحيطات والأنهار والرحلات الاستكشافية حول العالم - مع تصفية ذكية وإرشادات من الخبراء.',
      'es':
          'La plataforma de reservas de cruceros de Kitravia ofrece a los viajeros acceso a una cuidada selección de cruceros oceánicos, fluviales y de expedición en todo el mundo, con filtros inteligentes y asesoramiento experto.',
      'fr':
          'La plateforme de réservation de croisières de Kitravia offre aux voyageurs un accès à une sélection pointue de croisières maritimes, fluviales et d\'expédition dans le monde entier, grâce à un système de filtrage intelligent et aux conseils d\'experts.',
      'zh_Hans': 'Kitravia 的邮轮预订平台为旅行者提供精选的全球海洋、河流和探险邮轮航线——并具备智能筛选和专家指导功能。',
    },
    'tdwclicr': {
      'en':
          '- 200+ cruise lines — luxury, mainstream, expedition, and river cruises\n- Cabin category comparison with interactive deck plan views\n- Port excursion add-ons bookable within the same itinerary\n- Smart Radar tracking for cruise schedules, delays, and boarding alerts\n- Group booking management for cruise events and celebrations\n\n',
      'ar':
          '- أكثر من 200 شركة رحلات بحرية - رحلات فاخرة، ورحلات عامة، ورحلات استكشافية، ورحلات نهرية\n\n- مقارنة فئات الكبائن مع عرض تفاعلي لخرائط الطوابق\n\n- إمكانية حجز رحلات إضافية إلى الموانئ ضمن نفس مسار الرحلة\n\n- نظام رادار ذكي لتتبع جداول الرحلات البحرية، والتأخيرات، وتنبيهات الصعود إلى السفينة\n\n- إدارة حجوزات المجموعات لفعاليات واحتفالات الرحلات البحرية',
      'es':
          '- Más de 200 líneas de cruceros: de lujo, convencionales, de expedición y fluviales.\n- Comparación de categorías de camarotes con planos de cubierta interactivos.\n- Excursiones adicionales en puerto reservables dentro del mismo itinerario.\n- Seguimiento inteligente por radar para consultar horarios, retrasos y avisos de embarque.\n- Gestión de reservas grupales para eventos y celebraciones en crucero.',
      'fr':
          '- Plus de 200 compagnies de croisières : croisières de luxe, croisières classiques, croisières d\'expédition et croisières fluviales\n\n- Comparaison des catégories de cabines avec plans interactifs des ponts\n\n- Possibilité de réserver des excursions à terre en complément de votre itinéraire\n\n- Suivi intelligent des horaires, des retards et des alertes d\'embarquement grâce à un radar intelligent\n\n- Gestion des réservations de groupe pour vos événements et célébrations à bord',
      'zh_Hans':
          '- 200 多家邮轮公司——涵盖豪华邮轮、主流邮轮、探险邮轮和内河邮轮\n\n- 舱位等级对比及互动式甲板图\n\n- 可在同一行程中预订岸上观光项目\n\n- 智能雷达追踪邮轮时刻表、延误信息及登船提醒\n\n- 邮轮活动及庆典团体预订管理',
    },
    '0g169s68': {
      'en': 'Continue to Cruise Booking Page',
      'ar': 'انتقل إلى صفحة حجز الرحلات البحرية',
      'es': 'Continuar a la página de reserva de cruceros',
      'fr': 'Accéder à la page de réservation de croisière',
      'zh_Hans': '继续前往邮轮预订页面',
    },
    '1p7ll3jj': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // PricingPlanUtilityPage
  {
    'udbp1hft': {
      'en': 'Pricing Plan',
      'ar': 'خطة التسعير',
      'es': 'Plan de precios',
      'fr': 'Plan tarifaire',
      'zh_Hans': '定价方案',
    },
    'wo4x0ocj': {
      'en':
          'Kitravia offers a transparent two-tier membership model: a fully functional free tier for all travelers, and a Premium tier unlocking the full power of the platform.',
      'ar':
          'تقدم Kitravia نموذج عضوية شفاف من مستويين: مستوى مجاني كامل الوظائف لجميع المسافرين، ومستوى مميز يتيح الاستفادة الكاملة من إمكانيات المنصة.',
      'es':
          'Kitravia ofrece un modelo de membresía transparente de dos niveles: un nivel gratuito con todas las funciones para todos los viajeros y un nivel Premium que desbloquea todo el potencial de la plataforma.',
      'fr':
          'Kitravia propose un modèle d\'abonnement transparent à deux niveaux : un niveau gratuit entièrement fonctionnel pour tous les voyageurs et un niveau Premium débloquant toute la puissance de la plateforme.',
      'zh_Hans': 'Kitravia 提供透明的两级会员模式：面向所有旅行者的全功能免费会员，以及解锁平台全部功能的高级会员。',
    },
    '3hy46vzv': {
      'en': 'Continue to view Pricing Plan',
      'ar': 'تابع الاطلاع على خطة الأسعار',
      'es': 'Continuar viendo el plan de precios',
      'fr': 'Continuez à consulter le plan tarifaire',
      'zh_Hans': '继续查看定价方案',
    },
    'm5twl26e': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // KitraviaPremium
  {
    '51fw06yp': {
      'en': 'KITRAVIA PREMIUM',
      'ar': 'كيترافيا بريميوم',
      'es': 'KITRAVIA PREMIUM',
      'fr': 'KITRAVIA PREMIUM',
      'zh_Hans': 'KITRAVIA PREMIUM',
    },
    'zr5m0ocz': {
      'en':
          'Kitravia Premium is the ultimate travel membership for frequent travelers, deal hunters, and anyone who demands the best from their travel experience. It is designed to pay for itself with the very first booking.',
      'ar':
          'عضوية Kitravia Premium هي الخيار الأمثل للمسافرين الدائمين، والباحثين عن أفضل العروض، وكل من يتطلع إلى تجربة سفر استثنائية. صُممت هذه العضوية لتوفير قيمتها من أول حجز.',
      'es':
          'Kitravia Premium es la membresía de viajes definitiva para viajeros frecuentes, cazadores de ofertas y cualquiera que exija lo mejor en sus viajes. Está diseñada para amortizarse con la primera reserva.',
      'fr':
          'Kitravia Premium est l\'abonnement de voyage idéal pour les voyageurs fréquents, les chasseurs de bonnes affaires et tous ceux qui exigent une expérience de voyage optimale. Il est conçu pour être rentabilisé dès la première réservation.',
      'zh_Hans':
          'Kitravia Premium 是专为经常旅行、精打细算的旅行者以及所有追求极致旅行体验的人士打造的顶级旅行会员服务。它旨在让您在首次预订时就收回成本。',
    },
    'x40lotbo': {
      'en':
          '- Access to exclusive AI Error Fare alerts — up to 90% off standard airline fares\n- Early-bird notifications for flash sales, limited-time packages, and upgrades\n- Advanced AI itinerary tools with multi-destination optimization\n- Dedicated Premium customer support with priority response times\n- Monthly travel insights report personalized to your destinations\n\n',
      'ar':
          '- الوصول إلى تنبيهات حصرية بتقنية الذكاء الاصطناعي لتخفيضات أسعار تذاكر الطيران - خصم يصل إلى 90% على أسعار تذاكر الطيران القياسية\n\n- إشعارات مبكرة بالعروض السريعة، والباقات محدودة الوقت، وترقيات الدرجة السياحية\n\n- أدوات متطورة لتخطيط الرحلات بتقنية الذكاء الاصطناعي مع تحسين الرحلات متعددة الوجهات\n\n- دعم عملاء مميز مخصص مع استجابة سريعة\n\n- تقرير شهري مُخصص لبيانات السفر، مُصمم خصيصًا لوجهات سفرك',
      'es':
          '- Acceso a alertas exclusivas de errores en tarifas aéreas con IA: hasta un 90 % de descuento en tarifas estándar.\n- Notificaciones anticipadas para ofertas relámpago, paquetes por tiempo limitado y mejoras.\n- Herramientas avanzadas de IA para la planificación de itinerarios con optimización para múltiples destinos.\n- Soporte al cliente Premium con tiempos de respuesta prioritarios.\n- Informe mensual de información de viajes personalizado según tus destinos.',
      'fr':
          '- Accès aux alertes exclusives de prix erronés grâce à l\'IA : jusqu\'à 90 % de réduction sur les tarifs aériens standard\n\n- Notifications anticipées pour les ventes flash, les offres à durée limitée et les surclassements\n\n- Outils avancés d\'optimisation d\'itinéraires par IA pour les voyages multi-destinations\n\n- Assistance client Premium dédiée avec temps de réponse prioritaire\n\n- Rapport mensuel d\'informations de voyage personnalisé selon vos destinations',
      'zh_Hans':
          '- 获取专属 AI 错误票价提醒——最高可享 90% 标准机票折扣\n\n- 抢先获取限时特价、限时套餐和升舱优惠信息\n\n- 先进的 AI 行程规划工具，支持多目的地优化\n\n- 专属高级客户支持，优先响应\n\n- 每月根据您的目的地定制的旅行洞察报告',
    },
    'slh7n207': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // FlightCancelledRefund
  {
    'rzfjc583': {
      'en': 'FLIGHT CANCELLATION & REFUND GUIDE',
      'ar': 'دليل إلغاء الرحلات الجوية واسترداد الأموال',
      'es': 'GUÍA DE CANCELACIÓN Y REEMBOLSO DE VUELOS',
      'fr': 'GUIDE D\'ANNULATION ET DE REMBOURSEMENT DES VOLS',
      'zh_Hans': '航班取消及退款指南',
    },
    '2b8haxnt': {
      'en': 'Effective Date: April 2026',
      'ar': 'تاريخ السريان: أبريل 2026 | المراقب: كيترافيا.',
      'es': 'Fecha de entrada en vigor: abril de 2026 | Controlador: Kitravia.',
      'fr': 'Date d\'entrée en vigueur : avril 2026 | Contrôleur : Kitravia.',
      'zh_Hans': '生效日期：2026 年 4 月 | 控制人：Kitravia。',
    },
    'g54xn4hx': {
      'en':
          'The Kitravia Flight Disruption Centre provides travelers with immediate, actionable support when flights are delayed, canceled, or diverted — ensuring minimum disruption to every journey.',
      'ar':
          'يوفر مركز كيترافيا لاضطرابات الرحلات الجوية للمسافرين دعمًا فوريًا وقابلًا للتنفيذ عندما تتأخر الرحلات الجوية أو يتم إلغاؤها أو تحويل مسارها - مما يضمن الحد الأدنى من الاضطراب في كل رحلة.',
      'es':
          'El Centro de Asistencia para Interrupciones de Vuelos de Kitravia ofrece a los viajeros ayuda inmediata y práctica cuando los vuelos se retrasan, cancelan o desvían, garantizando así las mínimas molestias en cada viaje.',
      'fr':
          'Le Centre d\'assistance en cas de perturbation des vols de Kitravia offre aux voyageurs une aide immédiate et concrète en cas de retard, d\'annulation ou de déviation de vol, garantissant ainsi une perturbation minimale de chaque voyage.',
      'zh_Hans': 'Kitravia 航班延误中心为旅客提供航班延误、取消或改道时的即时、可操作的支持，确保每次旅程受到的影响降到最低。',
    },
    '8st5r4gz': {
      'en':
          '- Real-time Smart Radar alerts the moment a disruption is detected\n- Automatic rebooking options presented within minutes of cancellation\n- Passenger rights information by airline and jurisdiction (EU261, DOT, etc.)\n- Compensation claim calculator and automated claim filing assistance\n- Emergency accommodation and ground transport booking for stranded travelers\n- 24/7 Premium support line for urgent rebooking and crisis management\n',
      'ar':
          '- تنبيهات رادار ذكية فورية عند رصد أي خلل\n\nخيارات إعادة حجز تلقائية متاحة خلال دقائق من الإلغاء\n\nمعلومات عن حقوق المسافرين حسب شركة الطيران والجهة القضائية (الاتحاد الأوروبي 261، وزارة النقل الأمريكية، إلخ)\n\nحاسبة مطالبات التعويض ومساعدة آلية في تقديم المطالبات\n\nحجز أماكن إقامة طارئة ووسائل نقل برية للمسافرين العالقين\n\nخط دعم مميز متاح على مدار الساعة طوال أيام الأسبوع لإعادة الحجز العاجل وإدارة الأزمات',
      'es':
          '- Alertas de radar inteligente en tiempo real al detectar una interrupción.\n- Opciones de reprogramación automática disponibles a los pocos minutos de la cancelación.\n- Información sobre los derechos de los pasajeros por aerolínea y jurisdicción (EU261, DOT, etc.).\n- Calculadora de reclamaciones de compensación y asistencia automatizada para la presentación de reclamaciones.\n- Reserva de alojamiento y transporte terrestre de emergencia para viajeros varados.\n- Línea de asistencia premium 24/7 para reprogramaciones urgentes y gestión de crisis.',
      'fr':
          '- Alertes radar intelligentes en temps réel dès qu\'une perturbation est détectée\n\n- Proposition automatique de nouvelles réservations quelques minutes après l\'annulation\n\n- Informations sur les droits des passagers par compagnie aérienne et juridiction (Règlement UE 261, DOT, etc.)\n\n- Calculateur de demande d\'indemnisation et assistance automatisée pour le dépôt de réclamation\n\n- Réservation d\'hébergement d\'urgence et de transport terrestre pour les voyageurs bloqués\n\n- Assistance téléphonique premium 24h/24 et 7j/7 pour les nouvelles réservations urgentes et la gestion de crise',
      'zh_Hans':
          '- 实时智能雷达会在检测到航班中断时立即发出警报\n\n- 航班取消后数分钟内自动提供改签选项\n\n- 按航空公司和司法管辖区（欧盟261号条例、美国交通部条例等）提供乘客权利信息\n\n- 赔偿申请计算器和自动索赔申请协助\n\n- 为滞留旅客预订紧急住宿和地面交通\n\n- 全天候24小时高级支持热线，提供紧急改签和危机管理服务',
    },
    'crw4yxvi': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // ReferralProgramUtilityPage
  {
    'doebntnj': {
      'en': 'REFERRAL PROGRAM',
      'ar': 'برنامج الإحالة',
      'es': 'PROGRAMA DE REFERENCIA',
      'fr': 'PROGRAMME DE PARRAINAGE',
      'zh_Hans': '转介计划',
    },
    'tteou9zv': {
      'en': 'Invite. Earn. Travel More.',
      'ar': 'ادعُ. اربح. سافر أكثر.',
      'es': 'Invita. Gana. Viaja más.',
      'fr': 'Invitez. Gagnez. Voyagez plus.',
      'zh_Hans': '邀请好友，赚取奖励，畅游更多精彩旅程。',
    },
    '08kq2mey': {
      'en':
          'The Kitravia Referral Program rewards loyal users for growing the community. Every successful referral earns travel credits redeemable across the entire Kitravia platform.',
      'ar':
          'يكافئ برنامج الإحالة في كيترافيا المستخدمين المخلصين على مساهمتهم في تنمية المجتمع. كل إحالة ناجحة تمنح رصيد سفر يمكن استخدامه في جميع أنحاء منصة كيترافيا.',
      'es':
          'El programa de referidos de Kitravia premia a los usuarios fieles por contribuir al crecimiento de la comunidad. Cada referido exitoso genera créditos de viaje canjeables en toda la plataforma de Kitravia.',
      'fr':
          'Le programme de parrainage Kitravia récompense les utilisateurs fidèles qui contribuent à l\'expansion de la communauté. Chaque parrainage réussi permet de gagner des crédits de voyage utilisables sur l\'ensemble de la plateforme Kitravia.',
      'zh_Hans':
          'Kitravia推荐计划旨在奖励忠实用户，帮助他们发展壮大社区。每次成功推荐，用户都将获得可在Kitravia平台内兑换的旅行积分。',
    },
    '3nnaqqsn': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // APIDeveloperPortalPage
  {
    'fll1txae': {
      'en': 'API & DEVELOPER PORTAL',
      'ar': 'واجهة برمجة التطبيقات وبوابة المطورين',
      'es': 'API Y PORTAL PARA DESARROLLADORES',
      'fr': 'API ET PORTAIL DÉVELOPPEUR',
      'zh_Hans': 'API 和开发者门户',
    },
    'c0itt3m3': {
      'en':
          'The Kitravia Developer Portal provides technical access to the full Kitravia booking and intelligence ecosystem — enabling travel businesses, startups, and developers to build powerful travel products on top of the Kitravia infrastructure.',
      'ar':
          'توفر بوابة مطوري Kitravia إمكانية الوصول التقني إلى نظام الحجز والذكاء الكامل لـ Kitravia - مما يتيح لشركات السفر والشركات الناشئة والمطورين بناء منتجات سفر قوية على بنية Kitravia التحتية.',
      'es':
          'El portal para desarrolladores de Kitravia proporciona acceso técnico a todo el ecosistema de reservas e inteligencia de Kitravia, lo que permite a las empresas de viajes, las startups y los desarrolladores crear potentes productos de viaje sobre la infraestructura de Kitravia.',
      'fr':
          'Le portail développeur Kitravia offre un accès technique à l\'écosystème complet de réservation et d\'analyse de données Kitravia, permettant aux entreprises de voyage, aux startups et aux développeurs de créer des produits de voyage performants sur l\'infrastructure Kitravia.',
      'zh_Hans':
          'Kitravia 开发者门户提供对整个 Kitravia 预订和智能生态系统的技术访问——使旅游企业、初创公司和开发者能够在 Kitravia 基础设施之上构建强大的旅游产品。',
    },
    'kv8bj127': {
      'en':
          '- RESTful API with comprehensive documentation and sandbox environment\n- Real-time flight, hotel, car, and cruise inventory endpoints\n- AI Trip Planning API for embedding Kitravia intelligence in third-party apps\n- Visa information and requirements API updated in real time\n- Webhook support for booking events, status updates, and price alerts\n- Developer-tier pricing with scalable production plans\n- OAuth 2.0 authentication with enterprise-grade security\n- Dedicated technical support channel and SLA guarantees for partners\n',
      'ar':
          '- واجهة برمجة تطبيقات RESTful مع توثيق شامل وبيئة تجريبية\n\nنقاط وصول لعرض مخزون الرحلات الجوية والفنادق والسيارات والرحلات البحرية في الوقت الفعلي\n\nواجهة برمجة تطبيقات لتخطيط الرحلات بالذكاء الاصطناعي لدمج ذكاء Kitravia في تطبيقات الطرف الثالث\n\nواجهة برمجة تطبيقات لمعلومات ومتطلبات التأشيرة يتم تحديثها في الوقت الفعلي\n\nدعم Webhook لحجز الفعاليات وتحديثات الحالة وتنبيهات الأسعار\n\nأسعار خاصة بالمطورين مع خطط إنتاج قابلة للتوسع\n\nمصادقة OAuth 2.0 مع أمان على مستوى المؤسسات\n\nقناة دعم فني مخصصة وضمانات اتفاقية مستوى الخدمة للشركاء',
      'es':
          '- API RESTful con documentación completa y entorno de pruebas\n- Puntos de acceso en tiempo real a la disponibilidad de vuelos, hoteles, coches y cruceros\n- API de planificación de viajes con IA para integrar la inteligencia de Kitravia en aplicaciones de terceros\n- API con información y requisitos de visados ​​actualizada en tiempo real\n- Compatibilidad con webhooks para eventos de reserva, actualizaciones de estado y alertas de precios\n- Precios para desarrolladores con planes de producción escalables\n- Autenticación OAuth 2.0 con seguridad de nivel empresarial\n- Canal de soporte técnico exclusivo y garantías de nivel de servicio (SLA) para socios',
      'fr':
          '- API RESTful avec documentation complète et environnement de test\n\n- Accès en temps réel aux disponibilités de vols, hôtels, voitures et croisières\n\n- API de planification de voyages IA pour intégrer l\'intelligence de Kitravia dans les applications tierces\n\n- API d\'informations et d\'exigences en matière de visas mise à jour en temps réel\n\n- Prise en charge des webhooks pour la réservation d\'événements, les mises à jour de statut et les alertes de prix\n\n- Tarification adaptée aux développeurs avec des plans de production évolutifs\n\n- Authentification OAuth 2.0 avec sécurité de niveau entreprise\n\n- Canal de support technique dédié et garanties de SLA pour les partenaires',
      'zh_Hans':
          '- 提供全面文档和沙盒环境的 RESTful API\n\n- 实时航班、酒店、租车和邮轮库存接口\n\n- 可将 Kitravia 智能功能嵌入第三方应用程序的 AI 旅行规划 API\n\n- 实时更新的签证信息和要求 API\n\n- 支持 Webhook，用于预订活动、状态更新和价格提醒\n\n- 开发者级别定价，并提供可扩展的生产计划\n\n- 采用企业级安全性的 OAuth 2.0 身份验证\n\n- 为合作伙伴提供专属技术支持渠道和 SLA 保障',
    },
    'isygbog7': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // LegalPage
  {
    'sjc8lmxy': {
      'en': 'LEGAL',
      'ar': 'قانوني',
      'es': 'LEGAL',
      'fr': 'LÉGAL',
      'zh_Hans': '合法的',
    },
    '30e4qicq': {
      'en':
          'Kitravia is committed to the highest standards of legal compliance, user protection, and data governance. The following legal documents govern the use of the Kitravia platform and all associated services.',
      'ar':
          'تلتزم كيترافيا بأعلى معايير الامتثال القانوني وحماية المستخدمين وإدارة البيانات. تحكم الوثائق القانونية التالية استخدام منصة كيترافيا وجميع الخدمات المرتبطة بها.',
      'es':
          'Kitravia se compromete a cumplir con los más altos estándares de cumplimiento legal, protección del usuario y gobernanza de datos. Los siguientes documentos legales rigen el uso de la plataforma Kitravia y todos los servicios asociados.',
      'fr':
          'Kitravia s\'engage à respecter les normes les plus strictes en matière de conformité légale, de protection des utilisateurs et de gouvernance des données. Les documents juridiques suivants régissent l\'utilisation de la plateforme Kitravia et de tous les services associés.',
      'zh_Hans':
          'Kitravia 致力于遵守最高的法律合规、用户保护和数据治理标准。以下法律文件规范 Kitravia 平台及其所有相关服务的使用。',
    },
    'gbw9b2qo': {
      'en': 'Legal Notice & Compliance',
      'ar': 'إشعار قانوني والامتثال',
      'es': 'Aviso legal y cumplimiento',
      'fr': 'Mentions légales et conformité',
      'zh_Hans': '法律声明及合规',
    },
    'ak9j2lgd': {
      'en':
          '- Kitravia is a registered travel technology company compliant with IATA regulations and applicable national travel agency licensing requirements.\n- All financial transactions are processed through PCI-DSS Level 1 certified payment infrastructure.\n- User data is protected under GDPR (EU), CCPA (California), and applicable international data protection legislation.\n- All booking confirmations constitute binding contracts subject to the respective supplier’s fare rules and the Kitravia Booking Policy.\n- Dispute resolution is available through Kitravia’s Customer Relations team, with escalation paths including applicable national consumer protection bodies.\n',
      'ar':
          '- كيترافيا شركة تقنية سفر مسجلة، ملتزمة بلوائح الاتحاد الدولي للنقل الجوي (IATA) ومتطلبات ترخيص وكالات السفر الوطنية المعمول بها.\n\n- تتم معالجة جميع المعاملات المالية عبر بنية تحتية للدفع معتمدة وفقًا لمعيار أمان بيانات صناعة بطاقات الدفع (PCI-DSS) من المستوى الأول.\n\n- بيانات المستخدمين محمية بموجب اللائحة العامة لحماية البيانات (GDPR) (الاتحاد الأوروبي)، وقانون خصوصية المستهلك في كاليفورنيا (CCPA)، والتشريعات الدولية المعمول بها لحماية البيانات.\n\n- جميع تأكيدات الحجز تُعد عقودًا ملزمة تخضع لقواعد أسعار المورد المعني وسياسة حجز كيترافيا.\n\n- يُمكن حل النزاعات من خلال فريق علاقات العملاء في كيترافيا، مع إمكانية اللجوء إلى هيئات حماية المستهلك الوطنية المختصة.',
      'es':
          'Kitravia es una empresa de tecnología de viajes registrada que cumple con las regulaciones de IATA y los requisitos de licencia de agencia de viajes nacionales aplicables.\n\nTodas las transacciones financieras se procesan a través de una infraestructura de pago con certificación PCI-DSS Nivel 1.\n\nLos datos de los usuarios están protegidos por el RGPD (UE), la CCPA (California) y la legislación internacional de protección de datos aplicable.\n\nTodas las confirmaciones de reserva constituyen contratos vinculantes sujetos a las condiciones tarifarias del proveedor correspondiente y a la Política de Reservas de Kitravia.\n\nLa resolución de disputas está disponible a través del equipo de Atención al Cliente de Kitravia, con vías de escalamiento que incluyen los organismos nacionales de protección al consumidor aplicables.',
      'fr':
          'Kitravia est une société de technologie du voyage enregistrée, conforme à la réglementation IATA et aux exigences nationales applicables en matière de licences d\'agences de voyages.\n\nToutes les transactions financières sont traitées via une infrastructure de paiement certifiée PCI-DSS niveau 1.\n\nLes données des utilisateurs sont protégées par le RGPD (UE), le CCPA (Californie) et la législation internationale applicable en matière de protection des données.\n\nToute confirmation de réservation constitue un contrat ferme, soumis aux conditions tarifaires du fournisseur concerné et à la politique de réservation de Kitravia.\n\nLe service des relations clients de Kitravia est à votre disposition pour tout litige, avec possibilité de recours auprès des organismes nationaux de protection des consommateurs compétents.',
      'zh_Hans':
          'Kitravia是一家注册的旅游科技公司，符合国际航空运输协会（IATA）的规定以及适用的国家旅行社许可要求。\n\n所有金融交易均通过PCI-DSS 1级认证的支付基础设施进行处理。\n\n用户数据受欧盟《通用数据保护条例》（GDPR）、加州《消费者隐私法案》（CCPA）以及适用的国际数据保护法律法规的保护。\n\n所有预订确认均构成具有约束力的合同，并受相应供应商的票价规则和Kitravia预订政策的约束。\n\n如有争议，可通过Kitravia客户关系团队解决，并可向适用的国家消费者保护机构提出升级申诉。',
    },
    'dw6skcis': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // BlogUtilityPage
  {
    'mja61msk': {
      'en': 'BLOG',
      'ar': 'مدونة',
      'es': 'BLOG',
      'fr': 'BLOG',
      'zh_Hans': '博客',
    },
    'y93badte': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // ContactUsPage
  {
    'c7il3x16': {
      'en': 'CONTACT',
      'ar': 'اتصل بنا',
      'es': 'CONTÁCTANOS',
      'fr': 'CONTACTEZ-NOUS',
      'zh_Hans': '联系我们',
    },
    'qw2sdoma': {
      'en': 'Contact us any time under: ',
      'ar': 'تواصل معنا في أي وقت عبر:',
      'es': 'Contáctanos en cualquier momento a través de:',
      'fr': 'Vous pouvez nous contacter à tout moment via :',
      'zh_Hans': '您可以随时通过以下方式联系我们：',
    },
    'n25zwwp6': {
      'en': 'support@kitravia.com',
      'ar': 'support@kitravia.com',
      'es': 'support@kitravia.com',
      'fr': 'support@kitravia.com',
      'zh_Hans': 'support@kitravia.com',
    },
    'y0zpjfnx': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // ReportIssuePage
  {
    'bw05raqi': {
      'en': 'REPORT AN ISSUE',
      'ar': 'الإبلاغ عن مشكلة',
      'es': 'INFORMAR DE UN PROBLEMA',
      'fr': 'SIGNALER UN PROBLÈME',
      'zh_Hans': '报告问题',
    },
    'f3hjb6fq': {
      'en': 'Report an issue to us any time under: ',
      'ar': 'يمكنك الإبلاغ عن أي مشكلة لنا في أي وقت عبر الرابط التالي:',
      'es':
          'Puedes informarnos de cualquier problema en cualquier momento a través de:',
      'fr': 'Signalez-nous tout problème à tout moment via :',
      'zh_Hans': '您可随时通过以下方式向我们报告问题：',
    },
    'tit02bwg': {
      'en': 'support@kitravia.com',
      'ar': 'support@kitravia.com',
      'es': 'support@kitravia.com',
      'fr': 'support@kitravia.com',
      'zh_Hans': 'support@kitravia.com',
    },
    'rzxc45vq': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // eBookGenerator
  {
    'nrx7d25y': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // FlightDetails
  {
    'uqrxhrtf': {
      'en': 'Flight Details',
      'ar': 'تفاصيل الرحلة',
      'es': 'Detalles del vuelo',
      'fr': 'Détails du vol',
      'zh_Hans': '航班详情',
    },
    'i5x33ay3': {
      'en': 'New York',
      'ar': 'نيويورك',
      'es': 'Nueva York',
      'fr': 'New York',
      'zh_Hans': '纽约',
    },
    'c5sygmw9': {
      'en': 'London',
      'ar': 'لندن',
      'es': 'Londres',
      'fr': 'Londres',
      'zh_Hans': '伦敦',
    },
    'yvf95i6b': {
      'en': 'Departure',
      'ar': 'رحيل',
      'es': 'Partida',
      'fr': 'Départ',
      'zh_Hans': '离开',
    },
    'cyn3la6b': {
      'en': 'Arrival',
      'ar': 'الوصول',
      'es': 'Llegada',
      'fr': 'Arrivée',
      'zh_Hans': '到达',
    },
    'vlvaoujp': {
      'en': 'On Time',
      'ar': 'في الوقت المحدد',
      'es': 'A tiempo',
      'fr': 'À l\'heure',
      'zh_Hans': '准时',
    },
    'yxrocehl': {
      'en': 'Date',
      'ar': 'تاريخ',
      'es': 'Fecha',
      'fr': 'Date',
      'zh_Hans': '日期',
    },
    'ijlm1equ': {
      'en': 'Duration',
      'ar': 'مدة',
      'es': 'Duración',
      'fr': 'Durée',
      'zh_Hans': '期间',
    },
    'vqt345l7': {
      'en': 'Stops',
      'ar': 'توقفات',
      'es': 'Paradas',
      'fr': 'Arrêts',
      'zh_Hans': '停止',
    },
    '6zc6q2ja': {
      'en': 'Cabin & Seat Info',
      'ar': 'معلومات المقصورة والمقاعد',
      'es': 'Información sobre la cabina y los asientos',
      'fr': 'Informations sur la cabine et les sièges',
      'zh_Hans': '客舱及座位信息',
    },
    'z0ropdis': {
      'en': 'Class',
      'ar': 'فصل',
      'es': 'Clase',
      'fr': 'Classe',
      'zh_Hans': '班级',
    },
    'm8hzdglz': {
      'en': 'Economy',
      'ar': 'اقتصاد',
      'es': 'Economía',
      'fr': 'Économie',
      'zh_Hans': '经济',
    },
    'vqfbkcdn': {
      'en': 'Seat',
      'ar': 'مقعد',
      'es': 'Asiento',
      'fr': 'Siège',
      'zh_Hans': '座位',
    },
    'rfpbi6dg': {
      'en': 'Null',
      'ar': 'باطل',
      'es': 'Nulo',
      'fr': 'Nul',
      'zh_Hans': '无效的',
    },
    'edexavzn': {
      'en': 'Aircraft',
      'ar': 'الطائرات',
      'es': 'Aeronave',
      'fr': 'Aéronef',
      'zh_Hans': '飞机',
    },
    'd75jcl6l': {
      'en': 'Baggage',
      'ar': 'أمتعة',
      'es': 'equipaje',
      'fr': 'bagages',
      'zh_Hans': '行李',
    },
    'pqd6tf0c': {
      'en': '23 kg',
      'ar': '23 كجم',
      'es': '23 kg',
      'fr': '23 kg',
      'zh_Hans': '23公斤',
    },
    'rr9lw3mq': {
      'en': 'Cabin Bag',
      'ar': 'حقيبة يد',
      'es': 'Bolsa de cabina',
      'fr': 'Sac de cabine',
      'zh_Hans': '随身行李',
    },
    'rdj389bd': {
      'en': '7 kg',
      'ar': '7 كجم',
      'es': '7 kg',
      'fr': '7 kg',
      'zh_Hans': '7公斤',
    },
    'fg4u0a70': {
      'en': 'Meal',
      'ar': 'وجبة',
      'es': 'Comida',
      'fr': 'Repas',
      'zh_Hans': '一顿饭',
    },
    'sv2hqc5g': {
      'en': 'Included',
      'ar': 'مشمول',
      'es': 'Incluido',
      'fr': 'Compris',
      'zh_Hans': '包括',
    },
    'g5ihuz30': {
      'en': 'Amenities',
      'ar': 'المرافق',
      'es': 'Comodidades',
      'fr': 'Équipements',
      'zh_Hans': '便利设施',
    },
    'nd5avxg2': {
      'en': 'Wi-Fi',
      'ar': 'واي فاي',
      'es': 'Wi-Fi',
      'fr': 'Wi-Fi',
      'zh_Hans': '无线上网',
    },
    '7omm0c0p': {
      'en': 'In-flight TV',
      'ar': 'تلفزيون على متن الطائرة',
      'es': 'Televisión a bordo',
      'fr': 'Télévision en vol',
      'zh_Hans': '机上电视',
    },
    'eh5bk5ty': {
      'en': 'USB Port',
      'ar': 'منفذ USB',
      'es': 'Puerto USB',
      'fr': 'Port USB',
      'zh_Hans': 'USB端口',
    },
    'rj62ig87': {
      'en': 'Dining',
      'ar': 'تناول الطعام',
      'es': 'Comida',
      'fr': 'À manger',
      'zh_Hans': '用餐',
    },
    '0q2uzi08': {
      'en': 'Price Breakdown',
      'ar': 'تفاصيل السعر',
      'es': 'Desglose de precios',
      'fr': 'Détail des prix',
      'zh_Hans': '价格明细',
    },
    'vkdurryo': {
      'en': 'Total',
      'ar': 'المجموع',
      'es': 'Total',
      'fr': 'Total',
      'zh_Hans': '全部的',
    },
    'alkxlmn2': {
      'en':
          '                                                                                                                               \$',
      'ar': 'دولار',
      'es': '\$',
      'fr': '\$',
      'zh_Hans': '\$',
    },
    'hjrbvdcy': {
      'en': 'Passenger',
      'ar': 'راكب',
      'es': 'Pasajero',
      'fr': 'Passager',
      'zh_Hans': '乘客',
    },
    '4tnrpgju': {
      'en': 'James Anderson',
      'ar': 'جيمس أندرسون',
      'es': 'James Anderson',
      'fr': 'James Anderson',
      'zh_Hans': '詹姆斯·安德森',
    },
    'p72dnbth': {
      'en': 'Passport: AB1234567',
      'ar': 'رقم جواز السفر: AB1234567',
      'es': 'Pasaporte: AB1234567',
      'fr': 'Passeport : AB1234567',
      'zh_Hans': '护照号码：AB1234567',
    },
    'os4zfpbl': {
      'en': 'Nationality: American',
      'ar': 'الجنسية: أمريكي',
      'es': 'Nacionalidad: estadounidense',
      'fr': 'Nationalité : Américaine',
      'zh_Hans': '国籍：美国',
    },
    '2otb1pfr': {
      'en': 'Download Ticket',
      'ar': 'تنزيل التذكرة',
      'es': 'Descargar boleto',
      'fr': 'Télécharger le billet',
      'zh_Hans': '下载门票',
    },
    'z6whlvh5': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
      'es': 'Reserva ahora',
      'fr': 'Réservez maintenant',
      'zh_Hans': '立即预订',
    },
  },
  // BookingOptionsFlight
  {
    'm6hw1wsl': {
      'en': 'Booking Options',
      'ar': 'خيارات الحجز',
      'es': 'Opciones de reserva',
      'fr': 'Options de réservation',
      'zh_Hans': '预订选项',
    },
    'yorij2fl': {
      'en': 'Economy',
      'ar': 'اقتصاد',
      'es': 'Economía',
      'fr': 'Économie',
      'zh_Hans': '经济',
    },
    '18tceq7b': {
      'en': 'FROM',
      'ar': 'من',
      'es': 'DE',
      'fr': 'DEPUIS',
      'zh_Hans': '从',
    },
    '60yqlntg': {
      'en': 'TO',
      'ar': 'ل',
      'es': 'A',
      'fr': 'À',
      'zh_Hans': '到',
    },
    'nvzd8njg': {
      'en': 'DEPARTURE',
      'ar': 'رحيل',
      'es': 'PARTIDA',
      'fr': 'DÉPART',
      'zh_Hans': '离开',
    },
    '67nfavn4': {
      'en': 'ARRIVAL',
      'ar': 'الوصول',
      'es': 'LLEGADA',
      'fr': 'ARRIVÉE',
      'zh_Hans': '到达',
    },
    'y6r2tsib': {
      'en': '+1 day',
      'ar': '+1 يوم',
      'es': '+1 día',
      'fr': '+1 jour',
      'zh_Hans': '+1天',
    },
    'ymvwlype': {
      'en': 'STOPS',
      'ar': 'نقاط التوقف',
      'es': 'PARADAS',
      'fr': 'ARRÊTS',
      'zh_Hans': '停止',
    },
    '95ug6ft8': {
      'en': 'AIRCRAFT',
      'ar': 'الطائرات',
      'es': 'AERONAVE',
      'fr': 'AÉRONEF',
      'zh_Hans': '飞机',
    },
    'xl6ss6f7': {
      'en': 'PASSENGERS',
      'ar': 'الركاب',
      'es': 'PASAJEROS',
      'fr': 'PASSAGERS',
      'zh_Hans': '乘客',
    },
    'ohoxx91v': {
      'en': '1 Adult',
      'ar': 'شخص بالغ واحد',
      'es': '1 adulto',
      'fr': '1 adulte',
      'zh_Hans': '1名成人',
    },
    'mkhf7fmd': {
      'en': 'TOTAL PRICE',
      'ar': 'السعر الإجمالي',
      'es': 'PRECIO TOTAL',
      'fr': 'PRIX TOTAL',
      'zh_Hans': '总价',
    },
    'yqms1uuc': {
      'en': 'Best Price Found',
      'ar': 'أفضل سعر تم العثور عليه',
      'es': 'Mejor precio encontrado',
      'fr': 'Meilleur prix trouvé',
      'zh_Hans': '找到的最低价格',
    },
    'ovcf1c83': {
      'en': 'Available Sellers',
      'ar': 'البائعون المتاحون',
      'es': 'Vendedores disponibles',
      'fr': 'Vendeurs disponibles',
      'zh_Hans': '可用卖家',
    },
    'e81behxp': {
      'en': '3 options found',
      'ar': 'تم العثور على 3 خيارات',
      'es': 'Se encontraron 3 opciones',
      'fr': '3 options trouvées',
      'zh_Hans': '找到 3 个选项',
    },
    'daqu6h5y': {
      'en': 'Select Seller',
      'ar': 'اختر البائع',
      'es': 'Seleccionar vendedor',
      'fr': 'Sélectionner le vendeur',
      'zh_Hans': '选择卖家',
    },
    'we4r71sx': {
      'en': 'Kayak',
      'ar': 'قوارب الكاياك',
      'es': 'Kayac',
      'fr': 'Kayak',
      'zh_Hans': '皮艇',
    },
    'ej8vqcdb': {
      'en': 'Final booking on seller website',
      'ar': 'الحجز النهائي على موقع البائع',
      'es': 'Reserva final en la página web del vendedor.',
      'fr': 'Réservation finale sur le site web du vendeur',
      'zh_Hans': '在卖家网站上完成最终预订',
    },
    'xmbmhkdh': {
      'en': '\$869',
      'ar': '869 دولارًا',
      'es': '\$869',
      'fr': '869 \$',
      'zh_Hans': '869美元',
    },
    '911h2y9y': {
      'en': 'Select Seller',
      'ar': 'اختر البائع',
      'es': 'Seleccionar vendedor',
      'fr': 'Sélectionner le vendeur',
      'zh_Hans': '选择卖家',
    },
    '0zdv44x3': {
      'en': 'Skyscanner',
      'ar': 'سكاي سكانر',
      'es': 'Skyscanner',
      'fr': 'Skyscanner',
      'zh_Hans': 'Skyscanner',
    },
    'keojcdnq': {
      'en': 'Final booking on seller website',
      'ar': 'الحجز النهائي على موقع البائع',
      'es': 'Reserva final en la página web del vendedor.',
      'fr': 'Réservation finale sur le site web du vendeur',
      'zh_Hans': '在卖家网站上完成最终预订',
    },
    'qk9947xu': {
      'en': '\$891',
      'ar': '891 دولارًا',
      'es': '\$891',
      'fr': '891 \$',
      'zh_Hans': '891美元',
    },
    'u3ogxjkg': {
      'en': 'Select Seller',
      'ar': 'اختر البائع',
      'es': 'Seleccionar vendedor',
      'fr': 'Sélectionner le vendeur',
      'zh_Hans': '选择卖家',
    },
  },
  // AllSearchPage2
  {
    '45yjaqfu': {
      'en': 'Kitravia',
      'ar': 'كيترافيا',
      'es': 'Kitravia',
      'fr': 'Kitravia',
      'zh_Hans': '基特拉维亚',
    },
    'goq5gmki': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'zh_Hans': '登入',
    },
    'agbnfd75': {
      'en': 'Register',
      'ar': 'يسجل',
      'es': 'Registro',
      'fr': 'Registre',
      'zh_Hans': '登记',
    },
    'n9rja8ob': {
      'en': 'Where will you go next?',
      'ar': 'إلى أين ستذهب بعد ذلك؟',
      'es': '¿Adónde irás después?',
      'fr': 'Où irez-vous ensuite ?',
      'zh_Hans': '你接下来要去哪里？',
    },
    '4oyb7i57': {
      'en': 'Discover amazing destinations at unbeatable prices',
      'ar': 'اكتشف وجهات مذهلة بأسعار لا تُضاهى',
      'es': 'Descubre destinos increíbles a precios inmejorables.',
      'fr': 'Découvrez des destinations exceptionnelles à des prix imbattables',
      'zh_Hans': '以无与伦比的价格探索精彩目的地',
    },
    'nxj25wtf': {
      'en': 'Flights',
      'ar': 'رحلات جوية',
      'es': 'Vuelos',
      'fr': 'Vols',
      'zh_Hans': '航班',
    },
    'mrweb8b2': {
      'en': 'Hotels',
      'ar': 'الفنادق',
      'es': 'Hoteles',
      'fr': 'Hôtels',
      'zh_Hans': '酒店',
    },
    'mmowjqw8': {
      'en': 'Cars',
      'ar': 'سيارات',
      'es': 'coches',
      'fr': 'Voitures',
      'zh_Hans': '汽车',
    },
    '6l5byrsg': {
      'en': 'Packages',
      'ar': 'الطرود',
      'es': 'Paquetes',
      'fr': 'Colis',
      'zh_Hans': '包裹',
    },
    'ggzu801n': {
      'en': 'Round Trip',
      'ar': 'رحلة ذهاب وعودة',
      'es': 'Ida y vuelta',
      'fr': 'Aller-retour',
      'zh_Hans': '往返',
    },
    '05go5ga2': {
      'en': 'One Way',
      'ar': 'طريقة واحدة',
      'es': 'De una sola mano',
      'fr': 'Sens Unique',
      'zh_Hans': '单程',
    },
    'myequgvi': {
      'en': 'Multi-City',
      'ar': 'مدن متعددة',
      'es': 'Multiciudad',
      'fr': 'Multi-villes',
      'zh_Hans': '多城市',
    },
    'dscijt48': {
      'en': 'From',
      'ar': 'من',
      'es': 'De',
      'fr': 'Depuis',
      'zh_Hans': '从',
    },
    'lhsf5udi': {
      'en': 'New York (JFK)',
      'ar': 'نيويورك (مطار جون إف كينيدي)',
      'es': 'Nueva York (JFK)',
      'fr': 'New York (JFK)',
      'zh_Hans': '纽约（肯尼迪机场）',
    },
    '13yty8qd': {
      'en': 'To',
      'ar': 'ل',
      'es': 'A',
      'fr': 'À',
      'zh_Hans': '到',
    },
    'vtj9kzyh': {
      'en': 'London (LHR)',
      'ar': 'لندن (مطار هيثرو)',
      'es': 'Londres (LHR)',
      'fr': 'Londres (LHR)',
      'zh_Hans': '伦敦（LHR）',
    },
    'ui7rzaoc': {
      'en': 'Depart',
      'ar': 'المغادرة',
      'es': 'Salir',
      'fr': 'Partir',
      'zh_Hans': '出发',
    },
    'b6qcn99i': {
      'en': 'Jun 15, 2025',
      'ar': '15 يونيو 2025',
      'es': '15 de junio de 2025',
      'fr': '15 juin 2025',
      'zh_Hans': '2025年6月15日',
    },
    '1k0drbp5': {
      'en': 'Return',
      'ar': 'يعود',
      'es': 'Devolver',
      'fr': 'Retour',
      'zh_Hans': '返回',
    },
    'w9kqymye': {
      'en': 'Jun 22, 2025',
      'ar': '22 يونيو 2025',
      'es': '22 de junio de 2025',
      'fr': '22 juin 2025',
      'zh_Hans': '2025年6月22日',
    },
    'gwkc5qvx': {
      'en': 'Travelers',
      'ar': 'المسافرون',
      'es': 'Viajeros',
      'fr': 'Les voyageurs',
      'zh_Hans': '旅行者',
    },
    'ksw2i682': {
      'en': '2 Adults, Economy',
      'ar': 'شخصان بالغان، سعر اقتصادي',
      'es': '2 adultos, clase económica',
      'fr': '2 adultes, classe économique',
      'zh_Hans': '2 位成人，经济型',
    },
    'isgsv3zv': {
      'en': 'Search Flights',
      'ar': 'ابحث عن رحلات الطيران',
      'es': 'Buscar vuelos',
      'fr': 'Rechercher des vols',
      'zh_Hans': '搜索航班',
    },
    'agnxmalr': {
      'en': 'Available Flights',
      'ar': 'الرحلات المتاحة',
      'es': 'Vuelos disponibles',
      'fr': 'Vols disponibles',
      'zh_Hans': '可搭乘的航班',
    },
    'xl3t6sm5': {
      'en': 'Filter',
      'ar': 'فلتر',
      'es': 'Filtrar',
      'fr': 'Filtre',
      'zh_Hans': '筛选',
    },
    '31zkskqh': {
      'en': 'Showing 6 results for JFK → LHR · Jun 15–22 · 2 Adults',
      'ar': 'عرض 6 نتائج لرحلة JFK → LHR · 15-22 يونيو · شخصان بالغان',
      'es':
          'Mostrando 6 resultados para JFK → LHR · 15–22 de junio · 2 adultos',
      'fr': 'Affichage de 6 résultats pour JFK → LHR · 15–22 juin · 2 adultes',
      'zh_Hans': '共找到 6 条关于 JFK → LHR · 6 月 15 日至 22 日 · 2 名成人',
    },
    'r2pwzi9i': {
      'en': 'British Airways',
      'ar': 'الخطوط الجوية البريطانية',
      'es': 'British Airways',
      'fr': 'British Airways',
      'zh_Hans': '英国航空公司',
    },
    'lh5hcqzb': {
      'en': 'BA 178 · Boeing 777',
      'ar': 'الرحلة رقم BA 178 · بوينغ 777',
      'es': 'BA 178 · Boeing 777',
      'fr': 'BA 178 · Boeing 777',
      'zh_Hans': 'BA 178 · 波音777',
    },
    '3uqn0e6b': {
      'en': '\$489',
      'ar': '489 دولارًا',
      'es': '\$489',
      'fr': '489 \$',
      'zh_Hans': '489美元',
    },
    '5n2zbvhh': {
      'en': 'per person',
      'ar': 'لكل شخص',
      'es': 'por persona',
      'fr': 'par personne',
      'zh_Hans': '每人',
    },
    '35lcbtd3': {
      'en': '08:30',
      'ar': '08:30',
      'es': '08:30',
      'fr': '08:30',
      'zh_Hans': '08:30',
    },
    'zs54d5w7': {
      'en': 'JFK',
      'ar': 'جون كينيدي',
      'es': 'JFK',
      'fr': 'JFK',
      'zh_Hans': '肯尼迪',
    },
    '8lkx5fo1': {
      'en': 'New York',
      'ar': 'نيويورك',
      'es': 'Nueva York',
      'fr': 'New York',
      'zh_Hans': '纽约',
    },
  },
  // MyAccountMenuPage
  {
    'u1s5tas8': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // SettingsMenuPage
  {
    'jcxag5a3': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // BillingDetailsMenuPage
  {
    'vfb7cokq': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // AiChatPage
  {
    'h3w36oiu': {
      'en': 'New Trip',
      'ar': 'رحلة جديدة',
      'es': 'Nuevo viaje',
      'fr': 'Nouveau voyage',
      'zh_Hans': '新旅程',
    },
    'dlaedv5x': {
      'en': 'My Trips',
      'ar': 'رحلاتي',
      'es': 'Mis viajes',
      'fr': 'Mes voyages',
      'zh_Hans': '我的旅行',
    },
    'm2a9y2sy': {
      'en': 'Las Vegas Weekend',
      'ar': 'عطلة نهاية الأسبوع في لاس فيغاس',
      'es': 'Fin de semana en Las Vegas',
      'fr': 'Week-end à Las Vegas',
      'zh_Hans': '拉斯维加斯周末',
    },
    'd7tno57z': {
      'en': 'Buisness Trip to New York',
      'ar': 'رحلة عمل إلى نيويورك',
      'es': 'Viaje de negocios a Nueva York',
      'fr': 'Voyage d\'affaires à New York',
      'zh_Hans': '纽约商务之旅',
    },
    '3e9unhmj': {
      'en': 'Cultural Trip to Nairobi',
      'ar': 'رحلة ثقافية إلى نيروبي',
      'es': 'Viaje cultural a Nairobi',
      'fr': 'Voyage culturel à Nairobi',
      'zh_Hans': '内罗毕文化之旅',
    },
    'bhxmhvta': {
      'en': 'U',
      'ar': 'يو',
      'es': 'U',
      'fr': 'U',
      'zh_Hans': 'U',
    },
    'o3sq4nx5': {
      'en': 'Premium',
      'ar': 'غالي',
      'es': 'De primera calidad',
      'fr': 'Prime',
      'zh_Hans': '优质的',
    },
    'ao136466': {
      'en': 'Continue to Book',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'akr3b1uh': {
      'en': 'Share',
      'ar': 'يشارك',
      'es': 'Compartir',
      'fr': 'Partager',
      'zh_Hans': '分享',
    },
    'akfbjiex': {
      'en': 'Like ChatGPT.\nBut for your Travel needs.',
      'ar': 'مثل ChatGPT.\nولكن لتلبية احتياجاتك أثناء السفر.',
      'es': 'Como ChatGPT.\n\nPero para tus necesidades de viaje.',
      'fr': 'Comme ChatGPT.\n\nMais pour vos besoins de voyage.',
      'zh_Hans': '类似 ChatGPT。\n\n但满足您的旅行需求。',
    },
    'xd5bwx7e': {
      'en': 'Hi, I\'m Kitravia. I will be your AI travel agent.',
      'ar': 'مرحباً، أنا كيترافيا. سأكون وكيل سفرك الآلي.',
      'es':
          'Hola, soy Kitravia. Seré tu agente de viajes con inteligencia artificial.',
      'fr':
          'Bonjour, je suis Kitravia. Je serai votre agent de voyages tout compris.',
      'zh_Hans': '您好，我是Kitravia，我将是您的AI旅行顾问。',
    },
    '1pzhj6x8': {
      'en':
          'Not sure where to start? Tell me where you want to go? What\'s your budget? Is there something specific you\'d like to do? Do you need a rental car? We\'ll guide you through the booking process!',
      'ar':
          'لست متأكدًا من أين تبدأ؟ أخبرنا أين تريد الذهاب؟ ما هي ميزانيتك؟ هل هناك شيء محدد ترغب في القيام به؟ هل تحتاج إلى استئجار سيارة؟ سنرشدك خلال عملية الحجز!',
      'es':
          '¿No sabes por dónde empezar? ¿Adónde quieres ir? ¿Cuál es tu presupuesto? ¿Hay algo en particular que te gustaría hacer? ¿Necesitas alquilar un coche? ¡Te guiaremos durante todo el proceso de reserva!',
      'fr':
          'Vous ne savez pas par où commencer ? Dites-nous où vous souhaitez aller. Quel est votre budget ? Avez-vous des envies particulières ? Avez-vous besoin d’une voiture de location ? Nous vous accompagnerons tout au long de la réservation !',
      'zh_Hans': '不知道从哪里开始？告诉我你想去哪里？你的预算是多少？有什么特别想体验的活动吗？需要租车吗？我们会指导你完成预订流程！',
    },
    '42k7vlvn': {
      'en': 'Where should Kitravia take you today?',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '8o0m2ogq': {
      'en':
          'Kitravia can make mistkaes. Double check important information before completing booking transaction',
      'ar':
          'قد ترتكب شركة كيترافيا أخطاءً. لذا، يرجى التحقق من المعلومات المهمة قبل إتمام عملية الحجز.',
      'es':
          'Kitravia puede cometer errores. Verifique la información importante antes de completar la transacción de reserva.',
      'fr':
          'Kitravia peut préparer des mistkaes. Veuillez vérifier attentivement les informations importantes avant de finaliser votre réservation.',
      'zh_Hans': 'Kitravia可能会出错。请在完成预订交易前仔细核对重要信息。',
    },
    'krcwzabv': {
      'en': 'Flight Booking',
      'ar': 'حجز الرحلات',
      'es': 'Reserva de vuelos',
      'fr': 'Réservation de vols',
      'zh_Hans': '航班预订',
    },
    'b2tmnp0d': {
      'en': 'Hotel',
      'ar': 'الفندق',
      'es': 'Hotel',
      'fr': 'Hôtel',
      'zh_Hans': '酒店',
    },
    'g5v6wque': {
      'en': 'Cruise',
      'ar': 'رحلة بحرية',
      'es': 'Crucero',
      'fr': 'Croisière',
      'zh_Hans': '巡航',
    },
    '45lbyvg1': {
      'en': 'Car Rental',
      'ar': 'تأجير سيارات',
      'es': 'Alquiler de coches',
      'fr': 'Location de voitures',
      'zh_Hans': '租车',
    },
    'psf0z38s': {
      'en': 'Things to Do',
      'ar': 'أشياء للقيام بها',
      'es': 'Cosas que hacer',
      'fr': 'Choses à faire',
      'zh_Hans': '可以做的事情',
    },
    'sd7ibiex': {
      'en': 'Places to Go',
      'ar': 'أماكن للزيارة',
      'es': 'Lugares para visitar',
      'fr': 'Lieux à visiter',
      'zh_Hans': '去哪儿',
    },
    'ujcydc7s': {
      'en': 'Holiday Packages',
      'ar': 'باقات العطلات',
      'es': 'Paquetes vacacionales',
      'fr': 'Forfaits vacances',
      'zh_Hans': '假日套餐',
    },
    'jq2rpbq0': {
      'en': 'Vacation',
      'ar': 'أجازة',
      'es': 'Vacaciones',
      'fr': 'Vacances',
      'zh_Hans': '假期',
    },
    'z1sduslo': {
      'en': 'Hotel Deals',
      'ar': 'عروض الفنادق',
      'es': 'Ofertas de hotel',
      'fr': 'Offres d\'hôtels',
      'zh_Hans': '酒店优惠',
    },
    '4y7xoqqp': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // RouterPage
  {
    'z2k3yshc': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // AccountOptions
  {
    'attriof6': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // AddNewCardMenu
  {
    '26adk1kd': {
      'en': 'Credit Card',
      'ar': 'بطاقة إئتمان',
      'es': 'Tarjeta de crédito',
      'fr': 'Carte de crédit',
      'zh_Hans': '信用卡',
    },
    'l8kkqi4h': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'es': 'Su nombre',
      'fr': 'Votre nom',
      'zh_Hans': '你的名字',
    },
    'v6txkh7t': {
      'en': 'Add Card',
      'ar': 'أضف البطاقة',
      'es': 'Agregar tarjeta',
      'fr': 'Ajouter une carte',
      'zh_Hans': '添加卡片',
    },
    '8pjl1swh': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Visa_Platform
  {
    'hndvvkwb': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Home
  {
    '45tesdqc': {
      'en': 'AI Travel & Booking Platform',
      'ar': 'منصة سفر وحجز تعتمد على الذكاء الاصطناعي',
      'es': 'Plataforma de viajes y reservas con IA',
      'fr': 'Plateforme de voyage et de réservation basée sur l\'IA',
      'zh_Hans': 'AI旅行与预订平台',
    },
    '64kfm8sr': {
      'en':
          'Discover a world designed by AI — where we find \nyour perfect flights, stays, and adventures before anyone else.',
      'ar':
          'اكتشف عالماً صممه الذكاء الاصطناعي — حيث نجد لك رحلاتك وإقاماتك ومغامراتك المثالية قبل أي شخص آخر.',
      'es':
          'Descubre un mundo diseñado por IA, donde encontramos tus vuelos, estancias y aventuras perfectas antes que nadie.',
      'fr':
          'Découvrez un monde conçu par l\'IA — où nous trouvons\n\nvos vols, séjours et aventures parfaits avant tout le monde.',
      'zh_Hans': '探索人工智能设计的世界——我们抢先一步为您找到最完美的航班、住宿和探险之旅。',
    },
    'zv42h9l0': {
      'en': 'Like ChatGPT.\nBut for your Travel needs.',
      'ar': 'مثل ChatGPT.\nلكن لتلبية احتياجاتك أثناء السفر.',
      'es': 'Como ChatGPT.\n\nPero para tus necesidades de viaje.',
      'fr': 'Comme ChatGPT.\n\nMais pour vos besoins de voyage.',
      'zh_Hans': '类似 ChatGPT。\n\n但满足您的旅行需求。',
    },
    'eq89w62b': {
      'en': 'Hi, I\'m Kitravia. I will be your AI travel agent.',
      'ar': 'مرحباً، أنا كيترافيا. سأكون وكيل سفرك الآلي.',
      'es':
          'Hola, soy Kitravia. Seré tu agente de viajes con inteligencia artificial.',
      'fr':
          'Bonjour, je suis Kitravia. Je serai votre agent de voyages tout compris.',
      'zh_Hans': '您好，我是Kitravia，我将是您的AI旅行顾问。',
    },
    'qg3vzezb': {
      'en':
          '\nNot sure where to start? Tell me where you want to go? What\'s your budget? Is there something \nspecific you\'d like to do? Do you need a rental car? We’ll guide you through the booking process!',
      'ar':
          'لست متأكدًا من أين تبدأ؟ أخبرنا أين تريد الذهاب؟ ما هي ميزانيتك؟ هل هناك شيء محدد ترغب في القيام به؟ هل تحتاج إلى استئجار سيارة؟ سنرشدك خلال عملية الحجز!',
      'es':
          '¿No sabes por dónde empezar? Cuéntanos adónde quieres ir. ¿Cuál es tu presupuesto? ¿Hay algo en particular que te gustaría hacer? ¿Necesitas alquilar un coche? ¡Te ayudaremos con el proceso de reserva!',
      'fr':
          'Vous ne savez pas par où commencer ? Dites-nous où vous souhaitez aller. Quel est votre budget ? Avez-vous une activité particulière en tête ? Avez-vous besoin d’une voiture de location ? Nous vous accompagnerons tout au long de la réservation !',
      'zh_Hans': '不知道从哪里开始？告诉我你想去哪里？你的预算是多少？有什么特别想体验的活动吗？需要租车吗？我们会指导你完成预订流程！',
    },
    'qfgnaxg4': {
      'en': 'Flight Booking',
      'ar': 'حجز الرحلات',
      'es': 'Reserva de vuelos',
      'fr': 'Réservation de vols',
      'zh_Hans': '航班预订',
    },
    'z8rmkvwb': {
      'en': 'Hotel',
      'ar': 'الفندق',
      'es': 'Hotel',
      'fr': 'Hôtel',
      'zh_Hans': '酒店',
    },
    'c6oy3d7h': {
      'en': 'Cruise',
      'ar': 'رحلة بحرية',
      'es': 'Crucero',
      'fr': 'Croisière',
      'zh_Hans': '巡航',
    },
    'd6xvab6c': {
      'en': 'Car Rental',
      'ar': 'تأجير سيارات',
      'es': 'Alquiler de coches',
      'fr': 'Location de voitures',
      'zh_Hans': '租车',
    },
    '9st000ee': {
      'en': 'Things to Do',
      'ar': 'أشياء للقيام بها',
      'es': 'Cosas que hacer',
      'fr': 'Choses à faire',
      'zh_Hans': '可以做的事情',
    },
    '4nnll4tv': {
      'en': 'Places to Go',
      'ar': 'أماكن للزيارة',
      'es': 'Lugares para visitar',
      'fr': 'Lieux à visiter',
      'zh_Hans': '去哪儿',
    },
    'an10fmrl': {
      'en': 'Holiday Packages',
      'ar': 'باقات العطلات',
      'es': 'Paquetes vacacionales',
      'fr': 'Forfaits vacances',
      'zh_Hans': '假日套餐',
    },
    'nn5644zd': {
      'en': 'Vacation',
      'ar': 'أجازة',
      'es': 'Vacaciones',
      'fr': 'Vacances',
      'zh_Hans': '假期',
    },
    'ldxvcfn9': {
      'en': 'Hotel Deals',
      'ar': 'عروض الفنادق',
      'es': 'Ofertas de hotel',
      'fr': 'Offres d\'hôtels',
      'zh_Hans': '酒店优惠',
    },
    'k4amh8ar': {
      'en':
          'Smart Travel Search — Faster, personalized trips beyond traditional search.” This is the way is want the Search Engine look like with icon.',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'da14fx9e': {
      'en':
          'Discover smarter travel with Kitravia \nand experiences tailored to you, in seconds. \n',
      'ar': 'اكتشف السفر الذكي مع كيترافيا\nوتجارب مصممة خصيصاً لك، في ثوانٍ.',
      'es':
          'Descubre viajes más inteligentes con Kitravia y experiencias personalizadas en cuestión de segundos.',
      'fr':
          'Découvrez des voyages plus intelligents avec Kitravia\n\net des expériences personnalisées en quelques secondes.',
      'zh_Hans': '使用 Kitravia 探索更智能的旅行方式，并在几秒钟内获得为您量身定制的旅行体验。',
    },
    'i7jz8v8j': {
      'en': '🌍 Global Flights & Hotels,\n Perfectly Personalized for You',
      'ar': '🌍 رحلات طيران وفنادق عالمية،\n\nمصممة خصيصاً لك',
      'es':
          '🌍 Vuelos y hoteles internacionales,\n\nPerfectamente personalizados para ti',
      'fr':
          '🌍 Vols et hôtels internationaux,\n\nParfaitement personnalisés pour vous',
      'zh_Hans': '🌍 全球航班和酒店，\n\n为您量身定制',
    },
    'l92jqbxr': {
      'en':
          'Experience seamless travel with Kitravia’s AI Travel Agent, curating destinations, stays, and adventures that match your unique style.',
      'ar':
          'استمتع بتجربة سفر سلسة مع وكيل السفر المدعوم بالذكاء الاصطناعي من Kitravia، والذي يقوم بتنسيق الوجهات والإقامات والمغامرات التي تتناسب مع أسلوبك الفريد.',
      'es':
          'Disfruta de viajes sin complicaciones con el agente de viajes con IA de Kitravia, que selecciona destinos, alojamientos y aventuras que se adaptan a tu estilo único.',
      'fr':
          'Vivez une expérience de voyage sans faille grâce à l\'agent de voyage IA de Kitravia, qui sélectionne des destinations, des séjours et des aventures correspondant à votre style unique.',
      'zh_Hans': 'Kitravia 的 AI 旅行助手可为您量身定制符合您独特风格的目的地、住宿和探险活动，让您享受无缝旅行体验。',
    },
    'zetwoulq': {
      'en': '✈️ Flights from 500+ Airlines — Found in Seconds',
      'ar': '✈️ رحلات طيران من أكثر من 500 شركة طيران — تجدها في ثوانٍ',
      'es': '✈️ Vuelos de más de 500 aerolíneas: ¡encuéntralos en segundos!',
      'fr':
          '✈️ Vols de plus de 500 compagnies aériennes — Trouvez-les en quelques secondes',
      'zh_Hans': '✈️ 查询来自 500 多家航空公司的航班——秒速找到',
    },
    'kjr1koqi': {
      'en':
          'Our AI Travel Agent scans hundreds of airlines instantly to bring you the best fares, from the most affordable to the fastest routes — all tailored to your travel style.',
      'ar':
          'يقوم وكيل السفر المدعوم بالذكاء الاصطناعي لدينا بمسح مئات شركات الطيران على الفور ليقدم لك أفضل الأسعار، بدءًا من الأقل تكلفة وحتى أسرع الطرق - وكلها مصممة خصيصًا لأسلوب سفرك.',
      'es':
          'Nuestro agente de viajes con inteligencia artificial analiza al instante cientos de aerolíneas para ofrecerte las mejores tarifas, desde las rutas más económicas hasta las más rápidas, todo ello adaptado a tu estilo de viaje.',
      'fr':
          'Notre agent de voyages IA analyse instantanément des centaines de compagnies aériennes pour vous proposer les meilleurs tarifs, des itinéraires les plus abordables aux plus rapides, le tout adapté à votre style de voyage.',
      'zh_Hans':
          '我们的AI旅行代理可立即扫描数百家航空公司，为您提供最优惠的价格，从最经济实惠的航线到最快捷的路线——所有这一切都根据您的旅行方式量身定制。',
    },
    'etynlh1x': {
      'en': '🏨 Stay at 1,000+ Hotels Worldwide',
      'ar': '🏨 أقم في أكثر من 1000 فندق حول العالم',
      'es': '🏨 Hospédese en más de 1000 hoteles en todo el mundo.',
      'fr': '🏨 Séjournez dans plus de 1 000 hôtels à travers le monde',
      'zh_Hans': '🏨 入住全球 1000 多家酒店',
    },
    'vmvqmq83': {
      'en':
          'Discover a curated selection of luxury, boutique, and budget-friendly stays.\nOur partners with trusted hotels across the globe to offer the perfect stay — for every traveler and every budget.',
      'ar':
          'اكتشف مجموعة مختارة بعناية من أماكن الإقامة الفاخرة، والبوتيكية، والاقتصادية.\nنتعاون مع فنادق موثوقة حول العالم لنقدم لك الإقامة المثالية التي تناسب جميع المسافرين وميزانياتهم.',
      'es':
          'Descubre una cuidada selección de alojamientos de lujo, boutique y económicos.\n\nColaboramos con hoteles de confianza en todo el mundo para ofrecerte la estancia perfecta, para cada viajero y cada presupuesto.',
      'fr':
          'Découvrez une sélection d\'hébergements de luxe, de charme et à prix abordables.\n\nNos partenaires hôteliers de confiance à travers le monde vous proposent le séjour idéal, quel que soit votre budget ou vos envies.',
      'zh_Hans':
          '探索我们精心挑选的豪华、精品和经济型酒店。\n\n我们与全球各地值得信赖的酒店合作，为每位旅行者和每种预算提供完美的住宿体验。',
    },
    'p1joj36m': {
      'en': '🚗 Car Rentals Made Effortless',
      'ar': '🚗 تأجير السيارات أصبح سهلاً',
      'es': '🚗 Alquiler de coches sin complicaciones',
      'fr': '🚗 Location de voitures simplifiée',
      'zh_Hans': '🚗 轻松租车',
    },
    'fqiqlux6': {
      'en':
          'From city rides to countryside escapes, our smart system compares top car rental providers to ensure the best prices, flexible options, and smooth journeys.',
      'ar':
          'من الرحلات داخل المدينة إلى الرحلات الريفية، يقوم نظامنا الذكي بمقارنة أفضل شركات تأجير السيارات لضمان أفضل الأسعار والخيارات المرنة والرحلات السلسة.',
      'es':
          'Desde trayectos por la ciudad hasta escapadas al campo, nuestro sistema inteligente compara a los principales proveedores de alquiler de coches para garantizar los mejores precios, opciones flexibles y viajes sin contratiempos.',
      'fr':
          'Des trajets en ville aux escapades à la campagne, notre système intelligent compare les meilleurs loueurs de voitures pour vous garantir les meilleurs prix, des options flexibles et des voyages sans encombre.',
      'zh_Hans': '从城市出行到乡村度假，我们的智能系统会比较各大租车供应商，以确保最优惠的价格、灵活的选择和顺畅的旅程。',
    },
    'hknrmjy4': {
      'en': '🛳️ Cruises & Voyages Beyond Imagination',
      'ar': '🛳️ رحلات بحرية ورحلات تتجاوز الخيال',
      'es': '🛳️ Cruceros y viajes que superan la imaginación',
      'fr': '🛳️ Croisières et voyages au-delà de l\'imagination',
      'zh_Hans': '🛳️ 超越想象的邮轮与航行',
    },
    'acjk5t8l': {
      'en':
          'Set sail with exclusive cruise deals and AI-personalized itineraries across oceans, rivers, and islands — turning your next voyage into an unforgettable experience.',
      'ar':
          'انطلق في رحلة بحرية مع عروض حصرية وخطط رحلات مخصصة بالذكاء الاصطناعي عبر المحيطات والأنهار والجزر - لتحويل رحلتك القادمة إلى تجربة لا تُنسى.',
      'es':
          'Zarpa con ofertas exclusivas de cruceros e itinerarios personalizados mediante inteligencia artificial a través de océanos, ríos e islas, convirtiendo tu próximo viaje en una experiencia inolvidable.',
      'fr':
          'Larguez les amarres grâce à des offres de croisières exclusives et des itinéraires personnalisés par l\'IA à travers les océans, les fleuves et les îles — transformant votre prochain voyage en une expérience inoubliable.',
      'zh_Hans': '扬帆起航，享受专属邮轮优惠和人工智能个性化行程，畅游海洋、河流和岛屿——让您的下一次航行成为一段难忘的体验。',
    },
    'qhz4vdkv': {
      'en':
          '🛳️ Cruises & Voyages Beyond Imagination\nSet sail with exclusive cruise deals and AI-personalized itineraries across oceans, rivers, and islands — turning your next voyage into an unforgettable experience.',
      'ar':
          '🛳️ رحلات بحرية تتجاوز الخيال\nانطلق في رحلة بحرية مع عروض حصرية وخطط رحلات مصممة خصيصاً لك بواسطة الذكاء الاصطناعي عبر المحيطات والأنهار والجزر - لتحويل رحلتك القادمة إلى تجربة لا تُنسى.',
      'es':
          '🛳️ Cruceros y viajes que superan la imaginación\nZarpa con ofertas exclusivas de cruceros e itinerarios personalizados con IA a través de océanos, ríos e islas, convirtiendo tu próximo viaje en una experiencia inolvidable.',
      'fr':
          '🛳️ Croisières et voyages au-delà de l\'imagination\n\nLarguez les amarres grâce à des offres de croisières exclusives et des itinéraires personnalisés par l\'IA à travers les océans, les fleuves et les îles — transformant votre prochain voyage en une expérience inoubliable.',
      'zh_Hans':
          '🛳️ 超越想象的邮轮之旅\n\n扬帆起航，享受专属邮轮优惠和人工智能个性化行程，畅游海洋、河流和岛屿——让您的下一次航行成为一段难忘的体验。',
    },
    '774fbdda': {
      'en': 'Our Partners',
      'ar': 'شركاؤنا',
      'es': 'Nuestros socios',
      'fr': 'Nos partenaires',
      'zh_Hans': '我们的合作伙伴',
    },
    'w6zbywzl': {
      'en': 'Like ChatGPT.\nBut for your Travel needs.',
      'ar': 'مثل ChatGPT.\nلكن لتلبية احتياجاتك أثناء السفر.',
      'es': 'Como ChatGPT.\n\nPero para tus necesidades de viaje.',
      'fr': 'Comme ChatGPT.\n\nMais pour vos besoins de voyage.',
      'zh_Hans': '类似 ChatGPT。\n\n但满足您的旅行需求。',
    },
    'c78os6fg': {
      'en': 'Hi, I\'m Kitravia. I will be your AI travel agent.',
      'ar': 'مرحباً، أنا كيترافيا. سأكون وكيل سفرك الآلي.',
      'es':
          'Hola, soy Kitravia. Seré tu agente de viajes con inteligencia artificial.',
      'fr':
          'Bonjour, je suis Kitravia. Je serai votre agent de voyages tout compris.',
      'zh_Hans': '您好，我是Kitravia，我将是您的AI旅行顾问。',
    },
    '5239uxeg': {
      'en': 'Flight Booking',
      'ar': 'حجز الرحلات',
      'es': 'Reserva de vuelos',
      'fr': 'Réservation de vols',
      'zh_Hans': '航班预订',
    },
    'j1yo5n8v': {
      'en': 'Hotel',
      'ar': 'الفندق',
      'es': 'Hotel',
      'fr': 'Hôtel',
      'zh_Hans': '酒店',
    },
    '9i2fqdjg': {
      'en': 'Cruise',
      'ar': 'رحلة بحرية',
      'es': 'Crucero',
      'fr': 'Croisière',
      'zh_Hans': '巡航',
    },
    'mxtluagb': {
      'en': 'Car Rental',
      'ar': 'تأجير سيارات',
      'es': 'Alquiler de coches',
      'fr': 'Location de voitures',
      'zh_Hans': '租车',
    },
    'eehr55fv': {
      'en': 'Things to Do',
      'ar': 'أشياء للقيام بها',
      'es': 'Cosas que hacer',
      'fr': 'Choses à faire',
      'zh_Hans': '可以做的事情',
    },
    '9h5orgbg': {
      'en': 'Places to Go',
      'ar': 'أماكن للزيارة',
      'es': 'Lugares para visitar',
      'fr': 'Lieux à visiter',
      'zh_Hans': '去哪儿',
    },
    '4pfm4f6p': {
      'en': 'Holiday Packages',
      'ar': 'باقات العطلات',
      'es': 'Paquetes vacacionales',
      'fr': 'Forfaits vacances',
      'zh_Hans': '假日套餐',
    },
    'lw5ib9z6': {
      'en': 'Vacation',
      'ar': 'أجازة',
      'es': 'Vacaciones',
      'fr': 'Vacances',
      'zh_Hans': '假期',
    },
    'cmvakjo3': {
      'en': 'Hotel Deals',
      'ar': 'عروض الفنادق',
      'es': 'Ofertas de hotel',
      'fr': 'Offres d\'hôtels',
      'zh_Hans': '酒店优惠',
    },
    'mpwmfiy9': {
      'en': '🌍 Global Flights & Hotels,\n Perfectly Personalized for You',
      'ar': '🌍 رحلات طيران وفنادق عالمية،\n\nمصممة خصيصاً لك',
      'es':
          '🌍 Vuelos y hoteles internacionales,\n\nPerfectamente personalizados para ti',
      'fr':
          '🌍 Vols et hôtels internationaux,\n\nParfaitement personnalisés pour vous',
      'zh_Hans': '🌍 全球航班和酒店，\n\n为您量身定制',
    },
    'mst8i452': {
      'en':
          'Experience seamless travel with Kitravia’s AI Travel Agent, curating destinations, stays, and adventures that match your unique style.',
      'ar':
          'استمتع بتجربة سفر سلسة مع وكيل السفر المدعوم بالذكاء الاصطناعي من Kitravia، والذي يقوم بتنسيق الوجهات والإقامات والمغامرات التي تتناسب مع أسلوبك الفريد.',
      'es':
          'Disfruta de viajes sin complicaciones con el agente de viajes con IA de Kitravia, que selecciona destinos, alojamientos y aventuras que se adaptan a tu estilo único.',
      'fr':
          'Vivez une expérience de voyage sans faille grâce à l\'agent de voyage IA de Kitravia, qui sélectionne des destinations, des séjours et des aventures correspondant à votre style unique.',
      'zh_Hans': 'Kitravia 的 AI 旅行助手可为您量身定制符合您独特风格的目的地、住宿和探险活动，让您享受无缝旅行体验。',
    },
    '20kuoze2': {
      'en': '✈️ Flights from 500+ Airlines — Found in Seconds',
      'ar': '✈️ رحلات طيران من أكثر من 500 شركة طيران — تجدها في ثوانٍ',
      'es': '✈️ Vuelos de más de 500 aerolíneas: ¡encuéntralos en segundos!',
      'fr':
          '✈️ Vols de plus de 500 compagnies aériennes — Trouvez-les en quelques secondes',
      'zh_Hans': '✈️ 查询来自 500 多家航空公司的航班——秒速找到',
    },
    '73cbyf7o': {
      'en':
          'Our AI Travel Agent scans hundreds of airlines instantly to bring you the best fares, from the most affordable to the fastest routes — all tailored to your travel style.',
      'ar':
          'يقوم وكيل السفر المدعوم بالذكاء الاصطناعي لدينا بمسح مئات شركات الطيران على الفور ليقدم لك أفضل الأسعار، بدءًا من الأقل تكلفة وحتى أسرع الطرق - وكلها مصممة خصيصًا لأسلوب سفرك.',
      'es':
          'Nuestro agente de viajes con inteligencia artificial analiza al instante cientos de aerolíneas para ofrecerte las mejores tarifas, desde las rutas más económicas hasta las más rápidas, todo ello adaptado a tu estilo de viaje.',
      'fr':
          'Notre agent de voyages IA analyse instantanément des centaines de compagnies aériennes pour vous proposer les meilleurs tarifs, des itinéraires les plus abordables aux plus rapides, le tout adapté à votre style de voyage.',
      'zh_Hans':
          '我们的AI旅行代理可立即扫描数百家航空公司，为您提供最优惠的价格，从最经济实惠的航线到最快捷的路线——所有这一切都根据您的旅行方式量身定制。',
    },
    'nppptmxo': {
      'en': '🏨 Stay at 1,000+ Hotels Worldwide',
      'ar': '🏨 أقم في أكثر من 1000 فندق حول العالم',
      'es': '🏨 Hospédese en más de 1000 hoteles en todo el mundo.',
      'fr': '🏨 Séjournez dans plus de 1 000 hôtels à travers le monde',
      'zh_Hans': '🏨 入住全球 1000 多家酒店',
    },
    'vaij6fyd': {
      'en':
          'Discover a curated selection of luxury, boutique, and budget-friendly stays.\nOur partners with trusted hotels across the globe to offer the perfect stay — for every traveler and every budget.',
      'ar':
          'اكتشف مجموعة مختارة بعناية من أماكن الإقامة الفاخرة، والبوتيكية، والاقتصادية.\nنتعاون مع فنادق موثوقة حول العالم لنقدم لك الإقامة المثالية التي تناسب جميع المسافرين وميزانياتهم.',
      'es':
          'Descubre una cuidada selección de alojamientos de lujo, boutique y económicos.\n\nColaboramos con hoteles de confianza en todo el mundo para ofrecerte la estancia perfecta, para cada viajero y cada presupuesto.',
      'fr':
          'Découvrez une sélection d\'hébergements de luxe, de charme et à prix abordables.\n\nNos partenaires hôteliers de confiance à travers le monde vous proposent le séjour idéal, quel que soit votre budget ou vos envies.',
      'zh_Hans':
          '探索我们精心挑选的豪华、精品和经济型酒店。\n\n我们与全球各地值得信赖的酒店合作，为每位旅行者和每种预算提供完美的住宿体验。',
    },
    'sp3d7dor': {
      'en': '🚗 Car Rentals Made Effortless',
      'ar': '🚗 تأجير السيارات أصبح سهلاً',
      'es': '🚗 Alquiler de coches sin complicaciones',
      'fr': '🚗 Location de voitures simplifiée',
      'zh_Hans': '🚗 轻松租车',
    },
    'l4tcyzj4': {
      'en':
          'From city rides to countryside escapes, our smart system compares top car rental providers to ensure the best prices, flexible options, and smooth journeys.',
      'ar':
          'من الرحلات داخل المدينة إلى الرحلات الريفية، يقوم نظامنا الذكي بمقارنة أفضل شركات تأجير السيارات لضمان أفضل الأسعار والخيارات المرنة والرحلات السلسة.',
      'es':
          'Desde trayectos por la ciudad hasta escapadas al campo, nuestro sistema inteligente compara a los principales proveedores de alquiler de coches para garantizar los mejores precios, opciones flexibles y viajes sin contratiempos.',
      'fr':
          'Des trajets en ville aux escapades à la campagne, notre système intelligent compare les meilleurs loueurs de voitures pour vous garantir les meilleurs prix, des options flexibles et des voyages sans encombre.',
      'zh_Hans': '从城市出行到乡村度假，我们的智能系统会比较各大租车供应商，以确保最优惠的价格、灵活的选择和顺畅的旅程。',
    },
    'hco9g94b': {
      'en': '🛳️ Cruises & Voyages Beyond Imagination',
      'ar': '🛳️ رحلات بحرية ورحلات تتجاوز الخيال',
      'es': '🛳️ Cruceros y viajes que superan la imaginación',
      'fr': '🛳️ Croisières et voyages au-delà de l\'imagination',
      'zh_Hans': '🛳️ 超越想象的邮轮与航行',
    },
    '99c9eqy3': {
      'en':
          'Set sail with exclusive cruise deals and AI-personalized itineraries across oceans, rivers, and islands — turning your next voyage into an unforgettable experience.',
      'ar':
          'انطلق في رحلة بحرية مع عروض حصرية وخطط رحلات مخصصة بالذكاء الاصطناعي عبر المحيطات والأنهار والجزر - لتحويل رحلتك القادمة إلى تجربة لا تُنسى.',
      'es':
          'Zarpa con ofertas exclusivas de cruceros e itinerarios personalizados mediante inteligencia artificial a través de océanos, ríos e islas, convirtiendo tu próximo viaje en una experiencia inolvidable.',
      'fr':
          'Larguez les amarres grâce à des offres de croisières exclusives et des itinéraires personnalisés par l\'IA à travers les océans, les fleuves et les îles — transformant votre prochain voyage en une expérience inoubliable.',
      'zh_Hans': '扬帆起航，享受专属邮轮优惠和人工智能个性化行程，畅游海洋、河流和岛屿——让您的下一次航行成为一段难忘的体验。',
    },
    'dy9md05y': {
      'en':
          '🛳️ Cruises & Voyages Beyond Imagination\nSet sail with exclusive cruise deals and AI-personalized itineraries across oceans, rivers, and islands — turning your next voyage into an unforgettable experience.',
      'ar':
          '🛳️ رحلات بحرية تتجاوز الخيال\nانطلق في رحلة بحرية مع عروض حصرية وخطط رحلات مصممة خصيصاً لك بواسطة الذكاء الاصطناعي عبر المحيطات والأنهار والجزر - لتحويل رحلتك القادمة إلى تجربة لا تُنسى.',
      'es':
          '🛳️ Cruceros y viajes que superan la imaginación\nZarpa con ofertas exclusivas de cruceros e itinerarios personalizados con IA a través de océanos, ríos e islas, convirtiendo tu próximo viaje en una experiencia inolvidable.',
      'fr':
          '🛳️ Croisières et voyages au-delà de l\'imagination\n\nLarguez les amarres grâce à des offres de croisières exclusives et des itinéraires personnalisés par l\'IA à travers les océans, les fleuves et les îles — transformant votre prochain voyage en une expérience inoubliable.',
      'zh_Hans':
          '🛳️ 超越想象的邮轮之旅\n\n扬帆起航，享受专属邮轮优惠和人工智能个性化行程，畅游海洋、河流和岛屿——让您的下一次航行成为一段难忘的体验。',
    },
    '1unr6k56': {
      'en': 'Our Partners',
      'ar': 'شركاؤنا',
      'es': 'Nuestros socios',
      'fr': 'Nos partenaires',
      'zh_Hans': '我们的合作伙伴',
    },
    'jahbjv58': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // LandingPage
  {
    '830xwas9': {
      'en': 'AI Travel & Booking Platform',
      'ar': 'منصة سفر وحجز تعتمد على الذكاء الاصطناعي',
      'es': 'Plataforma de viajes y reservas con IA',
      'fr': 'Plateforme de voyage et de réservation basée sur l\'IA',
      'zh_Hans': 'AI旅行与预订平台',
    },
    '5tyzqt0k': {
      'en': '|     Travel Smarter. Live Freer.     ',
      'ar': 'سافر بذكاء. عش بحرية أكبر.',
      'es': 'Viaja de forma más inteligente. Vive con más libertad.',
      'fr': 'Voyagez plus intelligemment. Vivez plus librement.',
      'zh_Hans': '更智能地旅行，更自由地生活。',
    },
    'perdulro': {
      'en':
          'Discover a world designed by AI — where we find \nyour perfect flights, stays, and adventures before anyone else.',
      'ar':
          'اكتشف عالماً صممه الذكاء الاصطناعي — حيث نجد لك رحلاتك وإقاماتك ومغامراتك المثالية قبل أي شخص آخر.',
      'es':
          'Descubre un mundo diseñado por IA, donde encontramos tus vuelos, estancias y aventuras perfectas antes que nadie.',
      'fr':
          'Découvrez un monde conçu par l\'IA — où nous trouvons\n\nvos vols, séjours et aventures parfaits avant tout le monde.',
      'zh_Hans': '探索人工智能设计的世界——我们抢先一步为您找到最完美的航班、住宿和探险之旅。',
    },
    'mubdrido': {
      'en': 'Like ChatGPT.\nBut for your Travel needs.',
      'ar': 'مثل ChatGPT.\nلكن لتلبية احتياجاتك أثناء السفر.',
      'es': 'Como ChatGPT.\n\nPero para tus necesidades de viaje.',
      'fr': 'Comme ChatGPT.\n\nMais pour vos besoins de voyage.',
      'zh_Hans': '类似 ChatGPT。\n\n但满足您的旅行需求。',
    },
    'nfz7y15n': {
      'en': 'Hi, I\'m Kitravia. I will be your AI travel agent.',
      'ar': 'مرحباً، أنا كيترافيا. سأكون وكيل سفرك الآلي.',
      'es':
          'Hola, soy Kitravia. Seré tu agente de viajes con inteligencia artificial.',
      'fr':
          'Bonjour, je suis Kitravia. Je serai votre agent de voyages tout compris.',
      'zh_Hans': '您好，我是Kitravia，我将是您的AI旅行顾问。',
    },
    '2nv8skr1': {
      'en':
          '\nNot sure where to start? Tell me where you want to go? What\'s your budget? Is there something specific you\'d like to do? Do you need a rental car? We’ll guide you through the booking process!',
      'ar':
          'لست متأكدًا من أين تبدأ؟ أخبرنا أين تريد الذهاب؟ ما هي ميزانيتك؟ هل هناك شيء محدد ترغب في القيام به؟ هل تحتاج إلى استئجار سيارة؟ سنرشدك خلال عملية الحجز!',
      'es':
          '¿No sabes por dónde empezar? ¿Adónde quieres ir? ¿Cuál es tu presupuesto? ¿Hay algo en particular que te gustaría hacer? ¿Necesitas alquilar un coche? ¡Te guiaremos durante todo el proceso de reserva!',
      'fr':
          'Vous ne savez pas par où commencer ? Dites-nous où vous souhaitez aller ! Quel est votre budget ? Avez-vous des envies particulières ? Avez-vous besoin d’une voiture de location ? Nous vous accompagnerons tout au long de la réservation !',
      'zh_Hans': '不知道从哪里开始？告诉我你想去哪里？你的预算是多少？有什么特别想体验的活动吗？需要租车吗？我们会指导你完成预订流程！',
    },
    'gjj2ofrx': {
      'en':
          'Discover smarter travel with Kitravia \nand experiences tailored to you, in seconds. \n',
      'ar': 'اكتشف السفر الذكي مع كيترافيا\nوتجارب مصممة خصيصاً لك، في ثوانٍ.',
      'es':
          'Descubre viajes más inteligentes con Kitravia y experiencias personalizadas en cuestión de segundos.',
      'fr':
          'Découvrez des voyages plus intelligents avec Kitravia\n\net des expériences personnalisées en quelques secondes.',
      'zh_Hans': '使用 Kitravia 探索更智能的旅行方式，并在几秒钟内获得为您量身定制的旅行体验。',
    },
    'ecevuewj': {
      'en': '🌍 Global Flights & Hotels,\n Perfectly Personalized for You',
      'ar': '🌍 رحلات طيران وفنادق عالمية،\n\nمصممة خصيصاً لك',
      'es':
          '🌍 Vuelos y hoteles internacionales,\n\nPerfectamente personalizados para ti',
      'fr':
          '🌍 Vols et hôtels internationaux,\n\nParfaitement personnalisés pour vous',
      'zh_Hans': '🌍 全球航班和酒店，\n\n为您量身定制',
    },
    'dfpovdpg': {
      'en':
          'Experience seamless travel with Kitravia’s AI Travel Agent, curating destinations, stays, and adventures that match your unique style.',
      'ar':
          'استمتع بتجربة سفر سلسة مع وكيل السفر المدعوم بالذكاء الاصطناعي من Kitravia، والذي يقوم بتنسيق الوجهات والإقامات والمغامرات التي تتناسب مع أسلوبك الفريد.',
      'es':
          'Disfruta de viajes sin complicaciones con el agente de viajes con IA de Kitravia, que selecciona destinos, alojamientos y aventuras que se adaptan a tu estilo único.',
      'fr':
          'Vivez une expérience de voyage sans faille grâce à l\'agent de voyage IA de Kitravia, qui sélectionne des destinations, des séjours et des aventures correspondant à votre style unique.',
      'zh_Hans': 'Kitravia 的 AI 旅行助手可为您量身定制符合您独特风格的目的地、住宿和探险活动，让您享受无缝旅行体验。',
    },
    'p5n4zsj6': {
      'en': '✈️ Flights from 500+ Airlines — Found in Seconds',
      'ar': '✈️ رحلات طيران من أكثر من 500 شركة طيران — تجدها في ثوانٍ',
      'es': '✈️ Vuelos de más de 500 aerolíneas: ¡encuéntralos en segundos!',
      'fr':
          '✈️ Vols de plus de 500 compagnies aériennes — Trouvez-les en quelques secondes',
      'zh_Hans': '✈️ 查询来自 500 多家航空公司的航班——秒速找到',
    },
    'fs9vvbei': {
      'en':
          'Our AI Travel Agent scans hundreds of airlines instantly to bring you the best fares, from the most affordable to the fastest routes — all tailored to your travel style.',
      'ar':
          'يقوم وكيل السفر المدعوم بالذكاء الاصطناعي لدينا بمسح مئات شركات الطيران على الفور ليقدم لك أفضل الأسعار، بدءًا من الأقل تكلفة وحتى أسرع الطرق - وكلها مصممة خصيصًا لأسلوب سفرك.',
      'es':
          'Nuestro agente de viajes con inteligencia artificial analiza al instante cientos de aerolíneas para ofrecerte las mejores tarifas, desde las rutas más económicas hasta las más rápidas, todo ello adaptado a tu estilo de viaje.',
      'fr':
          'Notre agent de voyages IA analyse instantanément des centaines de compagnies aériennes pour vous proposer les meilleurs tarifs, des itinéraires les plus abordables aux plus rapides, le tout adapté à votre style de voyage.',
      'zh_Hans':
          '我们的AI旅行代理可立即扫描数百家航空公司，为您提供最优惠的价格，从最经济实惠的航线到最快捷的路线——所有这一切都根据您的旅行方式量身定制。',
    },
    'm0xvfrkv': {
      'en': '🏨 Stay at 1,000+ Hotels Worldwide',
      'ar': '🏨 أقم في أكثر من 1000 فندق حول العالم',
      'es': '🏨 Hospédese en más de 1000 hoteles en todo el mundo.',
      'fr': '🏨 Séjournez dans plus de 1 000 hôtels à travers le monde',
      'zh_Hans': '🏨 入住全球 1000 多家酒店',
    },
    '9vj4cftx': {
      'en':
          'Discover a curated selection of luxury, boutique, and budget-friendly stays.\nOur partners with trusted hotels across the globe to offer the perfect stay — for every traveler and every budget.',
      'ar':
          'اكتشف مجموعة مختارة بعناية من أماكن الإقامة الفاخرة، والبوتيكية، والاقتصادية.\nنتعاون مع فنادق موثوقة حول العالم لنقدم لك الإقامة المثالية التي تناسب جميع المسافرين وميزانياتهم.',
      'es':
          'Descubre una cuidada selección de alojamientos de lujo, boutique y económicos.\n\nColaboramos con hoteles de confianza en todo el mundo para ofrecerte la estancia perfecta, para cada viajero y cada presupuesto.',
      'fr':
          'Découvrez une sélection d\'hébergements de luxe, de charme et à prix abordables.\n\nNos partenaires hôteliers de confiance à travers le monde vous proposent le séjour idéal, quel que soit votre budget ou vos envies.',
      'zh_Hans':
          '探索我们精心挑选的豪华、精品和经济型酒店。\n\n我们与全球各地值得信赖的酒店合作，为每位旅行者和每种预算提供完美的住宿体验。',
    },
    'rodj4cue': {
      'en': '🚗 Car Rentals Made Effortless',
      'ar': '🚗 تأجير السيارات أصبح سهلاً',
      'es': '🚗 Alquiler de coches sin complicaciones',
      'fr': '🚗 Location de voitures simplifiée',
      'zh_Hans': '🚗 轻松租车',
    },
    'l233p5rr': {
      'en':
          'From city rides to countryside escapes, our smart system compares top car rental providers to ensure the best prices, flexible options, and smooth journeys.',
      'ar':
          'من الرحلات داخل المدينة إلى الرحلات الريفية، يقوم نظامنا الذكي بمقارنة أفضل شركات تأجير السيارات لضمان أفضل الأسعار والخيارات المرنة والرحلات السلسة.',
      'es':
          'Desde trayectos por la ciudad hasta escapadas al campo, nuestro sistema inteligente compara a los principales proveedores de alquiler de coches para garantizar los mejores precios, opciones flexibles y viajes sin contratiempos.',
      'fr':
          'Des trajets en ville aux escapades à la campagne, notre système intelligent compare les meilleurs loueurs de voitures pour vous garantir les meilleurs prix, des options flexibles et des voyages sans encombre.',
      'zh_Hans': '从城市出行到乡村度假，我们的智能系统会比较各大租车供应商，以确保最优惠的价格、灵活的选择和顺畅的旅程。',
    },
    'lclo0zfn': {
      'en': '🛳️ Cruises & Voyages Beyond Imagination',
      'ar': '🛳️ رحلات بحرية ورحلات تتجاوز الخيال',
      'es': '🛳️ Cruceros y viajes que superan la imaginación',
      'fr': '🛳️ Croisières et voyages au-delà de l\'imagination',
      'zh_Hans': '🛳️ 超越想象的邮轮与航行',
    },
    'lm2yhz60': {
      'en':
          'Set sail with exclusive cruise deals and AI-personalized itineraries across oceans, rivers, and islands — turning your next voyage into an unforgettable experience.',
      'ar':
          'انطلق في رحلة بحرية مع عروض حصرية وخطط رحلات مخصصة بالذكاء الاصطناعي عبر المحيطات والأنهار والجزر - لتحويل رحلتك القادمة إلى تجربة لا تُنسى.',
      'es':
          'Zarpa con ofertas exclusivas de cruceros e itinerarios personalizados mediante inteligencia artificial a través de océanos, ríos e islas, convirtiendo tu próximo viaje en una experiencia inolvidable.',
      'fr':
          'Larguez les amarres grâce à des offres de croisières exclusives et des itinéraires personnalisés par l\'IA à travers les océans, les fleuves et les îles — transformant votre prochain voyage en une expérience inoubliable.',
      'zh_Hans': '扬帆起航，享受专属邮轮优惠和人工智能个性化行程，畅游海洋、河流和岛屿——让您的下一次航行成为一段难忘的体验。',
    },
    'sppqab9f': {
      'en':
          '🛳️ Cruises & Voyages Beyond Imagination\nSet sail with exclusive cruise deals and AI-personalized itineraries across oceans, rivers, and islands — turning your next voyage into an unforgettable experience.',
      'ar':
          '🛳️ رحلات بحرية تتجاوز الخيال\nانطلق في رحلة بحرية مع عروض حصرية وخطط رحلات مصممة خصيصاً لك بواسطة الذكاء الاصطناعي عبر المحيطات والأنهار والجزر - لتحويل رحلتك القادمة إلى تجربة لا تُنسى.',
      'es':
          '🛳️ Cruceros y viajes que superan la imaginación\nZarpa con ofertas exclusivas de cruceros e itinerarios personalizados con IA a través de océanos, ríos e islas, convirtiendo tu próximo viaje en una experiencia inolvidable.',
      'fr':
          '🛳️ Croisières et voyages au-delà de l\'imagination\n\nLarguez les amarres grâce à des offres de croisières exclusives et des itinéraires personnalisés par l\'IA à travers les océans, les fleuves et les îles — transformant votre prochain voyage en une expérience inoubliable.',
      'zh_Hans':
          '🛳️ 超越想象的邮轮之旅\n\n扬帆起航，享受专属邮轮优惠和人工智能个性化行程，畅游海洋、河流和岛屿——让您的下一次航行成为一段难忘的体验。',
    },
    'cwzkypz3': {
      'en': 'Our Partners',
      'ar': 'شركاؤنا',
      'es': 'Nuestros socios',
      'fr': 'Nos partenaires',
      'zh_Hans': '我们的合作伙伴',
    },
    '2k84f6c7': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // LandingPage2
  {
    'tw7nzir4': {
      'en': 'AI Travel & Booking Platform',
      'ar': 'منصة سفر وحجز تعتمد على الذكاء الاصطناعي',
      'es': 'Plataforma de viajes y reservas con IA',
      'fr': 'Plateforme de voyage et de réservation basée sur l\'IA',
      'zh_Hans': 'AI旅行与预订平台',
    },
    '4n5qf60n': {
      'en': '|     Travel Smarter. Live Freer.     ',
      'ar': 'سافر بذكاء. عش بحرية أكبر.',
      'es': 'Viaja de forma más inteligente. Vive con más libertad.',
      'fr': 'Voyagez plus intelligemment. Vivez plus librement.',
      'zh_Hans': '更智能地旅行，更自由地生活。',
    },
    'lyvied9m': {
      'en':
          'Discover a world designed by AI — where we find \nyour perfect flights, stays, and adventures before anyone else.',
      'ar':
          'اكتشف عالماً صممه الذكاء الاصطناعي — حيث نجد لك رحلاتك وإقاماتك ومغامراتك المثالية قبل أي شخص آخر.',
      'es':
          'Descubre un mundo diseñado por IA, donde encontramos tus vuelos, estancias y aventuras perfectas antes que nadie.',
      'fr':
          'Découvrez un monde conçu par l\'IA — où nous trouvons\n\nvos vols, séjours et aventures parfaits avant tout le monde.',
      'zh_Hans': '探索人工智能设计的世界——我们抢先一步为您找到最完美的航班、住宿和探险之旅。',
    },
    '4phy48gn': {
      'en': 'Like ChatGPT.\nBut for your Travel needs.',
      'ar': 'مثل ChatGPT.\nلكن لتلبية احتياجاتك أثناء السفر.',
      'es': 'Como ChatGPT.\n\nPero para tus necesidades de viaje.',
      'fr': 'Comme ChatGPT.\n\nMais pour vos besoins de voyage.',
      'zh_Hans': '类似 ChatGPT。\n\n但满足您的旅行需求。',
    },
    'ooll6byb': {
      'en': 'Hi, I\'m Kitravia. I will be your AI travel agent.',
      'ar': 'مرحباً، أنا كيترافيا. سأكون وكيل سفرك الآلي.',
      'es':
          'Hola, soy Kitravia. Seré tu agente de viajes con inteligencia artificial.',
      'fr':
          'Bonjour, je suis Kitravia. Je serai votre agent de voyages tout compris.',
      'zh_Hans': '您好，我是Kitravia，我将是您的AI旅行顾问。',
    },
    '01lgw40q': {
      'en':
          '\nNot sure where to start? Tell me where you want to go? What\'s your budget? Is there something \nspecific you\'d like to do? Do you need a rental car? We’ll guide you through the booking process!',
      'ar':
          'لست متأكدًا من أين تبدأ؟ أخبرنا أين تريد الذهاب؟ ما هي ميزانيتك؟ هل هناك شيء محدد ترغب في القيام به؟ هل تحتاج إلى استئجار سيارة؟ سنرشدك خلال عملية الحجز!',
      'es':
          '¿No sabes por dónde empezar? Cuéntanos adónde quieres ir. ¿Cuál es tu presupuesto? ¿Hay algo en particular que te gustaría hacer? ¿Necesitas alquilar un coche? ¡Te ayudaremos con el proceso de reserva!',
      'fr':
          'Vous ne savez pas par où commencer ? Dites-nous où vous souhaitez aller. Quel est votre budget ? Avez-vous une activité particulière en tête ? Avez-vous besoin d’une voiture de location ? Nous vous accompagnerons tout au long de la réservation !',
      'zh_Hans': '不知道从哪里开始？告诉我你想去哪里？你的预算是多少？有什么特别想体验的活动吗？需要租车吗？我们会指导你完成预订流程！',
    },
    'ls2drr9n': {
      'en': 'Flight Booking',
      'ar': 'حجز الرحلات',
      'es': 'Reserva de vuelos',
      'fr': 'Réservation de vols',
      'zh_Hans': '航班预订',
    },
    '670y1izf': {
      'en': 'Hotel',
      'ar': 'الفندق',
      'es': 'Hotel',
      'fr': 'Hôtel',
      'zh_Hans': '酒店',
    },
    '3hv3tyer': {
      'en': 'Cruise',
      'ar': 'رحلة بحرية',
      'es': 'Crucero',
      'fr': 'Croisière',
      'zh_Hans': '巡航',
    },
    'avffviip': {
      'en': 'Car Rental',
      'ar': 'تأجير سيارات',
      'es': 'Alquiler de coches',
      'fr': 'Location de voitures',
      'zh_Hans': '租车',
    },
    'o6qpetaa': {
      'en': 'Things to Do',
      'ar': 'أشياء للقيام بها',
      'es': 'Cosas que hacer',
      'fr': 'Choses à faire',
      'zh_Hans': '可以做的事情',
    },
    'yfjhh204': {
      'en': 'Places to Go',
      'ar': 'أماكن للزيارة',
      'es': 'Lugares para visitar',
      'fr': 'Lieux à visiter',
      'zh_Hans': '去哪儿',
    },
    '564lniuz': {
      'en': 'Holiday Packages',
      'ar': 'باقات العطلات',
      'es': 'Paquetes vacacionales',
      'fr': 'Forfaits vacances',
      'zh_Hans': '假日套餐',
    },
    'f5wvftbz': {
      'en': 'Vacation',
      'ar': 'أجازة',
      'es': 'Vacaciones',
      'fr': 'Vacances',
      'zh_Hans': '假期',
    },
    'esm5sgbz': {
      'en': 'Hotel Deals',
      'ar': 'عروض الفنادق',
      'es': 'Ofertas de hotel',
      'fr': 'Offres d\'hôtels',
      'zh_Hans': '酒店优惠',
    },
    'rb3pobdg': {
      'en':
          'Discover smarter travel with Kitravia \nand experiences tailored to you, in seconds. \n',
      'ar': 'اكتشف السفر الذكي مع كيترافيا\nوتجارب مصممة خصيصاً لك، في ثوانٍ.',
      'es':
          'Descubre viajes más inteligentes con Kitravia y experiencias personalizadas en cuestión de segundos.',
      'fr':
          'Découvrez des voyages plus intelligents avec Kitravia\n\net des expériences personnalisées en quelques secondes.',
      'zh_Hans': '使用 Kitravia 探索更智能的旅行方式，并在几秒钟内获得为您量身定制的旅行体验。',
    },
    'nehrqda9': {
      'en': '🌍 Global Flights & Hotels,\n Perfectly Personalized for You',
      'ar': '🌍 رحلات طيران وفنادق عالمية،\n\nمصممة خصيصاً لك',
      'es':
          '🌍 Vuelos y hoteles internacionales,\n\nPerfectamente personalizados para ti',
      'fr':
          '🌍 Vols et hôtels internationaux,\n\nParfaitement personnalisés pour vous',
      'zh_Hans': '🌍 全球航班和酒店，\n\n为您量身定制',
    },
    '23g5r1x0': {
      'en':
          'Experience seamless travel with Kitravia’s AI Travel Agent, curating destinations, stays, and adventures that match your unique style.',
      'ar':
          'استمتع بتجربة سفر سلسة مع وكيل السفر المدعوم بالذكاء الاصطناعي من Kitravia، والذي يقوم بتنسيق الوجهات والإقامات والمغامرات التي تتناسب مع أسلوبك الفريد.',
      'es':
          'Disfruta de viajes sin complicaciones con el agente de viajes con IA de Kitravia, que selecciona destinos, alojamientos y aventuras que se adaptan a tu estilo único.',
      'fr':
          'Vivez une expérience de voyage sans faille grâce à l\'agent de voyage IA de Kitravia, qui sélectionne des destinations, des séjours et des aventures correspondant à votre style unique.',
      'zh_Hans': 'Kitravia 的 AI 旅行助手可为您量身定制符合您独特风格的目的地、住宿和探险活动，让您享受无缝旅行体验。',
    },
    'cpeps7gs': {
      'en': '✈️ Flights from 500+ Airlines — Found in Seconds',
      'ar': '✈️ رحلات طيران من أكثر من 500 شركة طيران — تجدها في ثوانٍ',
      'es': '✈️ Vuelos de más de 500 aerolíneas: ¡encuéntralos en segundos!',
      'fr':
          '✈️ Vols de plus de 500 compagnies aériennes — Trouvez-les en quelques secondes',
      'zh_Hans': '✈️ 查询来自 500 多家航空公司的航班——秒速找到',
    },
    '6mmoadbp': {
      'en':
          'Our AI Travel Agent scans hundreds of airlines instantly to bring you the best fares, from the most affordable to the fastest routes — all tailored to your travel style.',
      'ar':
          'يقوم وكيل السفر المدعوم بالذكاء الاصطناعي لدينا بمسح مئات شركات الطيران على الفور ليقدم لك أفضل الأسعار، بدءًا من الأقل تكلفة وحتى أسرع الطرق - وكلها مصممة خصيصًا لأسلوب سفرك.',
      'es':
          'Nuestro agente de viajes con inteligencia artificial analiza al instante cientos de aerolíneas para ofrecerte las mejores tarifas, desde las rutas más económicas hasta las más rápidas, todo ello adaptado a tu estilo de viaje.',
      'fr':
          'Notre agent de voyages IA analyse instantanément des centaines de compagnies aériennes pour vous proposer les meilleurs tarifs, des itinéraires les plus abordables aux plus rapides, le tout adapté à votre style de voyage.',
      'zh_Hans':
          '我们的AI旅行代理可立即扫描数百家航空公司，为您提供最优惠的价格，从最经济实惠的航线到最快捷的路线——所有这一切都根据您的旅行方式量身定制。',
    },
    'c3gbo6hc': {
      'en': '🏨 Stay at 1,000+ Hotels Worldwide',
      'ar': '🏨 أقم في أكثر من 1000 فندق حول العالم',
      'es': '🏨 Hospédese en más de 1000 hoteles en todo el mundo.',
      'fr': '🏨 Séjournez dans plus de 1 000 hôtels à travers le monde',
      'zh_Hans': '🏨 入住全球 1000 多家酒店',
    },
    'yhf7dlqm': {
      'en':
          'Discover a curated selection of luxury, boutique, and budget-friendly stays.\nOur partners with trusted hotels across the globe to offer the perfect stay — for every traveler and every budget.',
      'ar':
          'اكتشف مجموعة مختارة بعناية من أماكن الإقامة الفاخرة، والبوتيكية، والاقتصادية.\nنتعاون مع فنادق موثوقة حول العالم لنقدم لك الإقامة المثالية التي تناسب جميع المسافرين وميزانياتهم.',
      'es':
          'Descubre una cuidada selección de alojamientos de lujo, boutique y económicos.\n\nColaboramos con hoteles de confianza en todo el mundo para ofrecerte la estancia perfecta, para cada viajero y cada presupuesto.',
      'fr':
          'Découvrez une sélection d\'hébergements de luxe, de charme et à prix abordables.\n\nNos partenaires hôteliers de confiance à travers le monde vous proposent le séjour idéal, quel que soit votre budget ou vos envies.',
      'zh_Hans':
          '探索我们精心挑选的豪华、精品和经济型酒店。\n\n我们与全球各地值得信赖的酒店合作，为每位旅行者和每种预算提供完美的住宿体验。',
    },
    'hhakqhgy': {
      'en': '🚗 Car Rentals Made Effortless',
      'ar': '🚗 تأجير السيارات أصبح سهلاً',
      'es': '🚗 Alquiler de coches sin complicaciones',
      'fr': '🚗 Location de voitures simplifiée',
      'zh_Hans': '🚗 轻松租车',
    },
    'll03mxp4': {
      'en':
          'From city rides to countryside escapes, our smart system compares top car rental providers to ensure the best prices, flexible options, and smooth journeys.',
      'ar':
          'من الرحلات داخل المدينة إلى الرحلات الريفية، يقوم نظامنا الذكي بمقارنة أفضل شركات تأجير السيارات لضمان أفضل الأسعار والخيارات المرنة والرحلات السلسة.',
      'es':
          'Desde trayectos por la ciudad hasta escapadas al campo, nuestro sistema inteligente compara a los principales proveedores de alquiler de coches para garantizar los mejores precios, opciones flexibles y viajes sin contratiempos.',
      'fr':
          'Des trajets en ville aux escapades à la campagne, notre système intelligent compare les meilleurs loueurs de voitures pour vous garantir les meilleurs prix, des options flexibles et des voyages sans encombre.',
      'zh_Hans': '从城市出行到乡村度假，我们的智能系统会比较各大租车供应商，以确保最优惠的价格、灵活的选择和顺畅的旅程。',
    },
    'g5f11rrw': {
      'en': '🛳️ Cruises & Voyages Beyond Imagination',
      'ar': '🛳️ رحلات بحرية ورحلات تتجاوز الخيال',
      'es': '🛳️ Cruceros y viajes que superan la imaginación',
      'fr': '🛳️ Croisières et voyages au-delà de l\'imagination',
      'zh_Hans': '🛳️ 超越想象的邮轮与航行',
    },
    'qxzv4w8z': {
      'en':
          'Set sail with exclusive cruise deals and AI-personalized itineraries across oceans, rivers, and islands — turning your next voyage into an unforgettable experience.',
      'ar':
          'انطلق في رحلة بحرية مع عروض حصرية وخطط رحلات مخصصة بالذكاء الاصطناعي عبر المحيطات والأنهار والجزر - لتحويل رحلتك القادمة إلى تجربة لا تُنسى.',
      'es':
          'Zarpa con ofertas exclusivas de cruceros e itinerarios personalizados mediante inteligencia artificial a través de océanos, ríos e islas, convirtiendo tu próximo viaje en una experiencia inolvidable.',
      'fr':
          'Larguez les amarres grâce à des offres de croisières exclusives et des itinéraires personnalisés par l\'IA à travers les océans, les fleuves et les îles — transformant votre prochain voyage en une expérience inoubliable.',
      'zh_Hans': '扬帆起航，享受专属邮轮优惠和人工智能个性化行程，畅游海洋、河流和岛屿——让您的下一次航行成为一段难忘的体验。',
    },
    'negpp8yp': {
      'en':
          '🛳️ Cruises & Voyages Beyond Imagination\nSet sail with exclusive cruise deals and AI-personalized itineraries across oceans, rivers, and islands — turning your next voyage into an unforgettable experience.',
      'ar':
          '🛳️ رحلات بحرية تتجاوز الخيال\nانطلق في رحلة بحرية مع عروض حصرية وخطط رحلات مصممة خصيصاً لك بواسطة الذكاء الاصطناعي عبر المحيطات والأنهار والجزر - لتحويل رحلتك القادمة إلى تجربة لا تُنسى.',
      'es':
          '🛳️ Cruceros y viajes que superan la imaginación\nZarpa con ofertas exclusivas de cruceros e itinerarios personalizados con IA a través de océanos, ríos e islas, convirtiendo tu próximo viaje en una experiencia inolvidable.',
      'fr':
          '🛳️ Croisières et voyages au-delà de l\'imagination\n\nLarguez les amarres grâce à des offres de croisières exclusives et des itinéraires personnalisés par l\'IA à travers les océans, les fleuves et les îles — transformant votre prochain voyage en une expérience inoubliable.',
      'zh_Hans':
          '🛳️ 超越想象的邮轮之旅\n\n扬帆起航，享受专属邮轮优惠和人工智能个性化行程，畅游海洋、河流和岛屿——让您的下一次航行成为一段难忘的体验。',
    },
    'pclsso6h': {
      'en': 'Our Partners',
      'ar': 'شركاؤنا',
      'es': 'Nuestros socios',
      'fr': 'Nos partenaires',
      'zh_Hans': '我们的合作伙伴',
    },
    'd3xjgs6x': {
      'en': 'Like ChatGPT.\nBut for your Travel needs.',
      'ar': 'مثل ChatGPT.\nلكن لتلبية احتياجاتك أثناء السفر.',
      'es': 'Como ChatGPT.\n\nPero para tus necesidades de viaje.',
      'fr': 'Comme ChatGPT.\n\nMais pour vos besoins de voyage.',
      'zh_Hans': '类似 ChatGPT。\n\n但满足您的旅行需求。',
    },
    'etjzrmyu': {
      'en': 'Hi, I\'m Kitravia. I will be your AI travel agent.',
      'ar': 'مرحباً، أنا كيترافيا. سأكون وكيل سفرك الآلي.',
      'es':
          'Hola, soy Kitravia. Seré tu agente de viajes con inteligencia artificial.',
      'fr':
          'Bonjour, je suis Kitravia. Je serai votre agent de voyages tout compris.',
      'zh_Hans': '您好，我是Kitravia，我将是您的AI旅行顾问。',
    },
    'ty8u2755': {
      'en': 'Flight Booking',
      'ar': 'حجز الرحلات',
      'es': 'Reserva de vuelos',
      'fr': 'Réservation de vols',
      'zh_Hans': '航班预订',
    },
    '8sy88a53': {
      'en': 'Hotel',
      'ar': 'الفندق',
      'es': 'Hotel',
      'fr': 'Hôtel',
      'zh_Hans': '酒店',
    },
    'lz4ggi5l': {
      'en': 'Cruise',
      'ar': 'رحلة بحرية',
      'es': 'Crucero',
      'fr': 'Croisière',
      'zh_Hans': '巡航',
    },
    'dhcwgpmn': {
      'en': 'Car Rental',
      'ar': 'تأجير سيارات',
      'es': 'Alquiler de coches',
      'fr': 'Location de voitures',
      'zh_Hans': '租车',
    },
    'uevs51ws': {
      'en': 'Things to Do',
      'ar': 'أشياء للقيام بها',
      'es': 'Cosas que hacer',
      'fr': 'Choses à faire',
      'zh_Hans': '可以做的事情',
    },
    '5vprqr96': {
      'en': 'Places to Go',
      'ar': 'أماكن للزيارة',
      'es': 'Lugares para visitar',
      'fr': 'Lieux à visiter',
      'zh_Hans': '去哪儿',
    },
    'oc85y1s0': {
      'en': 'Holiday Packages',
      'ar': 'باقات العطلات',
      'es': 'Paquetes vacacionales',
      'fr': 'Forfaits vacances',
      'zh_Hans': '假日套餐',
    },
    'wzsgo2bf': {
      'en': 'Vacation',
      'ar': 'أجازة',
      'es': 'Vacaciones',
      'fr': 'Vacances',
      'zh_Hans': '假期',
    },
    'wjli5f3s': {
      'en': 'Hotel Deals',
      'ar': 'عروض الفنادق',
      'es': 'Ofertas de hotel',
      'fr': 'Offres d\'hôtels',
      'zh_Hans': '酒店优惠',
    },
    'nauyi2jv': {
      'en': '🌍 Global Flights & Hotels,\n Perfectly Personalized for You',
      'ar': '🌍 رحلات طيران وفنادق عالمية،\n\nمصممة خصيصاً لك',
      'es':
          '🌍 Vuelos y hoteles internacionales,\n\nPerfectamente personalizados para ti',
      'fr':
          '🌍 Vols et hôtels internationaux,\n\nParfaitement personnalisés pour vous',
      'zh_Hans': '🌍 全球航班和酒店，\n\n为您量身定制',
    },
    'ey4325h1': {
      'en':
          'Experience seamless travel with Kitravia’s AI Travel Agent, curating destinations, stays, and adventures that match your unique style.',
      'ar':
          'استمتع بتجربة سفر سلسة مع وكيل السفر المدعوم بالذكاء الاصطناعي من Kitravia، والذي يقوم بتنسيق الوجهات والإقامات والمغامرات التي تتناسب مع أسلوبك الفريد.',
      'es':
          'Disfruta de viajes sin complicaciones con el agente de viajes con IA de Kitravia, que selecciona destinos, alojamientos y aventuras que se adaptan a tu estilo único.',
      'fr':
          'Vivez une expérience de voyage sans faille grâce à l\'agent de voyage IA de Kitravia, qui sélectionne des destinations, des séjours et des aventures correspondant à votre style unique.',
      'zh_Hans': 'Kitravia 的 AI 旅行助手可为您量身定制符合您独特风格的目的地、住宿和探险活动，让您享受无缝旅行体验。',
    },
    '5yt7s3y1': {
      'en': '✈️ Flights from 500+ Airlines — Found in Seconds',
      'ar': '✈️ رحلات طيران من أكثر من 500 شركة طيران — تجدها في ثوانٍ',
      'es': '✈️ Vuelos de más de 500 aerolíneas: ¡encuéntralos en segundos!',
      'fr':
          '✈️ Vols de plus de 500 compagnies aériennes — Trouvez-les en quelques secondes',
      'zh_Hans': '✈️ 查询来自 500 多家航空公司的航班——秒速找到',
    },
    'mstepgo2': {
      'en':
          'Our AI Travel Agent scans hundreds of airlines instantly to bring you the best fares, from the most affordable to the fastest routes — all tailored to your travel style.',
      'ar':
          'يقوم وكيل السفر المدعوم بالذكاء الاصطناعي لدينا بمسح مئات شركات الطيران على الفور ليقدم لك أفضل الأسعار، بدءًا من الأقل تكلفة وحتى أسرع الطرق - وكلها مصممة خصيصًا لأسلوب سفرك.',
      'es':
          'Nuestro agente de viajes con inteligencia artificial analiza al instante cientos de aerolíneas para ofrecerte las mejores tarifas, desde las rutas más económicas hasta las más rápidas, todo ello adaptado a tu estilo de viaje.',
      'fr':
          'Notre agent de voyages IA analyse instantanément des centaines de compagnies aériennes pour vous proposer les meilleurs tarifs, des itinéraires les plus abordables aux plus rapides, le tout adapté à votre style de voyage.',
      'zh_Hans':
          '我们的AI旅行代理可立即扫描数百家航空公司，为您提供最优惠的价格，从最经济实惠的航线到最快捷的路线——所有这一切都根据您的旅行方式量身定制。',
    },
    '9sobrfwq': {
      'en': '🏨 Stay at 1,000+ Hotels Worldwide',
      'ar': '🏨 أقم في أكثر من 1000 فندق حول العالم',
      'es': '🏨 Hospédese en más de 1000 hoteles en todo el mundo.',
      'fr': '🏨 Séjournez dans plus de 1 000 hôtels à travers le monde',
      'zh_Hans': '🏨 入住全球 1000 多家酒店',
    },
    'dj17ubb8': {
      'en':
          'Discover a curated selection of luxury, boutique, and budget-friendly stays.\nOur partners with trusted hotels across the globe to offer the perfect stay — for every traveler and every budget.',
      'ar':
          'اكتشف مجموعة مختارة بعناية من أماكن الإقامة الفاخرة، والبوتيكية، والاقتصادية.\nنتعاون مع فنادق موثوقة حول العالم لنقدم لك الإقامة المثالية التي تناسب جميع المسافرين وميزانياتهم.',
      'es':
          'Descubre una cuidada selección de alojamientos de lujo, boutique y económicos.\n\nColaboramos con hoteles de confianza en todo el mundo para ofrecerte la estancia perfecta, para cada viajero y cada presupuesto.',
      'fr':
          'Découvrez une sélection d\'hébergements de luxe, de charme et à prix abordables.\n\nNos partenaires hôteliers de confiance à travers le monde vous proposent le séjour idéal, quel que soit votre budget ou vos envies.',
      'zh_Hans':
          '探索我们精心挑选的豪华、精品和经济型酒店。\n\n我们与全球各地值得信赖的酒店合作，为每位旅行者和每种预算提供完美的住宿体验。',
    },
    'agybum4r': {
      'en': '🚗 Car Rentals Made Effortless',
      'ar': '🚗 تأجير السيارات أصبح سهلاً',
      'es': '🚗 Alquiler de coches sin complicaciones',
      'fr': '🚗 Location de voitures simplifiée',
      'zh_Hans': '🚗 轻松租车',
    },
    'rwdnbv6z': {
      'en':
          'From city rides to countryside escapes, our smart system compares top car rental providers to ensure the best prices, flexible options, and smooth journeys.',
      'ar':
          'من الرحلات داخل المدينة إلى الرحلات الريفية، يقوم نظامنا الذكي بمقارنة أفضل شركات تأجير السيارات لضمان أفضل الأسعار والخيارات المرنة والرحلات السلسة.',
      'es':
          'Desde trayectos por la ciudad hasta escapadas al campo, nuestro sistema inteligente compara a los principales proveedores de alquiler de coches para garantizar los mejores precios, opciones flexibles y viajes sin contratiempos.',
      'fr':
          'Des trajets en ville aux escapades à la campagne, notre système intelligent compare les meilleurs loueurs de voitures pour vous garantir les meilleurs prix, des options flexibles et des voyages sans encombre.',
      'zh_Hans': '从城市出行到乡村度假，我们的智能系统会比较各大租车供应商，以确保最优惠的价格、灵活的选择和顺畅的旅程。',
    },
    '394e757k': {
      'en': '🛳️ Cruises & Voyages Beyond Imagination',
      'ar': '🛳️ رحلات بحرية ورحلات تتجاوز الخيال',
      'es': '🛳️ Cruceros y viajes que superan la imaginación',
      'fr': '🛳️ Croisières et voyages au-delà de l\'imagination',
      'zh_Hans': '🛳️ 超越想象的邮轮与航行',
    },
    'yilri04s': {
      'en':
          'Set sail with exclusive cruise deals and AI-personalized itineraries across oceans, rivers, and islands — turning your next voyage into an unforgettable experience.',
      'ar':
          'انطلق في رحلة بحرية مع عروض حصرية وخطط رحلات مخصصة بالذكاء الاصطناعي عبر المحيطات والأنهار والجزر - لتحويل رحلتك القادمة إلى تجربة لا تُنسى.',
      'es':
          'Zarpa con ofertas exclusivas de cruceros e itinerarios personalizados mediante inteligencia artificial a través de océanos, ríos e islas, convirtiendo tu próximo viaje en una experiencia inolvidable.',
      'fr':
          'Larguez les amarres grâce à des offres de croisières exclusives et des itinéraires personnalisés par l\'IA à travers les océans, les fleuves et les îles — transformant votre prochain voyage en une expérience inoubliable.',
      'zh_Hans': '扬帆起航，享受专属邮轮优惠和人工智能个性化行程，畅游海洋、河流和岛屿——让您的下一次航行成为一段难忘的体验。',
    },
    'clnjdxae': {
      'en':
          '🛳️ Cruises & Voyages Beyond Imagination\nSet sail with exclusive cruise deals and AI-personalized itineraries across oceans, rivers, and islands — turning your next voyage into an unforgettable experience.',
      'ar':
          '🛳️ رحلات بحرية تتجاوز الخيال\nانطلق في رحلة بحرية مع عروض حصرية وخطط رحلات مصممة خصيصاً لك بواسطة الذكاء الاصطناعي عبر المحيطات والأنهار والجزر - لتحويل رحلتك القادمة إلى تجربة لا تُنسى.',
      'es':
          '🛳️ Cruceros y viajes que superan la imaginación\nZarpa con ofertas exclusivas de cruceros e itinerarios personalizados con IA a través de océanos, ríos e islas, convirtiendo tu próximo viaje en una experiencia inolvidable.',
      'fr':
          '🛳️ Croisières et voyages au-delà de l\'imagination\n\nLarguez les amarres grâce à des offres de croisières exclusives et des itinéraires personnalisés par l\'IA à travers les océans, les fleuves et les îles — transformant votre prochain voyage en une expérience inoubliable.',
      'zh_Hans':
          '🛳️ 超越想象的邮轮之旅\n\n扬帆起航，享受专属邮轮优惠和人工智能个性化行程，畅游海洋、河流和岛屿——让您的下一次航行成为一段难忘的体验。',
    },
    'gkm8efqs': {
      'en': 'Our Partners',
      'ar': 'شركاؤنا',
      'es': 'Nuestros socios',
      'fr': 'Nos partenaires',
      'zh_Hans': '我们的合作伙伴',
    },
    'cysryccl': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Sidebar
  {
    '8t48067a': {
      'en': 'New Trip',
      'ar': 'رحلة جديدة',
      'es': 'Nuevo viaje',
      'fr': 'Nouveau voyage',
      'zh_Hans': '新旅程',
    },
  },
  // BaseInputField
  {
    '7xtuyurn': {
      'en': 'Where should Kitravia take you today?',
      'ar': 'إلى أين ستأخذك كيترافيا اليوم؟',
      'es': '¿Adónde debería llevarte Kitravia hoy?',
      'fr': 'Où Kitravia devrait-elle vous emmener aujourd\'hui ?',
      'zh_Hans': '今天，Kitravia 会带您去哪里？',
    },
    'ulx9bmez': {
      'en': 'Voice Mode',
      'ar': 'وضع الصوت',
      'es': 'Modo de voz',
      'fr': 'Mode vocal',
      'zh_Hans': '语音模式',
    },
  },
  // SearchModal
  {
    'jdstywk4': {
      'en': 'Search previous trips...',
      'ar': 'ابحث عن الرحلات السابقة...',
      'es': 'Buscar viajes anteriores...',
      'fr': 'Rechercher les voyages précédents...',
      'zh_Hans': '搜索以往行程……',
    },
  },
  // WebFooter
  {
    'gy2epe5w': {
      'en': 'Company',
      'ar': 'شركة',
      'es': 'Compañía',
      'fr': 'Entreprise',
      'zh_Hans': '公司',
    },
    'mjctls2g': {
      'en': 'About',
      'ar': 'معلومات عنا',
      'es': 'Sobre nosotros',
      'fr': 'À propos de nous',
      'zh_Hans': '关于我们',
    },
    'qgmmcwwa': {
      'en': 'Our Vision & Ethics',
      'ar': 'رؤيتنا وأخلاقياتنا',
      'es': 'Nuestra visión y ética',
      'fr': 'Notre vision et notre éthique',
      'zh_Hans': '我们的愿景与道德准则',
    },
    'ws4h92wx': {
      'en': 'Team Members',
      'ar': 'أعضاء الفريق',
      'es': 'Miembros del equipo',
      'fr': 'Membres de l\'équipe',
      'zh_Hans': '团队成员',
    },
    'l1wjtypj': {
      'en': 'All in One Platform',
      'ar': 'منصة متكاملة',
      'es': 'Plataforma todo en uno',
      'fr': 'Plateforme tout-en-un',
      'zh_Hans': '一体化平台',
    },
    'j8nfxe5w': {
      'en': 'Features',
      'ar': 'سمات',
      'es': 'Características',
      'fr': 'Caractéristiques',
      'zh_Hans': '特征',
    },
    'o82ay6dd': {
      'en': 'AI Travel Guide Generator',
      'ar': 'مولد دليل السفر بالذكاء الاصطناعي',
      'es': 'Generador de guías de viaje con IA',
      'fr': 'Générateur de guides de voyage IA',
      'zh_Hans': 'AI旅行指南生成器',
    },
    '6urlslai': {
      'en': 'Trip Planner',
      'ar': 'مخطط الرحلات',
      'es': 'Planificador de viajes',
      'fr': 'Planificateur de voyage',
      'zh_Hans': '旅行计划',
    },
    'kzuhcbea': {
      'en': 'Booking for Visa',
      'ar': 'حجز تأشيرة',
      'es': 'Reserva para visa',
      'fr': 'Réservation de visa',
      'zh_Hans': '签证预约',
    },
    'okjg862w': {
      'en': 'Visa Information',
      'ar': 'معلومات التأشيرة',
      'es': 'Información sobre visados',
      'fr': 'Informations sur les visas',
      'zh_Hans': '签证信息',
    },
    'iw00wjdn': {
      'en': 'Expert Hub',
      'ar': 'مركز الخبراء',
      'es': 'Centro de expertos',
      'fr': 'Centre d\'experts',
      'zh_Hans': '专家中心',
    },
    '3iq7vxxz': {
      'en': 'eBook Generator',
      'ar': 'مولد الكتب الإلكترونية',
      'es': 'Generador de libros electrónicos',
      'fr': 'Générateur de livres électroniques',
      'zh_Hans': '电子书生成器',
    },
    'uvkmzobg': {
      'en': 'Flights, Hotels & Cars',
      'ar': 'رحلات الطيران والفنادق والسيارات',
      'es': 'Vuelos, hoteles y coches',
      'fr': 'Vols, hôtels et voitures',
      'zh_Hans': '机票、酒店和租车',
    },
    'wz0x8z2p': {
      'en': 'All Packages',
      'ar': 'جميع الباقات',
      'es': 'Todos los paquetes',
      'fr': 'Tous les forfaits',
      'zh_Hans': '所有套餐',
    },
    '15kw5ozt': {
      'en': 'Cruise Booking',
      'ar': 'حجز رحلة بحرية',
      'es': 'Reserva de cruceros',
      'fr': 'Réservation de croisière',
      'zh_Hans': '邮轮预订',
    },
    'l0fln6w2': {
      'en': 'Resources',
      'ar': 'موارد',
      'es': 'Recursos',
      'fr': 'Ressources',
      'zh_Hans': '资源',
    },
    'qnzx6302': {
      'en': 'Pricing Plan',
      'ar': 'خطة التسعير',
      'es': 'Plan de precios',
      'fr': 'Plan tarifaire',
      'zh_Hans': '定价方案',
    },
    'vj4k2wps': {
      'en': 'Blog',
      'ar': 'مدونة',
      'es': 'Blog',
      'fr': 'Blog',
      'zh_Hans': '博客',
    },
    'wapu3879': {
      'en': 'Flight Cancellation & Refund Guide',
      'ar': 'دليل إلغاء الرحلات الجوية واسترداد الأموال',
      'es': 'Guía de cancelación y reembolso de vuelos',
      'fr': 'Guide d\'annulation et de remboursement des vols',
      'zh_Hans': '航班取消及退款指南',
    },
    'mbtmfb19': {
      'en': 'Kitravia Premium',
      'ar': 'كيترافيا بريميوم',
      'es': 'Kitravia Premium',
      'fr': 'Kitravia Premium',
      'zh_Hans': 'Kitravia Premium',
    },
    'fi2ti6vc': {
      'en': 'Referral Program',
      'ar': 'برنامج الإحالة',
      'es': 'Programa de recomendación',
      'fr': 'Programme de parrainage',
      'zh_Hans': '推荐计划',
    },
    '203xylq6': {
      'en': 'API & Developer Portal',
      'ar': 'واجهة برمجة التطبيقات وبوابة المطورين',
      'es': 'API y portal para desarrolladores',
      'fr': 'Portail API et développeurs',
      'zh_Hans': 'API 和开发者门户',
    },
    'r1lx4ziy': {
      'en': 'Legal',
      'ar': 'قانوني',
      'es': 'Legal',
      'fr': 'Légal',
      'zh_Hans': '合法的',
    },
    '2jei8e5c': {
      'en': 'Terms & Conditions',
      'ar': 'الشروط والأحكام',
      'es': 'Términos y condiciones',
      'fr': 'Conditions générales',
      'zh_Hans': '条款及细则',
    },
    'k3t4uisw': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
      'zh_Hans': '隐私政策',
    },
    '1q6uq8zn': {
      'en': 'Refund & Cancelllation Poliicy',
      'ar': 'سياسة الاسترداد والإلغاء',
      'es': 'Política de reembolsos y cancelaciones',
      'fr': 'Politique de remboursement et d\'annulation',
      'zh_Hans': '退款和取消政策',
    },
    'nzaamz2h': {
      'en': 'Cookie Policy',
      'ar': 'سياسة ملفات تعريف الارتباط',
      'es': 'Política de cookies',
      'fr': 'Politique relative aux cookies',
      'zh_Hans': 'Cookie政策',
    },
    'bh6s0t2t': {
      'en': 'Booking Policy',
      'ar': 'سياسة الحجز',
      'es': 'Política de reservas',
      'fr': 'Politique de réservation',
      'zh_Hans': '预订政策',
    },
    'a279evhk': {
      'en': 'Referral Program T&Cs',
      'ar': 'شروط وأحكام برنامج الإحالة',
      'es': 'Términos y condiciones del programa de referidos',
      'fr': 'Conditions générales du programme de parrainage',
      'zh_Hans': '推荐计划条款及细则',
    },
    '9atqsdql': {
      'en': 'Accesibility Statement',
      'ar': 'بيان إمكانية الوصول',
      'es': 'Declaración de accesibilidad',
      'fr': 'Déclaration d\'accessibilité',
      'zh_Hans': '无障碍声明',
    },
    'hquwgfcg': {
      'en': 'API Developer Agreement',
      'ar': 'اتفاقية مطور واجهة برمجة التطبيقات',
      'es': 'Acuerdo para desarrolladores de API',
      'fr': 'Contrat de développeur d\'API',
      'zh_Hans': 'API开发者协议',
    },
    '7o6ssocu': {
      'en': 'Support',
      'ar': 'يدعم',
      'es': 'Apoyo',
      'fr': 'Soutien',
      'zh_Hans': '支持',
    },
    'oe3zgarl': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
      'es': 'Contáctanos',
      'fr': 'Contactez-nous',
      'zh_Hans': '联系我们',
    },
    'toeogkjl': {
      'en': 'FAQs',
      'ar': 'الأسئلة الشائعة',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
      'zh_Hans': '常见问题解答',
    },
    'aa2t1oo3': {
      'en': 'Report an Issue',
      'ar': 'الإبلاغ عن مشكلة',
      'es': 'Informar de un problema',
      'fr': 'Signaler un problème',
      'zh_Hans': '报告问题',
    },
    'gf2t3abx': {
      'en': 'Explore Intelligently. Travel Freely.',
      'ar': 'استكشف بذكاء. سافر بحرية.',
      'es': 'Explora con inteligencia. Viaja con libertad.',
      'fr': 'Explorez intelligemment. Voyagez librement.',
      'zh_Hans': '智慧探索，自由旅行。',
    },
    '3kfi02aa': {
      'en':
          '© 2025 Kitravia. All rights reserved. Powered by Kimuntu Power Inc.',
      'ar': '© 2025 كيترافيا. جميع الحقوق محفوظة.',
      'es': '© 2025 Kitravia. Todos los derechos reservados.',
      'fr': '© 2025 Kitravia. Tous droits réservés.',
      'zh_Hans': '© 2025 Kitravia。版权所有。',
    },
    'w4a9klfj': {
      'en': 'Language | Currency | Dark/Light Mode Toggle',
      'ar': 'اللغة | العملة | تبديل الوضع الداكن/الفاتح',
      'es': 'Idioma | Moneda | Alternar modo oscuro/claro',
      'fr': 'Langue | Devise | Basculer entre le mode clair et sombre',
      'zh_Hans': '语言 | 货币 | 深色/浅色模式切换',
    },
  },
  // DestinationBundels
  {
    '0wngasc8': {
      'en': 'Destination Bundles',
      'ar': 'باقات الوجهات',
      'es': 'Paquetes de destino',
      'fr': 'Forfaits de destination',
      'zh_Hans': '目的地套餐',
    },
    'ekyitn17': {
      'en': 'View all',
      'ar': 'عرض الكل',
      'es': 'Ver todo',
      'fr': 'Afficher tout',
      'zh_Hans': '查看全部',
    },
    '5ub92p3h': {
      'en': 'Paris Magic',
      'ar': 'سحر باريس',
      'es': 'Magia parisina',
      'fr': 'La magie de Paris',
      'zh_Hans': '巴黎魔幻之旅',
    },
    '6i3fu56s': {
      'en': '5 days • Hotel + Flight',
      'ar': '5 أيام • فندق + طيران',
      'es': '5 días • Hotel + Vuelo',
      'fr': '5 jours • Hôtel + Vol',
      'zh_Hans': '5天 • 酒店+机票',
    },
    'yl1wgyk7': {
      'en': 'Starting from',
      'ar': 'ابتداءً من',
      'es': 'A partir de',
      'fr': 'À partir de',
      'zh_Hans': '从',
    },
    'vug09f19': {
      'en': '\$899',
      'ar': '899 دولارًا',
      'es': '\$899',
      'fr': '899 \$',
      'zh_Hans': '899美元',
    },
    'u8nv77zj': {
      'en': 'Lisbon Getaway',
      'ar': 'ملاذ لشبونة',
      'es': 'Escapada a Lisboa',
      'fr': 'Escapade à Lisbonne',
      'zh_Hans': '里斯本度假之旅',
    },
    'ms0a4szx': {
      'en': '3 days • Hotel + Flight',
      'ar': '3 أيام • فندق + طيران',
      'es': '3 días • Hotel + Vuelo',
      'fr': '3 jours • Hôtel + Vol',
      'zh_Hans': '3天 • 酒店+机票',
    },
    'ip2wwpbl': {
      'en': 'Starting from',
      'ar': 'ابتداءً من',
      'es': 'A partir de',
      'fr': 'À partir de',
      'zh_Hans': '从',
    },
    'o0m5d88e': {
      'en': '\$499',
      'ar': '499 دولارًا',
      'es': '\$499',
      'fr': '499 \$',
      'zh_Hans': '499美元',
    },
    'khwio60v': {
      'en': 'Puerto Rican Indulgence',
      'ar': 'متعة بورتوريكية',
      'es': 'Indulgencia puertorriqueña',
      'fr': 'Plaisir portoricain',
      'zh_Hans': '波多黎各式放纵',
    },
    'x6uob032': {
      'en': '5 days • Hotel + Flight',
      'ar': '5 أيام • فندق + طيران',
      'es': '5 días • Hotel + Vuelo',
      'fr': '5 jours • Hôtel + Vol',
      'zh_Hans': '5天 • 酒店+机票',
    },
    'szjd1p10': {
      'en': 'Starting from',
      'ar': 'ابتداءً من',
      'es': 'A partir de',
      'fr': 'À partir de',
      'zh_Hans': '从',
    },
    'lsdbgrr4': {
      'en': '\$899',
      'ar': '899 دولارًا',
      'es': '\$899',
      'fr': '899 \$',
      'zh_Hans': '899美元',
    },
    'jdcdabth': {
      'en': 'Tokyo Adventure',
      'ar': 'مغامرة طوكيو',
      'es': 'Aventura en Tokio',
      'fr': 'Aventure à Tokyo',
      'zh_Hans': '东京冒险',
    },
    'ymwfv92l': {
      'en': '7 days • Hotel + Flight',
      'ar': '7 أيام • فندق + طيران',
      'es': '7 días • Hotel + Vuelo',
      'fr': '7 jours • Hôtel + Vol',
      'zh_Hans': '7天 • 酒店+机票',
    },
    'tucfqsob': {
      'en': 'Starting from',
      'ar': 'ابتداءً من',
      'es': 'A partir de',
      'fr': 'À partir de',
      'zh_Hans': '从',
    },
    '6bxiyc5e': {
      'en': '\$1,299',
      'ar': '1299 دولارًا',
      'es': '\$1,299',
      'fr': '1 299 \$',
      'zh_Hans': '1299美元',
    },
    'fcf5c57g': {
      'en': 'Bali Paradise',
      'ar': 'جنة بالي',
      'es': 'Paraíso de Bali',
      'fr': 'Paradis de Bali',
      'zh_Hans': '巴厘岛天堂',
    },
    '6wi2unsr': {
      'en': '6 days • Hotel + Flight',
      'ar': '6 أيام • فندق + طيران',
      'es': '6 días • Hotel + Vuelo',
      'fr': '6 jours • Hôtel + Vol',
      'zh_Hans': '6天 • 酒店+机票',
    },
    'bia67dur': {
      'en': 'Starting from',
      'ar': 'ابتداءً من',
      'es': 'A partir de',
      'fr': 'À partir de',
      'zh_Hans': '从',
    },
    '4sekro1o': {
      'en': '\$749',
      'ar': '749 دولارًا',
      'es': '\$749',
      'fr': '749 \$',
      'zh_Hans': '749美元',
    },
    '6i5lmnvw': {
      'en': 'Santorini Escape',
      'ar': 'ملاذ سانتوريني',
      'es': 'Escapada a Santorini',
      'fr': 'Évasion à Santorin',
      'zh_Hans': '圣托里尼岛逃亡之旅',
    },
    '30bqtwfb': {
      'en': '4 days • Hotel + Flight',
      'ar': '4 أيام • فندق + طيران',
      'es': '4 días • Hotel + Vuelo',
      'fr': '4 jours • Hôtel + Vol',
      'zh_Hans': '4天 • 酒店+机票',
    },
    'weojiz9d': {
      'en': 'Starting from',
      'ar': 'ابتداءً من',
      'es': 'A partir de',
      'fr': 'À partir de',
      'zh_Hans': '从',
    },
    't8ewup0b': {
      'en': '\$1,099',
      'ar': '1099 دولارًا',
      'es': '\$1,099',
      'fr': '1 099 \$',
      'zh_Hans': '1,099 美元',
    },
    '4ycw26ni': {
      'en': 'Explore Johannesburg',
      'ar': 'استكشف جوهانسبرج',
      'es': 'Explora Johannesburgo',
      'fr': 'Explorez Johannesburg',
      'zh_Hans': '探索约翰内斯堡',
    },
    '5fk84vmd': {
      'en': '4 days • Hotel + Flight',
      'ar': '4 أيام • فندق + طيران',
      'es': '4 días • Hotel + Vuelo',
      'fr': '4 jours • Hôtel + Vol',
      'zh_Hans': '4天 • 酒店+机票',
    },
    '4z25haap': {
      'en': 'Starting from',
      'ar': 'ابتداءً من',
      'es': 'A partir de',
      'fr': 'À partir de',
      'zh_Hans': '从',
    },
    'b2xdiwph': {
      'en': '\$999',
      'ar': '999 دولارًا',
      'es': '\$999',
      'fr': '999 \$',
      'zh_Hans': '999美元',
    },
  },
  // HomeQuery
  {
    '4gkk3l5g': {
      'en': 'Hi, I\'m KiTravia. I will be your \ntravel agent.',
      'ar': 'مرحباً، أنا كي ترافيا. سأكون وكيل سفرك.',
      'es': 'Hola, soy KiTravia. Seré tu agente de viajes.',
      'fr': 'Bonjour, je suis KiTravia. Je serai votre\nagent de voyages.',
      'zh_Hans': '您好，我是KiTravia。我将是您的\n\n旅行社代理。',
    },
    'nt36a9oy': {
      'en':
          'Not sure where to start? Tell me where you want to go? What\'s your budget? Is there something specific you\'d like to do? Do you need a rental car? We’ll guide you through the booking process!',
      'ar':
          'لست متأكدًا من أين تبدأ؟ أخبرنا أين تريد الذهاب؟ ما هي ميزانيتك؟ هل هناك شيء محدد ترغب في القيام به؟ هل تحتاج إلى استئجار سيارة؟ سنرشدك خلال عملية الحجز!',
      'es':
          '¿No sabes por dónde empezar? ¿Adónde quieres ir? ¿Cuál es tu presupuesto? ¿Hay algo en particular que te gustaría hacer? ¿Necesitas alquilar un coche? ¡Te guiaremos durante todo el proceso de reserva!',
      'fr':
          'Vous ne savez pas par où commencer ? Dites-nous où vous souhaitez aller. Quel est votre budget ? Avez-vous des envies particulières ? Avez-vous besoin d’une voiture de location ? Nous vous accompagnerons tout au long de la réservation !',
      'zh_Hans': '不知道从哪里开始？告诉我你想去哪里？你的预算是多少？有什么特别想体验的活动吗？需要租车吗？我们会指导你完成预订流程！',
    },
  },
  // WarningMessage
  {
    'p8nrr290': {
      'en':
          'Kitravia can make mistakes. Double check important information before completing booking transaction.',
      'ar':
          'قد ترتكب شركة كيترافيا أخطاءً. لذا، يُرجى التحقق جيداً من المعلومات المهمة قبل إتمام عملية الحجز.',
      'es':
          'Kitravia puede cometer errores. Verifique cuidadosamente la información importante antes de completar la transacción de reserva.',
      'fr':
          'Kitravia peut commettre des erreurs. Veuillez vérifier attentivement les informations importantes avant de finaliser votre réservation.',
      'zh_Hans': 'Kitravia可能会出错。请在完成预订交易前仔细核对重要信息。',
    },
  },
  // LastMinDeals
  {
    '6i1pjtea': {
      'en': 'Last Minute Deals',
      'ar': 'عروض اللحظة الأخيرة',
      'es': 'Ofertas de última hora',
      'fr': 'Offres de dernière minute',
      'zh_Hans': '最后一分钟优惠',
    },
    'd33z4kp5': {
      'en': 'View all',
      'ar': 'عرض الكل',
      'es': 'Ver todo',
      'fr': 'Afficher tout',
      'zh_Hans': '查看全部',
    },
    't51jbj2d': {
      'en': '50% OFF',
      'ar': 'خصم 50%',
      'es': '50% de descuento',
      'fr': '50 % de réduction',
      'zh_Hans': '五折优惠',
    },
    '075iprkd': {
      'en': 'Rome',
      'ar': 'روما',
      'es': 'Roma',
      'fr': 'Rome',
      'zh_Hans': '罗马',
    },
    'xp3jsqhy': {
      'en': 'From \$399',
      'ar': 'ابتداءً من 399 دولارًا',
      'es': 'Desde \$399',
      'fr': 'À partir de 399 \$',
      'zh_Hans': '399美元起',
    },
    'yqe506jc': {
      'en': '30% OFF',
      'ar': 'خصم 30%',
      'es': '30% de descuento',
      'fr': '30 % de réduction',
      'zh_Hans': '七折优惠',
    },
    'epu6dnyg': {
      'en': 'Barcelona',
      'ar': 'برشلونة',
      'es': 'Barcelona',
      'fr': 'Barcelone',
      'zh_Hans': '巴塞罗那',
    },
    '248r0lvo': {
      'en': 'From \$549',
      'ar': 'ابتداءً من 549 دولارًا',
      'es': 'Desde \$549',
      'fr': 'À partir de 549 \$',
      'zh_Hans': '549美元起',
    },
    'awi4w3u8': {
      'en': '40% OFF',
      'ar': 'خصم 40%',
      'es': '40% de descuento',
      'fr': '40 % de réduction',
      'zh_Hans': '40% 折扣',
    },
    '3njc2pph': {
      'en': 'Dubai',
      'ar': 'دبي',
      'es': 'Dubái',
      'fr': 'Dubaï',
      'zh_Hans': '迪拜',
    },
    '4yzx87z4': {
      'en': 'From \$699',
      'ar': 'ابتداءً من 699 دولارًا',
      'es': 'Desde \$699',
      'fr': 'À partir de 699 \$',
      'zh_Hans': '699美元起',
    },
    'g2pgmxu7': {
      'en': '25% OFF',
      'ar': 'خصم 25%',
      'es': '25% de descuento',
      'fr': '25 % de réduction',
      'zh_Hans': '七五折',
    },
    'ax945nre': {
      'en': 'London',
      'ar': 'لندن',
      'es': 'Londres',
      'fr': 'Londres',
      'zh_Hans': '伦敦',
    },
    'jiwc98ev': {
      'en': 'From \$749',
      'ar': 'ابتداءً من 749 دولارًا',
      'es': 'Desde \$749',
      'fr': 'À partir de 749 \$',
      'zh_Hans': '749美元起',
    },
    'hmap1lyn': {
      'en': '30% OFF',
      'ar': 'خصم 30%',
      'es': '30% de descuento',
      'fr': '30 % de réduction',
      'zh_Hans': '七折优惠',
    },
    'zdd87uws': {
      'en': 'Mexico City',
      'ar': 'مدينة مكسيكو',
      'es': 'Ciudad de México',
      'fr': 'Mexico',
      'zh_Hans': '墨西哥城',
    },
    'hm40qj0e': {
      'en': 'From \$449',
      'ar': 'ابتداءً من 449 دولارًا',
      'es': 'Desde \$449',
      'fr': 'À partir de 449 \$',
      'zh_Hans': '449美元起',
    },
    'xlnxep7r': {
      'en': '25% OFF',
      'ar': 'خصم 25%',
      'es': '25% de descuento',
      'fr': '25 % de réduction',
      'zh_Hans': '七五折',
    },
    'rffq8dpi': {
      'en': 'Toronto',
      'ar': 'تورنتو',
      'es': 'Toronto',
      'fr': 'Toronto',
      'zh_Hans': '多伦多',
    },
    'skdhg9j9': {
      'en': 'From \$799',
      'ar': 'ابتداءً من 799 دولارًا',
      'es': 'Desde \$799',
      'fr': 'À partir de 799 \$',
      'zh_Hans': '799美元起',
    },
  },
  // PopularDestinations
  {
    'dnwfo1ub': {
      'en': 'Popular Destinations',
      'ar': 'الوجهات السياحية الشهيرة',
      'es': 'Destinos populares',
      'fr': 'Destinations populaires',
      'zh_Hans': '热门目的地',
    },
    'pk2y7911': {
      'en': 'Explore all',
      'ar': 'استكشف الكل',
      'es': 'Explorar todo',
      'fr': 'Explorez tout',
      'zh_Hans': '探索全部',
    },
    'a6bkq4ny': {
      'en': 'New York',
      'ar': 'نيويورك',
      'es': 'Nueva York',
      'fr': 'New York',
      'zh_Hans': '纽约',
    },
    'v6ellzkt': {
      'en': '245 hotels',
      'ar': '245 فندقًا',
      'es': '245 hoteles',
      'fr': '245 hôtels',
      'zh_Hans': '245家酒店',
    },
    'a190yy0f': {
      'en': 'Maldives',
      'ar': 'جزر المالديف',
      'es': 'Maldivas',
      'fr': 'Maldives',
      'zh_Hans': '马尔代夫',
    },
    'jwnpsz2r': {
      'en': '89 resorts',
      'ar': '89 منتجعاً',
      'es': '89 complejos turísticos',
      'fr': '89 stations balnéaires',
      'zh_Hans': '89家度假村',
    },
    '6bjcr05d': {
      'en': 'Paris',
      'ar': 'باريس',
      'es': 'París',
      'fr': 'Paris',
      'zh_Hans': '巴黎',
    },
    'voudd5qg': {
      'en': '220 Hotels',
      'ar': '220 فندقًا',
      'es': '220 hoteles',
      'fr': '220 hôtels',
      'zh_Hans': '220家酒店',
    },
    '96khora3': {
      'en': 'Sydney',
      'ar': 'سيدني',
      'es': 'Sídney',
      'fr': 'Sydney',
      'zh_Hans': '悉尼',
    },
    '7rltq0wc': {
      'en': '154 Hotels',
      'ar': '154 فندقًا',
      'es': '154 hoteles',
      'fr': '154 hôtels',
      'zh_Hans': '154家酒店',
    },
    'q4pb7ylg': {
      'en': 'Bali',
      'ar': 'بالي',
      'es': 'Bali',
      'fr': 'Bali',
      'zh_Hans': '巴厘岛',
    },
    'w98ltv6h': {
      'en': '45 resorts',
      'ar': '45 منتجعاً',
      'es': '45 complejos turísticos',
      'fr': '45 stations balnéaires',
      'zh_Hans': '45家度假村',
    },
    'fwlnvp9e': {
      'en': 'Los Angeles',
      'ar': 'لوس أنجلوس',
      'es': 'Los Ángeles',
      'fr': 'Los Angeles',
      'zh_Hans': '洛杉矶',
    },
    'ir380vov': {
      'en': '234 Hotels',
      'ar': '234 فندقًا',
      'es': '234 hoteles',
      'fr': '234 hôtels',
      'zh_Hans': '234 家酒店',
    },
    'qg83l9hp': {
      'en': 'Tokyo',
      'ar': 'طوكيو',
      'es': 'Tokio',
      'fr': 'Tokyo',
      'zh_Hans': '东京',
    },
    'qnzmpdnn': {
      'en': '159 Hotels',
      'ar': '159 فندقًا',
      'es': '159 hoteles',
      'fr': '159 hôtels',
      'zh_Hans': '159 家酒店',
    },
    'zfez6wwj': {
      'en': 'Barcelona',
      'ar': 'برشلونة',
      'es': 'Barcelona',
      'fr': 'Barcelone',
      'zh_Hans': '巴塞罗那',
    },
    'wvkqrr6q': {
      'en': '282 Hotels',
      'ar': '282 فندقًا',
      'es': '282 hoteles',
      'fr': '282 hôtels',
      'zh_Hans': '282家酒店',
    },
    'tairj22l': {
      'en': 'Cancun',
      'ar': 'كانكون',
      'es': 'Cancún',
      'fr': 'Cancún',
      'zh_Hans': '坎昆',
    },
    'nrf0rl1v': {
      'en': '72 resorts',
      'ar': '72 منتجعاً',
      'es': '72 complejos turísticos',
      'fr': '72 stations balnéaires',
      'zh_Hans': '72家度假村',
    },
    'zc15cvos': {
      'en': 'Cape Town',
      'ar': 'كيب تاون',
      'es': 'Ciudad del Cabo',
      'fr': 'Le Cap',
      'zh_Hans': '开普敦',
    },
    'fo7naq5j': {
      'en': '189 Hotels',
      'ar': '189 فندقًا',
      'es': '189 hoteles',
      'fr': '189 hôtels',
      'zh_Hans': '189 家酒店',
    },
    'eyp1sq3n': {
      'en': 'London',
      'ar': 'لندن',
      'es': 'Londres',
      'fr': 'Londres',
      'zh_Hans': '伦敦',
    },
    'esi554vr': {
      'en': '379 Hotels',
      'ar': '379 فندقًا',
      'es': '379 hoteles',
      'fr': '379 hôtels',
      'zh_Hans': '379 家酒店',
    },
  },
  // BaseInputFieldCopy
  {
    '29k9jcac': {
      'en': 'Voice Mode',
      'ar': 'وضع الصوت',
      'es': 'Modo de voz',
      'fr': 'Mode vocal',
      'zh_Hans': '语音模式',
    },
    'jpbs0yi0': {
      'en': 'Describe additional details about your trip',
      'ar': 'صف تفاصيل إضافية حول رحلتك',
      'es': 'Describe detalles adicionales sobre tu viaje.',
      'fr': 'Décrivez plus en détail votre voyage',
      'zh_Hans': '请详细描述您的旅行情况',
    },
  },
  // PopularDestinationsCopy
  {
    '1em20k95': {
      'en': 'Popular AIrlines',
      'ar': 'شركات طيران شعبية',
      'es': 'Aerolíneas populares',
      'fr': 'Compagnies aériennes populaires',
      'zh_Hans': '热门航空公司',
    },
    'sgvsez2b': {
      'en': 'Explore all',
      'ar': 'استكشف الكل',
      'es': 'Explorar todo',
      'fr': 'Explorez tout',
      'zh_Hans': '探索全部',
    },
    'ons9n8gt': {
      'en': 'New York',
      'ar': 'نيويورك',
      'es': 'Nueva York',
      'fr': 'New York',
      'zh_Hans': '纽约',
    },
    'ot25ilyk': {
      'en': '245 hotels',
      'ar': '245 فندقًا',
      'es': '245 hoteles',
      'fr': '245 hôtels',
      'zh_Hans': '245家酒店',
    },
    'tolzlhb8': {
      'en': 'Maldives',
      'ar': 'جزر المالديف',
      'es': 'Maldivas',
      'fr': 'Maldives',
      'zh_Hans': '马尔代夫',
    },
    '2ghyp7mk': {
      'en': '89 resorts',
      'ar': '89 منتجعاً',
      'es': '89 complejos turísticos',
      'fr': '89 stations balnéaires',
      'zh_Hans': '89家度假村',
    },
    '570wpijd': {
      'en': 'Paris',
      'ar': 'باريس',
      'es': 'París',
      'fr': 'Paris',
      'zh_Hans': '巴黎',
    },
    'faa13ufp': {
      'en': '220 Hotels',
      'ar': '220 فندقًا',
      'es': '220 hoteles',
      'fr': '220 hôtels',
      'zh_Hans': '220家酒店',
    },
    'u84vdm1u': {
      'en': 'Sydney',
      'ar': 'سيدني',
      'es': 'Sídney',
      'fr': 'Sydney',
      'zh_Hans': '悉尼',
    },
    'otcs273c': {
      'en': '154 Hotels',
      'ar': '154 فندقًا',
      'es': '154 hoteles',
      'fr': '154 hôtels',
      'zh_Hans': '154家酒店',
    },
    'hucjp1gf': {
      'en': 'Bali',
      'ar': 'بالي',
      'es': 'Bali',
      'fr': 'Bali',
      'zh_Hans': '巴厘岛',
    },
    'qcr6jeag': {
      'en': '45 resorts',
      'ar': '45 منتجعاً',
      'es': '45 complejos turísticos',
      'fr': '45 stations balnéaires',
      'zh_Hans': '45家度假村',
    },
    'qogbaewl': {
      'en': 'Los Angeles',
      'ar': 'لوس أنجلوس',
      'es': 'Los Ángeles',
      'fr': 'Los Angeles',
      'zh_Hans': '洛杉矶',
    },
    '9gnbhe8a': {
      'en': '234 Hotels',
      'ar': '234 فندقًا',
      'es': '234 hoteles',
      'fr': '234 hôtels',
      'zh_Hans': '234 家酒店',
    },
    '33d2qh7u': {
      'en': 'Tokyo',
      'ar': 'طوكيو',
      'es': 'Tokio',
      'fr': 'Tokyo',
      'zh_Hans': '东京',
    },
    '3a96772c': {
      'en': '159 Hotels',
      'ar': '159 فندقًا',
      'es': '159 hoteles',
      'fr': '159 hôtels',
      'zh_Hans': '159 家酒店',
    },
    '3ymdxwi1': {
      'en': 'Barcelona',
      'ar': 'برشلونة',
      'es': 'Barcelona',
      'fr': 'Barcelone',
      'zh_Hans': '巴塞罗那',
    },
    'yqsihyzo': {
      'en': '282 Hotels',
      'ar': '282 فندقًا',
      'es': '282 hoteles',
      'fr': '282 hôtels',
      'zh_Hans': '282家酒店',
    },
    'psi78ug9': {
      'en': 'Cancun',
      'ar': 'كانكون',
      'es': 'Cancún',
      'fr': 'Cancún',
      'zh_Hans': '坎昆',
    },
    'f9m64in7': {
      'en': '72 resorts',
      'ar': '72 منتجعاً',
      'es': '72 complejos turísticos',
      'fr': '72 stations balnéaires',
      'zh_Hans': '72家度假村',
    },
    'ksp4vajq': {
      'en': 'Cape Town',
      'ar': 'كيب تاون',
      'es': 'Ciudad del Cabo',
      'fr': 'Le Cap',
      'zh_Hans': '开普敦',
    },
    '6k1jrggi': {
      'en': '189 Hotels',
      'ar': '189 فندقًا',
      'es': '189 hoteles',
      'fr': '189 hôtels',
      'zh_Hans': '189 家酒店',
    },
    'm3zvishr': {
      'en': 'London',
      'ar': 'لندن',
      'es': 'Londres',
      'fr': 'Londres',
      'zh_Hans': '伦敦',
    },
    'e3jsbhcu': {
      'en': '379 Hotels',
      'ar': '379 فندقًا',
      'es': '379 hoteles',
      'fr': '379 hôtels',
      'zh_Hans': '379 家酒店',
    },
  },
  // Dropdown02Options
  {
    'ff9wmarl': {
      'en': 'Account Options',
      'ar': 'خيارات الحساب',
      'es': 'Opciones de cuenta',
      'fr': 'Options du compte',
      'zh_Hans': '账户选项',
    },
    'qym06veh': {
      'en': 'My Account',
      'ar': 'حسابي',
      'es': 'Mi cuenta',
      'fr': 'Mon compte',
      'zh_Hans': '我的账户',
    },
    'efx0irbu': {
      'en': 'Settings',
      'ar': 'إعدادات',
      'es': 'Ajustes',
      'fr': 'Paramètres',
      'zh_Hans': '设置',
    },
    'k14uzt72': {
      'en': 'Billing Details',
      'ar': 'تفاصيل الفاتورة',
      'es': 'Detalles de facturación',
      'fr': 'Détails de facturation',
      'zh_Hans': '账单详情',
    },
    '3sxqre3u': {
      'en': 'Platform',
      'ar': 'منصة',
      'es': 'Plataforma',
      'fr': 'Plate-forme',
      'zh_Hans': '平台',
    },
    'l4pw4qlf': {
      'en': 'Customer Support',
      'ar': 'دعم العملاء',
      'es': 'Soporte al cliente',
      'fr': 'Service client',
      'zh_Hans': '客户支持',
    },
    '8upbtpng': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
      'es': 'Cerrar sesión',
      'fr': 'Déconnexion',
      'zh_Hans': '注销',
    },
  },
  // PopularAirlines
  {
    'liku3wle': {
      'en': 'Your Favorite Airlines',
      'ar': 'شركات الطيران المفضلة لديك',
      'es': 'Tus aerolíneas favoritas',
      'fr': 'Vos compagnies aériennes préférées',
      'zh_Hans': '您最喜爱的航空公司',
    },
    '8m1b8n50': {
      'en': 'Explore all',
      'ar': 'استكشف الكل',
      'es': 'Explorar todo',
      'fr': 'Explorez tout',
      'zh_Hans': '探索全部',
    },
    'oiwigt3z': {
      'en': 'American Airlines',
      'ar': 'الخطوط الجوية الأمريكية',
      'es': 'American Airlines',
      'fr': 'American Airlines',
      'zh_Hans': '美国航空公司',
    },
    'ouojt0qz': {
      'en': 'Qatar Airways',
      'ar': 'الخطوط الجوية القطرية',
      'es': 'Qatar Airways',
      'fr': 'Qatar Airways',
      'zh_Hans': '卡塔尔航空公司',
    },
    'v7x3ewuk': {
      'en': 'United Airlines',
      'ar': 'الخطوط الجوية المتحدة',
      'es': 'United Airlines',
      'fr': 'United Airlines',
      'zh_Hans': '联合航空公司',
    },
    'l1cyrpc0': {
      'en': 'Ryanair',
      'ar': 'ريان إير',
      'es': 'Ryanair',
      'fr': 'Ryanair',
      'zh_Hans': '瑞安航空',
    },
    'emmic615': {
      'en': 'Delta Airlines',
      'ar': 'خطوط دلتا الجوية',
      'es': 'Delta Airlines',
      'fr': 'Delta Airlines',
      'zh_Hans': '达美航空',
    },
    '2ba0f8wg': {
      'en': 'Singapore Airlines',
      'ar': 'الخطوط الجوية السنغافورية',
      'es': 'Singapore Airlines',
      'fr': 'Singapore Airlines',
      'zh_Hans': '新加坡航空公司',
    },
    'wudo2dua': {
      'en': 'SWISS',
      'ar': 'سويسري',
      'es': 'SUIZO',
      'fr': 'SUISSE',
      'zh_Hans': '瑞士',
    },
    'yw12x3zz': {
      'en': 'Southwest Airlines',
      'ar': 'خطوط طيران ساوث ويست',
      'es': 'Southwest Airlines',
      'fr': 'Southwest Airlines',
      'zh_Hans': '西南航空公司',
    },
    '35606qzh': {
      'en': 'Royal Dutch Airlines',
      'ar': 'الخطوط الجوية الملكية الهولندية',
      'es': 'Real Aerolínea Holandesa',
      'fr': 'Royal Dutch Airlines',
      'zh_Hans': '荷兰皇家航空公司',
    },
    'rcc8ck4y': {
      'en': 'Emirates ',
      'ar': 'طيران الإمارات',
      'es': 'Emiratos',
      'fr': 'Émirats',
      'zh_Hans': '阿联酋航空',
    },
    '9ax2c3jk': {
      'en': 'Lufthansa',
      'ar': 'لوفتهانزا',
      'es': 'Lufthansa',
      'fr': 'Lufthansa',
      'zh_Hans': '汉莎航空',
    },
    'ui8qcben': {
      'en': 'Air China',
      'ar': 'الخطوط الجوية الصينية',
      'es': 'Aire China',
      'fr': 'Air China',
      'zh_Hans': '中国国际航空公司',
    },
    'rxsmsemt': {
      'en': 'British Airways',
      'ar': 'الخطوط الجوية البريطانية',
      'es': 'British Airways',
      'fr': 'British Airways',
      'zh_Hans': '英国航空公司',
    },
    'nagbsff3': {
      'en': 'Air France',
      'ar': 'الخطوط الجوية الفرنسية',
      'es': 'Air France',
      'fr': 'Air France',
      'zh_Hans': '法国航空',
    },
  },
  // HeaderLoggedIn
  {
    'bjqz8t16': {
      'en': '🎁 Promotional offer',
      'ar': '🎁 عرض ترويجي',
      'es': '🎁 Oferta promocional',
      'fr': '🎁 Offre promotionnelle',
      'zh_Hans': '🎁 促销优惠',
    },
    'rjxna33q': {
      'en': 'user1234',
      'ar': 'المستخدم 1234',
      'es': 'usuario1234',
      'fr': 'utilisateur1234',
      'zh_Hans': '用户1234',
    },
    '2wg4lzp4': {
      'en': 'Plan Your Trip',
      'ar': 'خطط لرحلتك',
      'es': 'Planifica tu viaje',
      'fr': 'Planifiez votre voyage',
      'zh_Hans': '计划您的行程',
    },
    '73c6hrmp': {
      'en': 'About',
      'ar': 'عن',
      'es': 'Acerca de',
      'fr': 'À propos',
      'zh_Hans': '关于',
    },
    'mctrv73a': {
      'en': 'Travel Guides',
      'ar': 'أدلة السفر',
      'es': 'Guías de viaje',
      'fr': 'Guides de voyage',
      'zh_Hans': '旅游指南',
    },
    'wy1vfklh': {
      'en': 'Booking for Visa',
      'ar': 'حجز تأشيرة',
      'es': 'Reserva para visa',
      'fr': 'Réservation de visa',
      'zh_Hans': '签证预约',
    },
    'wetqx4wa': {
      'en': 'Pricing',
      'ar': 'التسعير',
      'es': 'Precios',
      'fr': 'Tarification',
      'zh_Hans': '定价',
    },
    'lilh9bsw': {
      'en': 'Blog',
      'ar': 'مدونة',
      'es': 'Blog',
      'fr': 'Blog',
      'zh_Hans': '博客',
    },
    'cjgee4ni': {
      'en': 'FAQs',
      'ar': 'الأسئلة الشائعة',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
      'zh_Hans': '常见问题解答',
    },
  },
  // HeaderCopy
  {
    'ohga59qh': {
      'en': '🎁 Promotional offer',
      'ar': '🎁 عرض ترويجي',
      'es': '🎁 Oferta promocional',
      'fr': '🎁 Offre promotionnelle',
      'zh_Hans': '🎁 促销优惠',
    },
    'w7t1jrza': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'zh_Hans': '登录',
    },
    '94j7evrd': {
      'en': 'Plan Your Trip',
      'ar': 'خطط لرحلتك',
      'es': 'Planifica tu viaje',
      'fr': 'Planifiez votre voyage',
      'zh_Hans': '计划您的行程',
    },
    '9b4uz5p6': {
      'en': 'About',
      'ar': 'عن',
      'es': 'Acerca de',
      'fr': 'À propos',
      'zh_Hans': '关于',
    },
    'a5fqw32t': {
      'en': 'Travel Guides',
      'ar': 'أدلة السفر',
      'es': 'Guías de viaje',
      'fr': 'Guides de voyage',
      'zh_Hans': '旅游指南',
    },
    '49rd1170': {
      'en': 'Booking for Visa',
      'ar': 'حجز تأشيرة',
      'es': 'Reserva para visa',
      'fr': 'Réservation de visa',
      'zh_Hans': '签证预约',
    },
    'wueevi8r': {
      'en': 'Pricing',
      'ar': 'التسعير',
      'es': 'Precios',
      'fr': 'Tarification',
      'zh_Hans': '定价',
    },
    '8c3we0ql': {
      'en': 'Blog',
      'ar': 'مدونة',
      'es': 'Blog',
      'fr': 'Blog',
      'zh_Hans': '博客',
    },
    'zncuzjkj': {
      'en': 'FAQs',
      'ar': 'الأسئلة الشائعة',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
      'zh_Hans': '常见问题解答',
    },
  },
  // Results
  {
    'n8drlbvy': {
      'en': '+ New Trip',
      'ar': '+ رحلة جديدة',
      'es': '+ Nuevo viaje',
      'fr': '+ Nouveau voyage',
      'zh_Hans': '+ 新行程',
    },
    'wa9irmy7': {
      'en': 'My Trips',
      'ar': 'رحلاتي',
      'es': 'Mis viajes',
      'fr': 'Mes voyages',
      'zh_Hans': '我的旅行',
    },
    '52tsnncs': {
      'en': 'Las Vegas weekend',
      'ar': 'عطلة نهاية الأسبوع في لاس فيغاس',
      'es': 'Fin de semana en Las Vegas',
      'fr': 'week-end à Las Vegas',
      'zh_Hans': '拉斯维加斯周末',
    },
    'rwpf7c6i': {
      'en': 'Business trip to Vancouver',
      'ar': 'رحلة عمل إلى فانكوفر',
      'es': 'Viaje de negocios a Vancouver',
      'fr': 'Voyage d\'affaires à Vancouver',
      'zh_Hans': '温哥华商务出差',
    },
    'uj1unpul': {
      'en': 'Cultural trip to Nairobi',
      'ar': 'رحلة ثقافية إلى نيروبي',
      'es': 'Viaje cultural a Nairobi',
      'fr': 'Voyage culturel à Nairobi',
      'zh_Hans': '内罗毕文化之旅',
    },
    'kyisqgbb': {
      'en':
          'I live in Phoenix I want to spend the upcoming weekend in Las Vegas with my friend and go party but also see special historic landmarks, we want to fly and stay at a 4 star casino.',
      'ar':
          'أعيش في فينيكس، وأريد قضاء عطلة نهاية الأسبوع القادمة في لاس فيغاس مع صديقي، والذهاب للاحتفال، ولكن أيضاً زيارة المعالم التاريخية المميزة، ونريد السفر جواً والإقامة في كازينو من فئة 4 نجوم.',
      'es':
          'Vivo en Phoenix y quiero pasar el próximo fin de semana en Las Vegas con mi amigo, ir de fiesta y también visitar lugares históricos especiales. Queremos volar y alojarnos en un casino de 4 estrellas.',
      'fr':
          'J\'habite à Phoenix et je souhaite passer le week-end prochain à Las Vegas avec mon ami pour faire la fête mais aussi visiter des sites historiques importants. Nous voulons prendre l\'avion et séjourner dans un casino 4 étoiles.',
      'zh_Hans':
          '我住在凤凰城，想和朋友一起在即将到来的周末去拉斯维加斯玩乐，也想参观一些特别的历史地标。我们想飞过去，住在一家四星级赌场酒店。',
    },
    'z3n7j49f': {
      'en': 'Researching your destination...',
      'ar': 'البحث عن وجهتك...',
      'es': 'Investigando tu destino...',
      'fr': 'Vous recherchez votre destination...',
      'zh_Hans': '研究您的目的地……',
    },
    'v2d32cxd': {
      'en':
          'Here is your trip information to destination Las Vegas, select the options you want. Let me know if you want to refine your search.',
      'ar':
          'إليك معلومات رحلتك إلى لاس فيغاس، اختر الخيارات التي تناسبك. أخبرني إن كنت ترغب في تحسين بحثك.',
      'es':
          'Aquí tienes la información de tu viaje a Las Vegas. Selecciona las opciones que prefieras. Avísame si quieres refinar tu búsqueda.',
      'fr':
          'Voici les informations concernant votre voyage à Las Vegas. Sélectionnez les options qui vous intéressent. N\'hésitez pas à me contacter si vous souhaitez affiner votre recherche.',
      'zh_Hans': '以下是您前往拉斯维加斯的行程信息，请选择您需要的选项。如果您想进一步筛选搜索结果，请告诉我。',
    },
    '7gng9s9c': {
      'en': 'Describe additional details about your trip',
      'ar': 'صف تفاصيل إضافية حول رحلتك',
      'es': 'Describe detalles adicionales sobre tu viaje.',
      'fr': 'Décrivez plus en détail votre voyage',
      'zh_Hans': '请详细描述您的旅行情况',
    },
    'to6jpnop': {
      'en': 'Voice Mode',
      'ar': 'وضع الصوت',
      'es': 'Modo de voz',
      'fr': 'Mode vocal',
      'zh_Hans': '语音模式',
    },
    '5mnim375': {
      'en': 'Flights',
      'ar': 'رحلات جوية',
      'es': 'Vuelos',
      'fr': 'Vols',
      'zh_Hans': '航班',
    },
    'ft8bn0xk': {
      'en': 'Delta Airlines',
      'ar': 'خطوط دلتا الجوية',
      'es': 'Delta Airlines',
      'fr': 'Delta Airlines',
      'zh_Hans': '达美航空',
    },
    'rrswbjoy': {
      'en': 'DL 2150',
      'ar': 'DL 2150',
      'es': 'DL 2150',
      'fr': 'DL 2150',
      'zh_Hans': 'DL 2150',
    },
    'wjlekk5f': {
      'en': '\$325',
      'ar': '325 دولارًا',
      'es': '\$325',
      'fr': '325 \$',
      'zh_Hans': '325美元',
    },
    'mjbh5iqx': {
      'en': '2:10 PM',
      'ar': '2:10 مساءً',
      'es': '14:10',
      'fr': '14h10',
      'zh_Hans': '下午2:10',
    },
    'ks2n7aae': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'llyh68ep': {
      'en': '1h 25m • Direct',
      'ar': 'ساعة و25 دقيقة • مباشر',
      'es': '1h 25m • Direct',
      'fr': '1 h 25 min • Direct',
      'zh_Hans': '1小时25分钟 • 直达',
    },
    'te197sfh': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'vvf18tm5': {
      'en': 'Southwest',
      'ar': 'جنوب غرب',
      'es': 'Suroeste',
      'fr': 'Sud-ouest',
      'zh_Hans': '西南',
    },
    '11yf5ik5': {
      'en': 'WN 2421',
      'ar': 'WN 2421',
      'es': 'WN 2421',
      'fr': 'WN 2421',
      'zh_Hans': 'WN 2421',
    },
    'l1d6qbim': {
      'en': '\$199',
      'ar': '199 دولارًا',
      'es': '\$199',
      'fr': '199 \$',
      'zh_Hans': '199美元',
    },
    'savdacz0': {
      'en': '8:45 PM',
      'ar': '8:45 مساءً',
      'es': '20:45',
      'fr': '20h45',
      'zh_Hans': '晚上8:45',
    },
    'fhn8pog4': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'bieln5qo': {
      'en': '1h 10m • Direct',
      'ar': 'ساعة و10 دقائق • مباشر',
      'es': '1h 10m • Direct',
      'fr': '1 h 10 min • Direct',
      'zh_Hans': '1小时10分钟 • 直达',
    },
    '4tbojl1y': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'ozfb0lk6': {
      'en': 'American Airlines',
      'ar': 'الخطوط الجوية الأمريكية',
      'es': 'American Airlines',
      'fr': 'American Airlines',
      'zh_Hans': '美国航空公司',
    },
    '8egafvvr': {
      'en': 'AA 1534',
      'ar': 'AA 1534',
      'es': 'AA 1534',
      'fr': 'AA 1534',
      'zh_Hans': 'AA 1534',
    },
    '7gaau8ne': {
      'en': '\$215',
      'ar': '215 دولارًا',
      'es': '\$215',
      'fr': '215 \$',
      'zh_Hans': '215美元',
    },
    'glr8fefu': {
      'en': '6:30 AM',
      'ar': '6:30 صباحاً',
      'es': '6:30 AM',
      'fr': '6h30',
      'zh_Hans': '早上6:30',
    },
    'a54mz611': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'ytmclk4e': {
      'en': '1h 15m • Direct',
      'ar': 'ساعة و15 دقيقة • مباشر',
      'es': '1h 15m • Direct',
      'fr': '1 h 15 min • Direct',
      'zh_Hans': '1小时15分钟 • 直达',
    },
    'gpbop940': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'ttk54xla': {
      'en': 'United Airlines',
      'ar': 'الخطوط الجوية المتحدة',
      'es': 'United Airlines',
      'fr': 'United Airlines',
      'zh_Hans': '联合航空公司',
    },
    '7hhwd5wi': {
      'en': 'UA 892',
      'ar': 'UA 892',
      'es': 'UA 892',
      'fr': 'UA 892',
      'zh_Hans': 'UA 892',
    },
    'ittytqo7': {
      'en': '\$289',
      'ar': '289 دولارًا',
      'es': '\$289',
      'fr': '289 \$',
      'zh_Hans': '289美元',
    },
    'scgbfnqr': {
      'en': '11:20 AM',
      'ar': '11:20 صباحاً',
      'es': '11:20 AM',
      'fr': '11h20',
      'zh_Hans': '上午11:20',
    },
    '461vxgts': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'fcuxodgq': {
      'en': '1h 20m • Direct',
      'ar': 'ساعة و20 دقيقة • مباشر',
      'es': '1h 20m • Direct',
      'fr': '1 h 20 min • Direct',
      'zh_Hans': '1小时20分钟 • 直达',
    },
    'ptgs6n19': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'x3bwravn': {
      'en': 'Frontier Airlines',
      'ar': 'خطوط فرونتير الجوية',
      'es': 'Frontier Airlines',
      'fr': 'Frontier Airlines',
      'zh_Hans': '边疆航空',
    },
    '0zdnjqpi': {
      'en': 'F9 1056',
      'ar': 'F9 1056',
      'es': 'F9 1056',
      'fr': 'F9 1056',
      'zh_Hans': 'F9 1056',
    },
    'kyt40pkj': {
      'en': '\$16',
      'ar': '16 دولارًا',
      'es': '\$16',
      'fr': '16 \$',
      'zh_Hans': '16美元',
    },
    'ihgb38cc': {
      'en': '3:45 PM',
      'ar': '3:45 مساءً',
      'es': '15:45',
      'fr': '15h45',
      'zh_Hans': '下午3:45',
    },
    'jvyabv37': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'u8ed31im': {
      'en': '1h 12m • Direct',
      'ar': 'ساعة و12 دقيقة • مباشر',
      'es': '1h 12m • Direct',
      'fr': '1 h 12 min • Direct',
      'zh_Hans': '1小时12分钟 • 直达',
    },
    'wzau1bwr': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    '8bt5l848': {
      'en': 'Hotels',
      'ar': 'الفنادق',
      'es': 'Hoteles',
      'fr': 'Hôtels',
      'zh_Hans': '酒店',
    },
    'jj4z6c8j': {
      'en': 'Bellagio Hotel & Casino',
      'ar': 'فندق وكازينو بيلاجيو',
      'es': 'Hotel y casino Bellagio',
      'fr': 'Hôtel et casino Bellagio',
      'zh_Hans': '百乐宫酒店及赌场',
    },
    'ndz4ly7d': {
      'en': '4.8',
      'ar': '4.8',
      'es': '4.8',
      'fr': '4.8',
      'zh_Hans': '4.8',
    },
    'gecux00r': {
      'en': '\$289/night',
      'ar': '289 دولارًا في الليلة',
      'es': '\$289 por noche',
      'fr': '289 \$/nuit',
      'zh_Hans': '每晚289美元',
    },
    'mbe4daru': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'twkmm5u8': {
      'en': 'The Venetian Resort',
      'ar': 'منتجع فينيشيان',
      'es': 'El complejo turístico veneciano',
      'fr': 'Le Venetian Resort',
      'zh_Hans': '威尼斯人度假酒店',
    },
    'ckfojjg1': {
      'en': '4.7',
      'ar': '4.7',
      'es': '4.7',
      'fr': '4.7',
      'zh_Hans': '4.7',
    },
    '0m9djiz9': {
      'en': '\$329/night',
      'ar': '329 دولارًا في الليلة',
      'es': '\$329 por noche',
      'fr': '329 \$/nuit',
      'zh_Hans': '每晚 329 美元',
    },
    '4i623n4z': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    '0weo7d4c': {
      'en': 'Wynn Las Vegas',
      'ar': 'وين لاس فيغاس',
      'es': 'Wynn Las Vegas',
      'fr': 'Wynn Las Vegas',
      'zh_Hans': '永利拉斯维加斯',
    },
    'lscgwsgd': {
      'en': '4.9',
      'ar': '4.9',
      'es': '4.9',
      'fr': '4.9',
      'zh_Hans': '4.9',
    },
    'yukup44w': {
      'en': '\$399/night',
      'ar': '399 دولارًا في الليلة',
      'es': '\$399 por noche',
      'fr': '399 \$/nuit',
      'zh_Hans': '每晚 399 美元',
    },
    'f3qseesq': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'lnootijm': {
      'en': 'MGM Grand',
      'ar': 'إم جي إم جراند',
      'es': 'MGM Grand',
      'fr': 'MGM Grand',
      'zh_Hans': '米高梅大酒店',
    },
    'ulr3ioe3': {
      'en': '4.6',
      'ar': '4.6',
      'es': '4.6',
      'fr': '4.6',
      'zh_Hans': '4.6',
    },
    'dg49wmev': {
      'en': '\$219/night',
      'ar': '219 دولارًا في الليلة',
      'es': '\$219 por noche',
      'fr': '219 \$/nuit',
      'zh_Hans': '每晚219美元',
    },
    'dxmuufp7': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'w250n75v': {
      'en': 'Caesars Palace',
      'ar': 'قصر سيزرز',
      'es': 'Palacio de César',
      'fr': 'Palais de César',
      'zh_Hans': '凯撒宫',
    },
    'rsair87q': {
      'en': '4.7',
      'ar': '4.7',
      'es': '4.7',
      'fr': '4.7',
      'zh_Hans': '4.7',
    },
    '6g0ugf82': {
      'en': '\$349/night',
      'ar': '349 دولارًا في الليلة',
      'es': '\$349 por noche',
      'fr': '349 \$/nuit',
      'zh_Hans': '每晚 349 美元',
    },
    '9z3lue82': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'qp3t4zo9': {
      'en': 'Book',
      'ar': 'كتاب',
      'es': 'Libro',
      'fr': 'Livre',
      'zh_Hans': '书',
    },
  },
  // Landmarks
  {
    'd0pingkp': {
      'en': 'Landmarks',
      'ar': 'المعالم',
      'es': 'Monumentos',
      'fr': 'Monuments',
      'zh_Hans': '地标',
    },
    'nsf6r0p6': {
      'en': 'Bellagio Fountains',
      'ar': 'نوافير بيلاجيو',
      'es': 'Fuentes del Bellagio',
      'fr': 'Fontaines du Bellagio',
      'zh_Hans': '百乐宫喷泉',
    },
    '09qd4cnv': {
      'en': 'Iconic water show',
      'ar': 'عرض مائي مميز',
      'es': 'Espectáculo acuático emblemático',
      'fr': 'Spectacle aquatique emblématique',
      'zh_Hans': '标志性水舞表演',
    },
    'gnofmrmn': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    '4y8rehwc': {
      'en': 'Welcome to Faboulous Las Vegas sign',
      'ar': 'مرحباً بكم في لاس فيغاس الرائعة',
      'es': 'Letrero de bienvenida a la fabulosa Las Vegas',
      'fr': 'Bienvenue à Fabulous Las Vegas',
      'zh_Hans': '欢迎来到拉斯维加斯绝妙标志',
    },
    'yw54lnar': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'b4cvyvdk': {
      'en': 'Freemont Street',
      'ar': 'شارع فريمونت',
      'es': 'Calle Freemont',
      'fr': 'Rue Freemont',
      'zh_Hans': '弗里蒙特街',
    },
    'eh80ay5m': {
      'en': 'Iconic water show',
      'ar': 'عرض مائي مميز',
      'es': 'Espectáculo acuático emblemático',
      'fr': 'Spectacle aquatique emblématique',
      'zh_Hans': '标志性水舞表演',
    },
    'a2wgjvzw': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'hdyjuepp': {
      'en': 'The SRAT Tower',
      'ar': 'برج إس آر إيه تي',
      'es': 'La torre SRAT',
      'fr': 'La tour SRAT',
      'zh_Hans': 'SRAT塔',
    },
    'uajk3e09': {
      'en': 'Iconic water show',
      'ar': 'عرض مائي مميز',
      'es': 'Espectáculo acuático emblemático',
      'fr': 'Spectacle aquatique emblématique',
      'zh_Hans': '标志性水舞表演',
    },
    '5dndy09f': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'bdsx4d0k': {
      'en': 'Neon Museum',
      'ar': 'متحف النيون',
      'es': 'Museo del neón',
      'fr': 'Musée du Néon',
      'zh_Hans': '霓虹灯博物馆',
    },
    'ei459qba': {
      'en': 'Iconic water show',
      'ar': 'عرض مائي مميز',
      'es': 'Espectáculo acuático emblemático',
      'fr': 'Spectacle aquatique emblématique',
      'zh_Hans': '标志性水舞表演',
    },
    'bt1zb78m': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'dj69nudo': {
      'en': 'Luxur Sphinx  & Pyramid',
      'ar': 'أبو الهول والهرم الفاخر',
      'es': 'Esfinge y Pirámide de Lujo',
      'fr': 'Luxur Sphinx et Pyramide',
      'zh_Hans': '豪华狮身人面像和金字塔',
    },
    'pckrtgts': {
      'en': 'Iconic water show',
      'ar': 'عرض مائي مميز',
      'es': 'Espectáculo acuático emblemático',
      'fr': 'Spectacle aquatique emblématique',
      'zh_Hans': '标志性水舞表演',
    },
    '0ubmh91m': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    '5vj3p9mc': {
      'en': 'Eiffel Tower Replica',
      'ar': 'نسخة طبق الأصل من برج إيفل',
      'es': 'Réplica de la Torre Eiffel',
      'fr': 'Réplique de la Tour Eiffel',
      'zh_Hans': '埃菲尔铁塔复制品',
    },
    '5nbbvu6u': {
      'en': 'Iconic water show',
      'ar': 'عرض مائي مميز',
      'es': 'Espectáculo acuático emblemático',
      'fr': 'Spectacle aquatique emblématique',
      'zh_Hans': '标志性水舞表演',
    },
    'dwwgetm4': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
  },
  // Events
  {
    '724q9lav': {
      'en': 'Events',
      'ar': 'الفعاليات',
      'es': 'Eventos',
      'fr': 'Événements',
      'zh_Hans': '活动',
    },
    'pew4hfib': {
      'en': 'Tiesto',
      'ar': 'تيستو',
      'es': 'Tiesto',
      'fr': 'Tiesto',
      'zh_Hans': '铁斯托',
    },
    'xjb6du6n': {
      'en': 'OMNIA Nightclub, Ceasers Palace',
      'ar': 'ملهى أومنيا الليلي، قصر سيزرز',
      'es': 'Discoteca OMNIA, Caesars Palace',
      'fr': 'Boîte de nuit OMNIA, Caesars Palace',
      'zh_Hans': 'OMNIA 夜总会，凯撒宫',
    },
    'dlttfgvi': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    '7aredebb': {
      'en': 'David Copperfield',
      'ar': 'ديفيد كوبرفيلد',
      'es': 'David Copperfield',
      'fr': 'David Copperfield',
      'zh_Hans': '大卫·科波菲尔',
    },
    'dng04u7w': {
      'en': 'David Copperfield Theater, MGM Grand',
      'ar': 'مسرح ديفيد كوبرفيلد، إم جي إم جراند',
      'es': 'Teatro David Copperfield, MGM Grand',
      'fr': 'Théâtre David Copperfield, MGM Grand',
      'zh_Hans': '米高梅大酒店的大卫·科波菲尔剧院',
    },
    'ou9da87f': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    '410irs5k': {
      'en': 'Cirque du Soleil',
      'ar': 'سيرك دو سوليه',
      'es': 'Cirque du Soleil',
      'fr': 'Cirque du Soleil',
      'zh_Hans': '太阳马戏团',
    },
    'jtq4wlvt': {
      'en': 'Mystère Theatre, Treasure Island',
      'ar': 'مسرح ميستير، جزيرة الكنز',
      'es': 'Teatro Mystère, La Isla del Tesoro',
      'fr': 'Théâtre Mystère, Île au Trésor',
      'zh_Hans': '金银岛神秘剧院',
    },
    'dou04mb2': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'dnfyda0c': {
      'en': 'Blue Man Group',
      'ar': 'فرقة بلو مان',
      'es': 'Grupo Blue Man',
      'fr': 'Groupe Blue Man',
      'zh_Hans': '蓝人组合',
    },
    'fmbwqlmr': {
      'en': 'Blue Man Theater, The Luxor Hotel',
      'ar': 'مسرح بلو مان، فندق لوكسور',
      'es': 'Teatro Blue Man, Hotel Luxor',
      'fr': 'Théâtre Blue Man, Hôtel Luxor',
      'zh_Hans': '蓝人剧院，卢克索酒店',
    },
    'qecbudcy': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    '8gig7h0u': {
      'en': 'Dom Dolla w/ Justin Mylo',
      'ar': 'دوم دولا مع جاستن مايلو',
      'es': 'Dom Dolla con Justin Mylo',
      'fr': 'Dom Dolla avec Justin Mylo',
      'zh_Hans': 'Dom Dolla 与 Justin Mylo',
    },
    'tajb4cg5': {
      'en': 'OMNIA Nightclub, Ceasers Palace',
      'ar': 'ملهى أومنيا الليلي، قصر سيزرز',
      'es': 'Discoteca OMNIA, Caesars Palace',
      'fr': 'Boîte de nuit OMNIA, Caesars Palace',
      'zh_Hans': 'OMNIA 夜总会，凯撒宫',
    },
    'wumnohep': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'e87yopmg': {
      'en': 'Meduza',
      'ar': 'ميدوزا',
      'es': 'Medusa',
      'fr': 'Méduza',
      'zh_Hans': '美杜莎',
    },
    'av3otcs5': {
      'en': 'Zouk Nightclub',
      'ar': 'ملهى زوك الليلي',
      'es': 'Discoteca Zouk',
      'fr': 'Boîte de nuit Zouk',
      'zh_Hans': 'Zouk夜总会',
    },
    '44wzumj0': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
  },
  // ResultsCopy
  {
    'i5ysqjvw': {
      'en':
          'I live in Phoenix I want to spend the upcoming weekend in Las Vegas with my friend and go party but also see special historic landmarks, we want to fly and stay at a 4 star casino.',
      'ar':
          'أعيش في فينيكس، وأريد قضاء عطلة نهاية الأسبوع القادمة في لاس فيغاس مع صديقي، والذهاب للاحتفال، ولكن أيضاً زيارة المعالم التاريخية المميزة، ونريد السفر جواً والإقامة في كازينو من فئة 4 نجوم.',
      'es':
          'Vivo en Phoenix y quiero pasar el próximo fin de semana en Las Vegas con mi amigo, ir de fiesta y también visitar lugares históricos especiales. Queremos volar y alojarnos en un casino de 4 estrellas.',
      'fr':
          'J\'habite à Phoenix et je souhaite passer le week-end prochain à Las Vegas avec mon ami pour faire la fête mais aussi visiter des sites historiques importants. Nous voulons prendre l\'avion et séjourner dans un casino 4 étoiles.',
      'zh_Hans':
          '我住在凤凰城，想和朋友一起在即将到来的周末去拉斯维加斯玩乐，也想参观一些特别的历史地标。我们想飞过去，住在一家四星级赌场酒店。',
    },
    'a32q3nlg': {
      'en': 'Researching your destination...',
      'ar': 'البحث عن وجهتك...',
      'es': 'Investigando tu destino...',
      'fr': 'Vous recherchez votre destination...',
      'zh_Hans': '研究您的目的地……',
    },
    'y41ja30h': {
      'en':
          'Here is your trip information to destination Las Vegas, select the options you want. Let me know if you want to refine your search.',
      'ar':
          'إليك معلومات رحلتك إلى لاس فيغاس، اختر الخيارات التي تناسبك. أخبرني إن كنت ترغب في تحسين بحثك.',
      'es':
          'Aquí tienes la información de tu viaje a Las Vegas. Selecciona las opciones que prefieras. Avísame si quieres refinar tu búsqueda.',
      'fr':
          'Voici les informations concernant votre voyage à Las Vegas. Sélectionnez les options qui vous intéressent. N\'hésitez pas à me contacter si vous souhaitez affiner votre recherche.',
      'zh_Hans': '以下是您前往拉斯维加斯的行程信息，请选择您需要的选项。如果您想进一步筛选搜索结果，请告诉我。',
    },
    'jgxvhcq5': {
      'en': 'Describe additional details about your trip',
      'ar': 'صف تفاصيل إضافية حول رحلتك',
      'es': 'Describe detalles adicionales sobre tu viaje.',
      'fr': 'Décrivez plus en détail votre voyage',
      'zh_Hans': '请详细描述您的旅行情况',
    },
    'pzwsgglf': {
      'en': 'Voice Mode',
      'ar': 'وضع الصوت',
      'es': 'Modo de voz',
      'fr': 'Mode vocal',
      'zh_Hans': '语音模式',
    },
    'rsnd4n3g': {
      'en': 'Flights',
      'ar': 'رحلات جوية',
      'es': 'Vuelos',
      'fr': 'Vols',
      'zh_Hans': '航班',
    },
    'c7gltt5j': {
      'en': 'Delta Airlines',
      'ar': 'خطوط دلتا الجوية',
      'es': 'Delta Airlines',
      'fr': 'Delta Airlines',
      'zh_Hans': '达美航空',
    },
    '3cghuyyh': {
      'en': 'DL 2150',
      'ar': 'DL 2150',
      'es': 'DL 2150',
      'fr': 'DL 2150',
      'zh_Hans': 'DL 2150',
    },
    '8lfm0qtw': {
      'en': '\$325',
      'ar': '325 دولارًا',
      'es': '\$325',
      'fr': '325 \$',
      'zh_Hans': '325美元',
    },
    'y24ia4ol': {
      'en': '2:10 PM',
      'ar': '2:10 مساءً',
      'es': '14:10',
      'fr': '14h10',
      'zh_Hans': '下午2:10',
    },
    '5womz1o3': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    '768enkfu': {
      'en': '1h 25m • Direct',
      'ar': 'ساعة و25 دقيقة • مباشر',
      'es': '1h 25m • Direct',
      'fr': '1 h 25 min • Direct',
      'zh_Hans': '1小时25分钟 • 直达',
    },
    'zh8vbkg8': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'vgbe957c': {
      'en': 'Southwest',
      'ar': 'جنوب غرب',
      'es': 'Suroeste',
      'fr': 'Sud-ouest',
      'zh_Hans': '西南',
    },
    'sxowkdmt': {
      'en': 'WN 2421',
      'ar': 'WN 2421',
      'es': 'WN 2421',
      'fr': 'WN 2421',
      'zh_Hans': 'WN 2421',
    },
    'esg0phvm': {
      'en': '\$199',
      'ar': '199 دولارًا',
      'es': '\$199',
      'fr': '199 \$',
      'zh_Hans': '199美元',
    },
    'pbe3wck9': {
      'en': '8:45 PM',
      'ar': '8:45 مساءً',
      'es': '20:45',
      'fr': '20h45',
      'zh_Hans': '晚上8:45',
    },
    '8zjbi8m7': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'njro7evr': {
      'en': '1h 10m • Direct',
      'ar': 'ساعة و10 دقائق • مباشر',
      'es': '1h 10m • Direct',
      'fr': '1 h 10 min • Direct',
      'zh_Hans': '1小时10分钟 • 直达',
    },
    '99xyt5m3': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    '3zqmxbx7': {
      'en': 'American Airlines',
      'ar': 'الخطوط الجوية الأمريكية',
      'es': 'American Airlines',
      'fr': 'American Airlines',
      'zh_Hans': '美国航空公司',
    },
    '9vdemfuu': {
      'en': 'AA 1534',
      'ar': 'AA 1534',
      'es': 'AA 1534',
      'fr': 'AA 1534',
      'zh_Hans': 'AA 1534',
    },
    '7wodso7x': {
      'en': '\$215',
      'ar': '215 دولارًا',
      'es': '\$215',
      'fr': '215 \$',
      'zh_Hans': '215美元',
    },
    'ugj2xhmj': {
      'en': '6:30 AM',
      'ar': '6:30 صباحاً',
      'es': '6:30 AM',
      'fr': '6h30',
      'zh_Hans': '早上6:30',
    },
    'ik43bfdt': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    '3jc7q20t': {
      'en': '1h 15m • Direct',
      'ar': 'ساعة و15 دقيقة • مباشر',
      'es': '1h 15m • Direct',
      'fr': '1 h 15 min • Direct',
      'zh_Hans': '1小时15分钟 • 直达',
    },
    'k6vqiaf2': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'xst5hddo': {
      'en': 'United Airlines',
      'ar': 'الخطوط الجوية المتحدة',
      'es': 'United Airlines',
      'fr': 'United Airlines',
      'zh_Hans': '联合航空公司',
    },
    'qdh3d3xf': {
      'en': 'UA 892',
      'ar': 'UA 892',
      'es': 'UA 892',
      'fr': 'UA 892',
      'zh_Hans': 'UA 892',
    },
    '4sqj32qe': {
      'en': '\$289',
      'ar': '289 دولارًا',
      'es': '\$289',
      'fr': '289 \$',
      'zh_Hans': '289美元',
    },
    '07wxi2un': {
      'en': '11:20 AM',
      'ar': '11:20 صباحاً',
      'es': '11:20 AM',
      'fr': '11h20',
      'zh_Hans': '上午11:20',
    },
    'dvymphcp': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'l5rl9odh': {
      'en': '1h 20m • Direct',
      'ar': 'ساعة و20 دقيقة • مباشر',
      'es': '1h 20m • Direct',
      'fr': '1 h 20 min • Direct',
      'zh_Hans': '1小时20分钟 • 直达',
    },
    'keqrpoqf': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'y21ealvf': {
      'en': 'Frontier Airlines',
      'ar': 'خطوط فرونتير الجوية',
      'es': 'Frontier Airlines',
      'fr': 'Frontier Airlines',
      'zh_Hans': '边疆航空',
    },
    'g9tq122m': {
      'en': 'F9 1056',
      'ar': 'F9 1056',
      'es': 'F9 1056',
      'fr': 'F9 1056',
      'zh_Hans': 'F9 1056',
    },
    'b5i6ai8i': {
      'en': '\$16',
      'ar': '16 دولارًا',
      'es': '\$16',
      'fr': '16 \$',
      'zh_Hans': '16美元',
    },
    '68380m55': {
      'en': '3:45 PM',
      'ar': '3:45 مساءً',
      'es': '15:45',
      'fr': '15h45',
      'zh_Hans': '下午3:45',
    },
    'v6cnbnmh': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'eeeoshwr': {
      'en': '1h 12m • Direct',
      'ar': 'ساعة و12 دقيقة • مباشر',
      'es': '1h 12m • Direct',
      'fr': '1 h 12 min • Direct',
      'zh_Hans': '1小时12分钟 • 直达',
    },
    'eu2nvyyn': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'lwci4fxf': {
      'en': 'Southwest',
      'ar': 'جنوب غرب',
      'es': 'Suroeste',
      'fr': 'Sud-ouest',
      'zh_Hans': '西南',
    },
    'z9t4skkr': {
      'en': 'WN 2420',
      'ar': 'WN 2420',
      'es': 'WN 2420',
      'fr': 'WN 2420',
      'zh_Hans': 'WN 2420',
    },
    'fufdo29n': {
      'en': '\$269',
      'ar': '269 ​​دولارًا',
      'es': '\$269',
      'fr': '269 ​​\$',
      'zh_Hans': '269美元',
    },
    '6n0hthwe': {
      'en': '12:35 PM',
      'ar': '12:35 مساءً',
      'es': '12:35 p. m.',
      'fr': '12h35',
      'zh_Hans': '下午12:35',
    },
    '5oodoq0i': {
      'en': 'PHX → LAS',
      'ar': 'فينيكس → لاس',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    '8xcv386g': {
      'en': '1h 10m • Direct',
      'ar': 'ساعة و10 دقائق • مباشر',
      'es': '1h 10m • Direct',
      'fr': '1 h 10 min • Direct',
      'zh_Hans': '1小时10分钟 • 直达',
    },
    'n0iqstc1': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    '1gojruwk': {
      'en': 'Hotels',
      'ar': 'الفنادق',
      'es': 'Hoteles',
      'fr': 'Hôtels',
      'zh_Hans': '酒店',
    },
    'c8ynmvf3': {
      'en': 'Bellagio Hotel & Casino',
      'ar': 'فندق وكازينو بيلاجيو',
      'es': 'Hotel y casino Bellagio',
      'fr': 'Hôtel et casino Bellagio',
      'zh_Hans': '百乐宫酒店及赌场',
    },
    'fpt5jvtj': {
      'en': '4.8',
      'ar': '4.8',
      'es': '4.8',
      'fr': '4.8',
      'zh_Hans': '4.8',
    },
    '3aetem40': {
      'en': '\$289/night',
      'ar': '289 دولارًا في الليلة',
      'es': '\$289 por noche',
      'fr': '289 \$/nuit',
      'zh_Hans': '每晚289美元',
    },
    'zqbgb3iy': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    '77s93wmi': {
      'en': 'The Venetian Resort',
      'ar': 'منتجع فينيشيان',
      'es': 'El complejo turístico veneciano',
      'fr': 'Le Venetian Resort',
      'zh_Hans': '威尼斯人度假酒店',
    },
    'c3n0y4ob': {
      'en': '4.7',
      'ar': '4.7',
      'es': '4.7',
      'fr': '4.7',
      'zh_Hans': '4.7',
    },
    'e98oy2eu': {
      'en': '\$329/night',
      'ar': '329 دولارًا في الليلة',
      'es': '\$329 por noche',
      'fr': '329 \$/nuit',
      'zh_Hans': '每晚 329 美元',
    },
    'inypgwmi': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'l8dxzn3s': {
      'en': 'Wynn Las Vegas',
      'ar': 'وين لاس فيغاس',
      'es': 'Wynn Las Vegas',
      'fr': 'Wynn Las Vegas',
      'zh_Hans': '永利拉斯维加斯',
    },
    '93bsgco4': {
      'en': '4.9',
      'ar': '4.9',
      'es': '4.9',
      'fr': '4.9',
      'zh_Hans': '4.9',
    },
    'f97pqr75': {
      'en': '\$399/night',
      'ar': '399 دولارًا في الليلة',
      'es': '\$399 por noche',
      'fr': '399 \$/nuit',
      'zh_Hans': '每晚 399 美元',
    },
    'rhhr2scg': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'me5hdasc': {
      'en': 'MGM Grand',
      'ar': 'إم جي إم جراند',
      'es': 'MGM Grand',
      'fr': 'MGM Grand',
      'zh_Hans': '米高梅大酒店',
    },
    'q2uge9sh': {
      'en': '4.6',
      'ar': '4.6',
      'es': '4.6',
      'fr': '4.6',
      'zh_Hans': '4.6',
    },
    's7jcnlnd': {
      'en': '\$219/night',
      'ar': '219 دولارًا في الليلة',
      'es': '\$219 por noche',
      'fr': '219 \$/nuit',
      'zh_Hans': '每晚219美元',
    },
    'qd7y8dwd': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'd16qql8t': {
      'en': 'Caesars Palace',
      'ar': 'قصر سيزرز',
      'es': 'Palacio de César',
      'fr': 'Palais de César',
      'zh_Hans': '凯撒宫',
    },
    '2z01hrp3': {
      'en': '4.7',
      'ar': '4.7',
      'es': '4.7',
      'fr': '4.7',
      'zh_Hans': '4.7',
    },
    '45ffm9ut': {
      'en': '\$349/night',
      'ar': '349 دولارًا في الليلة',
      'es': '\$349 por noche',
      'fr': '349 \$/nuit',
      'zh_Hans': '每晚 349 美元',
    },
    'h4r55grf': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'yj0cnu1r': {
      'en': 'Mandalay Bay',
      'ar': 'خليج ماندالاي',
      'es': 'Mandalay Bay',
      'fr': 'Baie de Mandalay',
      'zh_Hans': '曼德勒海湾',
    },
    'wvmxxjut': {
      'en': '4.2',
      'ar': '4.2',
      'es': '4.2',
      'fr': '4.2',
      'zh_Hans': '4.2',
    },
    'f3bp6uo9': {
      'en': '\$249/night',
      'ar': '249 دولارًا في الليلة',
      'es': '\$249 por noche',
      'fr': '249 \$/nuit',
      'zh_Hans': '每晚249美元',
    },
    'npinvs2c': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'uli2cot9': {
      'en': 'The LINQ',
      'ar': 'لينك',
      'es': 'El LINQ',
      'fr': 'Le LINQ',
      'zh_Hans': 'LINQ',
    },
    '1kn2s35q': {
      'en': '4.3',
      'ar': '4.3',
      'es': '4.3',
      'fr': '4.3',
      'zh_Hans': '4.3',
    },
    '1lw4qfm9': {
      'en': '\$349/night',
      'ar': '349 دولارًا في الليلة',
      'es': '\$349 por noche',
      'fr': '349 \$/nuit',
      'zh_Hans': '每晚 349 美元',
    },
    'si5oa873': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    '8ljrb3ff': {
      'en': 'Book',
      'ar': 'كتاب',
      'es': 'Libro',
      'fr': 'Livre',
      'zh_Hans': '书',
    },
  },
  // TripPlanner
  {
    'fe4tbgk0': {
      'en': 'Plan Your Trip',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'v4wg1vl9': {
      'en': 'Your personalized trip planner for smart travelers 🌍 ✈️',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'zoxbsxwl': {
      'en':
          'Experience stress-free travel planning with Kitravia! Kitravia helps you plan incredible local and international trips ✈️ 🌍, tailored to your budget. Discover top destinations, cheap flights, accommodations, activities, tour packages, car rentals, and more! Travel like a pro ⭐',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'oacbd0uo': {
      'en': '📋',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'kl1wcngo': {
      'en': 'Help me plan a trip...',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'mqjmakt0': {
      'en': '📍',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ztook66l': {
      'en': 'Suggest a new place to visit',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'z6fvu3b4': {
      'en': '💰',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'potw1iyx': {
      'en': 'Plan a budget-friendly getaway',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '1q27g4g2': {
      'en': '🚗',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'tazhzjvs': {
      'en': 'Road trip to Los Angeles, 3 days, 2 friends',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'db1ir0hg': {
      'en': 'Where should Kitravia take you today?',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'vyoe7wod': {
      'en': 'Voice Mode',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'u8w77qsu': {
      'en':
          'Kitravia can make mistakes. Double check important information before completing booking transaction.',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // TripForm
  {
    'g8c3bf74': {
      'en': 'Back to Search',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '5f3jj936': {
      'en': 'Plan Your Trip',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'nc9n2ckl': {
      'en': 'Tell us about your travel plans and preferences',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '5k7tnbyk': {
      'en': 'Destination',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'u16akcl6': {
      'en': 'New York City',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'oexrwhag': {
      'en': 'Number of Travelers',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'q29ujui3': {
      'en': '3',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'gqasc05z': {
      'en': 'Start Date',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'pxddczik': {
      'en': '05/01/2026',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '1e0khhvo': {
      'en': 'End Date',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'h0pl2m2g': {
      'en': '05/03/2026',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'rrqbpqjo': {
      'en': 'Type of Travel (select all that apply)',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '93hn7fr3': {
      'en':
          'Leisure\" \\ \"Cultural\" \\ \"Culinary\" \\ \"Shopping\" \\ \"Adventure\" \\ \"Business',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'nd6rmf9l': {
      'en': 'Accommodation Preference',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '22ccv36s': {
      'en': 'Hotel',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'rk9wp0tz': {
      'en': 'Hotel',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'emge086n': {
      'en': 'Hostel',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'zrv8zxwb': {
      'en': 'Airbnb',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'n7itmior': {
      'en': 'Resort',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'kum2d949': {
      'en': 'Camping',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'bnd8nf1d': {
      'en': 'Dining Preference',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'y3327wmo': {
      'en': 'Local',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '6pzq1ehl': {
      'en': 'Local',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'zrhrotmt': {
      'en': 'Fine Dining',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'z64pjn14': {
      'en': 'Fast Food',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '0hxjh1bz': {
      'en': 'Vegetarian',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '3xiv2n5z': {
      'en': 'Vegan',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ssri8uye': {
      'en': 'Transport Preference',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'pduq1y8e': {
      'en': 'Public Transport',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'zyvjhl1w': {
      'en': 'Public Transport',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'l0wzfh7e': {
      'en': 'Car Rental',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'rb2athk9': {
      'en': 'Taxi',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '1b29ylvd': {
      'en': 'Walking',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '5bvmwqbm': {
      'en': 'Cycling',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ms05m5fh': {
      'en': 'Budget Range (Optional)',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '6yy4e9u6': {
      'en': '2000',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '6ysjj1u2': {
      'en': 'Generate My Itinerary',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // CompleteBookingForm
  {
    'uhpt8s4y': {
      'en': 'Complete Your Booking',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'hjk3ttr0': {
      'en': 'Contact Information',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7iw50elb': {
      'en': 'Full Name',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'bu31c5vb': {
      'en': 'John Doe',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'd9hzuvl8': {
      'en': 'Email',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    's99h3mbh': {
      'en': 'john@example.com',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'sgq7o0u5': {
      'en': 'Phone Number',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '10kcqhoi': {
      'en': '+1 (555) 123-4567',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'og6bcw1b': {
      'en': 'Payment Information',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7gtjg68m': {
      'en': 'Card Number',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'tsw5n72m': {
      'en': '1234 5678 9012 3456',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'hdaixc0s': {
      'en': 'Expiry Date',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7c5xssyc': {
      'en': 'MM/YY',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '6okd19oa': {
      'en': 'CVV',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'oqb951rl': {
      'en': '123',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'o1w5gxlb': {
      'en': 'Billing Address',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'nhq87lf2': {
      'en': 'Street Address',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'u86l1wwg': {
      'en': '123 Main St',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ef66exns': {
      'en': 'City',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '0mr2aadd': {
      'en': 'New York',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'j9qtvnek': {
      'en': 'ZIP Code',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'c1w7lxya': {
      'en': '10001',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '4cydzf7y': {
      'en': 'Country',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'x3q583y0': {
      'en': 'United States',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7rwi2okm': {
      'en': 'Total Amount',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'rwcno4xp': {
      'en': '\$1720.48',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'eezwz479': {
      'en': 'Cancel',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '47r7wwqi': {
      'en': 'Confirm Payment',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // FlightMoreInfoMenu
  {
    'sm0s0ttz': {
      'en': 'United Airlines - UA 892',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'z56d70fw': {
      'en': 'Flight Details:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'vpjmgc9p': {
      'en': 'United Airlines UA 892',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '0mfx0ttr': {
      'en': 'Departure:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '4cyhtb32': {
      'en': '11:20 AM',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ktu2fnyc': {
      'en': 'Route:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ea3v7i4q': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'srxmfbns': {
      'en': 'Duration:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'fblzydsl': {
      'en': '1h 20m',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '690k3fqf': {
      'en': 'Stops:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'v6v7gyuw': {
      'en': 'Direct',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9rr81ei8': {
      'en': 'Aircraft:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'p6lqa3jh': {
      'en': 'Boeing 737-800',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '484h4rv6': {
      'en': 'Baggage:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'akdp3bfy': {
      'en': '1 carry-on, 1 checked bag included',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'pdtyoezo': {
      'en': 'Seat Selection:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7ginzm3j': {
      'en': 'Available for \$25',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'dutoznue': {
      'en': 'Close',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // HotelMoreInfo
  {
    'jh319f32': {
      'en': 'Wynn Las Vegas',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ho1oq27g': {
      'en': 'Name:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    's8avg7nl': {
      'en': 'Wynn Las Vegas',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'gcojaq8c': {
      'en': 'Location:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ewb5ohfz': {
      'en': '4.9',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'cpt66ga9': {
      'en': 'Price:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '1ljqw92a': {
      'en': '\$399/night',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'rg98ryvg': {
      'en': 'Amenities:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'wbniysek': {
      'en': 'Pool, Spa, Fitness Center, Restaurant',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    's8ou6xyx': {
      'en': 'Check-in:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '2pxdx17u': {
      'en': '3:00 PM',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'bkyj84yh': {
      'en': 'Check-out:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'mh6g5p1e': {
      'en': '11:00 AM',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'e0yyknxn': {
      'en': 'Cancellation:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '2kpau0or': {
      'en': 'Free cancellation up to 24 hours before',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'qdl49953': {
      'en': 'Close',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // EventMoreInfo
  {
    'ysfu96nf': {
      'en': 'Blue Man Theatre (The Luxor)',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '4tth2xxw': {
      'en': 'Name:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'n0iyjar7': {
      'en': 'Blue Man Theatre (The Luxor)',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'p1q13ky7': {
      'en': 'Location:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'yudqs4gl': {
      'en': 'Luxor Hotel',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9ho3au7g': {
      'en': 'Date:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'jpme2ljn': {
      'en': 'Apr 18, 2026',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '037qfwwd': {
      'en': 'Duration:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'cf8lr0bu': {
      'en': '2-3 hours',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'y4m1wdum': {
      'en': 'Tickets:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'dl0vumwc': {
      'en': 'Available online',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9tqepch1': {
      'en': 'Age Restriction:',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    't52gebmz': {
      'en': '18+',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // BookingConfirmation
  {
    '5vorfo1v': {
      'en': 'Thank You for Your Booking!',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'zu8uiv5o': {
      'en':
          'Your trip has been confirmed. We\'ve sent a confirmation email with all the details.',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '683p5rwb': {
      'en': 'Booking Reference',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'sw908eqz': {
      'en': 'KT8JI8UM6BY',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9z9wg6g8': {
      'en': 'Total Paid',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '00kysmh6': {
      'en': '\$40.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7ozx7ow7': {
      'en': 'Booking Summary',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'pp0ah9lp': {
      'en': 'Subtotal',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'yfge3ojq': {
      'en': '\$0.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '77q7hnis': {
      'en': 'Taxes (8%)',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    't542zut2': {
      'en': '\$0.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ct8ar3sm': {
      'en': 'Service Fee',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '8hyvm5ez': {
      'en': '\$40.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '12tnhdpb': {
      'en': 'Total Paid',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'pr6fzvqc': {
      'en': '\$40.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '86x2m1kj': {
      'en': 'Trip Details',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'hvcbyvvs': {
      'en': 'Travel Dates',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'alh410c2': {
      'en': 'April 11-13, 2026',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'm0nh30u9': {
      'en': 'Destination',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'qhqv000t': {
      'en': 'Las Vegas, Nevada',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'qb342wne': {
      'en': 'Travelers',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '2cv3vr80': {
      'en': '2 Adults',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'm17e8r1a': {
      'en': 'Confirmation Sent To',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'dodr5dw9': {
      'en': 'your@email.com',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'gk0lu0jf': {
      'en': 'What\'s Next?',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'mi3z3kkk': {
      'en': '1',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'xhmt9adf': {
      'en': 'Check your email for detailed booking confirmations and e-tickets',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '5z04oeps': {
      'en': '2',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '2rrarkht': {
      'en': 'Complete online check-in 24 hours before your flight',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ckc2bmcs': {
      'en': '3',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'zg404nns': {
      'en': 'Download the KiTravia app to manage your trip on the go',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'bbrbqvhk': {
      'en': 'Plan Another Trip',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '0k6mv2gt': {
      'en': 'Print Confirmation',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // TripItineraryOutput
  {
    'g03fmdqz': {
      'en': 'Plan Another Trip',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'nrs5vl37': {
      'en': 'Export as PDF',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'w5ykyoee': {
      'en': 'Las Vegas Trip Itinerary',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ro9mny8c': {
      'en': 'Book your Trip',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '994n2h1l': {
      'en': '2026-05-15 to 2026-05-15',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '5nrzns2r': {
      'en': '2 Travelers',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'uuy9mwzn': {
      'en': 'Total Budget: \$1,403.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'wmp95vge': {
      'en': 'Flights',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '18lnfjxa': {
      'en': '\$1,000.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '558u4vfy': {
      'en': 'Accommodation',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'mo2dosx9': {
      'en': '\$0.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'yoyclucc': {
      'en': 'Meals',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'b84t9cns': {
      'en': '\$135.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'vo122m1h': {
      'en': 'Activities',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ydgh1t63': {
      'en': '\$35.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'i50wlnht': {
      'en': 'Transport',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '4sgvg6ov': {
      'en': '\$50.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'qby7pvig': {
      'en': 'Contingency',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'kquc5289': {
      'en': '\$183.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'es05fzzo': {
      'en': 'Day 1 - Thu, May 14',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'gnh7i0ee': {
      'en': 'Daily Budget: \$220.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '1b0z4tkt': {
      'en': 'Time',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'yrp7fzv5': {
      'en': 'Activity',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'fkgq9oil': {
      'en': 'Details',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'vnukedtn': {
      'en': 'Cost',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'kt8v58uh': {
      'en': 'Morning',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'az9kjka3': {
      'en': 'The Strip Walking Tour',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'y2l2i7ul': {
      'en': '2-3 hours',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'b08kgpud': {
      'en': 'Explore iconic casinos and hotels',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'j9gsqhfz': {
      'en': '\$0.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '5tc2b65d': {
      'en': 'Lunch',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'u0j9d1ts': {
      'en': 'Hash House A Go Go',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '3uee21gc': {
      'en': 'American',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'wt49rhl6': {
      'en': 'The LINQ',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '1ft4ds0e': {
      'en': '\$25.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ng2t7ea8': {
      'en': 'Afternoon',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'p8fdwl9z': {
      'en': 'Bellagio Fountains',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'qbfnw5pc': {
      'en': '30 minutes',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'uix1daup': {
      'en': 'Free spectacular water show',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'q9twdbnt': {
      'en': 'Visit Website',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '1dietqbi': {
      'en': '\$0.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'dvmvwwfc': {
      'en': 'Dinner',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'rmmxq816': {
      'en': 'Gordon Ramsay Hell\'s Kitchen',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'lle0gtd5': {
      'en': 'Contemporary',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'emboylp0': {
      'en': 'Caesars Palace',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'rqma27wi': {
      'en': '\$95.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'n5kcodqs': {
      'en': 'Evening',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'lhsijdgn': {
      'en': 'High Roller Observation Wheel',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'v2ex28ic': {
      'en': '30 minutes',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '0vlrq70o': {
      'en': 'World\'s tallest observation wheel',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    're2sd3wl': {
      'en': 'Visit Website',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'oyra26w6': {
      'en': '\$35.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'lhzfnkaq': {
      'en': 'Transport',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'dxyhdlel': {
      'en': 'Taxi: Hotel → The Strip Walking Tour',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'u2fe7m93': {
      'en': 'Taxi: The Strip Walking Tour → Bellagio Fountains',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'js9mz3mr': {
      'en': 'Taxi: Bellagio Fountains → Hotel',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'me04pn2c': {
      'en': '\$50.00',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'jstrj01l': {
      'en': 'Travel Tips for Las Vegas',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'xdx49vq4': {
      'en': '•',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'xiuv3jtv': {
      'en': 'Book attractions in advance to skip the lines and save time',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'cuge267x': {
      'en': '•',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'lrl7qt1w': {
      'en': 'Download offline maps before your trip for easy navigation',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'p0qn72rk': {
      'en': '•',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'n4pq7901': {
      'en': 'Consider a city pass for bundled attractions at a discounted rate',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'gh2mv8sd': {
      'en': '•',
      'ar': '•',
      'es': '•',
      'fr': '•',
      'zh_Hans': '•',
    },
    '1elcadko': {
      'en':
          'Keep a 15% contingency buffer for unexpected expenses and spontaneous activities',
      'ar':
          'احتفظ باحتياطي بنسبة 15% لتغطية النفقات غير المتوقعة والأنشطة العفوية',
      'es':
          'Mantenga un margen de contingencia del 15% para gastos inesperados y actividades espontáneas.',
      'fr':
          'Prévoyez une marge de prévoyance de 15 % pour les dépenses imprévues et les activités spontanées.',
      'zh_Hans': '预留 15% 的应急资金，以应对意外支出和突发活动。',
    },
  },
  // BookingConfirmationReference
  {
    'p7nx5plz': {
      'en': 'Thank You for  Booking with ',
      'ar': 'نشكرك على الحجز معنا',
      'es': 'Gracias por reservar con nosotros.',
      'fr': 'Merci d\'avoir réservé avec',
      'zh_Hans': '感谢您通过我们预订',
    },
    'f7fvcbqi': {
      'en':
          'Your trip has been confirmed. We\'ve sent a confirmation email with all the details.',
      'ar':
          'تم تأكيد رحلتك. لقد أرسلنا بريدًا إلكترونيًا للتأكيد يحتوي على جميع التفاصيل.',
      'es':
          'Su viaje ha sido confirmado. Le hemos enviado un correo electrónico de confirmación con todos los detalles.',
      'fr':
          'Votre voyage a été confirmé. Nous vous avons envoyé un courriel de confirmation contenant tous les détails.',
      'zh_Hans': '您的行程已确认。我们已发送确认邮件，其中包含所有详细信息。',
    },
    'ixzet9lk': {
      'en': 'Booking Reference',
      'ar': 'رقم الحجز المرجعي',
      'es': 'Referencia de reserva',
      'fr': 'Référence de réservation',
      'zh_Hans': '预订参考号',
    },
    'qyhdi92h': {
      'en': 'KT3NXY1AHOY',
      'ar': 'KT3NXY1AHOY',
      'es': 'KT3NXY1AHOY',
      'fr': 'KT3NXY1AHOY',
      'zh_Hans': 'KT3NXY1AHOY',
    },
    'qn8zhf3g': {
      'en': 'Total Paid',
      'ar': 'إجمالي المبلغ المدفوع',
      'es': 'Total pagado',
      'fr': 'Total payé',
      'zh_Hans': '已付总额',
    },
    'phzr7ohw': {
      'en': '\$1753.92',
      'ar': '1753.92 دولارًا',
      'es': '\$1753.92',
      'fr': '1753,92 \$',
      'zh_Hans': '1753.92美元',
    },
    'l7tekgjn': {
      'en': 'Booking Summary',
      'ar': 'ملخص الحجز',
      'es': 'Resumen de la reserva',
      'fr': 'Résumé de la réservation',
      'zh_Hans': '预订概要',
    },
    'm0g374iq': {
      'en': 'United Airlines - UA 892',
      'ar': 'الخطوط الجوية المتحدة - الرحلة رقم 892',
      'es': 'United Airlines - UA 892',
      'fr': 'United Airlines - UA 892',
      'zh_Hans': '联合航空 - UA 892',
    },
    '0xon2xy7': {
      'en': 'PHX → LAS • 1h 20m',
      'ar': 'فينيكس → لاس فيغاس • ساعة و20 دقيقة',
      'es': 'PHX → LAS • 1h 20m',
      'fr': 'PHX → LAS • 1h 20m',
      'zh_Hans': '凤凰城 → 拉斯维加斯 • 1小时20分钟',
    },
    '4agqgb4s': {
      'en': 'Departure: 11:20 AM • Direct • Economy Class',
      'ar': 'المغادرة: 11:20 صباحًا • رحلة مباشرة • الدرجة السياحية',
      'es': 'Salida: 11:20 a. m. • Directo • Clase económica',
      'fr': 'Départ : 11h20 • Direct • Classe économique',
      'zh_Hans': '出发时间：上午 11:20 • 直飞 • 经济舱',
    },
    'fthcvknl': {
      'en': '\$289.00 × 2',
      'ar': '289.00 دولارًا × 2',
      'es': '\$289.00 × 2',
      'fr': '289,00 \$ × 2',
      'zh_Hans': '289.00 美元 × 2',
    },
    'rdcnckei': {
      'en': '\$578.00',
      'ar': '578.00 دولارًا',
      'es': '\$578.00',
      'fr': '578,00 \$',
      'zh_Hans': '578.00美元',
    },
    'r8ukc4gj': {
      'en': 'Bellagio Hotel & Casino',
      'ar': 'فندق وكازينو بيلاجيو',
      'es': 'Hotel y casino Bellagio',
      'fr': 'Hôtel et casino Bellagio',
      'zh_Hans': '百乐宫酒店及赌场',
    },
    '950zxo04': {
      'en': '4.8 • 2 nights',
      'ar': '4.8 • ليلتان',
      'es': '4.8 • 2 noches',
      'fr': '4,8 • 2 nuits',
      'zh_Hans': '4.8 • 2晚',
    },
    'zw9e1khd': {
      'en': 'Check-in: Apr 11, 2026 • Check-out: Apr 13, 2026 • 2 Guests',
      'ar':
          'تسجيل الوصول: ١١ أبريل ٢٠٢٦ • تسجيل المغادرة: ١٣ أبريل ٢٠٢٦ • ضيفان',
      'es':
          'Entrada: 11 de abril de 2026 • Salida: 13 de abril de 2026 • 2 huéspedes',
      'fr': 'Arrivée : 11 avril 2026 • Départ : 13 avril 2026 • 2 personnes',
      'zh_Hans': '入住日期：2026年4月11日 • 退房日期：2026年4月13日 • 2位客人',
    },
    '2drt849y': {
      'en': '\$289.00 × 2',
      'ar': '289.00 دولارًا × 2',
      'es': '\$289.00 × 2',
      'fr': '289,00 \$ × 2',
      'zh_Hans': '289.00 美元 × 2',
    },
    '4k2obsny': {
      'en': '\$578.00',
      'ar': '578.00 دولارًا',
      'es': '\$578.00',
      'fr': '578,00 \$',
      'zh_Hans': '578.00美元',
    },
    'vootefs6': {
      'en': 'Las Vegas Sign',
      'ar': 'لافتة لاس فيغاس',
      'es': 'Letrero de Las Vegas',
      'fr': 'Panneau de Las Vegas',
      'zh_Hans': '拉斯维加斯标志',
    },
    '14ifag02': {
      'en': 'Las Vegas Strip',
      'ar': 'قطاع لاس فيغاس',
      'es': 'Las Vegas Strip',
      'fr': 'Strip de Las Vegas',
      'zh_Hans': '拉斯维加斯大道',
    },
    'f3u2kfwh': {
      'en': 'Self-guided tour • 1 hour • No admission',
      'ar': 'جولة ذاتية التوجيه • ساعة واحدة • الدخول مجاني',
      'es': 'Visita autoguiada • 1 hora • Entrada gratuita',
      'fr': 'Visite libre • 1 heure • Entrée gratuite',
      'zh_Hans': '自助游览 • 1 小时 • 免费入场',
    },
    '2556mz8k': {
      'en': '\$0.00 × 2',
      'ar': '0.00 دولار × 2',
      'es': '\$0.00 × 2',
      'fr': '0,00 \$ × 2',
      'zh_Hans': '\$0.00 × 2',
    },
    'ox825b0q': {
      'en': '\$0.00',
      'ar': '0.00 دولار',
      'es': '\$0.00',
      'fr': '0,00 \$',
      'zh_Hans': '0.00 美元',
    },
    'ltlbtqpp': {
      'en': 'Neon Sign Museum',
      'ar': 'متحف لافتات النيون',
      'es': 'Museo de Letreros de Neón',
      'fr': 'Musée des enseignes lumineuses',
      'zh_Hans': '霓虹灯博物馆',
    },
    'prqebk9n': {
      'en': 'Downtown Las Vegas',
      'ar': 'وسط مدينة لاس فيغاس',
      'es': 'Centro de Las Vegas',
      'fr': 'Centre-ville de Las Vegas',
      'zh_Hans': '拉斯维加斯市中心',
    },
    'ozz1xmiv': {
      'en': 'Guided tour • 2-3 hours • Includes admission',
      'ar': 'جولة بصحبة مرشد سياحي • ساعتان إلى ثلاث ساعات • تشمل رسوم الدخول',
      'es': 'Visita guiada • 2-3 horas • Incluye entrada',
      'fr': 'Visite guidée • 2 à 3 heures • Entrée incluse',
      'zh_Hans': '导览游 • 2-3 小时 • 含门票',
    },
    'ui2y6vfa': {
      'en': '\$20.00 × 2',
      'ar': '20.00 دولارًا × 2',
      'es': '\$20.00 × 2',
      'fr': '20,00 \$ × 2',
      'zh_Hans': '20.00 美元 × 2',
    },
    'qzzz74w2': {
      'en': '\$40.00',
      'ar': '40.00 دولارًا',
      'es': '\$40.00',
      'fr': '40,00 \$',
      'zh_Hans': '40.00美元',
    },
    'gx2ag4om': {
      'en': 'Blue Man Theatre (The Luxor)',
      'ar': 'مسرح بلو مان (فندق لوكسور)',
      'es': 'Teatro Blue Man (El Luxor)',
      'fr': 'Théâtre Blue Man (Le Louxor)',
      'zh_Hans': '蓝人剧院（卢克索酒店）',
    },
    'y202haea': {
      'en': 'Luxor Hotel • Apr 18, 2026',
      'ar': 'فندق الأقصر • ١٨ أبريل ٢٠٢٦',
      'es': 'Hotel Luxor • 18 de abril de 2026',
      'fr': 'Hôtel Luxor • 18 avril 2026',
      'zh_Hans': '卢克索酒店 • 2026年4月18日',
    },
    'kha61bzy': {
      'en': 'General Admission • 2 Tickets • All ages welcome',
      'ar': 'دخول عام • تذكرتان • جميع الأعمار مرحب بها',
      'es': 'Entrada general • 2 entradas • Todas las edades son bienvenidas',
      'fr': 'Entrée générale • 2 billets • Tous les âges sont les bienvenus',
      'zh_Hans': '普通门票 • 2张票 • 欢迎所有年龄段人士',
    },
    'afdy9uzs': {
      'en': '\$97.00 × 2',
      'ar': '97.00 دولارًا × 2',
      'es': '\$97.00 × 2',
      'fr': '97,00 \$ × 2',
      'zh_Hans': '97.00 美元 × 2',
    },
    'drnqz03x': {
      'en': '\$194.00',
      'ar': '194.00 دولارًا',
      'es': '\$194.00',
      'fr': '194,00 \$',
      'zh_Hans': '194.00 美元',
    },
    'azbq4x0i': {
      'en': 'Magic Show',
      'ar': 'عرض سحري',
      'es': 'Espectáculo de magia',
      'fr': 'Spectacle de magie',
      'zh_Hans': '魔术表演',
    },
    'iqh2ags5': {
      'en': 'Entertainment, Caesars • Apr 20, 2026',
      'ar': 'الترفيه، سيزرز • ٢٠ أبريل ٢٠٢٦',
      'es': 'Entretenimiento, Caesars • 20 de abril de 2026',
      'fr': 'Divertissement, Caesars • 20 avril 2026',
      'zh_Hans': '娱乐，凯撒娱乐 • 2026年4月20日',
    },
    'wnsvxh30': {
      'en': 'General Admission • 2 Tickets • All ages welcome',
      'ar': 'دخول عام • تذكرتان • جميع الأعمار مرحب بها',
      'es': 'Entrada general • 2 entradas • Todas las edades son bienvenidas',
      'fr': 'Entrée générale • 2 billets • Tous les âges sont les bienvenus',
      'zh_Hans': '普通门票 • 2张票 • 欢迎所有年龄段人士',
    },
    'vyxlnn7c': {
      'en': '\$97.00 × 2',
      'ar': '97.00 دولارًا × 2',
      'es': '\$97.00 × 2',
      'fr': '97,00 \$ × 2',
      'zh_Hans': '97.00 美元 × 2',
    },
    '34pk8yf2': {
      'en': '\$194.00',
      'ar': '194.00 دولارًا',
      'es': '\$194.00',
      'fr': '194,00 \$',
      'zh_Hans': '194.00 美元',
    },
    'r3xz0ag5': {
      'en': 'Subtotal',
      'ar': 'المجموع الفرعي',
      'es': 'Total parcial',
      'fr': 'Total',
      'zh_Hans': '小计',
    },
    'sj13fa2l': {
      'en': '\$1584.00',
      'ar': '1584.00 دولارًا',
      'es': '\$1584.00',
      'fr': '1584,00 \$',
      'zh_Hans': '1584.00 美元',
    },
    '9tdxaqdg': {
      'en': 'Taxes (8%)',
      'ar': 'الضرائب (8%)',
      'es': 'Impuestos (8%)',
      'fr': 'Taxes (8%)',
      'zh_Hans': '税金（8%）',
    },
    'dxlgzcw3': {
      'en': '\$129.92',
      'ar': '129.92 دولارًا',
      'es': '\$129.92',
      'fr': '129,92 \$',
      'zh_Hans': '129.92美元',
    },
    '2khf0v7q': {
      'en': 'Service Fee',
      'ar': 'رسوم الخدمة',
      'es': 'Tarifa de servicio',
      'fr': 'Frais de service',
      'zh_Hans': '服务费',
    },
    'g6py5z5r': {
      'en': '\$40.00',
      'ar': '40.00 دولارًا',
      'es': '\$40.00',
      'fr': '40,00 \$',
      'zh_Hans': '40.00美元',
    },
    'zpi5niqu': {
      'en': 'Total Paid',
      'ar': 'إجمالي المبلغ المدفوع',
      'es': 'Total pagado',
      'fr': 'Total payé',
      'zh_Hans': '已付总额',
    },
    '48wgy5gn': {
      'en': '\$1753.92',
      'ar': '1753.92 دولارًا',
      'es': '\$1753.92',
      'fr': '1753,92 \$',
      'zh_Hans': '1753.92美元',
    },
    'olfmr2zp': {
      'en': 'Trip Details',
      'ar': 'تفاصيل الرحلة',
      'es': 'Detalles del viaje',
      'fr': 'Détails du voyage',
      'zh_Hans': '行程详情',
    },
    '4ceb846x': {
      'en': 'Travel Dates',
      'ar': 'مواعيد السفر',
      'es': 'Fechas de viaje',
      'fr': 'Dates de voyage',
      'zh_Hans': '旅行日期',
    },
    'n4c861it': {
      'en': 'April 11-13, 2026',
      'ar': '11-13 أبريل 2026',
      'es': 'Del 11 al 13 de abril de 2026',
      'fr': '11-13 avril 2026',
      'zh_Hans': '2026年4月11日至13日',
    },
    'x6xhswpk': {
      'en': 'Destination',
      'ar': 'وجهة',
      'es': 'Destino',
      'fr': 'Destination',
      'zh_Hans': '目的地',
    },
    'g099sjzr': {
      'en': 'Las Vegas, Nevada',
      'ar': 'لاس فيغاس، نيفادا',
      'es': 'Las Vegas, Nevada',
      'fr': 'Las Vegas, Nevada',
      'zh_Hans': '内华达州拉斯维加斯',
    },
    '6op3c1sb': {
      'en': 'Travelers',
      'ar': 'المسافرون',
      'es': 'Viajeros',
      'fr': 'Les voyageurs',
      'zh_Hans': '旅行者',
    },
    'lcwje9jp': {
      'en': '2 Adults',
      'ar': 'شخصان بالغان',
      'es': '2 adultos',
      'fr': '2 adultes',
      'zh_Hans': '2 位成人',
    },
    'rzt3dms8': {
      'en': 'Confirmation Sent To',
      'ar': 'تم إرسال التأكيد إلى',
      'es': 'Confirmación enviada a',
      'fr': 'Confirmation envoyée à',
      'zh_Hans': '已发送确认信息',
    },
    '573za8yk': {
      'en': 'john@example.com',
      'ar': 'john@example.com',
      'es': 'john@example.com',
      'fr': 'john@example.com',
      'zh_Hans': 'john@example.com',
    },
    '1uvkhk7c': {
      'en': 'What\'s Next?',
      'ar': 'ماذا بعد؟',
      'es': '¿Qué sigue?',
      'fr': 'Et ensuite ?',
      'zh_Hans': '接下来是什么？',
    },
    'uf6fjmep': {
      'en': '1',
      'ar': '1',
      'es': '1',
      'fr': '1',
      'zh_Hans': '1',
    },
    'ts78yxbj': {
      'en': 'Check your email for detailed booking confirmations and e-tickets',
      'ar':
          'تحقق من بريدك الإلكتروني للاطلاع على تأكيدات الحجز التفصيلية والتذاكر الإلكترونية.',
      'es':
          'Revisa tu correo electrónico para obtener confirmaciones de reserva detalladas y boletos electrónicos.',
      'fr':
          'Veuillez consulter votre boîte mail pour obtenir les confirmations de réservation détaillées et les billets électroniques.',
      'zh_Hans': '请查看您的电子邮件，以获取详细的预订确认信息和电子客票。',
    },
    '4hs0ee05': {
      'en': '2',
      'ar': '2',
      'es': '2',
      'fr': '2',
      'zh_Hans': '2',
    },
    'eqv7nq39': {
      'en': 'Complete online check-in 24 hours before your flight',
      'ar': 'أكمل إجراءات تسجيل الوصول عبر الإنترنت قبل 24 ساعة من موعد رحلتك',
      'es': 'Realiza el check-in online 24 horas antes de tu vuelo.',
      'fr':
          'Effectuez votre enregistrement en ligne 24 heures avant votre vol.',
      'zh_Hans': '请在航班起飞前 24 小时完成网上值机。',
    },
    'se2d8rjj': {
      'en': '3',
      'ar': '3',
      'es': '3',
      'fr': '3',
      'zh_Hans': '3',
    },
    'iedso7o9': {
      'en': 'Download the KiTravia app to manage your trip on the go',
      'ar': 'قم بتنزيل تطبيق KiTravia لإدارة رحلتك أثناء التنقل',
      'es':
          'Descarga la aplicación KiTravia para gestionar tu viaje desde cualquier lugar.',
      'fr':
          'Téléchargez l\'application KiTravia pour gérer votre voyage où que vous soyez.',
      'zh_Hans': '下载 KiTravia 应用，随时随地管理您的行程',
    },
    '7yj6ddg8': {
      'en': 'Plan Another Trip',
      'ar': 'خطط لرحلة أخرى',
      'es': 'Planifica otro viaje',
      'fr': 'Planifiez un autre voyage',
      'zh_Hans': '计划另一次旅行',
    },
    'ziit3l9d': {
      'en': 'Print Confirmation',
      'ar': 'طباعة التأكيد',
      'es': 'Confirmación de impresión',
      'fr': 'Confirmation d\'impression',
      'zh_Hans': '打印确认',
    },
  },
  // FullBookingSummary
  {
    'qnyjpfsj': {
      'en': 'Back',
      'ar': 'خلف',
      'es': 'Atrás',
      'fr': 'Dos',
      'zh_Hans': '后退',
    },
    'jwnq1fwl': {
      'en': 'Your Booking Summary',
      'ar': 'ملخص حجزك',
      'es': 'Resumen de su reserva',
      'fr': 'Récapitulatif de votre réservation',
      'zh_Hans': '您的预订摘要',
    },
    '67olfcxl': {
      'en': 'Below is the list of items in your cart.',
      'ar': 'فيما يلي قائمة بالعناصر الموجودة في سلة التسوق الخاصة بك.',
      'es': 'A continuación se muestra la lista de artículos en su carrito.',
      'fr': 'Voici la liste des articles de votre panier.',
      'zh_Hans': '以下是您购物车中的商品列表。',
    },
    'vuymcb6c': {
      'en': 'United Airlines - UA 892',
      'ar': 'الخطوط الجوية المتحدة - الرحلة رقم 892',
      'es': 'United Airlines - UA 892',
      'fr': 'United Airlines - UA 892',
      'zh_Hans': '联合航空 - UA 892',
    },
    't3b6jvbt': {
      'en': 'PHX → LAS • 1h 20m',
      'ar': 'فينيكس → لاس فيغاس • ساعة و20 دقيقة',
      'es': 'PHX → LAS • 1h 20m',
      'fr': 'PHX → LAS • 1h 20m',
      'zh_Hans': '凤凰城 → 拉斯维加斯 • 1小时20分钟',
    },
    'wwuy2iz1': {
      'en': 'Departure: 11:20 AM • Direct • Economy Class',
      'ar': 'المغادرة: 11:20 صباحًا • رحلة مباشرة • الدرجة السياحية',
      'es': 'Salida: 11:20 a. m. • Directo • Clase económica',
      'fr': 'Départ : 11h20 • Direct • Classe économique',
      'zh_Hans': '出发时间：上午 11:20 • 直飞 • 经济舱',
    },
    'pnxkwu9h': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    '1bez1ddm': {
      'en': '\$289.00 x 2',
      'ar': '289.00 دولارًا × 2',
      'es': '\$289.00 x 2',
      'fr': '289,00 \$ x 2',
      'zh_Hans': '289.00 美元 x 2',
    },
    'pwidnb22': {
      'en': 'Bellagio Hotel & Casino',
      'ar': 'فندق وكازينو بيلاجيو',
      'es': 'Hotel y casino Bellagio',
      'fr': 'Hôtel et casino Bellagio',
      'zh_Hans': '百乐宫酒店及赌场',
    },
    'x2ndjpqw': {
      'en': '4.8 • 2 nights',
      'ar': '4.8 • ليلتان',
      'es': '4.8 • 2 noches',
      'fr': '4,8 • 2 nuits',
      'zh_Hans': '4.8 • 2晚',
    },
    'kd0l3aup': {
      'en': 'Check-in: Apr 11, 2026 • Check-out: Apr 13, 2026 • 2 Guests',
      'ar':
          'تسجيل الوصول: ١١ أبريل ٢٠٢٦ • تسجيل المغادرة: ١٣ أبريل ٢٠٢٦ • ضيفان',
      'es':
          'Entrada: 11 de abril de 2026 • Salida: 13 de abril de 2026 • 2 huéspedes',
      'fr': 'Arrivée : 11 avril 2026 • Départ : 13 avril 2026 • 2 personnes',
      'zh_Hans': '入住日期：2026年4月11日 • 退房日期：2026年4月13日 • 2位客人',
    },
    'cc9v42vs': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    'zwbsto90': {
      'en': '\$289.00 x 2',
      'ar': '289.00 دولارًا × 2',
      'es': '\$289.00 x 2',
      'fr': '289,00 \$ x 2',
      'zh_Hans': '289.00 美元 x 2',
    },
    '6lvelwa8': {
      'en': 'Las Vegas Sign',
      'ar': 'لافتة لاس فيغاس',
      'es': 'Letrero de Las Vegas',
      'fr': 'Panneau de Las Vegas',
      'zh_Hans': '拉斯维加斯标志',
    },
    'qoi1cw69': {
      'en': 'Las Vegas Strip',
      'ar': 'قطاع لاس فيغاس',
      'es': 'Las Vegas Strip',
      'fr': 'Strip de Las Vegas',
      'zh_Hans': '拉斯维加斯大道',
    },
    'eicbxl7t': {
      'en': 'Guided tour • 2-3 hours • Includes admission',
      'ar': 'جولة بصحبة مرشد سياحي • ساعتان إلى ثلاث ساعات • تشمل رسوم الدخول',
      'es': 'Visita guiada • 2-3 horas • Incluye entrada',
      'fr': 'Visite guidée • 2 à 3 heures • Entrée incluse',
      'zh_Hans': '导览游 • 2-3 小时 • 含门票',
    },
    'by8d072b': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    'ut88gtwp': {
      'en': '\$0.00 x 2',
      'ar': '0.00 دولار × 2',
      'es': '\$0.00 x 2',
      'fr': '0,00 \$ x 2',
      'zh_Hans': '\$0.00 x 2',
    },
    'p78eelq0': {
      'en': 'Neon Sign Museum',
      'ar': 'متحف لافتات النيون',
      'es': 'Museo de Letreros de Neón',
      'fr': 'Musée des enseignes lumineuses',
      'zh_Hans': '霓虹灯博物馆',
    },
    'lo8jqjm5': {
      'en': 'Downtown Las Vegas',
      'ar': 'وسط مدينة لاس فيغاس',
      'es': 'Centro de Las Vegas',
      'fr': 'Centre-ville de Las Vegas',
      'zh_Hans': '拉斯维加斯市中心',
    },
    '077qgamo': {
      'en': 'Guided tour • 2-3 hours • Includes admission',
      'ar': 'جولة بصحبة مرشد سياحي • ساعتان إلى ثلاث ساعات • تشمل رسوم الدخول',
      'es': 'Visita guiada • 2-3 horas • Incluye entrada',
      'fr': 'Visite guidée • 2 à 3 heures • Entrée incluse',
      'zh_Hans': '导览游 • 2-3 小时 • 含门票',
    },
    '622ejcsi': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    'sktlzaze': {
      'en': '\$20.00 x 2',
      'ar': '20.00 دولارًا × 2',
      'es': '\$20.00 x 2',
      'fr': '20,00 \$ x 2',
      'zh_Hans': '20.00 美元 x 2',
    },
    'zo8c3rlt': {
      'en': 'Blue Man Theatre (The Luxor)',
      'ar': 'مسرح بلو مان (فندق لوكسور)',
      'es': 'Teatro Blue Man (El Luxor)',
      'fr': 'Théâtre Blue Man (Le Louxor)',
      'zh_Hans': '蓝人剧院（卢克索酒店）',
    },
    'e9jw6myx': {
      'en': 'Luxor Hotel • Apr 18, 2026',
      'ar': 'فندق الأقصر • ١٨ أبريل ٢٠٢٦',
      'es': 'Hotel Luxor • 18 de abril de 2026',
      'fr': 'Hôtel Luxor • 18 avril 2026',
      'zh_Hans': '卢克索酒店 • 2026年4月18日',
    },
    'i0w5kkx7': {
      'en': 'General Admission • 2 Tickets • All ages welcome',
      'ar': 'دخول عام • تذكرتان • جميع الأعمار مرحب بها',
      'es': 'Entrada general • 2 entradas • Todas las edades son bienvenidas',
      'fr': 'Entrée générale • 2 billets • Tous les âges sont les bienvenus',
      'zh_Hans': '普通门票 • 2张票 • 欢迎所有年龄段人士',
    },
    'hn2k3nzi': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    'wkwlen50': {
      'en': '\$97.00 x 2',
      'ar': '97.00 دولارًا × 2',
      'es': '\$97.00 x 2',
      'fr': '97,00 \$ x 2',
      'zh_Hans': '97.00 美元 x 2',
    },
    '2fve0cdy': {
      'en': 'Magic Show',
      'ar': 'عرض سحري',
      'es': 'Espectáculo de magia',
      'fr': 'Spectacle de magie',
      'zh_Hans': '魔术表演',
    },
    '2phwgeu3': {
      'en': 'Entertainment, Caesars • Apr 20, 2026',
      'ar': 'الترفيه، سيزرز • ٢٠ أبريل ٢٠٢٦',
      'es': 'Entretenimiento, Caesars • 20 de abril de 2026',
      'fr': 'Divertissement, Caesars • 20 avril 2026',
      'zh_Hans': '娱乐，凯撒娱乐 • 2026年4月20日',
    },
    'hvpkj0d6': {
      'en': 'General Admission • 2 Tickets • All ages welcome',
      'ar': 'دخول عام • تذكرتان • جميع الأعمار مرحب بها',
      'es': 'Entrada general • 2 entradas • Todas las edades son bienvenidas',
      'fr': 'Entrée générale • 2 billets • Tous les âges sont les bienvenus',
      'zh_Hans': '普通门票 • 2张票 • 欢迎所有年龄段人士',
    },
    'riimdd1v': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    'r0sb0ctr': {
      'en': '\$97.00 x 2',
      'ar': '97.00 دولارًا × 2',
      'es': '\$97.00 x 2',
      'fr': '97,00 \$ x 2',
      'zh_Hans': '97.00 美元 x 2',
    },
    '52xsagji': {
      'en': 'Booking Summary',
      'ar': 'ملخص الحجز',
      'es': 'Resumen de la reserva',
      'fr': 'Résumé de la réservation',
      'zh_Hans': '预订概要',
    },
    'm7q4rvqw': {
      'en': 'Below is a list of your items.',
      'ar': 'فيما يلي قائمة بمحتوياتك.',
      'es': 'A continuación se muestra una lista de sus artículos.',
      'fr': 'Vous trouverez ci-dessous la liste de vos articles.',
      'zh_Hans': '以下是您的物品清单。',
    },
    '43j7n6l2': {
      'en': 'Price Breakdown',
      'ar': 'تفاصيل السعر',
      'es': 'Desglose de precios',
      'fr': 'Détail des prix',
      'zh_Hans': '价格明细',
    },
    '4krpxd5m': {
      'en': 'Base Price',
      'ar': 'السعر الأساسي',
      'es': 'Precio base',
      'fr': 'Prix ​​de base',
      'zh_Hans': '基价',
    },
    'qwm7rqo1': {
      'en': '\$1584.00',
      'ar': '1584.00 دولارًا',
      'es': '\$1584.00',
      'fr': '1584,00 \$',
      'zh_Hans': '1584.00 美元',
    },
    '8ipwo38g': {
      'en': 'Taxes',
      'ar': 'الضرائب',
      'es': 'impuestos',
      'fr': 'Impôts',
      'zh_Hans': '税收',
    },
    'a4j6ac17': {
      'en': '\$129.92',
      'ar': '129.92 دولارًا',
      'es': '\$129.92',
      'fr': '129,92 \$',
      'zh_Hans': '129.92美元',
    },
    't2huvuwq': {
      'en': 'Service Fee',
      'ar': 'رسوم الخدمة',
      'es': 'Tarifa de servicio',
      'fr': 'Frais de service',
      'zh_Hans': '服务费',
    },
    '4o3so8pd': {
      'en': '\$40.00',
      'ar': '40.00 دولارًا',
      'es': '\$40.00',
      'fr': '40,00 \$',
      'zh_Hans': '40.00美元',
    },
    'uz3lh3df': {
      'en': 'Total',
      'ar': 'المجموع',
      'es': 'Total',
      'fr': 'Total',
      'zh_Hans': '全部的',
    },
    'gmi2p4zt': {
      'en': '\$1753.92',
      'ar': '1753.92 دولارًا',
      'es': '\$1753.92',
      'fr': '1753,92 \$',
      'zh_Hans': '1753.92美元',
    },
    '7i2jjyvb': {
      'en': 'Continue to Book',
      'ar': 'تابع الحجز',
      'es': 'Continuar con el libro',
      'fr': 'Continuer la réservation',
      'zh_Hans': '继续预订',
    },
  },
  // ItineraryBookingBreakdown
  {
    '3itr17ms': {
      'en': 'Back',
      'ar': 'خلف',
      'es': 'Atrás',
      'fr': 'Dos',
      'zh_Hans': '后退',
    },
    'ez6m228p': {
      'en': 'Your Booking Summary',
      'ar': 'ملخص حجزك',
      'es': 'Resumen de su reserva',
      'fr': 'Récapitulatif de votre réservation',
      'zh_Hans': '您的预订摘要',
    },
    'o8xaahp9': {
      'en': 'Below is the list of items in your cart.',
      'ar': 'فيما يلي قائمة بالعناصر الموجودة في سلة التسوق الخاصة بك.',
      'es': 'A continuación se muestra la lista de artículos en su carrito.',
      'fr': 'Voici la liste des articles de votre panier.',
      'zh_Hans': '以下是您购物车中的商品列表。',
    },
    '9uivyb82': {
      'en': 'Flight to Las Vegas',
      'ar': 'رحلة إلى لاس فيغاس',
      'es': 'Vuelo a Las Vegas',
      'fr': 'Vol pour Las Vegas',
      'zh_Hans': '飞往拉斯维加斯的航班',
    },
    '8f7inub6': {
      'en': '2026-05-15 • 2026-05-15',
      'ar': '2026-05-15 • 2026-05-15',
      'es': '15/05/2026 • 15/05/2026',
      'fr': '15/05/2026 • 15/05/2026',
      'zh_Hans': '2026年5月15日 • 2026年5月15日',
    },
    'wkk2by6s': {
      'en': 'Departure: 11:00 AM • Dest • Economy Class',
      'ar': 'المغادرة: 11:00 صباحًا • الوجهة • الدرجة السياحية',
      'es': 'Salida: 11:00 a. m. • Destino • Clase económica',
      'fr': 'Départ : 11 h 00 • Destination • Classe économique',
      'zh_Hans': '出发时间：上午 11:00 • 目的地：经济舱',
    },
    '01ki4mnd': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    'xej3e0fb': {
      'en': '\$500.00 x 2',
      'ar': '500.00 دولار × 2',
      'es': '\$500.00 x 2',
      'fr': '500,00 \$ x 2',
      'zh_Hans': '500.00 美元 x 2',
    },
    'wsw2lpfv': {
      'en': 'Hotel in Las Vegas',
      'ar': 'فندق في لاس فيغاس',
      'es': 'Hotel en Las Vegas',
      'fr': 'Hôtel à Las Vegas',
      'zh_Hans': '拉斯维加斯酒店',
    },
    'grcw6cqo': {
      'en': 'Check-in: 2026-05-15 • Check-out: 2026-05-15 • 2 Guests',
      'ar':
          'تاريخ الوصول: ١٥ مايو ٢٠٢٦ • تاريخ المغادرة: ١٥ مايو ٢٠٢٦ • عدد الضيوف: ٢',
      'es': 'Entrada: 15/05/2026 • Salida: 15/05/2026 • 2 huéspedes',
      'fr': 'Arrivée : 15/05/2026 • Départ : 15/05/2026 • 2 personnes',
      'zh_Hans': '入住日期：2026年5月15日 • 退房日期：2026年5月15日 • 2位客人',
    },
    'nnfioiba': {
      'en': '0 night',
      'ar': 'ليلة واحدة',
      'es': '0 noches',
      'fr': '0 nuit',
      'zh_Hans': '0 晚',
    },
    'pi3p6lk0': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    '09pqvrq3': {
      'en': '\$0.00 x 2',
      'ar': '0.00 دولار × 2',
      'es': '\$0.00 x 2',
      'fr': '0,00 \$ x 2',
      'zh_Hans': '\$0.00 x 2',
    },
    '5wi0emmd': {
      'en': 'High Roller Observation Wheel',
      'ar': 'عجلة المراقبة هاي رولر',
      'es': 'Rueda de observación High Roller',
      'fr': 'Grande roue d\'observation High Roller',
      'zh_Hans': '高空摩天轮',
    },
    '2tlh4pj1': {
      'en': 'World\'s tallest observation wheel',
      'ar': 'أطول عجلة مراقبة في العالم',
      'es': 'La noria de observación más alta del mundo',
      'fr': 'La plus haute roue d\'observation du monde',
      'zh_Hans': '世界最高的观景摩天轮',
    },
    'h5nwl60a': {
      'en': 'Includes admission',
      'ar': 'يشمل سعر الدخول',
      'es': 'Incluye la entrada',
      'fr': 'Entrée incluse',
      'zh_Hans': '包含入场费',
    },
    'o30w7uvr': {
      'en': 'Remove',
      'ar': 'يزيل',
      'es': 'Eliminar',
      'fr': 'Retirer',
      'zh_Hans': '消除',
    },
    'arf3szhw': {
      'en': '\$35.00 x 2',
      'ar': '35.00 دولارًا × 2',
      'es': '\$35.00 x 2',
      'fr': '35,00 \$ x 2',
      'zh_Hans': '35.00 美元 x 2',
    },
    'r4jx4r3f': {
      'en': 'Booking Summary',
      'ar': 'ملخص الحجز',
      'es': 'Resumen de la reserva',
      'fr': 'Résumé de la réservation',
      'zh_Hans': '预订概要',
    },
    'nk174xay': {
      'en': 'Below is a list of your items.',
      'ar': 'فيما يلي قائمة بمحتوياتك.',
      'es': 'A continuación se muestra una lista de sus artículos.',
      'fr': 'Vous trouverez ci-dessous la liste de vos articles.',
      'zh_Hans': '以下是您的物品清单。',
    },
    'vqpdwgc9': {
      'en': 'Price Breakdown',
      'ar': 'تفاصيل السعر',
      'es': 'Desglose de precios',
      'fr': 'Détail des prix',
      'zh_Hans': '价格明细',
    },
    '0898sofj': {
      'en': 'Base Price',
      'ar': 'السعر الأساسي',
      'es': 'Precio base',
      'fr': 'Prix ​​de base',
      'zh_Hans': '基价',
    },
    '6bi8z2oo': {
      'en': '\$1,070.00',
      'ar': '1070.00 دولارًا',
      'es': '\$1.070,00',
      'fr': '1 070,00 \$',
      'zh_Hans': '1070.00 美元',
    },
    'wbnflkhy': {
      'en': 'Taxes',
      'ar': 'الضرائب',
      'es': 'impuestos',
      'fr': 'Impôts',
      'zh_Hans': '税收',
    },
    'w8x1bpaj': {
      'en': '\$128.40',
      'ar': '128.40 دولارًا',
      'es': '\$128.40',
      'fr': '128,40 \$',
      'zh_Hans': '128.40美元',
    },
    'xug75974': {
      'en': 'Service Fee',
      'ar': 'رسوم الخدمة',
      'es': 'Tarifa de servicio',
      'fr': 'Frais de service',
      'zh_Hans': '服务费',
    },
    'kkpgo3mz': {
      'en': '\$53.50',
      'ar': '53.50 دولارًا',
      'es': '\$53.50',
      'fr': '53,50 \$',
      'zh_Hans': '53.50美元',
    },
    'jeye1vu3': {
      'en': 'Total',
      'ar': 'المجموع',
      'es': 'Total',
      'fr': 'Total',
      'zh_Hans': '全部的',
    },
    'ulj3ggz5': {
      'en': '\$1,251.90',
      'ar': '1251.90 دولارًا',
      'es': '\$1,251.90',
      'fr': '1 251,90 \$',
      'zh_Hans': '1251.90美元',
    },
    'swpjk151': {
      'en': 'Continue to Book',
      'ar': 'تابع الحجز',
      'es': 'Continuar con el libro',
      'fr': 'Continuer la réservation',
      'zh_Hans': '继续预订',
    },
  },
  // HeaderCopyCopy
  {
    'r7coseij': {
      'en': '🎁 Promotional offer',
      'ar': '🎁 عرض ترويجي',
      'es': '🎁 Oferta promocional',
      'fr': '🎁 Offre promotionnelle',
      'zh_Hans': '🎁 促销优惠',
    },
    'x6hn8tdo': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'zh_Hans': '登录',
    },
    'ouyvp8se': {
      'en': 'Plan Your Trip',
      'ar': 'خطط لرحلتك',
      'es': 'Planifica tu viaje',
      'fr': 'Planifiez votre voyage',
      'zh_Hans': '计划您的行程',
    },
    'lqo28s1g': {
      'en': 'About',
      'ar': 'عن',
      'es': 'Acerca de',
      'fr': 'À propos',
      'zh_Hans': '关于',
    },
    'iezaz5kw': {
      'en': 'Travel Guides',
      'ar': 'أدلة السفر',
      'es': 'Guías de viaje',
      'fr': 'Guides de voyage',
      'zh_Hans': '旅游指南',
    },
    '9o4ul86m': {
      'en': 'Booking for Visa',
      'ar': 'حجز تأشيرة',
      'es': 'Reserva para visa',
      'fr': 'Réservation de visa',
      'zh_Hans': '签证预约',
    },
    'tnb0euep': {
      'en': 'Pricing',
      'ar': 'التسعير',
      'es': 'Precios',
      'fr': 'Tarification',
      'zh_Hans': '定价',
    },
    'lfatm87h': {
      'en': 'Blog',
      'ar': 'مدونة',
      'es': 'Blog',
      'fr': 'Blog',
      'zh_Hans': '博客',
    },
    'p8ckz3o0': {
      'en': 'FAQs',
      'ar': 'الأسئلة الشائعة',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
      'zh_Hans': '常见问题解答',
    },
  },
  // HeaderCopyCopyCopy
  {
    'v8whusht': {
      'en': '🎁 Promotional offer',
      'ar': '🎁 عرض ترويجي',
      'es': '🎁 Oferta promocional',
      'fr': '🎁 Offre promotionnelle',
      'zh_Hans': '🎁 促销优惠',
    },
    'rdxmbbvk': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'zh_Hans': '登录',
    },
    'm1x0s3zy': {
      'en': 'Plan Your Trip',
      'ar': 'خطط لرحلتك',
      'es': 'Planifica tu viaje',
      'fr': 'Planifiez votre voyage',
      'zh_Hans': '计划您的行程',
    },
    'fu4yvx0z': {
      'en': 'About',
      'ar': 'عن',
      'es': 'Acerca de',
      'fr': 'À propos',
      'zh_Hans': '关于',
    },
    'f2x7xvip': {
      'en': 'Travel Guides',
      'ar': 'أدلة السفر',
      'es': 'Guías de viaje',
      'fr': 'Guides de voyage',
      'zh_Hans': '旅游指南',
    },
    'ae01mzhk': {
      'en': 'Booking for Visa',
      'ar': 'حجز تأشيرة',
      'es': 'Reserva para visa',
      'fr': 'Réservation de visa',
      'zh_Hans': '签证预约',
    },
    '06ywfe0o': {
      'en': 'Pricing',
      'ar': 'التسعير',
      'es': 'Precios',
      'fr': 'Tarification',
      'zh_Hans': '定价',
    },
    '7lj2g0am': {
      'en': 'Blog',
      'ar': 'مدونة',
      'es': 'Blog',
      'fr': 'Blog',
      'zh_Hans': '博客',
    },
    '3r7zar1w': {
      'en': 'FAQs',
      'ar': 'الأسئلة الشائعة',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
      'zh_Hans': '常见问题解答',
    },
  },
  // ComingSoon
  {
    'ugh2qvgt': {
      'en': 'Coming Soon!',
      'ar': 'قريباً!',
      'es': '¡Muy pronto!',
      'fr': 'À venir!',
      'zh_Hans': '即将推出！',
    },
  },
  // HeaderCopy2
  {
    'ghfalkw9': {
      'en': '🎁 Promotional offer',
      'ar': '🎁 عرض ترويجي',
      'es': '🎁 Oferta promocional',
      'fr': '🎁 Offre promotionnelle',
      'zh_Hans': '🎁 促销优惠',
    },
    'ayuzvjrz': {
      'en': ' user1234',
      'ar': 'المستخدم 1234',
      'es': 'usuario1234',
      'fr': 'utilisateur1234',
      'zh_Hans': '用户1234',
    },
    'cb1m72qf': {
      'en': 'Plan Your Trip',
      'ar': 'خطط لرحلتك',
      'es': 'Planifica tu viaje',
      'fr': 'Planifiez votre voyage',
      'zh_Hans': '计划您的行程',
    },
    '5qa9r3sn': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
    'sf1i1keu': {
      'en': 'About',
      'ar': 'عن',
      'es': 'Acerca de',
      'fr': 'À propos',
      'zh_Hans': '关于',
    },
    'b6eg8sek': {
      'en': 'Travel eBook',
      'ar': 'كتاب إلكتروني عن السفر',
      'es': 'Libro electrónico de viajes',
      'fr': 'Livre électronique de voyage',
      'zh_Hans': '旅游电子书',
    },
    'pn1tvsy1': {
      'en': 'Booking for Visa',
      'ar': 'حجز تأشيرة',
      'es': 'Reserva para visa',
      'fr': 'Réservation de visa',
      'zh_Hans': '签证预约',
    },
    'h2d3zln9': {
      'en': 'Pricing',
      'ar': 'التسعير',
      'es': 'Precios',
      'fr': 'Tarification',
      'zh_Hans': '定价',
    },
    'c0vxxvtv': {
      'en': 'Blog',
      'ar': 'مدونة',
      'es': 'Blog',
      'fr': 'Blog',
      'zh_Hans': '博客',
    },
    '65mhdmtw': {
      'en': 'FAQs',
      'ar': 'الأسئلة الشائعة',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
      'zh_Hans': '常见问题解答',
    },
  },
  // MyAccountMenu
  {
    'u6jjuydx': {
      'en': 'My Account',
      'ar': 'حسابي',
      'es': 'Mi cuenta',
      'fr': 'Mon compte',
      'zh_Hans': '我的账户',
    },
    '2uenxj12': {
      'en': 'Profile Information',
      'ar': 'معلومات الملف الشخصي',
      'es': 'Información del perfil',
      'fr': 'Informations de profil',
      'zh_Hans': '个人资料',
    },
    '6gsywkiu': {
      'en': 'Member since April 2026',
      'ar': 'عضو منذ أبريل 2026',
      'es': 'Miembro desde abril de 2026',
      'fr': 'Membre depuis avril 2026',
      'zh_Hans': '自2026年4月起成为会员',
    },
    'bwo075gx': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'zh_Hans': '电子邮件',
    },
    'bbmozdrb': {
      'en': 'Member Since',
      'ar': 'عضو منذ',
      'es': 'Miembro desde',
      'fr': 'Membre depuis',
      'zh_Hans': '会员自',
    },
    '40p2eg2i': {
      'en': 'April 22, 2026',
      'ar': '22 أبريل 2026',
      'es': '22 de abril de 2026',
      'fr': '22 avril 2026',
      'zh_Hans': '2026年4月22日',
    },
    'ob2x6vs4': {
      'en': 'Location',
      'ar': 'موقع',
      'es': 'Ubicación',
      'fr': 'Emplacement',
      'zh_Hans': '地点',
    },
    'l580paax': {
      'en': 'Phoenix, Arizona',
      'ar': 'فينيكس، أريزونا',
      'es': 'Phoenix, Arizona',
      'fr': 'Phoenix, Arizona',
      'zh_Hans': '亚利桑那州凤凰城',
    },
    'vf86awzd': {
      'en': 'Recent Activity',
      'ar': 'النشاط الأخير',
      'es': 'Actividad reciente',
      'fr': 'Activité récente',
      'zh_Hans': '近期活动',
    },
    'gdrsyum2': {
      'en': 'Las Vegas Trip',
      'ar': 'رحلة إلى لاس فيغاس',
      'es': 'Viaje a Las Vegas',
      'fr': 'Voyage à Las Vegas',
      'zh_Hans': '拉斯维加斯之旅',
    },
    'gbf3aype': {
      'en': 'Booked on',
      'ar': 'تم الحجز في',
      'es': 'Reservado el',
      'fr': 'Réservé le',
      'zh_Hans': '已预订',
    },
    'a02q6wrd': {
      'en': 'April 22, 2026',
      'ar': '22 أبريل 2026',
      'es': '22 de abril de 2026',
      'fr': '22 avril 2026',
      'zh_Hans': '2026年4月22日',
    },
    '8imdgkf9': {
      'en': '\$969.62',
      'ar': '969.62 دولارًا',
      'es': '\$969.62',
      'fr': '969,62 \$',
      'zh_Hans': '969.62美元',
    },
    'st88fnsd': {
      'en': 'Account Created',
      'ar': 'تم إنشاء الحساب',
      'es': 'Cuenta creada',
      'fr': 'Compte créé',
      'zh_Hans': '账户已创建',
    },
    'q600xtdy': {
      'en': 'April 22, 2026',
      'ar': '22 أبريل 2026',
      'es': '22 de abril de 2026',
      'fr': '22 avril 2026',
      'zh_Hans': '2026年4月22日',
    },
  },
  // SettingsMenu
  {
    'eh1337y3': {
      'en': 'Settings',
      'ar': 'إعدادات',
      'es': 'Ajustes',
      'fr': 'Paramètres',
      'zh_Hans': '设置',
    },
    '6kpbl46g': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'es': 'Notificaciones',
      'fr': 'Notifications',
      'zh_Hans': '通知',
    },
    'rvyfwhzf': {
      'en': 'Email Notifications',
      'ar': 'إشعارات البريد الإلكتروني',
      'es': 'Notificaciones por correo electrónico',
      'fr': 'Notifications par e-mail',
      'zh_Hans': '电子邮件通知',
    },
    '4fvfambm': {
      'en': 'Receive booking confirmations and updates via email',
      'ar': 'تلقي تأكيدات الحجز والتحديثات عبر البريد الإلكتروني',
      'es':
          'Reciba confirmaciones y actualizaciones de su reserva por correo electrónico.',
      'fr':
          'Recevez les confirmations de réservation et les mises à jour par e-mail.',
      'zh_Hans': '通过电子邮件接收预订确认和更新信息',
    },
    'bbmjbqyj': {
      'en': 'Push Notifications',
      'ar': 'الإشعارات الفورية',
      'es': 'Notificaciones push',
      'fr': 'Notifications push',
      'zh_Hans': '推送通知',
    },
    'kua7mkr8': {
      'en': 'Get notified about deals and special offers',
      'ar': 'احصل على إشعارات بالعروض والصفقات الخاصة',
      'es': 'Recibe notificaciones sobre ofertas y promociones especiales.',
      'fr': 'Soyez informé des promotions et offres spéciales',
      'zh_Hans': '获取优惠和特价信息',
    },
    '2tkyhe7h': {
      'en': 'Security',
      'ar': 'حماية',
      'es': 'Seguridad',
      'fr': 'Sécurité',
      'zh_Hans': '安全',
    },
    'zaz5pd0x': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
      'zh_Hans': '更改密码',
    },
    'szgdxs0x': {
      'en': 'Update your password regularly for security',
      'ar': 'قم بتحديث كلمة مرورك بانتظام لأسباب أمنية.',
      'es': 'Actualice su contraseña periódicamente por seguridad.',
      'fr':
          'Mettez régulièrement à jour votre mot de passe pour des raisons de sécurité.',
      'zh_Hans': '为了安全起见，请定期更新密码。',
    },
    'ni2akj6q': {
      'en': 'Two-Factor Authentication',
      'ar': 'المصادقة الثنائية',
      'es': 'Autenticación de dos factores',
      'fr': 'Authentification à deux facteurs',
      'zh_Hans': '双因素身份验证',
    },
    'd02l0tub': {
      'en': 'Add an extra layer of security to your account',
      'ar': 'أضف طبقة إضافية من الأمان إلى حسابك',
      'es': 'Añade una capa adicional de seguridad a tu cuenta.',
      'fr': 'Ajoutez une couche de sécurité supplémentaire à votre compte',
      'zh_Hans': '为您的账户增加一层额外的安全保障',
    },
    'a5g9pyqd': {
      'en': 'Preferences',
      'ar': 'التفضيلات',
      'es': 'Preferencias',
      'fr': 'Préférences',
      'zh_Hans': '偏好',
    },
    'gcj4wnwl': {
      'en': 'Language',
      'ar': 'لغة',
      'es': 'Idioma',
      'fr': 'Langue',
      'zh_Hans': '语言',
    },
    'opi7g7y8': {
      'en': 'Choose your preferred language',
      'ar': 'اختر لغتك المفضلة',
      'es': 'Elige tu idioma preferido',
      'fr': 'Choisissez votre langue préférée',
      'zh_Hans': '选择您偏好的语言',
    },
    '2fszdebq': {
      'en': 'Currency',
      'ar': 'عملة',
      'es': 'Divisa',
      'fr': 'Devise',
      'zh_Hans': '货币',
    },
    'vaurr25x': {
      'en': 'Select your preferred currency',
      'ar': 'اختر العملة التي تفضلها',
      'es': 'Seleccione su moneda preferida',
      'fr': 'Sélectionnez votre devise préférée',
      'zh_Hans': '选择您偏好的货币',
    },
    'vietplp5': {
      'en': 'USD (\$)',
      'ar': 'دولار أمريكي (\$)',
      'es': 'USD (\$)',
      'fr': 'USD (\$)',
      'zh_Hans': '美元（\$）',
    },
    '8jhlcces': {
      'en': 'USD (\$)',
      'ar': 'دولار أمريكي (\$)',
      'es': 'USD (\$)',
      'fr': 'USD (\$)',
      'zh_Hans': '美元（\$）',
    },
    'w34rthvk': {
      'en': 'EUR (€)',
      'ar': 'اليورو (€)',
      'es': 'EUR (€)',
      'fr': 'EUR (€)',
      'zh_Hans': '欧元（€）',
    },
    '4q97fl8n': {
      'en': 'GBP (£)',
      'ar': 'الجنيه الإسترليني (£)',
      'es': 'GBP (£)',
      'fr': 'GBP (£)',
      'zh_Hans': '英镑（£）',
    },
    '3603mtxj': {
      'en': 'JPY (¥)',
      'ar': 'الين الياباني (¥)',
      'es': 'JPY (¥)',
      'fr': 'JPY (¥)',
      'zh_Hans': '日元（¥）',
    },
    '3ugtxvpc': {
      'en': 'Appearance',
      'ar': 'مظهر',
      'es': 'Apariencia',
      'fr': 'Apparence',
      'zh_Hans': '外貌',
    },
    'p7arwj31': {
      'en': 'Dark Mode',
      'ar': 'الوضع الداكن',
      'es': 'Modo oscuro',
      'fr': 'Mode sombre',
      'zh_Hans': '深色模式',
    },
    'vkiakq87': {
      'en': 'Switch to dark theme',
      'ar': 'قم بالتبديل إلى الوضع الداكن',
      'es': 'Cambiar a tema oscuro',
      'fr': 'Passer au thème sombre',
      'zh_Hans': '切换到深色主题',
    },
  },
  // BillingDetailsMenu
  {
    'cz9z7tip': {
      'en': 'Billing Details',
      'ar': 'تفاصيل الفاتورة',
      'es': 'Detalles de facturación',
      'fr': 'Détails de facturation',
      'zh_Hans': '账单详情',
    },
    'at0pqmlo': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'es': 'Métodos de pago',
      'fr': 'Modes de paiement',
      'zh_Hans': '支付方式',
    },
    '6u4o0l1f': {
      'en': '+ Add New',
      'ar': '+ إضافة جديد',
      'es': '+ Agregar nuevo',
      'fr': '+ Ajouter un nouveau',
      'zh_Hans': '+ 添加新',
    },
    'hbwb4kze': {
      'en': 'Visa •••• 4242',
      'ar': 'فيزا •••• 4242',
      'es': 'Visa •••• 4242',
      'fr': 'Visa •••• 4242',
      'zh_Hans': '签证 •••• 4242',
    },
    'ebraun9z': {
      'en': 'Expires 12/25',
      'ar': 'ينتهي العرض في 25/12',
      'es': 'Caduca el 25/12',
      'fr': 'Expire le 25/12',
      'zh_Hans': '有效期至12月25日',
    },
    'v7cv7iy1': {
      'en': 'Default',
      'ar': 'تقصير',
      'es': 'Por defecto',
      'fr': 'Défaut',
      'zh_Hans': '默认',
    },
    'odpctq3l': {
      'en': 'Edit',
      'ar': 'يحرر',
      'es': 'Editar',
      'fr': 'Modifier',
      'zh_Hans': '编辑',
    },
    'q9a0uqwq': {
      'en': 'Mastercard •••• 8888',
      'ar': 'ماستركارد •••• 8888',
      'es': 'Mastercard •••• 8888',
      'fr': 'Mastercard •••• 8888',
      'zh_Hans': '万事达卡 •••• 8888',
    },
    'usljbd9z': {
      'en': 'Expires 06/26',
      'ar': 'تاريخ الانتهاء 26/06',
      'es': 'Caduca el 26/06',
      'fr': 'Expire le 26/06',
      'zh_Hans': '有效期至 06/26',
    },
    'tna1edrx': {
      'en': 'Edit',
      'ar': 'يحرر',
      'es': 'Editar',
      'fr': 'Modifier',
      'zh_Hans': '编辑',
    },
    '8vxgjq8y': {
      'en': 'Transaction History',
      'ar': 'سجل المعاملات',
      'es': 'Historial de transacciones',
      'fr': 'Historique des transactions',
      'zh_Hans': '交易历史记录',
    },
    'ekucz2li': {
      'en': 'Date',
      'ar': 'تاريخ',
      'es': 'Fecha',
      'fr': 'Date',
      'zh_Hans': '日期',
    },
    'rtdnr1po': {
      'en': 'Description',
      'ar': 'وصف',
      'es': 'Descripción',
      'fr': 'Description',
      'zh_Hans': '描述',
    },
    'jj6twmla': {
      'en': 'Amount',
      'ar': 'كمية',
      'es': 'Cantidad',
      'fr': 'Montant',
      'zh_Hans': '数量',
    },
    'rysg4zw3': {
      'en': 'Status',
      'ar': 'حالة',
      'es': 'Estado',
      'fr': 'Statut',
      'zh_Hans': '地位',
    },
    '211ifgwc': {
      'en': 'April 22, 2026',
      'ar': '22 أبريل 2026',
      'es': '22 de abril de 2026',
      'fr': '22 avril 2026',
      'zh_Hans': '2026年4月22日',
    },
    'didjca98': {
      'en': 'Las Vegas Trip Booking',
      'ar': 'حجز رحلة إلى لاس فيغاس',
      'es': 'Reserva de viaje a Las Vegas',
      'fr': 'Réservation de voyage à Las Vegas',
      'zh_Hans': '拉斯维加斯旅行预订',
    },
    'xcz8m1km': {
      'en': '\$969.62',
      'ar': '969.62 دولارًا',
      'es': '\$969.62',
      'fr': '969,62 \$',
      'zh_Hans': '969.62美元',
    },
    'yjrbucuc': {
      'en': 'Completed',
      'ar': 'مكتمل',
      'es': 'Terminado',
      'fr': 'Complété',
      'zh_Hans': '完全的',
    },
    'b330gh46': {
      'en': 'April 15, 2026',
      'ar': '15 أبريل 2026',
      'es': '15 de abril de 2026',
      'fr': '15 avril 2026',
      'zh_Hans': '2026年4月15日',
    },
    'm6umeilq': {
      'en': 'Hotel Reservation',
      'ar': 'حجز فندق',
      'es': 'Reserva de hotel',
      'fr': 'Réservation d\'hôtel',
      'zh_Hans': '酒店预订',
    },
    'tz172458': {
      'en': '\$329.00',
      'ar': '329.00 دولارًا',
      'es': '\$329.00',
      'fr': '329,00 \$',
      'zh_Hans': '329.00美元',
    },
    '85ddw54x': {
      'en': 'Completed',
      'ar': 'مكتمل',
      'es': 'Terminado',
      'fr': 'Complété',
      'zh_Hans': '完全的',
    },
    '4he0fw86': {
      'en': 'April 10, 2026',
      'ar': '10 أبريل 2026',
      'es': '10 de abril de 2026',
      'fr': '10 avril 2026',
      'zh_Hans': '2026年4月10日',
    },
    'o4n89sg1': {
      'en': 'Flight Booking',
      'ar': 'حجز الرحلات',
      'es': 'Reserva de vuelos',
      'fr': 'Réservation de vols',
      'zh_Hans': '航班预订',
    },
    '4opa212a': {
      'en': '\$199.00',
      'ar': '199.00 دولارًا',
      'es': '\$199.00',
      'fr': '199,00 \$',
      'zh_Hans': '199.00 美元',
    },
    'bh1uu5cp': {
      'en': 'Completed',
      'ar': 'مكتمل',
      'es': 'Terminado',
      'fr': 'Complété',
      'zh_Hans': '完全的',
    },
    'tzv7bwbo': {
      'en': 'Total Spent',
      'ar': 'إجمالي الإنفاق',
      'es': 'Total gastado',
      'fr': 'Total dépensé',
      'zh_Hans': '总支出',
    },
    'pvieiu6c': {
      'en': '\$1,497.62',
      'ar': '1,497.62 دولارًا',
      'es': '\$1.497,62',
      'fr': '1 497,62 \$',
      'zh_Hans': '1497.62美元',
    },
  },
  // AllSearchBarCopy
  {
    'uzb4as5y': {
      'en': 'Flights',
      'ar': 'رحلات جوية',
      'es': 'Vuelos',
      'fr': 'Vols',
      'zh_Hans': '航班',
    },
    'fjni3mj9': {
      'en': 'One Way',
      'ar': 'طريقة واحدة',
      'es': 'De una sola mano',
      'fr': 'Sens Unique',
      'zh_Hans': '单程',
    },
    'znajptx1': {
      'en': 'Round Trip',
      'ar': 'رحلة ذهاب وعودة',
      'es': 'Ida y vuelta',
      'fr': 'Aller-retour',
      'zh_Hans': '往返',
    },
    '64sjl6a3': {
      'en': 'Multi-City',
      'ar': 'مدن متعددة',
      'es': 'Multiciudad',
      'fr': 'Multi-villes',
      'zh_Hans': '多城市',
    },
    'vwucsw1d': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
      'zh_Hans': '重置',
    },
    'khsbex82': {
      'en': 'From (Enter Airport Code) i.e JFK',
      'ar': 'من',
      'es': 'De',
      'fr': 'Depuis',
      'zh_Hans': '从',
    },
    'zynvhbys': {
      'en': 'To (Enter Airport Code) i.e LAX',
      'ar': 'ل',
      'es': 'A',
      'fr': 'À',
      'zh_Hans': '到',
    },
    'do9g2dvs': {
      'en': 'Depart (YYYY-MM-DD)',
      'ar': 'المغادرة',
      'es': 'Salir',
      'fr': 'Partir',
      'zh_Hans': '出发',
    },
    'po7fexki': {
      'en': 'Return (YYYY-MM-DD)',
      'ar': 'يعود',
      'es': 'Devolver',
      'fr': 'Retour',
      'zh_Hans': '返回',
    },
    '5ogn2dhu': {
      'en': 'Passengers',
      'ar': 'الركاب',
      'es': 'Pasajeros',
      'fr': 'Passagers',
      'zh_Hans': '乘客',
    },
    'cy0o9n71': {
      'en': 'Button',
      'ar': 'زر',
      'es': 'Botón',
      'fr': 'Bouton',
      'zh_Hans': '按钮',
    },
    'hue3r9gq': {
      'en': 'Featured',
      'ar': 'مميز',
      'es': 'Presentado',
      'fr': 'En vedette',
      'zh_Hans': '精选',
    },
    'uwif33q1': {
      'en': 'Stops',
      'ar': 'توقفات',
      'es': 'Paradas',
      'fr': 'Arrêts',
      'zh_Hans': '停止',
    },
    'rgqa6fld': {
      'en': '\$',
      'ar': 'دولار',
      'es': '\$',
      'fr': '\$',
      'zh_Hans': '\$',
    },
    'mr6dl2aw': {
      'en': 'View Details',
      'ar': 'عرض التفاصيل',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'zh_Hans': '查看详情',
    },
    '0avqjkh5': {
      'en': 'Hotel',
      'ar': 'الفندق',
      'es': 'Hotel',
      'fr': 'Hôtel',
      'zh_Hans': '酒店',
    },
    '7y2m7qu2': {
      'en': 'Location',
      'ar': 'موقع',
      'es': 'Ubicación',
      'fr': 'Emplacement',
      'zh_Hans': '地点',
    },
    'kwyx2q8q': {
      'en': 'Check-in',
      'ar': 'تحقق في',
      'es': 'Registrarse',
      'fr': 'Enregistrement',
      'zh_Hans': '报到',
    },
    'ntz8zfka': {
      'en': 'Checkout',
      'ar': 'الدفع',
      'es': 'Verificar',
      'fr': 'Vérifier',
      'zh_Hans': '查看',
    },
    'dobc8fte': {
      'en': 'Guests',
      'ar': 'الضيوف',
      'es': 'Huéspedes',
      'fr': 'Les invités',
      'zh_Hans': '宾客',
    },
    'u3um3czw': {
      'en': 'Coming Soon!',
      'ar': 'قريباً!',
      'es': '¡Muy pronto!',
      'fr': 'À venir!',
      'zh_Hans': '即将推出！',
    },
    'gslpprgb': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
      'zh_Hans': '搜索',
    },
    'sj0bcxum': {
      'en': 'Cars',
      'ar': 'سيارات',
      'es': 'coches',
      'fr': 'Voitures',
      'zh_Hans': '汽车',
    },
    'p0c9naqy': {
      'en': 'Rent Car From',
      'ar': 'استأجر سيارة من',
      'es': 'Alquila un coche desde',
      'fr': 'Louez une voiture chez',
      'zh_Hans': '从……租车',
    },
    '2sig5br2': {
      'en': 'Dropoff Location',
      'ar': 'موقع التسليم',
      'es': 'Lugar de entrega',
      'fr': 'Lieu de dépôt',
      'zh_Hans': '下车地点',
    },
    'pf8pw608': {
      'en': 'Rent From',
      'ar': 'استأجر ابتداءً من',
      'es': 'Alquilar desde',
      'fr': 'Louez à partir de',
      'zh_Hans': '租房',
    },
    'mpb2e9hd': {
      'en': 'Return',
      'ar': 'يعود',
      'es': 'Devolver',
      'fr': 'Retour',
      'zh_Hans': '返回',
    },
    'trmz2cbl': {
      'en': 'Type of Vehicle',
      'ar': 'نوع المركبة',
      'es': 'Tipo de vehículo',
      'fr': 'Type de véhicule',
      'zh_Hans': '车辆类型',
    },
    'uxw07v5u': {
      'en': 'Coming Soon!',
      'ar': 'قريباً!',
      'es': '¡Muy pronto!',
      'fr': 'À venir!',
      'zh_Hans': '即将推出！',
    },
    'vv5003xm': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
      'zh_Hans': '搜索',
    },
    'hmtyrmcs': {
      'en': 'Packages',
      'ar': 'الطرود',
      'es': 'Paquetes',
      'fr': 'Colis',
      'zh_Hans': '包裹',
    },
    '9iq13oih': {
      'en': 'Leaving from',
      'ar': 'المغادرة من',
      'es': 'Saliendo de',
      'fr': 'Départ de',
      'zh_Hans': '离开',
    },
    'ookchhev': {
      'en': 'Going to',
      'ar': 'ذاهب إلى',
      'es': 'Ir a',
      'fr': 'Aller à',
      'zh_Hans': '前往',
    },
    'mulaewfv': {
      'en': 'Date',
      'ar': 'تاريخ',
      'es': 'Fecha',
      'fr': 'Date',
      'zh_Hans': '日期',
    },
    'b9h5wj6m': {
      'en': 'Number of guest',
      'ar': 'عدد الضيوف',
      'es': 'Número de invitados',
      'fr': 'Nombre d\'invités',
      'zh_Hans': '客人人数',
    },
    '58mmur28': {
      'en': 'Coming Soon!',
      'ar': 'قريباً!',
      'es': '¡Muy pronto!',
      'fr': 'À venir!',
      'zh_Hans': '即将推出！',
    },
    'dcdodg1y': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
      'zh_Hans': '搜索',
    },
    'xtxg5aew': {
      'en': 'Things to do',
      'ar': 'أشياء للقيام بها',
      'es': 'Cosas que hacer',
      'fr': 'Choses à faire',
      'zh_Hans': '要做的事',
    },
    'xiq7hgfh': {
      'en': 'Going to',
      'ar': 'استأجر سيارة من',
      'es': 'Alquila un coche desde',
      'fr': 'Louez une voiture chez',
      'zh_Hans': '从……租车',
    },
    'ptyowro5': {
      'en': ' From',
      'ar': 'استأجر ابتداءً من',
      'es': 'Alquilar desde',
      'fr': 'Louez à partir de',
      'zh_Hans': '租房',
    },
    'ga10wdv2': {
      'en': 'Return',
      'ar': 'يعود',
      'es': 'Devolver',
      'fr': 'Retour',
      'zh_Hans': '返回',
    },
    '2yn8q9db': {
      'en': 'Coming Soon!',
      'ar': 'قريباً!',
      'es': '¡Muy pronto!',
      'fr': 'À venir!',
      'zh_Hans': '即将推出！',
    },
    '8jr9ncqe': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
      'zh_Hans': '搜索',
    },
    'wf5pv5a3': {
      'en': 'Cruises',
      'ar': 'الرحلات البحرية',
      'es': 'Cruceros',
      'fr': 'Croisières',
      'zh_Hans': '游轮',
    },
    '1kycclv9': {
      'en': 'From',
      'ar': 'من',
      'es': 'De',
      'fr': 'Depuis',
      'zh_Hans': '从',
    },
    'uhfv4xl2': {
      'en': 'Dropoff Location',
      'ar': 'موقع التسليم',
      'es': 'Lugar de entrega',
      'fr': 'Lieu de dépôt',
      'zh_Hans': '下车地点',
    },
    'v4c0lrla': {
      'en': 'From',
      'ar': 'من',
      'es': 'De',
      'fr': 'Depuis',
      'zh_Hans': '从',
    },
    'j760uoi3': {
      'en': 'Return',
      'ar': 'يعود',
      'es': 'Devolver',
      'fr': 'Retour',
      'zh_Hans': '返回',
    },
    'g691230c': {
      'en': 'Passengers',
      'ar': 'الركاب',
      'es': 'Pasajeros',
      'fr': 'Passagers',
      'zh_Hans': '乘客',
    },
    '7rxx1f9b': {
      'en': 'Coming Soon!',
      'ar': 'قريباً!',
      'es': '¡Muy pronto!',
      'fr': 'À venir!',
      'zh_Hans': '即将推出！',
    },
    'hghwm45s': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
      'zh_Hans': '搜索',
    },
  },
  // resultsectionHotel
  {
    'szvx3mz1': {
      'en': 'Featured',
      'ar': 'مميز',
      'es': 'Presentado',
      'fr': 'En vedette',
      'zh_Hans': '精选',
    },
    'nyes6w3v': {
      'en': 'Paris, France',
      'ar': 'باريس، فرنسا',
      'es': 'París, Francia',
      'fr': 'Paris, France',
      'zh_Hans': '法国巴黎',
    },
    '655kp0pv': {
      'en': 'per night',
      'ar': 'في الليلة الواحدة',
      'es': 'por noche',
      'fr': 'par nuit',
      'zh_Hans': '每晚',
    },
    'z7dst0ia': {
      'en': 'WiFi',
      'ar': 'شبكة واي فاي',
      'es': 'WiFi',
      'fr': 'Wi-Fi',
      'zh_Hans': '无线上网',
    },
    'w3dikg3n': {
      'en': 'Breakfast',
      'ar': 'إفطار',
      'es': 'Desayuno',
      'fr': 'Petit-déjeuner',
      'zh_Hans': '早餐',
    },
    '7dj5zepl': {
      'en': 'Pool',
      'ar': 'حمام سباحة',
      'es': 'Piscina',
      'fr': 'Piscine',
      'zh_Hans': '水池',
    },
    'oofkrmx0': {
      'en': 'View Details',
      'ar': 'عرض التفاصيل',
      'es': 'Ver detalles',
      'fr': 'Voir les détails',
      'zh_Hans': '查看详情',
    },
  },
  // AllSearchBarHomeCopy
  {
    'ffir3ibg': {
      'en': 'Flights',
      'ar': 'رحلات جوية',
      'es': 'Vuelos',
      'fr': 'Vols',
      'zh_Hans': '航班',
    },
    'ry04eud4': {
      'en': 'Round Trip',
      'ar': 'رحلة ذهاب وعودة',
      'es': 'Ida y vuelta',
      'fr': 'Aller-retour',
      'zh_Hans': '往返',
    },
    'bnjfhn4n': {
      'en': 'One Trip',
      'ar': 'رحلة واحدة',
      'es': 'Un viaje',
      'fr': 'Un voyage',
      'zh_Hans': '一次旅行',
    },
    'z3kop4h1': {
      'en': 'Multi-City',
      'ar': 'مدن متعددة',
      'es': 'Multiciudad',
      'fr': 'Multi-villes',
      'zh_Hans': '多城市',
    },
    'kb0dflt0': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
      'zh_Hans': '重置',
    },
    'zmhtic5z': {
      'en': 'From',
      'ar': 'من',
      'es': 'De',
      'fr': 'Depuis',
      'zh_Hans': '从',
    },
    'd629omim': {
      'en': 'To',
      'ar': 'ل',
      'es': 'A',
      'fr': 'À',
      'zh_Hans': '到',
    },
    '78zq4nxj': {
      'en': 'Depart',
      'ar': 'المغادرة',
      'es': 'Salir',
      'fr': 'Partir',
      'zh_Hans': '出发',
    },
    '4zkrc87v': {
      'en': 'Return',
      'ar': 'يعود',
      'es': 'Devolver',
      'fr': 'Retour',
      'zh_Hans': '返回',
    },
    '7u0infzl': {
      'en': 'Passengers',
      'ar': 'الركاب',
      'es': 'Pasajeros',
      'fr': 'Passagers',
      'zh_Hans': '乘客',
    },
    '3cj45t7d': {
      'en': 'Search',
      'ar': 'زر',
      'es': 'Botón',
      'fr': 'Bouton',
      'zh_Hans': '按钮',
    },
    'g40cbio7': {
      'en': 'Hotel',
      'ar': 'الفندق',
      'es': 'Hotel',
      'fr': 'Hôtel',
      'zh_Hans': '酒店',
    },
    'b7cgpeh1': {
      'en': 'Location',
      'ar': 'موقع',
      'es': 'Ubicación',
      'fr': 'Emplacement',
      'zh_Hans': '地点',
    },
    's4nwoh92': {
      'en': 'Check-in',
      'ar': 'تحقق في',
      'es': 'Registrarse',
      'fr': 'Enregistrement',
      'zh_Hans': '报到',
    },
    '472z7mxy': {
      'en': 'Checkout',
      'ar': 'الدفع',
      'es': 'Verificar',
      'fr': 'Vérifier',
      'zh_Hans': '查看',
    },
    'vqb0h25g': {
      'en': 'Guests',
      'ar': 'الضيوف',
      'es': 'Huéspedes',
      'fr': 'Les invités',
      'zh_Hans': '宾客',
    },
    'wmse7dfo': {
      'en': 'Search',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'pl852cpj': {
      'en': 'Coming Soon!',
      'ar': 'قريباً!',
      'es': '¡Muy pronto!',
      'fr': 'À venir!',
      'zh_Hans': '即将推出！',
    },
    'ro5tgg9r': {
      'en': 'Cars',
      'ar': 'سيارات',
      'es': 'coches',
      'fr': 'Voitures',
      'zh_Hans': '汽车',
    },
    'xpu6q1kt': {
      'en': 'Rent Car From',
      'ar': 'استأجر سيارة من',
      'es': 'Alquila un coche desde',
      'fr': 'Louez une voiture chez',
      'zh_Hans': '从……租车',
    },
    'hlu8ewc6': {
      'en': 'Dropoff Location',
      'ar': 'موقع التسليم',
      'es': 'Lugar de entrega',
      'fr': 'Lieu de dépôt',
      'zh_Hans': '下车地点',
    },
    'spfuru18': {
      'en': 'Rent From',
      'ar': 'استأجر ابتداءً من',
      'es': 'Alquilar desde',
      'fr': 'Louez à partir de',
      'zh_Hans': '租房',
    },
    'jgbhkd2l': {
      'en': 'Return',
      'ar': 'يعود',
      'es': 'Devolver',
      'fr': 'Retour',
      'zh_Hans': '返回',
    },
    '4fdono6k': {
      'en': 'Type of Vehicle',
      'ar': 'نوع المركبة',
      'es': 'Tipo de vehículo',
      'fr': 'Type de véhicule',
      'zh_Hans': '车辆类型',
    },
    'kadioho4': {
      'en': 'Search',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'z1p98dyx': {
      'en': 'Coming Soon!',
      'ar': 'قريباً!',
      'es': '¡Muy pronto!',
      'fr': 'À venir!',
      'zh_Hans': '即将推出！',
    },
    '8az579tr': {
      'en': 'Packages',
      'ar': 'الطرود',
      'es': 'Paquetes',
      'fr': 'Colis',
      'zh_Hans': '包裹',
    },
    'xvikqf9e': {
      'en': 'Leaving from',
      'ar': 'المغادرة من',
      'es': 'Saliendo de',
      'fr': 'Départ de',
      'zh_Hans': '离开',
    },
    '3z7dwpai': {
      'en': 'Going to',
      'ar': 'ذاهب إلى',
      'es': 'Ir a',
      'fr': 'Aller à',
      'zh_Hans': '前往',
    },
    'tdme1ut9': {
      'en': 'Date From',
      'ar': 'تاريخ',
      'es': 'Fecha',
      'fr': 'Date',
      'zh_Hans': '日期',
    },
    'cdhgaxow': {
      'en': 'Date To',
      'ar': 'عدد الضيوف',
      'es': 'Número de invitados',
      'fr': 'Nombre d\'invités',
      'zh_Hans': '客人人数',
    },
    '84vjxp93': {
      'en': 'Travellers',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'wsxd8l78': {
      'en': 'Search',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '4fllpytc': {
      'en': 'Coming Soon!',
      'ar': 'قريباً!',
      'es': '¡Muy pronto!',
      'fr': 'À venir!',
      'zh_Hans': '即将推出！',
    },
    '22a7uu7n': {
      'en': 'Things to do',
      'ar': 'أشياء للقيام بها',
      'es': 'Cosas que hacer',
      'fr': 'Choses à faire',
      'zh_Hans': '要做的事',
    },
    'u14clzb9': {
      'en': 'Going to',
      'ar': 'استأجر سيارة من',
      'es': 'Alquila un coche desde',
      'fr': 'Louez une voiture chez',
      'zh_Hans': '从……租车',
    },
    'hixop3qy': {
      'en': 'From',
      'ar': 'استأجر ابتداءً من',
      'es': 'Alquilar desde',
      'fr': 'Louez à partir de',
      'zh_Hans': '租房',
    },
    't75jmj79': {
      'en': 'Return',
      'ar': 'يعود',
      'es': 'Devolver',
      'fr': 'Retour',
      'zh_Hans': '返回',
    },
    '0r5bq6i8': {
      'en': 'Search',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'd0477ouj': {
      'en': 'Coming Soon!',
      'ar': 'قريباً!',
      'es': '¡Muy pronto!',
      'fr': 'À venir!',
      'zh_Hans': '即将推出！',
    },
    'ilyilj3w': {
      'en': 'Cruises',
      'ar': 'الرحلات البحرية',
      'es': 'Cruceros',
      'fr': 'Croisières',
      'zh_Hans': '游轮',
    },
    '1vksg6h2': {
      'en': 'From',
      'ar': 'من',
      'es': 'De',
      'fr': 'Depuis',
      'zh_Hans': '从',
    },
    '25pjkakg': {
      'en': 'Dropoff Location',
      'ar': 'موقع التسليم',
      'es': 'Lugar de entrega',
      'fr': 'Lieu de dépôt',
      'zh_Hans': '下车地点',
    },
    'pik6jj9a': {
      'en': 'From',
      'ar': 'من',
      'es': 'De',
      'fr': 'Depuis',
      'zh_Hans': '从',
    },
    'do8e7xtm': {
      'en': 'Return',
      'ar': 'يعود',
      'es': 'Devolver',
      'fr': 'Retour',
      'zh_Hans': '返回',
    },
    'ol83o5vb': {
      'en': 'Passengers',
      'ar': 'الركاب',
      'es': 'Pasajeros',
      'fr': 'Passagers',
      'zh_Hans': '乘客',
    },
    'hd9nkgzi': {
      'en': 'Search',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'toy11dpi': {
      'en': 'Coming Soon!',
      'ar': 'قريباً!',
      'es': '¡Muy pronto!',
      'fr': 'À venir!',
      'zh_Hans': '即将推出！',
    },
  },
  // ResultsCopyCopy
  {
    'ew8mrutd': {
      'en':
          'I live in Phoenix I want to spend the upcoming weekend in Las Vegas with my friend and go party but also see special historic landmarks, we want to fly and stay at a 4 star casino.',
      'ar':
          'أعيش في فينيكس، وأريد قضاء عطلة نهاية الأسبوع القادمة في لاس فيغاس مع صديقي، والذهاب للاحتفال، ولكن أيضاً زيارة المعالم التاريخية المميزة، ونريد السفر جواً والإقامة في كازينو من فئة 4 نجوم.',
      'es':
          'Vivo en Phoenix y quiero pasar el próximo fin de semana en Las Vegas con mi amigo, ir de fiesta y también visitar lugares históricos especiales. Queremos volar y alojarnos en un casino de 4 estrellas.',
      'fr':
          'J\'habite à Phoenix et je souhaite passer le week-end prochain à Las Vegas avec mon ami pour faire la fête mais aussi visiter des sites historiques importants. Nous voulons prendre l\'avion et séjourner dans un casino 4 étoiles.',
      'zh_Hans':
          '我住在凤凰城，想和朋友一起在即将到来的周末去拉斯维加斯玩乐，也想参观一些特别的历史地标。我们想飞过去，住在一家四星级赌场酒店。',
    },
    'ggodxwlg': {
      'en': 'Researching your destination...',
      'ar': 'البحث عن وجهتك...',
      'es': 'Investigando tu destino...',
      'fr': 'Vous recherchez votre destination...',
      'zh_Hans': '研究您的目的地……',
    },
    'z9e3baq8': {
      'en':
          'Here is your trip information to destination Las Vegas, select the options you want. Let me know if you want to refine your search.',
      'ar':
          'إليك معلومات رحلتك إلى لاس فيغاس، اختر الخيارات التي تناسبك. أخبرني إن كنت ترغب في تحسين بحثك.',
      'es':
          'Aquí tienes la información de tu viaje a Las Vegas. Selecciona las opciones que prefieras. Avísame si quieres refinar tu búsqueda.',
      'fr':
          'Voici les informations concernant votre voyage à Las Vegas. Sélectionnez les options qui vous intéressent. N\'hésitez pas à me contacter si vous souhaitez affiner votre recherche.',
      'zh_Hans': '以下是您前往拉斯维加斯的行程信息，请选择您需要的选项。如果您想进一步筛选搜索结果，请告诉我。',
    },
    'nzlpbani': {
      'en': 'Describe additional details about your trip',
      'ar': 'صف تفاصيل إضافية حول رحلتك',
      'es': 'Describe detalles adicionales sobre tu viaje.',
      'fr': 'Décrivez plus en détail votre voyage',
      'zh_Hans': '请详细描述您的旅行情况',
    },
    '6mih2ups': {
      'en': 'Voice Mode',
      'ar': 'وضع الصوت',
      'es': 'Modo de voz',
      'fr': 'Mode vocal',
      'zh_Hans': '语音模式',
    },
    '3kjym6jc': {
      'en': 'Flights',
      'ar': 'رحلات جوية',
      'es': 'Vuelos',
      'fr': 'Vols',
      'zh_Hans': '航班',
    },
    'ees587ck': {
      'en': 'Delta Airlines',
      'ar': 'خطوط دلتا الجوية',
      'es': 'Delta Airlines',
      'fr': 'Delta Airlines',
      'zh_Hans': '达美航空',
    },
    'e0l47ako': {
      'en': 'DL 2150',
      'ar': 'DL 2150',
      'es': 'DL 2150',
      'fr': 'DL 2150',
      'zh_Hans': 'DL 2150',
    },
    'v5vc8j5g': {
      'en': '\$325',
      'ar': '325 دولارًا',
      'es': '\$325',
      'fr': '325 \$',
      'zh_Hans': '325美元',
    },
    '1naklbyl': {
      'en': '2:10 PM',
      'ar': '2:10 مساءً',
      'es': '14:10',
      'fr': '14h10',
      'zh_Hans': '下午2:10',
    },
    'wjkiyfxd': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'l56q1fwv': {
      'en': '1h 25m • Direct',
      'ar': 'ساعة و25 دقيقة • مباشر',
      'es': '1h 25m • Direct',
      'fr': '1 h 25 min • Direct',
      'zh_Hans': '1小时25分钟 • 直达',
    },
    'v3aioami': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'b9fbs5hb': {
      'en': 'Southwest',
      'ar': 'جنوب غرب',
      'es': 'Suroeste',
      'fr': 'Sud-ouest',
      'zh_Hans': '西南',
    },
    '3ibj04wh': {
      'en': 'WN 2421',
      'ar': 'WN 2421',
      'es': 'WN 2421',
      'fr': 'WN 2421',
      'zh_Hans': 'WN 2421',
    },
    'pv0gj67f': {
      'en': '\$199',
      'ar': '199 دولارًا',
      'es': '\$199',
      'fr': '199 \$',
      'zh_Hans': '199美元',
    },
    'q9u9r1te': {
      'en': '8:45 PM',
      'ar': '8:45 مساءً',
      'es': '20:45',
      'fr': '20h45',
      'zh_Hans': '晚上8:45',
    },
    '4z3hxwe5': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'bukxctow': {
      'en': '1h 10m • Direct',
      'ar': 'ساعة و10 دقائق • مباشر',
      'es': '1h 10m • Direct',
      'fr': '1 h 10 min • Direct',
      'zh_Hans': '1小时10分钟 • 直达',
    },
    'gzaflcbb': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'y3orkkhz': {
      'en': 'American Airlines',
      'ar': 'الخطوط الجوية الأمريكية',
      'es': 'American Airlines',
      'fr': 'American Airlines',
      'zh_Hans': '美国航空公司',
    },
    '0bm8nna4': {
      'en': 'AA 1534',
      'ar': 'AA 1534',
      'es': 'AA 1534',
      'fr': 'AA 1534',
      'zh_Hans': 'AA 1534',
    },
    'b4qcrp0m': {
      'en': '\$215',
      'ar': '215 دولارًا',
      'es': '\$215',
      'fr': '215 \$',
      'zh_Hans': '215美元',
    },
    'cedizmw9': {
      'en': '6:30 AM',
      'ar': '6:30 صباحاً',
      'es': '6:30 AM',
      'fr': '6h30',
      'zh_Hans': '早上6:30',
    },
    'y76gshdz': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'gp590hse': {
      'en': '1h 15m • Direct',
      'ar': 'ساعة و15 دقيقة • مباشر',
      'es': '1h 15m • Direct',
      'fr': '1 h 15 min • Direct',
      'zh_Hans': '1小时15分钟 • 直达',
    },
    'i9a3h775': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    '7pww84so': {
      'en': 'United Airlines',
      'ar': 'الخطوط الجوية المتحدة',
      'es': 'United Airlines',
      'fr': 'United Airlines',
      'zh_Hans': '联合航空公司',
    },
    'p2v6qxaw': {
      'en': 'UA 892',
      'ar': 'UA 892',
      'es': 'UA 892',
      'fr': 'UA 892',
      'zh_Hans': 'UA 892',
    },
    '9816qnuc': {
      'en': '\$289',
      'ar': '289 دولارًا',
      'es': '\$289',
      'fr': '289 \$',
      'zh_Hans': '289美元',
    },
    'tzy6fi9t': {
      'en': '11:20 AM',
      'ar': '11:20 صباحاً',
      'es': '11:20 AM',
      'fr': '11h20',
      'zh_Hans': '上午11:20',
    },
    '01v7jowv': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    '8tegeabo': {
      'en': '1h 20m • Direct',
      'ar': 'ساعة و20 دقيقة • مباشر',
      'es': '1h 20m • Direct',
      'fr': '1 h 20 min • Direct',
      'zh_Hans': '1小时20分钟 • 直达',
    },
    'gzcudw9m': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'pzp8a3iu': {
      'en': 'Frontier Airlines',
      'ar': 'خطوط فرونتير الجوية',
      'es': 'Frontier Airlines',
      'fr': 'Frontier Airlines',
      'zh_Hans': '边疆航空',
    },
    'kaw55uyl': {
      'en': 'F9 1056',
      'ar': 'F9 1056',
      'es': 'F9 1056',
      'fr': 'F9 1056',
      'zh_Hans': 'F9 1056',
    },
    'd2ce3gt4': {
      'en': '\$16',
      'ar': '16 دولارًا',
      'es': '\$16',
      'fr': '16 \$',
      'zh_Hans': '16美元',
    },
    'btt76u9d': {
      'en': '3:45 PM',
      'ar': '3:45 مساءً',
      'es': '15:45',
      'fr': '15h45',
      'zh_Hans': '下午3:45',
    },
    'o6fbgkge': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    'cyk8lzrh': {
      'en': '1h 12m • Direct',
      'ar': 'ساعة و12 دقيقة • مباشر',
      'es': '1h 12m • Direct',
      'fr': '1 h 12 min • Direct',
      'zh_Hans': '1小时12分钟 • 直达',
    },
    'okp3q430': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    'r2im1d37': {
      'en': 'Southwest',
      'ar': 'جنوب غرب',
      'es': 'Suroeste',
      'fr': 'Sud-ouest',
      'zh_Hans': '西南',
    },
    '9itan3zm': {
      'en': 'WN 2420',
      'ar': 'WN 2420',
      'es': 'WN 2420',
      'fr': 'WN 2420',
      'zh_Hans': 'WN 2420',
    },
    'e7yrccto': {
      'en': '\$269',
      'ar': '269 ​​دولارًا',
      'es': '\$269',
      'fr': '269 ​​\$',
      'zh_Hans': '269美元',
    },
    'kn90z4cc': {
      'en': '12:35 PM',
      'ar': '12:35 مساءً',
      'es': '12:35 p. m.',
      'fr': '12h35',
      'zh_Hans': '下午12:35',
    },
    'onc7z9br': {
      'en': 'PHX → LAS',
      'ar': 'PHX → LAS',
      'es': 'PHX → LAS',
      'fr': 'PHX → LAS',
      'zh_Hans': 'PHX → LAS',
    },
    '8weqrntp': {
      'en': '1h 10m • Direct',
      'ar': 'ساعة و10 دقائق • مباشر',
      'es': '1h 10m • Direct',
      'fr': '1 h 10 min • Direct',
      'zh_Hans': '1小时10分钟 • 直达',
    },
    'ursbacxt': {
      'en': 'More Info',
      'ar': 'مزيد من المعلومات',
      'es': 'Más información',
      'fr': 'Plus d\'infos',
      'zh_Hans': '更多信息',
    },
    '9kdljixe': {
      'en': 'Hotels',
      'ar': 'الفنادق',
      'es': 'Hoteles',
      'fr': 'Hôtels',
      'zh_Hans': '酒店',
    },
    'gha2aoc5': {
      'en': 'Bellagio Hotel & Casino',
      'ar': 'فندق وكازينو بيلاجيو',
      'es': 'Hotel y casino Bellagio',
      'fr': 'Hôtel et casino Bellagio',
      'zh_Hans': '百乐宫酒店及赌场',
    },
    'zur6ckoi': {
      'en': '4.8',
      'ar': '4.8',
      'es': '4.8',
      'fr': '4.8',
      'zh_Hans': '4.8',
    },
    '2emek49a': {
      'en': '\$289/night',
      'ar': '289 دولارًا في الليلة',
      'es': '\$289 por noche',
      'fr': '289 \$/nuit',
      'zh_Hans': '每晚289美元',
    },
    'gthc9bo5': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'bzgqaunm': {
      'en': 'The Venetian Resort',
      'ar': 'منتجع فينيشيان',
      'es': 'El complejo turístico veneciano',
      'fr': 'Le Venetian Resort',
      'zh_Hans': '威尼斯人度假酒店',
    },
    'elzbptnp': {
      'en': '4.7',
      'ar': '4.7',
      'es': '4.7',
      'fr': '4.7',
      'zh_Hans': '4.7',
    },
    '51u5jhx9': {
      'en': '\$329/night',
      'ar': '329 دولارًا في الليلة',
      'es': '\$329 por noche',
      'fr': '329 \$/nuit',
      'zh_Hans': '每晚 329 美元',
    },
    '2tpxjf0l': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'pqu5fxmh': {
      'en': 'Wynn Las Vegas',
      'ar': 'وين لاس فيغاس',
      'es': 'Wynn Las Vegas',
      'fr': 'Wynn Las Vegas',
      'zh_Hans': '永利拉斯维加斯',
    },
    'xp6raa58': {
      'en': '4.9',
      'ar': '4.9',
      'es': '4.9',
      'fr': '4.9',
      'zh_Hans': '4.9',
    },
    'ksqvglu8': {
      'en': '\$399/night',
      'ar': '399 دولارًا في الليلة',
      'es': '\$399 por noche',
      'fr': '399 \$/nuit',
      'zh_Hans': '每晚 399 美元',
    },
    'da1nem2d': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'p2zg8q3y': {
      'en': 'MGM Grand',
      'ar': 'إم جي إم جراند',
      'es': 'MGM Grand',
      'fr': 'MGM Grand',
      'zh_Hans': '米高梅大酒店',
    },
    'ztk165zx': {
      'en': '4.6',
      'ar': '4.6',
      'es': '4.6',
      'fr': '4.6',
      'zh_Hans': '4.6',
    },
    'n98wnxxk': {
      'en': '\$219/night',
      'ar': '219 دولارًا في الليلة',
      'es': '\$219 por noche',
      'fr': '219 \$/nuit',
      'zh_Hans': '每晚219美元',
    },
    '4g4srxql': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    '03go2kz8': {
      'en': 'Caesars Palace',
      'ar': 'قصر سيزرز',
      'es': 'Palacio de César',
      'fr': 'Palais de César',
      'zh_Hans': '凯撒宫',
    },
    'oj0t3066': {
      'en': '4.7',
      'ar': '4.7',
      'es': '4.7',
      'fr': '4.7',
      'zh_Hans': '4.7',
    },
    'gi2qgocg': {
      'en': '\$349/night',
      'ar': '349 دولارًا في الليلة',
      'es': '\$349 por noche',
      'fr': '349 \$/nuit',
      'zh_Hans': '每晚 349 美元',
    },
    'mrgy8lrm': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'wv09z6q0': {
      'en': 'Mandalay Bay',
      'ar': 'خليج ماندالاي',
      'es': 'Mandalay Bay',
      'fr': 'Baie de Mandalay',
      'zh_Hans': '曼德勒海湾',
    },
    'zfu57t1g': {
      'en': '4.2',
      'ar': '4.2',
      'es': '4.2',
      'fr': '4.2',
      'zh_Hans': '4.2',
    },
    'lc4x9oy6': {
      'en': '\$249/night',
      'ar': '249 دولارًا في الليلة',
      'es': '\$249 por noche',
      'fr': '249 \$/nuit',
      'zh_Hans': '每晚249美元',
    },
    '4nszk47v': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'ihcs0d0f': {
      'en': 'The LINQ',
      'ar': 'لينك',
      'es': 'El LINQ',
      'fr': 'Le LINQ',
      'zh_Hans': 'LINQ',
    },
    'uq8n0gbd': {
      'en': '4.3',
      'ar': '4.3',
      'es': '4.3',
      'fr': '4.3',
      'zh_Hans': '4.3',
    },
    'hgl0mwc9': {
      'en': '\$349/night',
      'ar': '349 دولارًا في الليلة',
      'es': '\$349 por noche',
      'fr': '349 \$/nuit',
      'zh_Hans': '每晚 349 美元',
    },
    'ycjjmunm': {
      'en': 'Learn More',
      'ar': 'يتعلم أكثر',
      'es': 'Más información',
      'fr': 'Apprendre encore plus',
      'zh_Hans': '了解更多',
    },
    'w9ygo9ji': {
      'en': 'Book',
      'ar': 'كتاب',
      'es': 'Libro',
      'fr': 'Livre',
      'zh_Hans': '书',
    },
  },
  // Header
  {
    'k1vkcj3i': {
      'en': '🎁 Promotional offer',
      'ar': '🎁 عرض ترويجي',
      'es': '🎁 Oferta promocional',
      'fr': '🎁 Offre promotionnelle',
      'zh_Hans': '🎁 促销优惠',
    },
    'ti6cor9g': {
      'en': ' Login ',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'zh_Hans': '登录',
    },
    '6f9q6c60': {
      'en': 'Plan Your Trip',
      'ar': 'خطط لرحلتك',
      'es': 'Planifica tu viaje',
      'fr': 'Planifiez votre voyage',
      'zh_Hans': '计划您的行程',
    },
    'lvpe8a5f': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
    'k9ei0y2m': {
      'en': 'About',
      'ar': 'عن',
      'es': 'Acerca de',
      'fr': 'À propos',
      'zh_Hans': '关于',
    },
    'ofiunkrd': {
      'en': 'Travel eBook',
      'ar': 'كتاب إلكتروني عن السفر',
      'es': 'Libro electrónico de viajes',
      'fr': 'Livre électronique de voyage',
      'zh_Hans': '旅游电子书',
    },
    '3b2yq4t1': {
      'en': 'Booking for Visa',
      'ar': 'حجز تأشيرة',
      'es': 'Reserva para visa',
      'fr': 'Réservation de visa',
      'zh_Hans': '签证预约',
    },
    'tgn3laol': {
      'en': 'Pricing',
      'ar': 'التسعير',
      'es': 'Precios',
      'fr': 'Tarification',
      'zh_Hans': '定价',
    },
    'seqmr7ss': {
      'en': 'Blog',
      'ar': 'مدونة',
      'es': 'Blog',
      'fr': 'Blog',
      'zh_Hans': '博客',
    },
    'mdc2zcij': {
      'en': 'FAQs',
      'ar': 'الأسئلة الشائعة',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
      'zh_Hans': '常见问题解答',
    },
  },
  // HeaderMobile
  {
    'm4lwo30c': {
      'en': '🎁 Promotional offer',
      'ar': '🎁 عرض ترويجي',
      'es': '🎁 Oferta promocional',
      'fr': '🎁 Offre promotionnelle',
      'zh_Hans': '🎁 促销优惠',
    },
    'bt4mcaad': {
      'en': ' Login ',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'zh_Hans': '登录',
    },
    'lookuvgl': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
    'p7zi1tds': {
      'en': 'About',
      'ar': 'عن',
      'es': 'Acerca de',
      'fr': 'À propos',
      'zh_Hans': '关于',
    },
    '51g6liq9': {
      'en': 'Travel eBook',
      'ar': 'كتاب إلكتروني عن السفر',
      'es': 'Libro electrónico de viajes',
      'fr': 'Livre électronique de voyage',
      'zh_Hans': '旅游电子书',
    },
    'oumpe298': {
      'en': 'Booking for Visa',
      'ar': 'حجز تأشيرة',
      'es': 'Reserva para visa',
      'fr': 'Réservation de visa',
      'zh_Hans': '签证预约',
    },
    'fium7qmc': {
      'en': 'Pricing',
      'ar': 'التسعير',
      'es': 'Precios',
      'fr': 'Tarification',
      'zh_Hans': '定价',
    },
    'lwqmhpt5': {
      'en': 'Blog',
      'ar': 'مدونة',
      'es': 'Blog',
      'fr': 'Blog',
      'zh_Hans': '博客',
    },
    'kc0pi9aa': {
      'en': 'FAQs',
      'ar': 'الأسئلة الشائعة',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
      'zh_Hans': '常见问题解答',
    },
    '1jtogmnq': {
      'en': 'Plan Your Trip',
      'ar': 'خطط لرحلتك',
      'es': 'Planifica tu viaje',
      'fr': 'Planifiez votre voyage',
      'zh_Hans': '计划您的行程',
    },
  },
  // PopularAirlinesmobilr
  {
    'n76sshfe': {
      'en': 'Your Favorite Airlines',
      'ar': 'شركات الطيران المفضلة لديك',
      'es': 'Tus aerolíneas favoritas',
      'fr': 'Vos compagnies aériennes préférées',
      'zh_Hans': '您最喜爱的航空公司',
    },
    'p19tz4nb': {
      'en': 'Explore all',
      'ar': 'استكشف الكل',
      'es': 'Explorar todo',
      'fr': 'Explorez tout',
      'zh_Hans': '探索全部',
    },
    '1kigocm6': {
      'en': 'Air France',
      'ar': 'الخطوط الجوية الفرنسية',
      'es': 'Air France',
      'fr': 'Air France',
      'zh_Hans': '法国航空',
    },
    'vo4ljqic': {
      'en': 'British Airways',
      'ar': 'الخطوط الجوية البريطانية',
      'es': 'British Airways',
      'fr': 'British Airways',
      'zh_Hans': '英国航空公司',
    },
    'vf9uy3d4': {
      'en': 'Air China',
      'ar': 'الخطوط الجوية الصينية',
      'es': 'Aire China',
      'fr': 'Air China',
      'zh_Hans': '中国国际航空公司',
    },
    'twm1ikng': {
      'en': 'Lufthansa',
      'ar': 'لوفتهانزا',
      'es': 'Lufthansa',
      'fr': 'Lufthansa',
      'zh_Hans': '汉莎航空',
    },
    'oc1xhykt': {
      'en': 'Emirates ',
      'ar': 'طيران الإمارات',
      'es': 'Emiratos',
      'fr': 'Émirats',
      'zh_Hans': '阿联酋航空',
    },
    'gu55uamh': {
      'en': 'Royal Dutch Airlines',
      'ar': 'الخطوط الجوية الملكية الهولندية',
      'es': 'Real Aerolínea Holandesa',
      'fr': 'Royal Dutch Airlines',
      'zh_Hans': '荷兰皇家航空公司',
    },
    'tdypi516': {
      'en': 'Southwest Airlines',
      'ar': 'خطوط طيران ساوث ويست',
      'es': 'Southwest Airlines',
      'fr': 'Southwest Airlines',
      'zh_Hans': '西南航空公司',
    },
    'rl6z38v7': {
      'en': 'SWISS',
      'ar': 'سويسري',
      'es': 'SUIZO',
      'fr': 'SUISSE',
      'zh_Hans': '瑞士',
    },
    'k586jnk6': {
      'en': 'Singapore Airlines',
      'ar': 'الخطوط الجوية السنغافورية',
      'es': 'Singapore Airlines',
      'fr': 'Singapore Airlines',
      'zh_Hans': '新加坡航空公司',
    },
    'rl8g8noc': {
      'en': 'Delta Airlines',
      'ar': 'خطوط دلتا الجوية',
      'es': 'Delta Airlines',
      'fr': 'Delta Airlines',
      'zh_Hans': '达美航空',
    },
    'yf9anzl5': {
      'en': 'Ryanair',
      'ar': 'ريان إير',
      'es': 'Ryanair',
      'fr': 'Ryanair',
      'zh_Hans': '瑞安航空',
    },
    '8in9blmo': {
      'en': 'United Airlines',
      'ar': 'الخطوط الجوية المتحدة',
      'es': 'United Airlines',
      'fr': 'United Airlines',
      'zh_Hans': '联合航空公司',
    },
    '92ewbrhe': {
      'en': 'American Airlines',
      'ar': 'الخطوط الجوية الأمريكية',
      'es': 'American Airlines',
      'fr': 'American Airlines',
      'zh_Hans': '美国航空公司',
    },
    'smjzb60b': {
      'en': 'Qatar Airways',
      'ar': 'الخطوط الجوية القطرية',
      'es': 'Qatar Airways',
      'fr': 'Qatar Airways',
      'zh_Hans': '卡塔尔航空公司',
    },
  },
  // WebFooterMobile
  {
    'u3mbfj2l': {
      'en': 'Company',
      'ar': 'شركة',
      'es': 'Compañía',
      'fr': 'Entreprise',
      'zh_Hans': '公司',
    },
    'sa1kwmkd': {
      'en': 'About Us',
      'ar': 'معلومات عنا',
      'es': 'Sobre nosotros',
      'fr': 'À propos de nous',
      'zh_Hans': '关于我们',
    },
    'e0z4vcqd': {
      'en': 'Our Vision & Ethics',
      'ar': 'رؤيتنا وأخلاقياتنا',
      'es': 'Nuestra visión y ética',
      'fr': 'Notre vision et notre éthique',
      'zh_Hans': '我们的愿景与道德准则',
    },
    'gf8s6iin': {
      'en': 'Team Members',
      'ar': 'أعضاء الفريق',
      'es': 'Miembros del equipo',
      'fr': 'Membres de l\'équipe',
      'zh_Hans': '团队成员',
    },
    'iid9l5dh': {
      'en': 'All in One Platform',
      'ar': 'منصة متكاملة',
      'es': 'Plataforma todo en uno',
      'fr': 'Plateforme tout-en-un',
      'zh_Hans': '一体化平台',
    },
    '73ift7tp': {
      'en': 'Features',
      'ar': 'سمات',
      'es': 'Características',
      'fr': 'Caractéristiques',
      'zh_Hans': '特征',
    },
    'vnsnpolr': {
      'en': 'AI Travel Guide Generator',
      'ar': 'مولد دليل السفر بالذكاء الاصطناعي',
      'es': 'Generador de guías de viaje con IA',
      'fr': 'Générateur de guides de voyage IA',
      'zh_Hans': 'AI旅行指南生成器',
    },
    'poew7xxt': {
      'en': 'Trip Planner',
      'ar': 'مخطط الرحلات',
      'es': 'Planificador de viajes',
      'fr': 'Planificateur de voyage',
      'zh_Hans': '旅行计划',
    },
    'cfpneinx': {
      'en': 'Booking for Visa',
      'ar': 'حجز تأشيرة',
      'es': 'Reserva para visa',
      'fr': 'Réservation de visa',
      'zh_Hans': '签证预约',
    },
    'i5bks0rw': {
      'en': 'Visa Information',
      'ar': 'معلومات التأشيرة',
      'es': 'Información sobre visados',
      'fr': 'Informations sur les visas',
      'zh_Hans': '签证信息',
    },
    'tun8tgan': {
      'en': 'Expert Hub',
      'ar': 'مركز الخبراء',
      'es': 'Centro de expertos',
      'fr': 'Centre d\'experts',
      'zh_Hans': '专家中心',
    },
    'b9f1ihog': {
      'en': 'eBook Generator',
      'ar': 'مولد الكتب الإلكترونية',
      'es': 'Generador de libros electrónicos',
      'fr': 'Générateur de livres électroniques',
      'zh_Hans': '电子书生成器',
    },
    'qgtlot5o': {
      'en': 'Flights, Hotels & Cars',
      'ar': 'رحلات الطيران والفنادق والسيارات',
      'es': 'Vuelos, hoteles y coches',
      'fr': 'Vols, hôtels et voitures',
      'zh_Hans': '机票、酒店和租车',
    },
    '3k67uzl7': {
      'en': 'All Packages',
      'ar': 'جميع الباقات',
      'es': 'Todos los paquetes',
      'fr': 'Tous les forfaits',
      'zh_Hans': '所有套餐',
    },
    'nz8hfezf': {
      'en': 'Cruise Booking',
      'ar': 'حجز رحلة بحرية',
      'es': 'Reserva de cruceros',
      'fr': 'Réservation de croisière',
      'zh_Hans': '邮轮预订',
    },
    'gln2q2h5': {
      'en': 'Resources',
      'ar': 'موارد',
      'es': 'Recursos',
      'fr': 'Ressources',
      'zh_Hans': '资源',
    },
    'e8lax0mp': {
      'en': 'Pricing Plan',
      'ar': 'خطة التسعير',
      'es': 'Plan de precios',
      'fr': 'Plan tarifaire',
      'zh_Hans': '定价方案',
    },
    'fcgmxj16': {
      'en': 'Blog',
      'ar': 'مدونة',
      'es': 'Blog',
      'fr': 'Blog',
      'zh_Hans': '博客',
    },
    '61btd5jx': {
      'en': 'Flight Cancellation & Refund Guide',
      'ar': 'دليل إلغاء الرحلات الجوية واسترداد الأموال',
      'es': 'Guía de cancelación y reembolso de vuelos',
      'fr': 'Guide d\'annulation et de remboursement des vols',
      'zh_Hans': '航班取消及退款指南',
    },
    '6pz78j7l': {
      'en': 'Kitravia Premium',
      'ar': 'كيترافيا بريميوم',
      'es': 'Kitravia Premium',
      'fr': 'Kitravia Premium',
      'zh_Hans': 'Kitravia Premium',
    },
    '8ukk48as': {
      'en': 'Referral Program',
      'ar': 'برنامج الإحالة',
      'es': 'Programa de recomendación',
      'fr': 'Programme de parrainage',
      'zh_Hans': '推荐计划',
    },
    'wo01r3zv': {
      'en': 'API & Developer Portal',
      'ar': 'واجهة برمجة التطبيقات وبوابة المطورين',
      'es': 'API y portal para desarrolladores',
      'fr': 'Portail API et développeurs',
      'zh_Hans': 'API 和开发者门户',
    },
    '8ms552ua': {
      'en': 'Legal',
      'ar': 'قانوني',
      'es': 'Legal',
      'fr': 'Légal',
      'zh_Hans': '合法的',
    },
    'lwnvbriz': {
      'en': 'Terms & Conditions',
      'ar': 'الشروط والأحكام',
      'es': 'Términos y condiciones',
      'fr': 'Conditions générales',
      'zh_Hans': '条款及细则',
    },
    's31hf23q': {
      'en': 'Refund & Cancelllation Poliicy',
      'ar': 'سياسة الاسترداد والإلغاء',
      'es': 'Política de reembolsos y cancelaciones',
      'fr': 'Politique de remboursement et d\'annulation',
      'zh_Hans': '退款和取消政策',
    },
    'hj8j5uws': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
      'zh_Hans': '隐私政策',
    },
    'f823xgda': {
      'en': 'Cookie Policy',
      'ar': 'سياسة ملفات تعريف الارتباط',
      'es': 'Política de cookies',
      'fr': 'Politique relative aux cookies',
      'zh_Hans': 'Cookie政策',
    },
    'h341fmgg': {
      'en': 'Booking Policy',
      'ar': 'سياسة الحجز',
      'es': 'Política de reservas',
      'fr': 'Politique de réservation',
      'zh_Hans': '预订政策',
    },
    'hqxc75c7': {
      'en': 'Referral Program T&Cs',
      'ar': 'شروط وأحكام برنامج الإحالة',
      'es': 'Términos y condiciones del programa de referidos',
      'fr': 'Conditions générales du programme de parrainage',
      'zh_Hans': '推荐计划条款及细则',
    },
    '8j46hqrm': {
      'en': 'Accesibility Statement',
      'ar': 'بيان إمكانية الوصول',
      'es': 'Declaración de accesibilidad',
      'fr': 'Déclaration d\'accessibilité',
      'zh_Hans': '无障碍声明',
    },
    'c9e6hr95': {
      'en': 'API Developer Agreement',
      'ar': 'اتفاقية مطور واجهة برمجة التطبيقات',
      'es': 'Acuerdo para desarrolladores de API',
      'fr': 'Contrat de développeur d\'API',
      'zh_Hans': 'API开发者协议',
    },
    '6firltl3': {
      'en': 'Support',
      'ar': 'يدعم',
      'es': 'Apoyo',
      'fr': 'Soutien',
      'zh_Hans': '支持',
    },
    'o3mcmop0': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
      'es': 'Contáctanos',
      'fr': 'Contactez-nous',
      'zh_Hans': '联系我们',
    },
    'rjp1xa33': {
      'en': 'FAQs',
      'ar': 'الأسئلة الشائعة',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
      'zh_Hans': '常见问题解答',
    },
    '7f7qf4jv': {
      'en': 'Report an Issue',
      'ar': 'الإبلاغ عن مشكلة',
      'es': 'Informar de un problema',
      'fr': 'Signaler un problème',
      'zh_Hans': '报告问题',
    },
    'plghaelt': {
      'en': 'Explore Intelligently. Travel Freely.',
      'ar': 'استكشف بذكاء. سافر بحرية.',
      'es': 'Explora con inteligencia. Viaja con libertad.',
      'fr': 'Explorez intelligemment. Voyagez librement.',
      'zh_Hans': '智慧探索，自由旅行。',
    },
    'dfkju43j': {
      'en': '© 2025 Kitravia. All rights reserved. ',
      'ar': '© 2025 كيترافيا. جميع الحقوق محفوظة.',
      'es': '© 2025 Kitravia. Todos los derechos reservados.',
      'fr': '© 2025 Kitravia. Tous droits réservés.',
      'zh_Hans': '© 2025 Kitravia。版权所有。',
    },
    'kme3bv4k': {
      'en': 'Language | Currency | Dark/Light Mode Toggle',
      'ar': 'اللغة | العملة | تبديل الوضع الداكن/الفاتح',
      'es': 'Idioma | Moneda | Alternar modo oscuro/claro',
      'fr': 'Langue | Devise | Basculer entre le mode clair et sombre',
      'zh_Hans': '语言 | 货币 | 深色/浅色模式切换',
    },
  },
  // Miscellaneous
  {
    '202rij24': {
      'en': 'Button',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'eyydxkf7': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'b20zy965': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'vnnfbhrt': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'lf3vdrdb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'i2eo4f16': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '8rg9b5pb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'omyv457k': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '01cs8ukj': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'yie4wpgf': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'aqp4sg6a': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7nkmvs2v': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'n7zbs108': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'y0llcd61': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'z52dnzjx': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'g15vsglb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '8qp7abmm': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'vebvvy1i': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'gsu23vr1': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9e57dax3': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ofjv7eml': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'wi15vqjy': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'mfjeir5m': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'mt18ytkz': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'a051d7pe': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'y281qq7c': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
