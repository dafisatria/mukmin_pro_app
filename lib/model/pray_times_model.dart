import 'package:intl/intl.dart';

class PrayTimesModel {
  bool? status;
  Data? data;

  PrayTimesModel({this.status, this.data});

  PrayTimesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? lokasi;
  String? daerah;
  Koordinat? koordinat;
  Jadwal? jadwal;

  Data({this.id, this.lokasi, this.daerah, this.koordinat, this.jadwal});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lokasi = json['lokasi'];
    daerah = json['daerah'];
    koordinat = json['koordinat'] != null
        ? Koordinat.fromJson(json['koordinat'])
        : null;
    jadwal = json['jadwal'] != null ? Jadwal.fromJson(json['jadwal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lokasi'] = lokasi;
    data['daerah'] = daerah;
    if (koordinat != null) {
      data['koordinat'] = koordinat!.toJson();
    }
    if (jadwal != null) {
      data['jadwal'] = jadwal!.toJson();
    }
    return data;
  }
}

class Koordinat {
  double? lat;
  double? lon;
  String? lintang;
  String? bujur;

  Koordinat({this.lat, this.lon, this.lintang, this.bujur});

  Koordinat.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    lintang = json['lintang'];
    bujur = json['bujur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    data['lintang'] = lintang;
    data['bujur'] = bujur;
    return data;
  }
}

final DateFormat format = DateFormat("hh:mm:ss a");

class Jadwal {
  String? tanggal;
  DateTime? imsak;
  DateTime? subuh;
  DateTime? terbit;
  DateTime? dhuha;
  DateTime? dzuhur;
  DateTime? ashar;
  DateTime? maghrib;
  DateTime? isya;
  DateTime? date;

  Jadwal(
      {this.tanggal,
      this.imsak,
      this.subuh,
      this.terbit,
      this.dhuha,
      this.dzuhur,
      this.ashar,
      this.maghrib,
      this.isya,
      this.date});

  Jadwal.fromJson(Map<DateTime, dynamic> json) {
    tanggal = json['tanggal'];
    imsak = format.parse(json['imsak']);
    subuh = format.parse(json['subuh']);
    terbit = format.parse(json['terbit']);
    dhuha = format.parse(json['dhuha']);
    dzuhur = format.parse(json['dzuhur']);
    ashar = format.parse(json['ashar']);
    maghrib = format.parse(json['maghrib']);
    isya = format.parse(json['tanggal']);
    date = format.parse(json['date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tanggal'] = tanggal;
    data['imsak'] = imsak;
    data['subuh'] = subuh;
    data['terbit'] = terbit;
    data['dhuha'] = dhuha;
    data['dzuhur'] = dzuhur;
    data['ashar'] = ashar;
    data['maghrib'] = maghrib;
    data['isya'] = isya;
    data['date'] = date;
    return data;
  }
}
