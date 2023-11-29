// To parse this JSON data, do
//
//     final rainfallData = rainfallDataFromJson(jsonString);

import 'dart:convert';

RainfallData rainfallDataFromJson(String str) =>
    RainfallData.fromJson(json.decode(str));

String rainfallDataToJson(RainfallData data) => json.encode(data.toJson());

class RainfallData {
  final String indexName;
  final String title;
  final String desc;
  final int created;
  final int updated;
  final DateTime createdDate;
  final DateTime updatedDate;
  final String active;
  final String visualizable;
  final String catalogUuid;
  final String source;
  final String orgType;
  final List<String> org;
  final List<String> sector;
  final List<Field> field;
  final String externalWsUrl;
  final String externalWs;
  final String message;
  final String version;
  final String status;
  final int total;
  final int count;
  final String limit;
  final String offset;
  final List<Record> records;

  RainfallData({
    required this.indexName,
    required this.title,
    required this.desc,
    required this.created,
    required this.updated,
    required this.createdDate,
    required this.updatedDate,
    required this.active,
    required this.visualizable,
    required this.catalogUuid,
    required this.source,
    required this.orgType,
    required this.org,
    required this.sector,
    required this.field,
    required this.externalWsUrl,
    required this.externalWs,
    required this.message,
    required this.version,
    required this.status,
    required this.total,
    required this.count,
    required this.limit,
    required this.offset,
    required this.records,
  });

  factory RainfallData.fromJson(Map<String, dynamic> json) => RainfallData(
        indexName: json["index_name"],
        title: json["title"],
        desc: json["desc"],
        created: json["created"],
        updated: json["updated"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        active: json["active"],
        visualizable: json["visualizable"],
        catalogUuid: json["catalog_uuid"],
        source: json["source"],
        orgType: json["org_type"],
        org: List<String>.from(json["org"].map((x) => x)),
        sector: List<String>.from(json["sector"].map((x) => x)),
        field: List<Field>.from(json["field"].map((x) => Field.fromJson(x))),
        externalWsUrl: json["external_ws_url"],
        externalWs: json["external_ws"],
        message: json["message"],
        version: json["version"],
        status: json["status"],
        total: json["total"],
        count: json["count"],
        limit: json["limit"],
        offset: json["offset"],
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "index_name": indexName,
        "title": title,
        "desc": desc,
        "created": created,
        "updated": updated,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "active": active,
        "visualizable": visualizable,
        "catalog_uuid": catalogUuid,
        "source": source,
        "org_type": orgType,
        "org": List<dynamic>.from(org.map((x) => x)),
        "sector": List<dynamic>.from(sector.map((x) => x)),
        "field": List<dynamic>.from(field.map((x) => x.toJson())),
        "external_ws_url": externalWsUrl,
        "external_ws": externalWs,
        "message": message,
        "version": version,
        "status": status,
        "total": total,
        "count": count,
        "limit": limit,
        "offset": offset,
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
      };
}

class Field {
  final String id;
  final String name;
  final String type;

  Field({
    required this.id,
    required this.name,
    required this.type,
  });

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        id: json["id"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
      };
}

class Record {
  final String subdivision;
  final String year;
  final String jan;
  final String feb;
  final String mar;
  final String apr;
  final String may;
  final String jun;
  final String jul;
  final String aug;
  final String sep;
  final String oct;
  final String nov;
  final String dec;
  final String annual;
  final String jf;
  final String mam;
  final String jjas;
  final String ond;

  Record({
    required this.subdivision,
    required this.year,
    required this.jan,
    required this.feb,
    required this.mar,
    required this.apr,
    required this.may,
    required this.jun,
    required this.jul,
    required this.aug,
    required this.sep,
    required this.oct,
    required this.nov,
    required this.dec,
    required this.annual,
    required this.jf,
    required this.mam,
    required this.jjas,
    required this.ond,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        subdivision: json["subdivision"],
        year: json["year"],
        jan: json["jan"],
        feb: json["feb"],
        mar: json["mar"],
        apr: json["apr"],
        may: json["may"],
        jun: json["jun"],
        jul: json["jul"],
        aug: json["aug"],
        sep: json["sep"],
        oct: json["oct"],
        nov: json["nov"],
        dec: json["dec"],
        annual: json["annual"],
        jf: json["jf"],
        mam: json["mam"],
        jjas: json["jjas"],
        ond: json["ond"],
      );

  Map<String, dynamic> toJson() => {
        "subdivision": subdivision,
        "year": year,
        "jan": jan,
        "feb": feb,
        "mar": mar,
        "apr": apr,
        "may": may,
        "jun": jun,
        "jul": jul,
        "aug": aug,
        "sep": sep,
        "oct": oct,
        "nov": nov,
        "dec": dec,
        "annual": annual,
        "jf": jf,
        "mam": mam,
        "jjas": jjas,
        "ond": ond,
      };
}
