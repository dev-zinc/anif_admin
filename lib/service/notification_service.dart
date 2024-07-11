
import 'package:anif_admin/lib/request.dart';
import 'package:anif_admin/model/notification/notification.dart';

class NotificationService {

  // Future<List<Notification>> fetchNotifications(int page, int size) async {
  //   var response = await request("notification/list/$page/$size");
  //   final jsonStores = response['stores'];
  //
  //   // print(response);
  //
  //   return [];
  // }

  Future<List<Notification>> fetchNotificationList() async {
    final response = await request("notification/list") as List<dynamic>;
    // print(response);
    final list = response.map((json) => Notification.fromJson(json)).toList();
    // print(list);

    return list;
  }
}