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
    'ryfrnoze': {
      'es': 'El correo electrónico es requerido.',
      'en': '',
    },
    '4yz1hq24': {
      'es': 'Debe ingresar un correo electrónico válido.',
      'en': '',
    },
    'hwj92i7w': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '9wppgp12': {
      'es': 'La contraseña es requerida.',
      'en': '',
    },
    'dmiuuvfv': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // Register
  {
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
    '720mj4c9': {
      'es': 'Su nombre es requerido.',
      'en': '',
    },
    'l5c57wia': {
      'es': 'El maximo de caracteres es de 40.',
      'en': '',
    },
    '91mcbacr': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'hp9ier30': {
      'es': 'Su correo electrónico es requerido.',
      'en': '',
    },
    'eixye28o': {
      'es': 'El máximo de caracteres es de 40.',
      'en': '',
    },
    'il9qgl3o': {
      'es': 'Debe ser un correo electrónico válido.',
      'en': '',
    },
    'qw6xh8hu': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    't4c1gxt9': {
      'es': 'El número de teléfono es requerido.',
      'en': '',
    },
    'tokkvkz2': {
      'es': 'Solo se permiten 8 dígitos.',
      'en': '',
    },
    '66rpaa7f': {
      'es': 'Solo se permiten 8 dígitos.',
      'en': '',
    },
    '1jtztxsv': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'bzd5xgl0': {
      'es': 'La contraseña es requerida.',
      'en': '',
    },
    'p5jqapmd': {
      'es': 'Debe tener 8 caracteres.',
      'en': '',
    },
    'al86tsjs': {
      'es': 'Ha llegado a los 20 caracteres permitidos.',
      'en': '',
    },
    'fd2i2xth': {
      'es':
          'Su contraseña debe contener 8 caracteres como mínimo, una letra mayúscula, un número y un caracter  especial.',
      'en': '',
    },
    '0pxde63k': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5i5xpqj3': {
      'es': 'La contraseña es requerida.',
      'en': '',
    },
    'l7ip4f3s': {
      'es': 'Debe tener 8 caracteres.',
      'en': '',
    },
    'um1e6sju': {
      'es': 'Ha llegado a los 20 caracteres permitidos.',
      'en': '',
    },
    'w9v4gkq2': {
      'es':
          'Su contraseña debe contener 8 caracteres como mínimo, una letra mayúscula, un número y un caracter  especial.',
      'en': '',
    },
    'ttypmrjy': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // producto1
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
    '4k5xbqb2': {
      'es': 'Edad',
      'en': '',
    },
    'eqsnoudo': {
      'es': 'Option 1',
      'en': '',
    },
    'koq742w7': {
      'es': 'Tipo de piel',
      'en': '',
    },
    'hg0wgewu': {
      'es': 'Buscar...',
      'en': '',
    },
    'e9d1n8j1': {
      'es': 'Option 1',
      'en': '',
    },
    'czk2jfmh': {
      'es': 'Color de piel',
      'en': '',
    },
    'kszkf03q': {
      'es': 'Buscar...',
      'en': '',
    },
    '9sp74bwr': {
      'es': 'Option 1',
      'en': '',
    },
    'i8nfdaz3': {
      'es': 'Alergias',
      'en': '',
    },
    'i9p9dtrk': {
      'es': 'Buscar...',
      'en': '',
    },
    '8uzi5bbm': {
      'es': 'Option 1',
      'en': '',
    },
    'etkbwth5': {
      'es': 'Provincia',
      'en': '',
    },
    '0swh2h6k': {
      'es': 'Buscar...',
      'en': '',
    },
    'nn1o6gro': {
      'es': 'Su nombre es requerido.',
      'en': '',
    },
    't0bustsw': {
      'es': 'Se permitren un máximo de 40 caracteres.',
      'en': '',
    },
    'pfsilrho': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '3n7wvs61': {
      'es': 'Su edad es requerida.',
      'en': '',
    },
    'pfu6m7kl': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fpvlcdxr': {
      'es': 'Guardar',
      'en': '',
    },
    'os1d5p7x': {
      'es': 'Home',
      'en': '',
    },
  },
  // productos
  {
    '0ykfwnup': {
      'es': 'Buscar Producto...',
      'en': '',
    },
    'dcg4ko7m': {
      'es': 'Option 1',
      'en': '',
    },
    't6ynft0x': {
      'es': 'Option 1',
      'en': '',
    },
    'bgocaboa': {
      'es': 'Categorías',
      'en': '',
    },
    'c80qpflv': {
      'es': 'Search for an item...',
      'en': '',
    },
    'kxcrp779': {
      'es': 'Option 1',
      'en': '',
    },
    'g5m0zfpa': {
      'es': 'Marcas',
      'en': '',
    },
    'dynccrol': {
      'es': 'Search for an item...',
      'en': '',
    },
    'hfjtnt37': {
      'es': 'Home',
      'en': '',
    },
  },
  // infoPerfil
  {
    '0gv8hagp': {
      'es': 'Actualizar foto de perfil',
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
    'wuu2ulhs': {
      'es': 'Digite su número de teléfono',
      'en': '',
    },
    '3kenkmg1': {
      'es': 'Option 1',
      'en': '',
    },
    'wfugbnwo': {
      'es': 'Tipo de piel',
      'en': '',
    },
    'zuemjn0k': {
      'es': 'Search for an item...',
      'en': '',
    },
    'ndkyyuhg': {
      'es': 'Editar Perfil',
      'en': '',
    },
    'lukm8n9s': {
      'es': 'Su nombre es requerido.',
      'en': '',
    },
    'vi5vjzku': {
      'es': 'El mínimo de caracteres es de 10.',
      'en': '',
    },
    'oupyiyxg': {
      'es': 'El máximo de caracteres es de 30',
      'en': '',
    },
    'o7dsnvg4': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'j3ac1rqr': {
      'es': 'Su correo electrónico es requerido.',
      'en': '',
    },
    'd6zaaqwb': {
      'es': 'Debe ser un correo electrónico válido.',
      'en': '',
    },
    'qaepcuia': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'p2ifnsj7': {
      'es': 'Su número telefónico es requerido.',
      'en': '',
    },
    'gch3wkei': {
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
  // ProductsHome
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
    'dey20upn': {
      'es': 'Reservar Cita',
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
      'es': 'No sabes que productos usar, contactame y yo te ayudo ',
      'en': '',
    },
    'e2voppo4': {
      'es': 'Cotizar',
      'en': '',
    },
    'w1fzccp6': {
      'es': 'Home',
      'en': '',
    },
  },
  // maquilajeEventos
  {
    'h2mc4085': {
      'es': 'Maquillaje para Eventos',
      'en': '',
    },
    'x87vfy6f': {
      'es':
          '¡Siempre es importante lucir hermosa y radiante para cualquier ocasión especial! Ofrezco servicios de peinado y maquillaje profesional para toda ocasión, desde bodas y eventos sociales hasta sesiones de fotos y graduaciones.\n\nTrabajo contigo para crear un look personalizado que complemente tu estilo y personalidad, y me aseguro de que te sientas cómoda y segura durante todo el proceso.\n\nYa sea que desees un look natural y fresco o un look más dramático y sofisticado, puedo ayudarte a crear el estilo perfecto para ti. Utilizo productos de alta calidad y técnicas avanzadas de peinado y maquillaje para garantizar que tu look se mantenga perfecto durante todo el día o noche.\n\nContáctame para cotizar mis servicios de peinado y maquillaje para toda ocasión. ¡Déjame ayudarte a lucir espectacular en tu próxima ocasión especial!',
      'en': '',
    },
    'se03gkzb': {
      'es': 'Cotizar',
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
      'es': 'Ver catalogo',
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
      'es': '¿Buscas nuevo maquillaje?',
      'en': '',
    },
    'cn85esz6': {
      'es': 'Ver catalogo',
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
      'es': 'Gel Fijador de Cejas Beauty Creations',
      'en': '',
    },
    'qn8l86gj': {
      'es': '₡ 3.400',
      'en': '',
    },
    '2s7l88r3': {
      'es':
          'De lo más nuevo de Beauty Creations, el gel fijador de cejas te ayudará a que el acabado de tus cejas se mantenga por más tiempo, dándote un aspecto fenomenal todo el día. ',
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
  // producto3
  {
    '45s7nykr': {
      'es': 'Delineador de Labios Beauty Creations Nude X',
      'en': '',
    },
    'xhv5mxaw': {
      'es': '₡ 3.500',
      'en': '',
    },
    '4dw6spov': {
      'es':
          'Lápiz delineadores de labios 24 tonos matte diferentes, con textura suave y punta retractil.',
      'en': '',
    },
    'kxmxeqpa': {
      'es': 'Page Title',
      'en': '',
    },
    'khqvz9vr': {
      'es': 'Home',
      'en': '',
    },
  },
  // producto4
  {
    'ahman6fr': {
      'es': 'Crema Costa BB Cream Perfect Match',
      'en': '',
    },
    'mv157zqj': {
      'es': '₡ 12.000',
      'en': '',
    },
    'df28qbd9': {
      'es':
          'Este producto es perfecto para reemplazar las bases que nos obstruyen los poros, hidratando la cara y dejando una sensación deliciosa.  Viene en 2 tonos: light o medium.\n\nEl BB Cream es una crema hidratante ultra ligera que se puede usar diariamente con la gran ventaja de que tiene un color tenue, ayudándonos a emparejar la piel y hacerla ver más fresca, además de tener extracto de aloe vera y rosas que ayudan a calmar, reafirmar y nutrir nuestra piel.',
      'en': '',
    },
    'wtiwd85t': {
      'es': 'Page Title',
      'en': '',
    },
    '315k5sjh': {
      'es': 'Home',
      'en': '',
    },
  },
  // producto5
  {
    'kdgxi6es': {
      'es': 'Labiales Beauty Creations Nude X Soft Matte Lipstick',
      'en': '',
    },
    'sduxr1m0': {
      'es': '₡ 3,000',
      'en': '',
    },
    'ponsk1ux': {
      'es':
          'Los labiales Soft matte vienen en 18 tonos nude  diferentes, cremosos y diseñados para combinar con cualquier tipo de piel.',
      'en': '',
    },
    'bqmpqrfs': {
      'es': 'Page Title',
      'en': '',
    },
    'gps8nqal': {
      'es': 'Home',
      'en': '',
    },
  },
  // producto6
  {
    'iqipktb7': {
      'es': 'Base Flawless Stay Fundation',
      'en': '',
    },
    'hcas4u6k': {
      'es': '₡ 8,800',
      'en': '',
    },
    '54jnz6yl': {
      'es':
          'Base Beauty Creations Flawless Stay Fundation. Excelente base para mantener de media a alta cobertura. ',
      'en': '',
    },
    'h7zlci53': {
      'es': 'Page Title',
      'en': '',
    },
    'rl63xf4c': {
      'es': 'Home',
      'en': '',
    },
  },
  // producto8
  {
    '0vk6ss5v': {
      'es': 'Gel Facial Hidratante Antioxidante Costa Dewy Drips',
      'en': '',
    },
    'iijwkyk4': {
      'es': '₡ 6,900',
      'en': '',
    },
    'cdnlhyj4': {
      'es':
          'Si lo que buscas es una fórmula ligera que a la vez hidrate su piel, este gel es perfecto para ti. Cargado de antioxidantes y extractos naturales que ayudan a reafirmar, regenerar y calmar la piel.',
      'en': '',
    },
    'zyxna44o': {
      'es': 'Page Title',
      'en': '',
    },
    'jbd6nwfq': {
      'es': 'Home',
      'en': '',
    },
  },
  // producto9
  {
    '81vxzxgu': {
      'es': 'Protector Solar Diario Costa 30spf',
      'en': '',
    },
    'mxq2h0am': {
      'es': '₡ 14,000',
      'en': '',
    },
    'tq8tfne7': {
      'es':
          'La fórmula tiene una textura ligera cargada de ácido hialurónico para dejar la piel humectada mientras la protege y al absorberse deja un acabado suave y aterciopelado como piel de durazno sin esas sensación pegajosa o grasosa.',
      'en': '',
    },
    '69926e5h': {
      'es': 'Page Title',
      'en': '',
    },
    'pfvpjxfb': {
      'es': 'Home',
      'en': '',
    },
  },
  // producto10
  {
    'lix7tcml': {
      'es': 'Labial para el cuidado de labios Sweet Dose Beauty Creations',
      'en': 'Sweet Dose Beauty Creations Lip Care Lipstick',
    },
    'ho948qvf': {
      'es': '₡ 5,000',
      'en': '',
    },
    'pmnxa230': {
      'es':
          'Lip Oil es un aceite nutritivo infundido con aceite de jojoba y vitamina E, ayuda a crear labios radiantes y saludables.',
      'en': '',
    },
    '9hko8w9h': {
      'es': 'Page Title',
      'en': '',
    },
    'wi1u8wlc': {
      'es': 'Home',
      'en': '',
    },
  },
  // producto11
  {
    '4n9wk85x': {
      'es': 'Floral Bloom Paleta de Rubor',
      'en': '',
    },
    's4w5rb98': {
      'es': '₡ 6,900',
      'en': '',
    },
    'nmf9ctxt': {
      'es':
          'Hermosa paleta de la marca Beauty Creacions, que contiene seis rubores en diferentes tonalidades mates',
      'en': '',
    },
    'styaigol': {
      'es': 'Page Title',
      'en': '',
    },
    '5l8u0rvb': {
      'es': 'Home',
      'en': '',
    },
  },
  // CategoriesPage
  {
    'zzsafvrl': {
      'es': 'Categorías de Productos',
      'en': '',
    },
    '27427qk0': {
      'es': 'Crear Categoría',
      'en': '',
    },
    '3yro6q99': {
      'es': 'Productos',
      'en': '',
    },
    'zj1gedtg': {
      'es': 'Home',
      'en': '',
    },
  },
  // BrandsPage
  {
    '1jr2c1xr': {
      'es': 'Marcas de Productos',
      'en': '',
    },
    'zqezw5ud': {
      'es': 'Crear Marca',
      'en': '',
    },
    '6ia8ojnl': {
      'es': 'Productos',
      'en': '',
    },
    '2npfap3m': {
      'es': 'Home',
      'en': '',
    },
  },
  // InfoProductos
  {
    'v4trfigf': {
      'es': 'Page Title',
      'en': '',
    },
    'qm09sdro': {
      'es': 'Home',
      'en': '',
    },
  },
  // AppointmentPage
  {
    '7r984chp': {
      'es': 'Agenda de Citas ',
      'en': '',
    },
    '8cf5w94o': {
      'es': 'Agregar Citas',
      'en': '',
    },
    'mjlbu7qv': {
      'es': 'Horarios Disponibles',
      'en': '',
    },
    'm6ktb9gx': {
      'es': 'Home',
      'en': '',
    },
  },
  // favorito
  {
    'fl2bej5f': {
      'es': 'Favoritos',
      'en': '',
    },
    'bxkt8c8n': {
      'es': 'Home',
      'en': '',
    },
  },
  // UsersPage
  {
    'b8qijbni': {
      'es': 'Lista de Usuarios',
      'en': '',
    },
    '81bv02pq': {
      'es': 'Crear Administrador',
      'en': '',
    },
    'ejllpq34': {
      'es': 'Admin',
      'en': '',
    },
    'kt9acrqr': {
      'es': 'Home',
      'en': '',
    },
  },
  // ResetPasswordPage
  {
    '0aen3r65': {
      'es': 'Recuperar Contraseña',
      'en': '',
    },
    'kuwjncxv': {
      'es':
          'Ingrese su correo electrónico para poder efectuar el cambio de contraseña.',
      'en': '',
    },
    'zlh6ha9k': {
      'es': 'Correo Electrónico',
      'en': '',
    },
    'uo2yj3yb': {
      'es': 'Enviar Correo',
      'en': '',
    },
    'ow4rajg7': {
      'es': 'Iniciar Sesión',
      'en': '',
    },
    '56lne3cl': {
      'es': 'El correo electrónico es requerido.',
      'en': '',
    },
    '3d4uimtd': {
      'es': 'Debe ingresar un correo electrónico válido.',
      'en': '',
    },
    '43h658dg': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // VideosPage
  {
    'xq9hcxhl': {
      'es': 'Videos de la Aplicación',
      'en': '',
    },
    '9tywv9oq': {
      'es': 'Agregar Video',
      'en': '',
    },
    'y00knr8c': {
      'es': 'Home',
      'en': '',
    },
  },
  // catalogoSkincare
  {
    'vzzq7exr': {
      'es': 'JABÓN FACIAL DE PROTEÍNA DE SEDA ÁMBAR',
      'en': '',
    },
    'vukx72vt': {
      'es': 'Ámbar',
      'en': '',
    },
    '7n0xaurr': {
      'es': 'Precio',
      'en': '',
    },
    'sikpbah0': {
      'es': 'TÓNICO DE PROTEÍNA DE SEDA DE ÁMBAR',
      'en': '',
    },
    'onqw3c15': {
      'es': 'Ámbar',
      'en': '',
    },
    '7kpfw51p': {
      'es': 'Precio',
      'en': '',
    },
    'nmwfe7im': {
      'es': 'SÉRUM DE PROTEÍNA DE SEDA DE ÁMBAR',
      'en': '',
    },
    'vaxvcdr3': {
      'es': 'Ámbar',
      'en': '',
    },
    'b1e6ku4z': {
      'es': 'Precio',
      'en': '',
    },
    '797n15is': {
      'es': 'CREMA HIDRTANTE DE PROTEÍNA DE SEDA ÁMBAR',
      'en': '',
    },
    'nbzevsbx': {
      'es': 'Ámbar',
      'en': '',
    },
    'f2t85c2e': {
      'es': 'Precio',
      'en': '',
    },
    'yix5m1jl': {
      'es': 'MASCARILLA DE VELO',
      'en': '',
    },
    'c1r4mphv': {
      'es': 'Ámbar - Kabuki',
      'en': '',
    },
    '6sp5pjrs': {
      'es': 'Precio',
      'en': '',
    },
    '1fc7r1pz': {
      'es': 'KIT DE LOS 4 PASOS DE ÁMBAR',
      'en': '',
    },
    'y59vsilk': {
      'es': 'Ámbar',
      'en': '',
    },
    'qxg0s0ss': {
      'es': 'Precio',
      'en': '',
    },
    '24345p4e': {
      'es': 'Page Title',
      'en': '',
    },
    'm99k8unp': {
      'es': 'Home',
      'en': '',
    },
  },
  // catalogoSkincareCopy
  {
    'bbsxkz60': {
      'es': 'JABÓN FACIAL DE PROTEÍNA DE SEDA ÁMBAR',
      'en': '',
    },
    'vth8xmfr': {
      'es': 'Ámbar',
      'en': '',
    },
    'kmg40tji': {
      'es': 'Precio',
      'en': '',
    },
    '43mek9nu': {
      'es': 'Page Title',
      'en': '',
    },
    'rrubqc64': {
      'es': 'Home',
      'en': '',
    },
  },
  // ShoppingCart
  {
    'eqphtyfj': {
      'es': 'Total a Pagar: ',
      'en': '',
    },
    '68nmsyqe': {
      'es': 'Realizar Pago',
      'en': '',
    },
    '22w6xxe8': {
      'es': 'Subtotal: ',
      'en': '',
    },
    '26qjyjed': {
      'es': 'Detalles',
      'en': '',
    },
    'p7v8sevu': {
      'es': 'Home',
      'en': '',
    },
  },
  // VideosPageCopy
  {
    'ob6h47zq': {
      'es': 'Videos de Ayuda',
      'en': '',
    },
    '512i46wu': {
      'es': 'Option 1',
      'en': '',
    },
    'jtcdiopn': {
      'es': 'Categorías',
      'en': '',
    },
    'zfl6b5a7': {
      'es': 'Search for an item...',
      'en': '',
    },
    'wdrvrdoy': {
      'es': 'Option 1',
      'en': '',
    },
    'rgbs6i1o': {
      'es': 'Tipos de Piel',
      'en': '',
    },
    '4gno0fpw': {
      'es': 'Search for an item...',
      'en': '',
    },
    '8pjt4d3n': {
      'es': 'Home',
      'en': '',
    },
  },
  // infoPerfilCopy
  {
    '5vs9ouw6': {
      'es': 'Actualizar foto de perfil',
      'en': '',
    },
    'gofr9rks': {
      'es': 'Digite su nombre',
      'en': '',
    },
    'fchi4yib': {
      'es': 'Digite su correo',
      'en': '',
    },
    '2yk2x0h2': {
      'es': 'Digite su número de teléfono',
      'en': '',
    },
    'pit6dvfz': {
      'es': 'Option 1',
      'en': '',
    },
    '73u16fgb': {
      'es': 'Tipo de piel',
      'en': '',
    },
    'rs2zgwvl': {
      'es': 'Search for an item...',
      'en': '',
    },
    'm1etskza': {
      'es': 'Editar Perfil',
      'en': '',
    },
    '429pa9av': {
      'es': 'Su nombre es requerido.',
      'en': '',
    },
    'w8xpqn14': {
      'es': 'El mínimo de caracteres es de 10.',
      'en': '',
    },
    'zwp582f5': {
      'es': 'El máximo de caracteres es de 30',
      'en': '',
    },
    'c8aatgo8': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'r3j8d2bj': {
      'es': 'Su correo electrónico es requerido.',
      'en': '',
    },
    '09r17jjw': {
      'es': 'Debe ser un correo electrónico válido.',
      'en': '',
    },
    'h5kmoxi1': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'jg764qba': {
      'es': 'Su número telefónico es requerido.',
      'en': '',
    },
    'izjuu643': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'xn48sel4': {
      'es': 'Home',
      'en': '',
    },
  },
  // FormData
  {
    '7wt5wlya': {
      'es': 'Información de Formularios',
      'en': '',
    },
    '2olvzsi2': {
      'es': 'Alergias: ',
      'en': '',
    },
    'nf1in359': {
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
    'gc5l1v7k': {
      'es': 'Favoritos',
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
    'bp1f7nc5': {
      'es': 'Cantidad',
      'en': '',
    },
    'fz3miakr': {
      'es': 'Option 1',
      'en': '',
    },
    'esda1dpb': {
      'es': 'Seleccione la categoría:',
      'en': '',
    },
    '2oqr8720': {
      'es': 'Search for an item...',
      'en': '',
    },
    'w285rnjg': {
      'es': 'Seleccione la marca:',
      'en': '',
    },
    'wbj2bj04': {
      'es': 'Search for an item...',
      'en': '',
    },
    'i158hw7c': {
      'es': 'Guardar',
      'en': '',
    },
    'lxpksphe': {
      'es': 'El nombre del producto es requerido.',
      'en': '',
    },
    'udpl4pal': {
      'es': 'El nombre debe poseer un mínimo de 10 caracteres.',
      'en': '',
    },
    '8jzuqq1p': {
      'es': 'El nombre debe poseer un máximo de 30 caracteres.',
      'en': '',
    },
    'uq97tjh6': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'k5ibwrux': {
      'es': 'El precio es requerido.',
      'en': '',
    },
    'l3p6fum4': {
      'es': 'El precio debe ser igual o mayor a 1000.',
      'en': '',
    },
    '2pv6ce3o': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'si1oyj8g': {
      'es': 'La información del producto es requerida.',
      'en': '',
    },
    '5gahnt6h': {
      'es': 'La información del producto posee un máximo de 150 caracteres.',
      'en': '',
    },
    'd68ceqqr': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qanlz6yq': {
      'es': 'La cantidad es requerida.',
      'en': '',
    },
    'jtg1cmfi': {
      'es': 'Please choose an option from the dropdown',
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
    'mfg2yad0': {
      'es': 'Cantidad',
      'en': '',
    },
    'qwq9m7lk': {
      'es': 'Option 1',
      'en': '',
    },
    'yfa91cqv': {
      'es': 'Seleccione la categoría:',
      'en': '',
    },
    'ox78nlpa': {
      'es': 'Search for an item...',
      'en': '',
    },
    'y8xb6a1f': {
      'es': 'Search for an item...',
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
  // bsCreateCategory
  {
    'npxh4tyg': {
      'es': 'Nueva Categoría',
      'en': '',
    },
    '5hgzxj7p': {
      'es': 'Nombre',
      'en': '',
    },
    'vpmnb1sv': {
      'es': 'Guardar',
      'en': '',
    },
    '9xnoxmw6': {
      'es': 'El nombre es requerido.',
      'en': '',
    },
    'bhgzztqg': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // bsEditCategory
  {
    'xp6rog8g': {
      'es': 'Modificar Categoría',
      'en': '',
    },
    'wna1qgel': {
      'es': 'Nombre',
      'en': '',
    },
    'ltgl5alv': {
      'es': 'Guardar',
      'en': '',
    },
    'en7wo9qc': {
      'es': 'La categoría es requerida.',
      'en': '',
    },
    'buioto20': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // bsCreateBrand
  {
    '6xumess0': {
      'es': 'Nueva Marca',
      'en': '',
    },
    'fcw69dvk': {
      'es': 'Nombre',
      'en': '',
    },
    'clof189n': {
      'es': 'Guardar',
      'en': '',
    },
    'vk1e3zqz': {
      'es': 'El nombre de la marca es requerido.',
      'en': '',
    },
    '8wxjwgfj': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // bsEditBrand
  {
    'ol8zq6jn': {
      'es': 'Modificar Marca',
      'en': '',
    },
    'ozhbkpeu': {
      'es': 'Nombre',
      'en': '',
    },
    '3rtfu1pn': {
      'es': 'Guardar',
      'en': '',
    },
    'wd81eopq': {
      'es': 'El nombre de la marca es requerido.',
      'en': '',
    },
    'n2k4cnws': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // bsCreateUser
  {
    'xjd8ftg0': {
      'es': 'Nuevo Administrador',
      'en': '',
    },
    'm9mabgua': {
      'es': 'Nombre',
      'en': '',
    },
    'nvzno7qd': {
      'es': 'Correo Electrónico',
      'en': '',
    },
    'yv4ix63q': {
      'es': 'Número Telefónico',
      'en': '',
    },
    'kbgovh75': {
      'es': 'Contraseña',
      'en': '',
    },
    '4q3uu1wb': {
      'es': 'Guardar',
      'en': '',
    },
    'vi39s3el': {
      'es': 'El nombre es requerido.',
      'en': '',
    },
    'r5tinqqv': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'pz2ym7t5': {
      'es': 'El correo electrónico es requerido.',
      'en': '',
    },
    '2gl36czo': {
      'es': 'Debe ingresar un correo electrónico válido.',
      'en': '',
    },
    'egswcwgd': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'szb988pm': {
      'es': 'El número telefónico es requerido.',
      'en': '',
    },
    'b8d5osgp': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'jmio9sna': {
      'es': 'La contraseña es requerida.',
      'en': '',
    },
    'wv5cn7ne': {
      'es':
          'Su contraseña debe contener 8 caracteres como mínimo, una letra mayúscula, un número y un caracter especial.',
      'en': '',
    },
    'cqto8252': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // bsCreateAppointment
  {
    'k5dwrhsr': {
      'es': 'Nueva Cita',
      'en': '',
    },
    'wl2qe7qv': {
      'es': 'Estado',
      'en': '',
    },
    'mqz7ztjp': {
      'es': 'Search for an item...',
      'en': '',
    },
    'odgsaev7': {
      'es': 'Guardar',
      'en': '',
    },
  },
  // bsSideBarAdmin
  {
    '584ez4on': {
      'es': 'Productos',
      'en': '',
    },
    'yzihpklm': {
      'es': 'Categorías',
      'en': '',
    },
    'hndhim9w': {
      'es': 'Agenda',
      'en': '',
    },
    '09rw7zv0': {
      'es': 'Marcas',
      'en': '',
    },
    '19w15z97': {
      'es': 'Videos',
      'en': '',
    },
    'wqae0zjp': {
      'es': 'Perfil',
      'en': '',
    },
    'y7563o7o': {
      'es': 'Usuarios',
      'en': '',
    },
    'yxduu2zc': {
      'es': 'Formularios',
      'en': '',
    },
  },
  // bsEmptyVideos
  {
    'du22frm2': {
      'es': 'No hay videos disponibles en este momento.',
      'en': '',
    },
  },
  // bsCreateVideo
  {
    '17u4twa6': {
      'es': 'Nuevo Video',
      'en': '',
    },
    'a44nfljc': {
      'es': 'Nombre',
      'en': '',
    },
    'kr4garaq': {
      'es': 'Descripción',
      'en': '',
    },
    'ocnxslky': {
      'es': 'Option 1',
      'en': '',
    },
    '5zn1ltsa': {
      'es': 'Categorías',
      'en': '',
    },
    '3klyq0de': {
      'es': 'Buscar...',
      'en': '',
    },
    '7lifl3nr': {
      'es': 'Tipo de Piel',
      'en': '',
    },
    'i6zd28bv': {
      'es': 'Buscar...',
      'en': '',
    },
    'xz6usgda': {
      'es': 'Guardar',
      'en': '',
    },
    'kx7z2ury': {
      'es': 'El nombre del video es requerido.',
      'en': '',
    },
    'sbt8urpg': {
      'es': 'El nombre del video debe poseer un mínimo de 10 caracteres.',
      'en': '',
    },
    'qmc84ims': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'v9038bz2': {
      'es': 'La descripción es requerida.',
      'en': '',
    },
    'dh4sekov': {
      'es': 'El precio debe serigual o mayor a 1000.',
      'en': '',
    },
    'hny6sp1x': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // bsEditAppointment
  {
    '02ux9e1c': {
      'es': 'Editar Cita',
      'en': '',
    },
    'u12ay9az': {
      'es': 'Estado',
      'en': '',
    },
    'a9cyirre': {
      'es': 'Search for an item...',
      'en': '',
    },
    'db9rx1zh': {
      'es': 'Guardar',
      'en': '',
    },
  },
  // bsEditVideo
  {
    'cd8po6x5': {
      'es': 'Editar Video',
      'en': '',
    },
    'fasd9uc2': {
      'es': 'Nombre',
      'en': '',
    },
    '9uqqc9gv': {
      'es': 'Descripción',
      'en': '',
    },
    'nxgia639': {
      'es': 'Option 1',
      'en': '',
    },
    '8poy9woi': {
      'es': 'Seleccione la categoría:',
      'en': '',
    },
    '1p5qz1ti': {
      'es': 'Buscar...',
      'en': '',
    },
    'oiopafe3': {
      'es': 'Seleccione el tipo de piel:',
      'en': '',
    },
    '2alwqprg': {
      'es': 'Buscar...',
      'en': '',
    },
    '3e7qixb0': {
      'es': 'Guardar',
      'en': '',
    },
    'fhpswasj': {
      'es': 'El nombre del video es requerido.',
      'en': '',
    },
    'ucnqio5q': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'a58jsc23': {
      'es': 'La descripción del video es requerida.',
      'en': '',
    },
    'abspioul': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // bsPayment
  {
    'hn0uz2vo': {
      'es': 'Total a Pagar',
      'en': '',
    },
    'un3si0tf': {
      'es': 'Producto:',
      'en': '',
    },
    '9oonlkqh': {
      'es': 'Cantidad:',
      'en': '',
    },
    'zfwo4302': {
      'es': 'Precio:',
      'en': '',
    },
    '0a753hcj': {
      'es': 'Subtotal:',
      'en': '',
    },
    'de5uv7qx': {
      'es': 'Total a Pagar:',
      'en': '',
    },
    '1b7tsj9o': {
      'es': 'Realizar Pago',
      'en': '',
    },
  },
  // bsEmptyFav
  {
    '1a3t4oz5': {
      'es': 'No has agregado ningún producto a Favoritos.',
      'en': '',
    },
  },
  // bsEmptyCart
  {
    'c2pi50o4': {
      'es': 'No has añadido ningún producto al carrito.',
      'en': '',
    },
  },
  // bsEmptyProducts
  {
    'yz3hnif1': {
      'es': 'No hay productos disponibles.',
      'en': '',
    },
  },
  // bsEmptyAllergies
  {
    'huflrri9': {
      'es': 'No posee alergias.',
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
