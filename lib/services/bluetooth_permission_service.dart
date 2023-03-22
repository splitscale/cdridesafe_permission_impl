import 'package:permission_handler/permission_handler.dart';
import 'package:ridesafe_core/exceptions/service_exception.dart';
import 'package:ridesafe_core/services/payload/service_payload.dart';
import 'package:ridesafe_core/services/permission_service.dart';
import 'package:ridesafe_core/services/state/service_state.dart';

class BluetoothPermissionService implements PermissionService {
  @override
  Future<ServicePayload<Map<Permission, PermissionStatus>>> request() async {
    try {
      final Map<Permission, PermissionStatus> payload = await [
        Permission.bluetooth,
        Permission.bluetoothScan,
        Permission.bluetoothAdvertise,
        Permission.bluetoothConnect,
      ].request();

      return ServicePayload<Map<Permission, PermissionStatus>>(payload);
    } catch (e) {
      throw ServiceException('Permission request Failed: $e');
    }
  }

  @override
  Future<ServiceState<Permission>> get state async {
    final payload = Permission.bluetooth;
    return ServiceState<Permission>(payload);
  }
}
