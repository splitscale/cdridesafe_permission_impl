import 'package:permission_handler/permission_handler.dart';
import 'package:ridesafe_core/exceptions/service_exception.dart';
import 'package:ridesafe_core/permission/basic_permission.dart';
import 'package:ridesafe_core/services/permission_service.dart';

class BluetoothPermissionServiceInteractor implements PermissionService {
  @override
  Future<void> request() async {
    try {
      await [
        Permission.bluetooth,
        Permission.bluetoothScan,
        Permission.bluetoothAdvertise,
        Permission.bluetoothConnect,
      ].request();
    } catch (e) {
      throw ServiceException('Permission request Failed: $e');
    }
  }

  @override
  Future<BasicPermission> get state async {
    try {
      final permission = Permission.bluetooth;

      if (await permission.isGranted) {
        return BasicPermission.isGranted();
      } else {
        return BasicPermission.isDenied();
      }
    } catch (e) {
      throw ServiceException('get permission state Failed: $e');
    }
  }
}
