// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gobank/utils/media.dart';
import 'package:provider/provider.dart';

import '../utils/colornotifire.dart';

class AddServices_Screen extends StatefulWidget {
  final String title;
  const AddServices_Screen(this.title, {Key? key}) : super(key: key);

  @override
  State<AddServices_Screen> createState() => _AddServices_ScreenState();
}

class _AddServices_ScreenState extends State<AddServices_Screen> {
  late ColorNotifire notifire;
  List<Map<String, dynamic>> detalles = [
    {
      "id": 1,
      "articulo": "Televisor 55 QLED 4K",
      "precioL": "13,500.00",
      "precioD": "548.00",
      "cantidad": 1,
      "imagen": "images/TCL.png",
      "marca": "TCL",
    },
    {
      "id": 2,
      "articulo": "Caja Android TV OTT",
      "precioL": "371.80",
      "precioD": "15.00",
      "cantidad": 1,
      "imagen": "images/AndroidOTT.png",
      "marca": "TV Box",
    },
    {
      "id": 3,
      "articulo": "Play Station 5",
      "precioL": "15,000.00",
      "precioD": "717.00",
      "cantidad": 1,
      "imagen": "images/PS5.png",
      "marca": "Sony",
    },
    {
      "id": 4,
      "articulo": "DECO X20	",
      "precioL": "5,059.13",
      "precioD": "0.00",
      "cantidad": 1,
      "imagen": "images/DECO.png",
      "marca": "KingType",
    }
  ];

  List<Map<String, dynamic>> detallessinadquirir = [
    {
      "id": 1,
      "articulo": "UNIFI Access Point",
      "precioL": "2,664.00",
      "precioD": "108.36",
      "cantidad": 1,
      "imagen": "images/UNIFI.png",
      "marca": "Ubiquiti",
    },
    {
      "id": 2,
      "articulo": "AX3000 DECO X55",
      "precioL": "1.00",
      "precioD": "0.00",
      "cantidad": 1,
      "imagen": "images/DECOX55.png",
      "marca": "tp-link",
    },
    {
      "id": 3,
      "articulo": "Smart TV TCL QLED 65 4K Full HD",
      "precioL": "15,997.00",
      "precioD": "0.00",
      "cantidad": 1,
      "imagen": "images/GoogleQLED.png",
      "marca": "TCL",
    },
    {
      "id": 4,
      "articulo": "SOPORTE PARA TV",
      "precioL": "0.00",
      "precioD": "25.00",
      "cantidad": 1,
      "imagen": "images/soportetv.png",
      "marca": "KingType",
    }
  ];

  List<Map<String, dynamic>> solicitudes = [];

  TabController? controller;

  late final List<Map<String, dynamic>> _originalDetalles = List.from(detalles);
  late final List<Map<String, dynamic>> _originaldetallesnoadd =
      List.from(detallessinadquirir);

  final TextEditingController _misproductosController = TextEditingController();
  final TextEditingController _noadquiridosController = TextEditingController();

  void addSolicitudes(int id) {
    var detalle =
        _originaldetallesnoadd.firstWhere((detalle) => detalle['id'] == id);

    solicitudes.add(detalle);
  }

  void lessSolicitudes(int id) {
    var detalle = solicitudes.firstWhere((detalle) => detalle['id'] == id);

    solicitudes.remove((detalle));
    _buildCardsDialog();
  }

  @override
  void initState() {
    super.initState();
  }

