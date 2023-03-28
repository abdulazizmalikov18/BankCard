class BankCardEntity {
  final int id;
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String cvvCode;
  final String? file;
  final String? assets;
  final int? color;
  final int isImage;

  const BankCardEntity({
    this.id = 0,
    this.cardHolderName = '',
    this.cardNumber = '',
    this.expiryDate = '',
    this.cvvCode = '',
    this.file,
    this.assets = '',
    this.color = 0,
    this.isImage = 0,
  });

  BankCardEntity copyWith({
    int? id,
    String? cardHolderName,
    String? cardNumber,
    String? expiryDate,
    String? cvvCode,
    String? file,
    String? assets,
    int? color,
    int? isImage,
  }) =>
      BankCardEntity(
        id: id ?? this.id,
        cardHolderName: cardHolderName ?? this.cardHolderName,
        cardNumber: cardNumber ?? this.cardNumber,
        expiryDate: expiryDate ?? this.expiryDate,
        cvvCode: cvvCode ?? this.cvvCode,
        file: file ?? this.file,
        assets: assets ?? this.assets,
        color: color ?? this.color,
        isImage: isImage ?? this.isImage,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cardHolderName': cardHolderName,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cvvCode': cvvCode,
      'file': file,
      'assets': assets,
      'color': color,
      'isImage': isImage,
    };
  }

  static BankCardEntity fromMap(Map<String, dynamic> map) {
    return BankCardEntity(
      id: map['id'],
      cardHolderName: map['cardHolderName'],
      cardNumber: map['cardNumber'],
      expiryDate: map['expiryDate'],
      cvvCode: map['cvvCode'],
      file: map['file'],
      assets: map['assets'],
      color: map['color'],
      isImage: map['isImage'],
    );
  }
}
