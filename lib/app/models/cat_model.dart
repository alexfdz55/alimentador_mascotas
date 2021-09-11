class Cat {
  final _edades = [
    {
      'Filhote, menos de 12 meses': [
        {
          'Até 1,6kg':
              'Que gatos  filhotes com  peso  de até  1,6kg  consumam  entre 10 e 20 gramas de ração por dia  divi -didas em pelo menos 4 refeições'
        },
        {
          'Entre 1,6 e 3,7kg':
              'Que gatos filhotes com  peso en -tre 1,6 e 3,7kg  consumam  entre 25 e 40 gramas de ração por dia  divididas em pelo menos 4 refei -ções. '
        }
      ],
    },
    {
      'Adulto': [
        {
          'Entre 4 e 6 kg':
              'Que gatos adultos com  peso en -tre 4 e 6kg  consumam  entre 40 e 80 gramas de ração por dia, di -vididas  em,   pelo  menos,   duas refeições.'
        },
        {
          'Entre 7 e 9 kg':
              'Que gatos adultos com  peso en -tre 7 e 9kg  consumam  entre 60 e  100  gramas  de  ração por dia, divididas em, pelo  menos,   duas refeições.'
        },
        {
          'Acima de 10kg':
              'Wue gatos adultos com peso aci -ma de 10kg  consumam entre 80 e  120  gramas  de  ração por dia, divididas em, pelo  menos,   duas refeições.'
        },
      ],
    },
    {
      'Idoso, cerca de 7 anos': [
        {
          'Entre 1,5 e 5 kg':
              'Que gatos idosos  com  peso en -tre  1,5  e  5kg  consumam   entre 35 e 75 gramas de ração por dia, divididas em 2 ou 3 refeições.'
        },
        {
          'Entre 5 e 10 kg':
              'Que gatos idosos  com  peso en -tre  5 e 10kg consumam entre 75 e  120  gramas  de  ração por dia, divididas em 2 ou 3 refeições.'
        }
      ]
    },
  ];

  List<Map<String, List<Map<String, String>>>> get edades {
    return _edades;
  }
}
