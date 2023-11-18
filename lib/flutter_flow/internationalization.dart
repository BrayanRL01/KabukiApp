import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

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
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // sobreNosotros
  {
    'vnxmfh6l': {
      'es':
          '     Descubre el poder que tienes para \ntransformarte y sentirte hermosa cada día.',
      'en': '',
    },
    'gnq4bk0q': {
      'es':
          '¡Hola! \nSoy Ale, y me complace compartir\n un poco de mi vida contigo.',
      'en': '',
    },
    'e0hhmfyb': {
      'es':
          'Desde el 2015, me dedico al mundo de la belleza,\ny en especial al maquillaje, ya que me encanta\nresaltar la belleza natural que cada persona tiene.\nSoy una persona creativa, soñadora y muy trabajadora,\ndisfruto mucho trabajar con personas.\n',
      'en': '',
    },
    'ceu4z8vj': {
      'es':
          'Quiero agradecerte por utilizar esta aplicación y \n espero tener el placer de atenderte en lo que necesites.',
      'en': '',
    },
    'mm8uozm0': {
      'es': '¡Un abrazo!',
      'en': '',
    },
    'qi3e08l8': {
      'es': 'Home',
      'en': '',
    },
  },
  // LoginPage
  {
    'b5egkd9t': {
      'es': 'Kabuki',
      'en': '',
    },
    'h64my6oi': {
      'es': 'Bienvenida',
      'en': '',
    },
    '5mfx1u2c': {
      'es': 'Descubre que tenemos para ti',
      'en': '',
    },
    'lnk1yy94': {
      'es': 'Correo Electrónico',
      'en': '',
    },
    'vd992itv': {
      'es': 'Contraseña',
      'en': '',
    },
    'dr94e0p6': {
      'es': 'Ingresar',
      'en': '',
    },
    'b1zesyp0': {
      'es': 'Recuperar contraseña',
      'en': '',
    },
    'c7y84viy': {
      'es': '¿No tienes cuenta?',
      'en': '',
    },
    'nlh8t64c': {
      'es': 'Ingresa aqui',
      'en': '',
    },
  },
  // Register
  {
    '9p4usmkv': {
      'es': 'Kabuki',
      'en': '',
    },
    'csy0pze2': {
      'es': '¡Unete y sé parte de nuestra comunidad!',
      'en': '',
    },
    '0tc6okmd': {
      'es': 'Nombre Completo',
      'en': '',
    },
    'ukxqbilm': {
      'es': 'Correo Electrónico',
      'en': '',
    },
    'cwzme2ma': {
      'es': 'Número de Telefono',
      'en': '',
    },
    '0381p578': {
      'es': 'Fecha de Nacimiento',
      'en': '',
    },
    'trjeykq9': {
      'es': 'Contraseña',
      'en': '',
    },
    'ogulqqr1': {
      'es': 'Confirmar Contraseña',
      'en': '',
    },
    'a6nmvukk': {
      'es': 'Registrarse',
      'en': '',
    },
    'k2i5pmfw': {
      'es': '¿Ya tienes una cuenta? ',
      'en': '',
    },
    'z6njv5a1': {
      'es': 'Inicia Sesión',
      'en': '',
    },
    'lef8ep6t': {
      'es': 'Field is required',
      'en': '',
    },
    'bh7o8vfd': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'jexh7iqe': {
      'es': 'Field is required',
      'en': '',
    },
    'ikbh3rqa': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'n3qqmcnc': {
      'es': 'Field is required',
      'en': '',
    },
    'zxtwx9nl': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'lzth4xge': {
      'es': 'Field is required',
      'en': '',
    },
    'ly5wf492': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'jt8ckn9x': {
      'es': 'Field is required',
      'en': '',
    },
    'g4lufpbc': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // producto
  {
    'g30fmqjw': {
      'es': 'Base Beauty Creations Flawless Stay Foundation',
      'en': '',
    },
    'bddhodx4': {
      'es': '₡ 8.900',
      'en': '',
    },
    'x67ipkgq': {
      'es':
          'Base Beauty Creations Flawless Stay Fundation. Excelente base para mantener de media a alta cobertura.',
      'en': '',
    },
    'qap3rckm': {
      'es': 'Page Title',
      'en': '',
    },
    'nak0ewsw': {
      'es': 'Home',
      'en': '',
    },
  },
  // frmCliente
  {
    'c72s9s1x': {
      'es':
          'Este formulario será de ayuda para conocer cuál \nproducto es mejor para vos. ',
      'en': '',
    },
    '0hk4ixcd': {
      'es': 'Nombre',
      'en': '',
    },
    '67jeljc0': {
      'es': 'Provincia',
      'en': '',
    },
    'k9xxihs7': {
      'es': 'Edad',
      'en': '',
    },
    'too1ebqh': {
      'es': 'Tipo de Piel',
      'en': '',
    },
    '6ukyjlbk': {
      'es': 'Alergias',
      'en': '',
    },
    'u78z1vy6': {
      'es': 'Color de Piel',
      'en': '',
    },
    'fpvlcdxr': {
      'es': 'Guardar',
      'en': '',
    },
    'bnogrqa2': {
      'es': 'Continuar',
      'en': '',
    },
    'os1d5p7x': {
      'es': 'Home',
      'en': '',
    },
  },
  // productos
  {
    'hfjtnt37': {
      'es': 'Home',
      'en': '',
    },
  },
  // infoPerfil
  {
    '0gv8hagp': {
      'es': 'Agregar foto de perfil',
      'en': '',
    },
    'v30kgpiv': {
      'es': 'Digite su nombre',
      'en': '',
    },
    'mj4fqvt6': {
      'es': 'Digite su correo',
      'en': '',
    },
    '82hi21ts': {
      'es': 'Fecha de nacimiento',
      'en': '',
    },
    'wuu2ulhs': {
      'es': 'Digite su número de teléfono',
      'en': '',
    },
    'itpbs5cf': {
      'es': 'Digite su contraseña',
      'en': '',
    },
    'ndkyyuhg': {
      'es': 'Editar Perfil',
      'en': '',
    },
    'n3zeok1v': {
      'es': 'Su nombre es requerido.',
      'en': '',
    },
    '18b5k3ks': {
      'es': 'El mínimo de caracteres es de 10.',
      'en': '',
    },
    'c0zl13ap': {
      'es': 'El máximo de caracteres es de 30',
      'en': '',
    },
    'zzmkk40h': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '3cj3f7n3': {
      'es': 'Su correo electrónico es requerido.',
      'en': '',
    },
    'edx0mrtk': {
      'es': 'Debe ser un correo válido.',
      'en': '',
    },
    'f1u15tti': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'e2j2inz2': {
      'es': 'Field is required',
      'en': '',
    },
    'tymkm8ri': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'stozcbbp': {
      'es': 'Su número telefónico es requerido.',
      'en': '',
    },
    'hse0zh67': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'kirs2naw': {
      'es': 'Field is required',
      'en': '',
    },
    '4rg2563w': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '1dh9zc2g': {
      'es': 'Home',
      'en': '',
    },
  },
  // editarCliente
  {
    'svz1pwlk': {
      'es': 'Cumpleaños',
      'en': '',
    },
    'u1tav54m': {
      'es': 'Número',
      'en': '',
    },
    'ea9lqnfq': {
      'es': 'Correo',
      'en': '',
    },
    'umvqpm78': {
      'es': 'Color de Piel',
      'en': '',
    },
    'irgfi9my': {
      'es': 'Guardar',
      'en': '',
    },
    'zs58r6lw': {
      'es': 'Continuar',
      'en': '',
    },
    'w32py221': {
      'es': 'Home',
      'en': '',
    },
  },
  // infoMaquillaje
  {
    '0gdv6rei': {
      'es': 'Skincare',
      'en': '',
    },
    'pwt9irhk': {
      'es': 'Maquillaje',
      'en': '',
    },
    'viv3fsun': {
      'es': 'Tips',
      'en': '',
    },
    'ydvu910k': {
      'es': 'Home',
      'en': '',
    },
  },
  // cateMaquillaje
  {
    'xlgez939': {
      'es': 'Maquillaje para Eventos',
      'en': '',
    },
    '0atp2c3e': {
      'es': 'Clases de Automaquillaje',
      'en': '',
    },
    'u2ic83n1': {
      'es': 'Paquetes de Novia',
      'en': '',
    },
    'ygbd6zby': {
      'es': 'Asesoría',
      'en': '',
    },
    'fxzhbiv9': {
      'es': 'Skincare',
      'en': '',
    },
    'lvgkrgj4': {
      'es': 'Venta de Maquillaje',
      'en': '',
    },
    'c0cv9zpt': {
      'es': 'Home',
      'en': '',
    },
  },
  // productsHome
  {
    'p1av52t5': {
      'es': 'Lista de Productos',
      'en': '',
    },
    '4auty5kk': {
      'es': 'Crear Producto',
      'en': '',
    },
    'bocxupg1': {
      'es': 'Home',
      'en': '',
    },
  },
  // CalendarPage
  {
    'cny7jhw1': {
      'es': 'Agenda de Citas ',
      'en': '',
    },
    'qulpbvv3': {
      'es': 'Horarios Disponibles',
      'en': '',
    },
    '9svhyilw': {
      'es': 'Home',
      'en': '',
    },
  },
  // clasesAutomaquillaje
  {
    '35rocjor': {
      'es': 'Clases de Automaquillaje',
      'en': '',
    },
    's4ei6p9q': {
      'es':
          'Ofrecemos servicios de asesorías y clases de automaquillaje personalizadas para mujeres de todas las edades y niveles de experiencia. Nuestros talleres están diseñados para enseñar técnicas de maquillaje, productos, herramientas y mucho más, y son divertidos y educativos.\n\nTambién brindamos nuestros servicios a marcas y empresas que buscan mejorar las habilidades de maquillaje de su personal. Si estás interesada en cotizar nuestros servicios, por favor contáctanos a través de WhatsApp. ¡No esperes más para sentirte más confiada y hermosa en tu piel!',
      'en': '',
    },
    'm2bzw6jy': {
      'es': 'Cotizar',
      'en': '',
    },
    '1qlugxrl': {
      'es': 'Page Title',
      'en': '',
    },
    'pluqtuwp': {
      'es': 'Home',
      'en': '',
    },
  },
  // asesoria
  {
    '3sxfqnyg': {
      'es': 'Asesoría',
      'en': '',
    },
    'du0c4qs6': {
      'es': '.....',
      'en': '',
    },
    'e2voppo4': {
      'es': 'Cotizar',
      'en': '',
    },
    'zifp1v5t': {
      'es': 'Page Title',
      'en': '',
    },
    'w1fzccp6': {
      'es': 'Home',
      'en': '',
    },
  },
  // maquilajeEventos
  {
    'ekj7ua7d': {
      'es': 'Maquillaje para Eventos',
      'en': '',
    },
    'gtsb1vc3': {
      'es':
          '¡Siempre es importante lucir hermosa y radiante para cualquier ocasión especial! Ofrezco servicios de peinado y maquillaje profesional para toda ocasión, desde bodas y eventos sociales hasta sesiones de fotos y graduaciones.\n\nTrabajo contigo para crear un look personalizado que complemente tu estilo y personalidad, y me aseguro de que te sientas cómoda y segura durante todo el proceso.\n\nYa sea que desees un look natural y fresco o un look más dramático y sofisticado, puedo ayudarte a crear el estilo perfecto para ti. Utilizo productos de alta calidad y técnicas avanzadas de peinado y maquillaje para garantizar que tu look se mantenga perfecto durante todo el día o noche.\n\nContáctame para cotizar mis servicios de peinado y maquillaje para toda ocasión. ¡Déjame ayudarte a lucir espectacular en tu próxima ocasión especial!',
      'en': '',
    },
    'ftyquwpk': {
      'es': 'Cotizar',
      'en': '',
    },
    '7zon8bt7': {
      'es': 'Page Title',
      'en': '',
    },
    'eiohymcu': {
      'es': 'Home',
      'en': '',
    },
  },
  // paquetesNovia
  {
    '790bbl51': {
      'es': 'Paquetes para Novia',
      'en': '',
    },
    '6lqcmzyx': {
      'es':
          '¡En tu gran día, mereces sentirte como una princesa! Ofrezco paquetes de novia que incluyen maquillaje y peinado profesional para que te sientas segura y radiante en uno de los días más importantes de tu vida.\n\nTrabajo contigo para crear un look personalizado que complemente tu estilo y personalidad. Ya sea que desees un look natural y romántico o un look glamuroso y atrevido, puedo ayudarte a crear el estilo perfecto para ti.\n\nAdemás, ofrezco servicios adicionales para tus damas de honor y familiares cercanos, para que todas se sientan hermosas y radiantes en tu gran día. Me aseguro de que todo sea perfecto para ti, desde la prueba de maquillaje y peinado hasta el gran día.\n\nContáctame para cotizar mis paquetes de novia. ¡Déjame ayudarte a crear un look que nunca olvidarás en el día más importante de tu vida!',
      'en': '',
    },
    'n0wwzti6': {
      'es': 'Cotizar',
      'en': '',
    },
    'o0dhzjts': {
      'es': 'Page Title',
      'en': '',
    },
    '7sgxvywi': {
      'es': 'Home',
      'en': '',
    },
  },
  // skinCare
  {
    'cedzh8ci': {
      'es': 'Skincare',
      'en': '',
    },
    'x06ysezj': {
      'es': 'No dejes de lado tu piel, busca los mejores productos aqui.',
      'en': '',
    },
    'dgb2xpza': {
      'es': 'Compra aqui',
      'en': '',
    },
    '85thx68t': {
      'es': 'Page Title',
      'en': '',
    },
    '3loa2i49': {
      'es': 'Home',
      'en': '',
    },
  },
  // ventaMaquillaje
  {
    'knxs0k2e': {
      'es': 'Venta de Maquillaje',
      'en': '',
    },
    's5evi25e': {
      'es': '¿Buscans nuevo maquillaje?',
      'en': '',
    },
    'cn85esz6': {
      'es': 'Compra aqui',
      'en': '',
    },
    'rf4udbbi': {
      'es': 'Maquillaje',
      'en': '',
    },
    'su11qsgj': {
      'es': 'Home',
      'en': '',
    },
  },
  // producto2
  {
    'tvnyxs1w': {
      'es': 'Base Beauty Creations Flawless Stay Foundation',
      'en': '',
    },
    'qn8l86gj': {
      'es': '₡ 8.900',
      'en': '',
    },
    '2s7l88r3': {
      'es':
          'Base Beauty Creations Flawless Stay Fundation. Excelente base para mantener de media a alta cobertura.',
      'en': '',
    },
    '8y07bzd7': {
      'es': 'Page Title',
      'en': '',
    },
    'r2l35dn7': {
      'es': 'Home',
      'en': '',
    },
  },
  // bsSideBar
  {
    'tcdz07xm': {
      'es': 'Productos',
      'en': '',
    },
    'syakb4tg': {
      'es': 'Servicios',
      'en': '',
    },
    'vz9v5kdg': {
      'es': 'Agenda',
      'en': '',
    },
    '8rdqqyya': {
      'es': 'Formulario',
      'en': '',
    },
    'oj58krki': {
      'es': 'Videos',
      'en': '',
    },
    'iralra0i': {
      'es': 'Perfil',
      'en': '',
    },
  },
  // bsCreateProduct
  {
    '58gv6edl': {
      'es': 'Nuevo Producto',
      'en': '',
    },
    '9yeil2tp': {
      'es': 'Nombre',
      'en': '',
    },
    'mt7qvkfv': {
      'es': 'Precio',
      'en': '',
    },
    'ic2xlscv': {
      'es': 'Descripción',
      'en': '',
    },
    '164vgmwj': {
      'es': 'Marca',
      'en': '',
    },
    'uq994gfs': {
      'es': 'Categoría',
      'en': '',
    },
    'i158hw7c': {
      'es': 'Guardar',
      'en': '',
    },
  },
  // bsEditProduct
  {
    'q6m1q3e5': {
      'es': 'Editar Producto',
      'en': '',
    },
    'uo9h38py': {
      'es': 'Nombre',
      'en': '',
    },
    'bbsl8att': {
      'es': 'Precio',
      'en': '',
    },
    'zq32aym9': {
      'es': 'Descripción',
      'en': '',
    },
    'snzy726i': {
      'es': 'Marca',
      'en': '',
    },
    'fu3x770l': {
      'es': 'Categoría',
      'en': '',
    },
    '0m9xcu8u': {
      'es': 'Guardar',
      'en': '',
    },
  },
  // bsEmptyList
  {
    'ysv8zyes': {
      'es': 'No hay citas disponibles en este momento.',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'vhr59go2': {
      'es': '',
      'en': '',
    },
    'mjs0t942': {
      'es': '',
      'en': '',
    },
    'w26wrh9m': {
      'es': '',
      'en': '',
    },
    'tbyv31xi': {
      'es': '',
      'en': '',
    },
    '2olw6lzo': {
      'es': '',
      'en': '',
    },
    'adr2arul': {
      'es': '',
      'en': '',
    },
    '3ui38i7c': {
      'es': '',
      'en': '',
    },
    '0k1whlwb': {
      'es': '',
      'en': '',
    },
    'l8u1nr2v': {
      'es': '',
      'en': '',
    },
    '7kkwp62o': {
      'es': '',
      'en': '',
    },
    'bsfdienx': {
      'es': '',
      'en': '',
    },
    'ywu5yn3r': {
      'es': '',
      'en': '',
    },
    '88x7e1s1': {
      'es': '',
      'en': '',
    },
    '8z72blvb': {
      'es': '',
      'en': '',
    },
    'nmvlp3u2': {
      'es': '',
      'en': '',
    },
    'kjq2pymk': {
      'es': '',
      'en': '',
    },
    'p2dyp91o': {
      'es': '',
      'en': '',
    },
    '5ojpu1uv': {
      'es': '',
      'en': '',
    },
    'oo77spde': {
      'es': '',
      'en': '',
    },
    '87c3xibz': {
      'es': '',
      'en': '',
    },
    '312e4euv': {
      'es': '',
      'en': '',
    },
    '85bm7gqe': {
      'es': '',
      'en': '',
    },
    'mgupgwrb': {
      'es': '',
      'en': '',
    },
    'mfvd9x8z': {
      'es': '',
      'en': '',
    },
    'e26q84yv': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
