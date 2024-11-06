import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TramiHelp',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const TramitesScreen(),
    );
  }
}

class TramitesScreen extends StatelessWidget {
  const TramitesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.indigo[400],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.help_outline,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'TramiHelp',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar trámites...',
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: Colors.grey[600]),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Trámites Populares',
                      style: TextStyle(color: Colors.indigo[400]),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Categorías',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ],
                indicatorColor: Colors.indigo[400],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: tramites
                      .map((tramite) => _buildTramiteCard(tramite))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTramiteCard(Tramite tramite) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: tramite.color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            tramite.icono,
            color: tramite.color,
            size: 24,
          ),
        ),
        title: Text(
          tramite.nombre,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          tramite.descripcion,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Documentos necesarios:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[400],
                  ),
                ),
                const SizedBox(height: 8),
                ...tramite.documentos.map((doc) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle,
                              size: 16, color: Colors.green[400]),
                          const SizedBox(width: 8),
                          Text(doc, style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tramite {
  final String nombre;
  final String descripcion;
  final List<String> documentos;
  final IconData icono;
  final Color color;

  Tramite({
    required this.nombre,
    required this.descripcion,
    required this.documentos,
    required this.icono,
    required this.color,
  });
}

final List<Tramite> tramites = [
  Tramite(
    nombre: 'INE',
    descripcion: 'Credencial para votar',
    documentos: [
      'Acta de nacimiento',
      'Comprobante de domicilio reciente',
      'Identificación oficial con fotografía',
    ],
    icono: Icons.how_to_vote,
    color: Colors.blue,
  ),
  Tramite(
    nombre: 'RFC',
    descripcion: 'Registro Federal de Contribuyentes',
    documentos: [
      'Acta de nacimiento',
      'Comprobante de domicilio reciente',
      'Identificación oficial con fotografía',
      'CURP',
    ],
    icono: Icons.account_balance,
    color: Colors.green,
  ),
  Tramite(
    nombre: 'CURP',
    descripcion: 'Clave Única de Registro de Población',
    documentos: [
      'Acta de nacimiento',
      'Identificación oficial con fotografía',
    ],
    icono: Icons.perm_identity,
    color: Colors.purple,
  ),
  Tramite(
    nombre: 'Acta de Nacimiento',
    descripcion: 'Documento oficial de nacimiento',
    documentos: [
      'Identificación oficial con fotografía del solicitante',
      'Datos de registro (fecha y lugar de nacimiento)',
    ],
    icono: Icons.child_care,
    color: Colors.orange,
  ),
  Tramite(
    nombre: 'Pasaporte',
    descripcion: 'Documento de identidad y viaje',
    documentos: [
      'Acta de nacimiento',
      'Identificación oficial con fotografía',
      'CURP',
      'Comprobante de domicilio reciente',
      'Pago de derechos',
    ],
    icono: Icons.flight,
    color: Colors.red,
  ),
  Tramite(
    nombre: 'Licencia de Conducir',
    descripcion: 'Permiso para conducir vehículos',
    documentos: [
      'Identificación oficial con fotografía',
      'Comprobante de domicilio reciente',
      'CURP',
      'Examen médico',
      'Pago de derechos',
    ],
    icono: Icons.drive_eta,
    color: Colors.teal,
  ),
];
