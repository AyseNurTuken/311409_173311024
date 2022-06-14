import 'dart:convert';
class Currency {
  String? updateDate;
  USD? uSD;
  USD? eUR;
  USD? gBP;
  USD? cHF;
  USD? cAD;
  USD? rUB;
  USD? aED;
  USD? aUD;
  USD? dKK;
  USD? sEK;
  USD? nOK;
  USD? jPY;
  USD? kWD;
  USD? zAR;
  USD? bHD;
  USD? lYD;
  USD? sAR;
  USD? iQD;
  USD? iLS;
  USD? iRR;
  USD? iNR;
  USD? mXN;
  USD? hUF;
  USD? nZD;
  USD? bRL;
  USD? iDR;
  USD? cSK;
  USD? pLN;
  USD? rON;
  USD? cNY;
  USD? aRS;
  USD? aLL;
  USD? aZN;
  USD? bAM;
  USD? cLP;
  USD? cOP;
  USD? cRC;
  USD? dZD;
  USD? eGP;
  USD? hKD;
  USD? hRK;
  USD? iSK;
  USD? jOD;
  USD? kRW;
  USD? kZT;
  USD? lBP;
  USD? lKR;
  USD? mAD;
  USD? mDL;
  USD? mKD;
  USD? mYR;
  USD? oMR;
  USD? pEN;
  USD? pHP;
  USD? pKR;
  USD? qAR;
  USD? rSD;
  USD? sGD;
  USD? sYP;
  USD? tHB;
  USD? tWD;
  USD? uAH;
  USD? uYU;
  USD? gEL;
  USD? tND;
  USD? bGN;
  USD? ons;
  USD? gramAltin;
  USD? ceyrekAltin;
  USD? yarimAltin;
  USD? tamAltin;
  USD? cumhuriyetAltini;
  USD? ataAltin;
  USD? resatAltin;
  USD? hamitAltin;
  USD? ikibucukAltin;
  USD? gremseAltin;
  USD? besliAltin;
  USD? u14AyarAltin;
  USD? u18AyarAltin;
  USD? u22AyarBilezik;
  USD? gumus;

  Currency(
      {this.updateDate,
      this.uSD,
      this.eUR,
      this.gBP,
      this.cHF,
      this.cAD,
      this.rUB,
      this.aED,
      this.aUD,
      this.dKK,
      this.sEK,
      this.nOK,
      this.jPY,
      this.kWD,
      this.zAR,
      this.bHD,
      this.lYD,
      this.sAR,
      this.iQD,
      this.iLS,
      this.iRR,
      this.iNR,
      this.mXN,
      this.hUF,
      this.nZD,
      this.bRL,
      this.iDR,
      this.cSK,
      this.pLN,
      this.rON,
      this.cNY,
      this.aRS,
      this.aLL,
      this.aZN,
      this.bAM,
      this.cLP,
      this.cOP,
      this.cRC,
      this.dZD,
      this.eGP,
      this.hKD,
      this.hRK,
      this.iSK,
      this.jOD,
      this.kRW,
      this.kZT,
      this.lBP,
      this.lKR,
      this.mAD,
      this.mDL,
      this.mKD,
      this.mYR,
      this.oMR,
      this.pEN,
      this.pHP,
      this.pKR,
      this.qAR,
      this.rSD,
      this.sGD,
      this.sYP,
      this.tHB,
      this.tWD,
      this.uAH,
      this.uYU,
      this.gEL,
      this.tND,
      this.bGN,
      this.ons,
      this.gramAltin,
      this.ceyrekAltin,
      this.yarimAltin,
      this.tamAltin,
      this.cumhuriyetAltini,
      this.ataAltin,
      this.resatAltin,
      this.hamitAltin,
      this.ikibucukAltin,
      this.gremseAltin,
      this.besliAltin,
      this.u14AyarAltin,
      this.u18AyarAltin,
      this.u22AyarBilezik,
      this.gumus});

