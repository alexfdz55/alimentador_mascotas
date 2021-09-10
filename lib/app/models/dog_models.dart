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
}
