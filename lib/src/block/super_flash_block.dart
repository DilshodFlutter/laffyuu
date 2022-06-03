import 'package:laffyuu/src/api/provider.dart';
import 'package:laffyuu/src/model/super_flash_model.dart';
import 'package:rxdart/rxdart.dart';

class SuperFlashBlock {
  final _appProvider = AppProvider();
  final _fetchSuperFlash = PublishSubject<SuperFlashModel>();

  Stream<SuperFlashModel> get getSuperFlash => _fetchSuperFlash.stream;


  allSuperFlash() async {
    SuperFlashModel superFlashModel = await _appProvider.getSuperFlash();
    _fetchSuperFlash.add(superFlashModel);
  }

}

final homeBlock = SuperFlashBlock();
