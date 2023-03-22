import 'package:permission_handler/permission_handler.dart';
import 'package:ridesafe_core/exceptions/service_exception.dart';
import 'package:ridesafe_core/services/permission_service.dart';

class BluetoothPermissionService
    implements
        PermissionService<Future<Map<Permission, PermissionStatus>>,
            Permission> {
  @override
  Future<Map<Permission, PermissionStatus>> request() async {
    try {
      return await [
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
  Permission get state {
    try {
      return Permission.bluetooth;
    } catch (e) {
      throw ServiceException('get permission state Failed: $e');
    }
  }
}
