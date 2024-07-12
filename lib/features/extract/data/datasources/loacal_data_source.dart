import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'package:business_tools/core/constant/app_strings.dart';
import 'package:business_tools/core/constant/regexts.dart';
import 'package:business_tools/core/errors/exceptions.dart';
import 'package:business_tools/features/extract/data/models/emails_numbers_model.dart';
import 'package:business_tools/features/extract/domain/entities/emails_numbera_entite.dart';
import 'package:dartz/dartz.dart';
import "package:file_picker/file_picker.dart";
import "package:csv/csv.dart";
import "package:path/path.dart";
import 'package:permission_handler/permission_handler.dart';

abstract class LocalDataSource {
  Future<List<EmailsNumberaModel>> extractEmails(String text);
  Future<List<EmailsNumberaModel>> extractNumbers(String text);
  Future<Unit> saveData(String type, List<EmailsNumberaEntite> data);
}

class LocalDataSourceImp extends LocalDataSource {
  @override
  Future<List<EmailsNumberaModel>> extractEmails(String text) async {
    final emails = await extractEmailsNumbers(text, Appregex.emailRegex);
    if (emails.isEmpty) {
      throw EmptyException();
    }
    return emails.map((e) => EmailsNumberaModel(value: e)).toList();
  }

  @override
  Future<List<EmailsNumberaModel>> extractNumbers(String text) async {
    final numbers = await extractEmailsNumbers(text, Appregex.numberRegex);
    if (numbers.isEmpty) {
      throw EmptyException();
    }
    return numbers.map((e) => EmailsNumberaModel(value: e)).toList();
  }

  @override
  Future<Unit> saveData(String type, List<EmailsNumberaEntite> data) async {
    await Permission.manageExternalStorage.request();
    String? path = await FilePicker.platform.getDirectoryPath();
    int random = Random().nextInt(1000000);
    if (path == null) {
      throw EmptyPathException();
    }
    String pathh = join(path, "$random.$type");
    File file = File(pathh);
    try {
      if (type == AppStrings.csv) {
        final csvData = const ListToCsvConverter().convert(dataToCsvList(data));
        await file.writeAsString(csvData);
        return Future.value(unit);
      }
      if (type == AppStrings.json) {
        await file.writeAsString(jsonEncode(data.map((e) => e.value).toList()));
        return Future.value(unit);
      }
      if (type == AppStrings.text) {
        await file.writeAsString(dataToText(data));
        return Future.value(unit);
      }
    } catch (e) {
      throw SaveException();
    }
    throw EmptyPathException();
  }

  //other
  Future<List<String>> extractEmailsNumbers(String text, RegExp regExp) async {
    List<String> data = await Isolate.run(() {
      List<String> isolatedData = [];
      Iterable<RegExpMatch> matches = regExp.allMatches(text);
      for (RegExpMatch element in matches) {
        isolatedData.add(element.group(0).toString());
      }
      return isolatedData;
    });
    return data;
  }

  List<List<String>> dataToCsvList(List<EmailsNumberaEntite> data) {
    List<List<String>> contacts = [
      ["Name", "Phone", "Email"]
    ];
    for (var element in data) {
      contacts.add(["name", element.value.toString(), "email@gmail.com"]);
    }
    return contacts;
  }

  dataToText(List<EmailsNumberaEntite> data) {
    String text = "";
    for (var element in data) {
      text = "$text\n${element.value}";
    }
    return text;
  }

  Future<bool> getPermission() async {
    if (await Permission.storage.request().isGranted) {
      return true;
    } else {
      return false;
    }
  }
}