  Currency.fromJson(Map<String, dynamic> json) {
    updateDate = json['Update_Date'];
    uSD = json['USD'] != null ? new USD.fromJson(json['USD']) : null;
    eUR = json['EUR'] != null ? new USD.fromJson(json['EUR']) : null;
    gBP = json['GBP'] != null ? new USD.fromJson(json['GBP']) : null;
    cHF = json['CHF'] != null ? new USD.fromJson(json['CHF']) : null;
    cAD = json['CAD'] != null ? new USD.fromJson(json['CAD']) : null;
    rUB = json['RUB'] != null ? new USD.fromJson(json['RUB']) : null;
    aED = json['AED'] != null ? new USD.fromJson(json['AED']) : null;
    aUD = json['AUD'] != null ? new USD.fromJson(json['AUD']) : null;
    dKK = json['DKK'] != null ? new USD.fromJson(json['DKK']) : null;
    sEK = json['SEK'] != null ? new USD.fromJson(json['SEK']) : null;
    nOK = json['NOK'] != null ? new USD.fromJson(json['NOK']) : null;
    jPY = json['JPY'] != null ? new USD.fromJson(json['JPY']) : null;
    kWD = json['KWD'] != null ? new USD.fromJson(json['KWD']) : null;
    zAR = json['ZAR'] != null ? new USD.fromJson(json['ZAR']) : null;
    bHD = json['BHD'] != null ? new USD.fromJson(json['BHD']) : null;
    lYD = json['LYD'] != null ? new USD.fromJson(json['LYD']) : null;
    sAR = json['SAR'] != null ? new USD.fromJson(json['SAR']) : null;
    iQD = json['IQD'] != null ? new USD.fromJson(json['IQD']) : null;
    iLS = json['ILS'] != null ? new USD.fromJson(json['ILS']) : null;
    iRR = json['IRR'] != null ? new USD.fromJson(json['IRR']) : null;
    iNR = json['INR'] != null ? new USD.fromJson(json['INR']) : null;
    mXN = json['MXN'] != null ? new USD.fromJson(json['MXN']) : null;
    hUF = json['HUF'] != null ? new USD.fromJson(json['HUF']) : null;
    nZD = json['NZD'] != null ? new USD.fromJson(json['NZD']) : null;
    bRL = json['BRL'] != null ? new USD.fromJson(json['BRL']) : null;
    iDR = json['IDR'] != null ? new USD.fromJson(json['IDR']) : null;
    cSK = json['CSK'] != null ? new USD.fromJson(json['CSK']) : null;
    pLN = json['PLN'] != null ? new USD.fromJson(json['PLN']) : null;
    rON = json['RON'] != null ? new USD.fromJson(json['RON']) : null;
    cNY = json['CNY'] != null ? new USD.fromJson(json['CNY']) : null;
    aRS = json['ARS'] != null ? new USD.fromJson(json['ARS']) : null;
    aLL = json['ALL'] != null ? new USD.fromJson(json['ALL']) : null;
    aZN = json['AZN'] != null ? new USD.fromJson(json['AZN']) : null;
    bAM = json['BAM'] != null ? new USD.fromJson(json['BAM']) : null;
    cLP = json['CLP'] != null ? new USD.fromJson(json['CLP']) : null;
    cOP = json['COP'] != null ? new USD.fromJson(json['COP']) : null;
    cRC = json['CRC'] != null ? new USD.fromJson(json['CRC']) : null;
    dZD = json['DZD'] != null ? new USD.fromJson(json['DZD']) : null;
    eGP = json['EGP'] != null ? new USD.fromJson(json['EGP']) : null;
    hKD = json['HKD'] != null ? new USD.fromJson(json['HKD']) : null;
    hRK = json['HRK'] != null ? new USD.fromJson(json['HRK']) : null;
    iSK = json['ISK'] != null ? new USD.fromJson(json['ISK']) : null;
    jOD = json['JOD'] != null ? new USD.fromJson(json['JOD']) : null;
    kRW = json['KRW'] != null ? new USD.fromJson(json['KRW']) : null;
    kZT = json['KZT'] != null ? new USD.fromJson(json['KZT']) : null;
    lBP = json['LBP'] != null ? new USD.fromJson(json['LBP']) : null;
    lKR = json['LKR'] != null ? new USD.fromJson(json['LKR']) : null;
    mAD = json['MAD'] != null ? new USD.fromJson(json['MAD']) : null;
    mDL = json['MDL'] != null ? new USD.fromJson(json['MDL']) : null;
    mKD = json['MKD'] != null ? new USD.fromJson(json['MKD']) : null;
    mYR = json['MYR'] != null ? new USD.fromJson(json['MYR']) : null;
    oMR = json['OMR'] != null ? new USD.fromJson(json['OMR']) : null;
    pEN = json['PEN'] != null ? new USD.fromJson(json['PEN']) : null;
    pHP = json['PHP'] != null ? new USD.fromJson(json['PHP']) : null;
    pKR = json['PKR'] != null ? new USD.fromJson(json['PKR']) : null;
    qAR = json['QAR'] != null ? new USD.fromJson(json['QAR']) : null;
    rSD = json['RSD'] != null ? new USD.fromJson(json['RSD']) : null;
    sGD = json['SGD'] != null ? new USD.fromJson(json['SGD']) : null;
    sYP = json['SYP'] != null ? new USD.fromJson(json['SYP']) : null;
    tHB = json['THB'] != null ? new USD.fromJson(json['THB']) : null;
    tWD = json['TWD'] != null ? new USD.fromJson(json['TWD']) : null;
    uAH = json['UAH'] != null ? new USD.fromJson(json['UAH']) : null;
    uYU = json['UYU'] != null ? new USD.fromJson(json['UYU']) : null;
    gEL = json['GEL'] != null ? new USD.fromJson(json['GEL']) : null;
    tND = json['TND'] != null ? new USD.fromJson(json['TND']) : null;
    bGN = json['BGN'] != null ? new USD.fromJson(json['BGN']) : null;
    ons = json['ons'] != null ? new USD.fromJson(json['ons']) : null;
    gramAltin = json['gram-altin'] != null
        ? new USD.fromJson(json['gram-altin'])
        : null;
    ceyrekAltin = json['ceyrek-altin'] != null
        ? new USD.fromJson(json['ceyrek-altin'])
        : null;
    yarimAltin = json['yarim-altin'] != null
        ? new USD.fromJson(json['yarim-altin'])
        : null;
    tamAltin =
        json['tam-altin'] != null ? new USD.fromJson(json['tam-altin']) : null;
    cumhuriyetAltini = json['cumhuriyet-altini'] != null
        ? new USD.fromJson(json['cumhuriyet-altini'])
        : null;
    ataAltin =
        json['ata-altin'] != null ? new USD.fromJson(json['ata-altin']) : null;
    resatAltin = json['resat-altin'] != null
        ? new USD.fromJson(json['resat-altin'])
        : null;
    hamitAltin = json['hamit-altin'] != null
        ? new USD.fromJson(json['hamit-altin'])
        : null;
    ikibucukAltin = json['ikibucuk-altin'] != null
        ? new USD.fromJson(json['ikibucuk-altin'])
        : null;
    gremseAltin = json['gremse-altin'] != null
        ? new USD.fromJson(json['gremse-altin'])
        : null;
    besliAltin = json['besli-altin'] != null
        ? new USD.fromJson(json['besli-altin'])
        : null;
    u14AyarAltin = json['14-ayar-altin'] != null
        ? new USD.fromJson(json['14-ayar-altin'])
        : null;
    u18AyarAltin = json['18-ayar-altin'] != null
        ? new USD.fromJson(json['18-ayar-altin'])
        : null;
    u22AyarBilezik = json['22-ayar-bilezik'] != null
        ? new USD.fromJson(json['22-ayar-bilezik'])
        : null;
    gumus = json['gumus'] != null ? new USD.fromJson(json['gumus']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Update_Date'] = this.updateDate;
    if (this.uSD != null) {
      data['USD'] = this.uSD!.toJson();
    }
    if (this.eUR != null) {
      data['EUR'] = this.eUR!.toJson();
    }
    if (this.gBP != null) {
      data['GBP'] = this.gBP!.toJson();
    }
    if (this.cHF != null) {
      data['CHF'] = this.cHF!.toJson();
    }
    if (this.cAD != null) {
      data['CAD'] = this.cAD!.toJson();
    }
    if (this.rUB != null) {
      data['RUB'] = this.rUB!.toJson();
    }
    if (this.aED != null) {
      data['AED'] = this.aED!.toJson();
    }
    if (this.aUD != null) {
      data['AUD'] = this.aUD!.toJson();
    }
    if (this.dKK != null) {
      data['DKK'] = this.dKK!.toJson();
    }
    if (this.sEK != null) {
      data['SEK'] = this.sEK!.toJson();
    }
    if (this.nOK != null) {
      data['NOK'] = this.nOK!.toJson();
    }
    if (this.jPY != null) {
      data['JPY'] = this.jPY!.toJson();
    }
    if (this.kWD != null) {
      data['KWD'] = this.kWD!.toJson();
    }
    if (this.zAR != null) {
      data['ZAR'] = this.zAR!.toJson();
    }
    if (this.bHD != null) {
      data['BHD'] = this.bHD!.toJson();
    }
    if (this.lYD != null) {
      data['LYD'] = this.lYD!.toJson();
    }
    if (this.sAR != null) {
      data['SAR'] = this.sAR!.toJson();
    }
    if (this.iQD != null) {
      data['IQD'] = this.iQD!.toJson();
    }
    if (this.iLS != null) {
      data['ILS'] = this.iLS!.toJson();
    }
    if (this.iRR != null) {
      data['IRR'] = this.iRR!.toJson();
    }
    if (this.iNR != null) {
      data['INR'] = this.iNR!.toJson();
    }
    if (this.mXN != null) {
      data['MXN'] = this.mXN!.toJson();
    }
    if (this.hUF != null) {
      data['HUF'] = this.hUF!.toJson();
    }
    if (this.nZD != null) {
      data['NZD'] = this.nZD!.toJson();
    }
    if (this.bRL != null) {
      data['BRL'] = this.bRL!.toJson();
    }
    if (this.iDR != null) {
      data['IDR'] = this.iDR!.toJson();
    }
    if (this.cSK != null) {
      data['CSK'] = this.cSK!.toJson();
    }
    if (this.pLN != null) {
      data['PLN'] = this.pLN!.toJson();
    }
    if (this.rON != null) {
      data['RON'] = this.rON!.toJson();
    }
    if (this.cNY != null) {
      data['CNY'] = this.cNY!.toJson();
    }
    if (this.aRS != null) {
      data['ARS'] = this.aRS!.toJson();
    }
    if (this.aLL != null) {
      data['ALL'] = this.aLL!.toJson();
    }
    if (this.aZN != null) {
      data['AZN'] = this.aZN!.toJson();
    }
    if (this.bAM != null) {
      data['BAM'] = this.bAM!.toJson();
    }
    if (this.cLP != null) {
      data['CLP'] = this.cLP!.toJson();
    }
    if (this.cOP != null) {
      data['COP'] = this.cOP!.toJson();
    }
    if (this.cRC != null) {
      data['CRC'] = this.cRC!.toJson();
    }
    if (this.dZD != null) {
      data['DZD'] = this.dZD!.toJson();
    }
    if (this.eGP != null) {
      data['EGP'] = this.eGP!.toJson();
    }
    if (this.hKD != null) {
      data['HKD'] = this.hKD!.toJson();
    }
    if (this.hRK != null) {
      data['HRK'] = this.hRK!.toJson();
    }
    if (this.iSK != null) {
      data['ISK'] = this.iSK!.toJson();
    }
    if (this.jOD != null) {
      data['JOD'] = this.jOD!.toJson();
    }
    if (this.kRW != null) {
      data['KRW'] = this.kRW!.toJson();
    }
    if (this.kZT != null) {
      data['KZT'] = this.kZT!.toJson();
    }
    if (this.lBP != null) {
      data['LBP'] = this.lBP!.toJson();
    }
    if (this.lKR != null) {
      data['LKR'] = this.lKR!.toJson();
    }
    if (this.mAD != null) {
      data['MAD'] = this.mAD!.toJson();
    }
    if (this.mDL != null) {
      data['MDL'] = this.mDL!.toJson();
    }
    if (this.mKD != null) {
      data['MKD'] = this.mKD!.toJson();
    }
    if (this.mYR != null) {
      data['MYR'] = this.mYR!.toJson();
    }
    if (this.oMR != null) {
      data['OMR'] = this.oMR!.toJson();
    }
    if (this.pEN != null) {
      data['PEN'] = this.pEN!.toJson();
    }
    if (this.pHP != null) {
      data['PHP'] = this.pHP!.toJson();
    }
    if (this.pKR != null) {
      data['PKR'] = this.pKR!.toJson();
    }
    if (this.qAR != null) {
      data['QAR'] = this.qAR!.toJson();
    }
    if (this.rSD != null) {
      data['RSD'] = this.rSD!.toJson();
    }
    if (this.sGD != null) {
      data['SGD'] = this.sGD!.toJson();
    }
    if (this.sYP != null) {
      data['SYP'] = this.sYP!.toJson();
    }
    if (this.tHB != null) {
      data['THB'] = this.tHB!.toJson();
    }
    if (this.tWD != null) {
      data['TWD'] = this.tWD!.toJson();
    }
    if (this.uAH != null) {
      data['UAH'] = this.uAH!.toJson();
    }
    if (this.uYU != null) {
      data['UYU'] = this.uYU!.toJson();
    }
    if (this.gEL != null) {
      data['GEL'] = this.gEL!.toJson();
    }
    if (this.tND != null) {
      data['TND'] = this.tND!.toJson();
    }
    if (this.bGN != null) {
      data['BGN'] = this.bGN!.toJson();
    }
    if (this.ons != null) {
      data['ons'] = this.ons!.toJson();
    }
    if (this.gramAltin != null) {
      data['gram-altin'] = this.gramAltin!.toJson();
    }
    if (this.ceyrekAltin != null) {
      data['ceyrek-altin'] = this.ceyrekAltin!.toJson();
    }
    if (this.yarimAltin != null) {
      data['yarim-altin'] = this.yarimAltin!.toJson();
    }
    if (this.tamAltin != null) {
      data['tam-altin'] = this.tamAltin!.toJson();
    }
    if (this.cumhuriyetAltini != null) {
      data['cumhuriyet-altini'] = this.cumhuriyetAltini!.toJson();
    }
    if (this.ataAltin != null) {
      data['ata-altin'] = this.ataAltin!.toJson();
    }
    if (this.resatAltin != null) {
      data['resat-altin'] = this.resatAltin!.toJson();
    }
    if (this.hamitAltin != null) {
      data['hamit-altin'] = this.hamitAltin!.toJson();
    }
    if (this.ikibucukAltin != null) {
      data['ikibucuk-altin'] = this.ikibucukAltin!.toJson();
    }
    if (this.gremseAltin != null) {
      data['gremse-altin'] = this.gremseAltin!.toJson();
    }
    if (this.besliAltin != null) {
      data['besli-altin'] = this.besliAltin!.toJson();
    }
    if (this.u14AyarAltin != null) {
      data['14-ayar-altin'] = this.u14AyarAltin!.toJson();
    }
    if (this.u18AyarAltin != null) {
      data['18-ayar-altin'] = this.u18AyarAltin!.toJson();
    }
    if (this.u22AyarBilezik != null) {
      data['22-ayar-bilezik'] = this.u22AyarBilezik!.toJson();
    }
    if (this.gumus != null) {
      data['gumus'] = this.gumus!.toJson();
    }
    return data;
  }
}

class USD {
  String? al;
  String? tR;
  String? sat;
  String? deIIm;

  USD({this.al, this.tR, this.sat, this.deIIm});

  USD.fromJson(Map<String, dynamic> json) {
    al = json['Alış'];
    tR = json['Tür'];
    sat = json['Satış'];
    deIIm = json['Değişim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Alış'] = this.al;
    data['Tür'] = this.tR;
    data['Satış'] = this.sat;
    data['Değişim'] = this.deIIm;
    return data;
  }
}