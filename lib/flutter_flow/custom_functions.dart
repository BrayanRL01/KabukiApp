import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double sumarSubTotal(
  double subTotal,
  double precio,
) {
  subTotal = subTotal + precio;
  return subTotal;
}

double restarSubTotal(
  double subTotal,
  double precio,
) {
  if (subTotal > 0) {
    subTotal = subTotal - precio;
  }
  return subTotal;
}

int disminuirCantidad(int numero) {
  if (numero == 1) {
    return 1;
  } else {
    return numero - 1;
  }
}

int aumentarCantidad(int numero) {
  return numero + 1;
}

double obtenerSubTotal(List<double> subTotal) {
  double total = 0;

  for (double add in subTotal) {
    total += add;
  }

  return total;
}

double calcularSubTotal(
  double precio,
  int cantidad,
) {
  return precio * cantidad;
}
