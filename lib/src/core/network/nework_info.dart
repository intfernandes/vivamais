import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'i_network_info.dart';

class NetWorkInfo implements INetWorkInfo {
  final InternetConnectionChecker ineternetConnect;

  NetWorkInfo({required this.ineternetConnect});
  @override
  Future<bool> get isConnected => ineternetConnect.hasConnection;
}
