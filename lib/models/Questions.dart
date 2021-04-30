class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Fren müşürü hangi sistemin bir parçasıdır?",
    "options": ['Yakıt Sisteminin', 'İkaz Sisteminin', 'Ateşleme Sisteminin', 'Aktarma Sisteminin'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "C Sınıfı Ehliyet Hangi Aracı Süremez ?",
    "options": ['Otomobil', 'Motorsiklet', 'Tır', 'Kamyon'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Src 4 belgesi ne Taşımacılığında  kullanılır?",
    "options": ['Hayvan', 'Yolcu ', 'Yük Ve kargo', 'Tanker'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Bir aracın teknik olarak güvenle taşıyabileceği en çok yük ağırlığı veya yolcu sayısına ne denir?",
    "options": ['Yüklü Ağırlık ', 'Taşıma Sınırı', 'Gabari', 'Dingil Ağırlığı'],
    "answer_index": 2,
  },
];
