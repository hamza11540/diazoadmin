
class VoucherModel {
  String? code;
  double? discount;
  String? title;
  String? validTill;

  VoucherModel({
    this.code,
    this.discount,
    this.title,
    this.validTill,
  });

  VoucherModel.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? "";
    if(json['discount'] is int){
      discount = double.parse(json['discount'].toString());
    }else{
      discount = json['discount'] ?? 0.0;
    }
    title = json['title'] ?? "";
    validTill = json['validTill'] ?? ""/*DateTime.fromMicrosecondsSinceEpoch(
        json['validTill'].microsecondsSinceEpoch)*/;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['discount'] = discount;
    data['title'] = title;
    data['validTill'] = validTill;
    return data;
  }
}
