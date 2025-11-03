import 'package:quiz_app/models/questions.dart';

import '../models/question.dart';

final questions = <Question>[
  // IPA
  Question(
    id: 'ipa1',
    category: 'IPA',
    text: 'Proses perubahan air menjadi uap disebut?',
    options: ['Pengembunan', 'Penguapan', 'Pembekuan', 'Peleburan'],
    correctIndex: 1,
  ),
  Question(
    id: 'ipa2',
    category: 'IPA',
    text: 'Air mendidih pada suhu berapa di permukaan laut?',
    options: ['50°C', '75°C', '100°C', '120°C'],
    correctIndex: 2,
  ),

  // Seni
  Question(
    id: 'seni1',
    category: 'Seni',
    text: 'Warna Primer dalam Seni Rupa adalah',
    options: [
      'Merah, hijau, biru',
      'Merah, kuning, biru',
      'Hitam, putih, abu-abu',
      'Jingga, ungu, hijau'
    ],
    correctIndex: 1,
  ),
  Question(
    id: 'seni2',
    category: 'Seni',
    text: 'Teknik arsir menggunakan media?',
    options: ['Arang', 'Pensil/pena', 'Cat akrilik', 'Kuas air'],
    correctIndex: 1,
  ),

  // Matematika
  Question(
    id: 'mtk1',
    category: 'Matematika',
    text: 'Hasil 12 × 8 adalah...',
    options: ['80', '88', '90', '96'],
    correctIndex: 3,
  ),
  Question(
    id: 'mtk2',
    category: 'Matematika',
    text: 'Bilangan prima terkecil adalah...',
    options: ['0', '1', '2', '3'],
    correctIndex: 2,
  ),

  // Bahasa
  Question(
    id: 'bhs1',
    category: 'Bahasa',
    text: 'Antonim dari “tinggi” adalah...',
    options: ['Rendah', 'Jauh', 'Pendek', 'Dalam'],
    correctIndex: 0,
  ),
  Question(
    id: 'bhs2',
    category: 'Bahasa',
    text: 'Kata baku dari “ijin” adalah...',
    options: ['Ijin', 'Izin', 'Ijyn', 'Ejin'],
    correctIndex: 1,
  ),
];

const categories = ['Matematika', 'Seni', 'IPA', 'Bahasa'];
