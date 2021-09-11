class Dog {
  final _porte = [
    {
      'Pequeno': [
        'Filhote, de 2 a 8 meses',
        'Adulto',
        'Idoso, cerca de 10 anos ',
      ],
    },
    {
      'Médio': [
        'Filhote, de 2 a 8 meses',
        'Adulto',
        'Idoso, cerca de 8 anos ',
      ],
    },
    {
      'Grande, entre 25 e 40 quilos': [
        'Filhote, de 2 a 8 meses',
        'Adulto',
        'Idoso, cerca de 6 anos ',
      ],
    },
    {
      'Gigante, mais de 40 quilos': [
        'Filhote, de 2 a 8 meses',
        'Adulto',
        'Idoso, cerca de 6 anos ',
      ],
    }
  ];

  List<Map<String, List<String>>> get porte {
    return _porte;
  }

  final Map<String, String> _infoMeses = {
    '2 a 3 meses':
        'Que cães filhotes de 2 a 3 meses consumam  entre 150 e 200 gra-mas, de ração macia para filhote, por dia,  fracionadas  em  4  ou  5 refeições diárias',
    '4 a 5 meses':
        'Que cães filhotes de 4 a 5 meses consumam  250  gramas  de  ra -ção  para filhotes por dia, fracio -nadas  em  3 refeições diárias.',
    '6 a 7 meses':
        'Que cães filhotes de 6 a 7 meses consumam  300  gramas  de  ra -ção  para filhotes por dia, fracio -nadas  em  2 refeições diárias.',
    '8 meses':
        'Que  cães   filhotes   de  8  meses consumam entre 300 e 400  gra -mas  de  ração para  filhotes  por dia, fracionadas em 2 refeições diárias.',
  };

  Map<String, String> get infoMeses {
    return _infoMeses;
  }

  final Map<String, String> _infoPequeno = {
    'Adulto':
        'Que cães adultos de pequeno porte consumam, pelo menos, de 90 a 150 gramas de ração diárias.',
    'Idoso, cerca de 10 anos ':
        'Que cães idosos de pequeno por-te consumam de  90 a 150 gra -mas de ração da gama Sênior, divididas em 2 refeições diárias.',
  };

  Map<String, String> get infoPequeno {
    return _infoPequeno;
  }

  final Map<String, String> _infoMedio = {
    'Adulto':
        'Que cães adultos de médio porte consumam em média, pelo  me -nos, de 160 a 270 gramas de ra -ção diárias.',
    'Idoso, cerca de 8 anos ':
        'Wue  cães idosos de médio porte consumam de 160 a 270 gramas de ração da gama Sênior, dividi -das em duas refeições diárias.',
  };

  Map<String, String> get infoMedio {
    return _infoMedio;
  }

  final Map<String, String> _infoGrande = {
    'Adulto':
        'Que cães adultos de grande porte consumam em média, pelo menos, de 280 a 450 gramas de ração diárias.',
    'Idoso, cerca de 6 anos ':
        'Que cães idosos de grande porte consumam de 280 a 450 gramas de ração da gama Sênior, divididas em duas refeições diárias.',
  };

  Map<String, String> get infoGrande {
    return _infoGrande;
  }

  final Map<String, String> _infoGigante = {
    'Adulto':
        'Que cães adultos de porte gigan-te consumam em média, pelo  menos, de  500 a 810 gramas de ração diárias.',
    'Idoso, cerca de 6 anos ':
        'Que  cães idosos de porte gigan -te consumam de 500 a 800 gra -mas de ração da gama Sênior, divididas em 2 refeições diárias.',
  };

  Map<String, String> get infoGigante {
    return _infoGigante;
  }
}
