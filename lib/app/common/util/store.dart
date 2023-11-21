import '../../../import.dart';

class Store {
  PhoneNumberUtil plugin;

  Store(this.plugin);

  List<Region>? _regions;

  Future<List<Region>> getRegions() async {
    if (_regions == null) {
      final regions = await plugin.allSupportedRegions();

      // Filter out regions with more than 2 characters
      _regions = regions
          .where((e) => e.code.length <= 2)
          .map((e) => Region(e.code, e.prefix))
          .toList(growable: false);

      _regions!.sort((a, b) => a.prefix.compareTo(b.prefix));
    }
    return _regions ?? [];
  }

  Future<ParseResult> parse(String string, Region region) async {
    try {
      final result = await plugin.parse(string, regionCode: region.code);
      return ParseResult(result);
    } on PlatformException catch (e) {
      return ParseResult.error(e.code);
    }
  }

  Future<String> format(String string, Region region) async {
    try {
      final result = await plugin.format(string, region.code);
      return result;
    } on PlatformException catch (e) {
      return e.code;
    }
  }

  Future<bool> validate(String string, Region region) async {
    try {
      final result = await plugin.validate(string, regionCode: region.code);
      return result;
    } on PlatformException {
      return false;
    }
  }
}