  bool visble_form = false;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Gilroy Bold',
            color: notifire.getdarkscolor,
          ),
        ),
        backgroundColor: notifire.getorangeprimerycolor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: notifire.getdarkscolor),
            ),
            child: Icon(Icons.arrow_back, color: notifire.getdarkscolor),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              _showDialogSolicitudes();
            },
            child: Icon(
              Icons.assignment,
              color: notifire.getdarkscolor,
              size: height * 0.05,
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Productos Adquiridos',
                  style: TextStyle(
                    color: notifire.getdarkscolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _misproductosController,
                onChanged: _filterProductsAdquiridos,
                autofocus: false,
                style: TextStyle(
                  fontSize: 12,
                  color: notifire.getdarkscolor,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: notifire.getbackcolor,
                  hintText: 'Buscar en tus productos',
                  hintStyle:
                      TextStyle(color: notifire.getdarkgreycolor, fontSize: 12),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: notifire.getorangeprimerycolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffd3d3d3)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: <DataColumn>[
                      DataColumn(
                        label: Text(
                          '#',
                          style: TextStyle(
                              fontSize: 15, color: notifire.getdarkscolor),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          ' ',
                          style: TextStyle(
                              fontSize: 15, color: notifire.getdarkscolor),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Articulo',
                          style: TextStyle(
                              fontSize: 15, color: notifire.getdarkscolor),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Marca',
                          style: TextStyle(
                              fontSize: 15, color: notifire.getdarkscolor),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Valor (L.)',
                          style: TextStyle(
                              fontSize: 15, color: notifire.getdarkscolor),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Valor (USD)',
                          style: TextStyle(
                              fontSize: 15, color: notifire.getdarkscolor),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Cantidad',
                          style: TextStyle(
                              fontSize: 15, color: notifire.getdarkscolor),
                        ),
                      ),
                    ],
                    rows: _buildDataRows(),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                reverseDuration: const Duration(milliseconds: 200),
                switchInCurve: Curves.decelerate,
                switchOutCurve: Curves.decelerate,
                child: visble_form == true
                    ? Column(
                        children: [
                          Center(
                            child: Text(
                              'Productos sin Adquirir',
                              style: TextStyle(
                                color: notifire.getdarkscolor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextField(
                            key: const ValueKey('textField'),
                            controller: _noadquiridosController,
                            onChanged: _filterProducts,
                            autofocus: false,
                            style: TextStyle(
                              fontSize: 12,
                              color: notifire.getdarkscolor,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: notifire.getbackcolor,
                              hintText: 'Buscar en Productos no Adquiridos',
                              hintStyle: TextStyle(
                                  color: notifire.getdarkgreycolor,
                                  fontSize: 12),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: notifire.getorangeprimerycolor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffd3d3d3)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Center(
                            child: Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: _buildCard(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            reverseDuration: const Duration(milliseconds: 200),
            switchInCurve: Curves.decelerate,
            switchOutCurve: Curves.decelerate,
            child: visble_form == false
                ? FloatingActionButton(
                    key: UniqueKey(),
                    onPressed: () {
                      setState(() {
                        visble_form = true;
                      });
                    },
                    child: const Icon(Icons.add),
                    backgroundColor: Colors.green,
                  )
                : FloatingActionButton(
                    key: UniqueKey(),
                    onPressed: () {
                      setState(() {
                        visble_form = false;
                      });
                    },
                    child: const Icon(Icons.close),
                    backgroundColor: Colors.red,
                  ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _filterProductsAdquiridos(String query) {
    setState(() {
      if (query.isNotEmpty) {
        detalles = _originalDetalles.where((detalle) {
          final articulo = detalle['articulo'].toString().toLowerCase();
          return articulo.contains(query.toLowerCase());
        }).toList();
      } else {
        detalles = List.from(_originalDetalles);
      }
    });
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isNotEmpty) {
        detallessinadquirir = _originaldetallesnoadd.where((detalle) {
          final articulo = detalle['articulo'].toString().toLowerCase();
          return articulo.contains(query.toLowerCase());
        }).toList();
      } else {
        detallessinadquirir = List.from(_originaldetallesnoadd);
      }
    });
  }

  List<Card> _buildCard() {
    return detallessinadquirir.map((detalle) {
      return Card(
        color: notifire.getbackcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  imagen(context, detalle['imagen']!.toString(),
                      detalle['articulo']!.toString());
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(detalle['imagen']),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      detalle['articulo'].toString().toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        color: notifire.getdarkscolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      detalle['marca'].toString().toUpperCase(),
                      style: TextStyle(
                        fontSize: 14,
                        color: notifire.getdarkgreycolor,
                      ),
                    ),
                    Text(
                      'Valor (L.): ${detalle['precioL'].toString()}',
                      style: TextStyle(
                          fontSize: 14, color: notifire.getdarkscolor),
                    ),
                    Text(
                      'Valor (USD): ${detalle['precioD'].toString()}',
                      style: TextStyle(
                          fontSize: 14, color: notifire.getdarkscolor),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showConfirmationDialog(
                        context,
                        detalle['imagen'].toString(),
                        detalle['articulo'].toString(),
                        detalle['id'].toString(),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: notifire.getorangeprimerycolor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shopping_basket_outlined,
                          color: notifire.getdarkscolor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      );
    }).toList();
  }

  List<Card> _buildCardsDialog() {
    return solicitudes.map((detalle) {
      return Card(
        color: notifire.getbackcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  imagen(context, detalle['imagen']!.toString(),
                      detalle['articulo']!.toString());
                },
                child: Container(
                  width: width * 0.2,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(detalle['imagen']),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded( 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      detalle['articulo'].toString().toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        color: notifire.getdarkscolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      detalle['marca'].toString().toUpperCase(),
                      style: TextStyle(
                        fontSize: 14,
                        color: notifire.getdarkgreycolor,
                      ),
                    ),
                    Text(
                      'Valor (L.): ${detalle['precioL'].toString()}',
                      style: TextStyle(
                          fontSize: 14, color: notifire.getdarkscolor),
                    ),
                    Text(
                      'Valor (USD): ${detalle['precioD'].toString()}',
                      style: TextStyle(
                          fontSize: 14, color: notifire.getdarkscolor),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showLessSolicitudDialog(context, detalle['imagen'],
                          detalle['articulo'], detalle['id']);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: notifire.getorangeprimerycolor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.remove_circle_outline_sharp,
                          color: notifire.getdarkscolor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      );
    }).toList();
  }

  Future<void> _showConfirmationDialog(
      BuildContext context, img, articulo, id) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: notifire.getprimerycolor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              decoration: BoxDecoration(
                color: notifire.getprimerycolor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: const EdgeInsets.all(15.0),
              height: 400,
              child: Column(
                children: [
                  SizedBox(
                    height: height / 40,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Center(
                    child: Text(
                      '¿Desea hacer solicitud del producto $articulo?',
                      style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontFamily: 'Gilroy Bold',
                        fontSize: height / 40,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      addSolicitudes(int.parse(id));
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height / 18,
                      width: width / 2.5,
                      decoration: BoxDecoration(
                        color: notifire.getorangeprimerycolor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Agregar',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Gilroy Bold',
                              fontSize: height / 55),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height / 18,
                      width: width / 2.5,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                              color: const Color(0xffEB5757),
                              fontFamily: 'Gilroy Bold',
                              fontSize: height / 55),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<DataRow> _buildDataRows() {
    return detalles.map((detalle) {
      return DataRow(
        color: MaterialStateColor.resolveWith((states) =>
            detalles.indexOf(detalle) % 2 == 0
                ? Colors.white
                : const Color.fromARGB(255, 216, 215, 215)),
        cells: [
          DataCell(
            Text(detalle['id']!.toString()),
          ),
          DataCell(IconButton(
            icon: const Icon(Icons.photo),
            onPressed: () {
              imagen(context, detalle['imagen']!.toString(),
                  detalle['articulo']!.toString());
            },
          )),
          DataCell(Text(detalle['articulo']!.toString())),
          DataCell(Text(detalle['marca']!.toString())),
          DataCell(Text(detalle['precioL']!.toString())),
          DataCell(Text(detalle['precioD']!.toString())),
          DataCell(Text(detalle['cantidad']!.toString())),
        ],
      );
    }).toList();
  }

  void imagen(BuildContext context, String img, String nombre) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: const EdgeInsets.all(0),
            content: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.contain,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        nombre,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          overflow: TextOverflow.clip,
                          color: Color.fromARGB(255, 80, 79, 79),
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showLessSolicitudDialog(
      BuildContext context, img, articulo, id) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: notifire.getprimerycolor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              decoration: BoxDecoration(
                color: notifire.getprimerycolor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: const EdgeInsets.all(15.0),
              height: 400,
              child: Column(
                children: [
                  SizedBox(
                    height: height / 40,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Center(
                    child: Text(
                      '¿Desea cancelar solicitud del producto $articulo?',
                      style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontFamily: 'Gilroy Bold',
                        fontSize: height / 40,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      lessSolicitudes(id);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height / 18,
                      width: width / 2.5,
                      decoration: BoxDecoration(
                        color: notifire.getorangeprimerycolor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Confirmar',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Gilroy Bold',
                              fontSize: height / 55),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height / 18,
                      width: width / 2.5,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                              color: const Color(0xffEB5757),
                              fontFamily: 'Gilroy Bold',
                              fontSize: height / 55),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showDialogSolicitudes() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: notifire.getprimerycolor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: DefaultTabController(
            length: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                decoration: BoxDecoration(
                  color: notifire.getprimerycolor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                margin: const EdgeInsets.all(15.0),
                height: 600,
                child: Column(
                  children: [
                    SizedBox(
                      height: height / 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          const Spacer(),
                          Icon(
                            Icons.clear,
                            color: notifire.getdarkscolor,
                          ),
                          SizedBox(
                            width: width / 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    TabBar(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => notifire.getbluecolor),
                      labelColor: notifire.getdarkscolor,
                      dividerColor: MaterialStateColor.resolveWith(
                          (states) => notifire.getprimerycolor),
                      indicatorColor: notifire.getorangeprimerycolor,
                      tabs: const [
                        Tab(
                          text: 'Productos a solicitar',
                        ),
                        Tab(
                          text: 'Estado de Solicitudes',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          solicitudes.isNotEmpty
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 6.00,
                                        ),
                                        solicitudes.isNotEmpty
                                            ? TextButton(
                                                onPressed: () {
                                                  //post api
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateColor.resolveWith(
                                                          (states) => notifire
                                                              .getorangeprimerycolor),
                                                ),
                                                child: Text(
                                                    'Enviar Solicitudes',
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getdarkscolor)),
                                              )
                                            : const SizedBox(
                                                width: 6.00,
                                              ),
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: _buildCardsDialog(),
                                      ),
                                    )
                                  ],
                                )
                              : Container(
                                  color: notifire.getbackcolor,
                                  child: Center(
                                    child: Text(
                                      'No se han ingresado productos',
                                      style: TextStyle(
                                          color: notifire.getdarkscolor),
                                    ),
                                  ),
                                ),
                          Container(
                            color: notifire.getbackcolor,
                            child: Center(
                              child: Text(
                                'Contenido de Tab 2',
                                style: TextStyle(color: notifire.getdarkscolor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
