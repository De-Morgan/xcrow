import 'package:flutter_contacts/flutter_contacts.dart';

class ContactService {
  factory ContactService() => _singleton;
  static final ContactService _singleton = ContactService._internal();

  ContactService._internal();

  Future<String?> pickPhoneNumber() async {
    try {
      if (await FlutterContacts.requestPermission()) {
        final contact = await FlutterContacts.openExternalPick();
        return contact?.phones.first.number;
      }
      return '';
    } catch (error) {
      return null;
    }
  }
}
