import 'dart:math';

import '../models/pub.dart';

final dummyPubs = [
  Pub(
    id: Random().nextDouble().toString(),
    userId: '1',
    name: 'Bar do Pukinha',
    phone: '89999454545',
    description:
        'Bem-vindo ao Bar do Pukinha, onde a diversão nunca acaba! Este lugar vibrante e animado oferece uma atmosfera única, com música ao vivo, drinks exclusivos e uma equipe incrível que sempre garante sua satisfação.',
    imageUrl:
        'https://10619-2.s.cdn12.com/rests/small/w550/h367/106_511579846.jpg',
    opennigTime: '22h',
    closingTime: '03h',
    state: 'Piauí',
    cep: '64980-000',
    city: 'Corrente',
    district: 'Sincerino',
    street: 'Rua Eutímio Messias',
    number: 574,
    latitude: '-10.43494',
    longitude: '-45.16184',
  ),
  Pub(
    id: Random().nextDouble().toString(),
    userId: '1',
    name: 'Bar da Ripa',
    phone: '899994541725',
    description:
        'Bem-vindo ao Bar da Ripa, o refúgio perfeito para os amantes de música ao vivo e boa cerveja. Localizado no coração da cidade, este icônico bar oferece uma atmosfera descontraída, com decoração rústica e uma extensa seleção de bebidas.',
    imageUrl: 'https://img.restaurantguru.com/rbc7-Bar-Risca-Faca-design.jpg',
    opennigTime: '22h',
    closingTime: '03h',
    state: 'Piauí',
    cep: '64980-000',
    city: 'Corrente',
    district: 'Centro',
    street: 'Rua Dep. Luiz Rocha',
    number: 975,
    latitude: '-2.51231',
    longitude: '-44.23969',
  ),
  Pub(
    id: Random().nextDouble().toString(),
    userId: '1',
    name: 'Bar Garagem',
    phone: '899994555895',
    description:
        'Explore o charmoso e aconchegante Bar Garagem, um local que transborda estilo e descontração. Com sua atmosfera única, repleta de luzes suaves e decoração vintage, este é o lugar perfeito para saborear deliciosos drinks e aproveitar boa música. ',
    imageUrl:
        'https://www.reporteralessandroguerra.com/images/noticias/1095/865611695.jpg',
    opennigTime: '22h',
    closingTime: '03h',
    state: 'Piauí',
    cep: '64980-000',
    city: 'Corrente',
    district: 'Centro',
    street: 'Rua Filemon Nogueira',
    number: 75,
    latitude: '-10.44122',
    longitude: '-45.16349',
  ),
];
