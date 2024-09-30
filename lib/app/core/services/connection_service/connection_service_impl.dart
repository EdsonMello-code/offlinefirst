import 'dart:io';

import 'package:offlinefirst/app/core/services/connection_service/connection_service.dart';

class ConnectionServiceImpl implements ConnectionService {
  @override
  Future<bool> checkConnectionWithInternet() async {
    bool connected = false;

    try {
      final result = await InternetAddress.lookup('google.com');
      connected = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      connected = false;
    }

    return connected;
  }
}
