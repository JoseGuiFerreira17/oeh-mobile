import 'dart:math';

import 'package:oeh/models/event.dart';

final dummyEvents = [
  Event(
    id: Random().nextDouble().toString(),
    userId: '1',
    name: 'Festa na piscina',
    phone: '89999454545',
    description:
        'Bem-vindo à festa na piscina mais incrível deste verão! Desfrute de um ambiente tropical, com música animada, bebidas refrescantes e muita diversão aquática.',
    imageUrl:
        'https://s2.glbimg.com/jpbqnkin7IobcD8ayS9tOUWd7AY=/300x225/s.glbimg.com/jo/g1/f/original/2014/11/06/pool_me_in_-_credito_i_hate_flash_2.jpg',
    date: DateTime.now(),
    state: 'Piauí',
    cep: '64980-000',
    city: 'Corrente',
    district: 'Centro',
    street: 'Rua Desembargador Amaral',
    number: 4855,
    latitude: '-10.44128',
    longitude: '-45.16348',
  ),
  Event(
    id: Random().nextDouble().toString(),
    userId: '1',
    name: 'Festa junina do Tio João',
    phone: '89999454545',
    description:
        'A Festa Junina do Tio João é um evento cheio de animação e tradição. Com sua decoração colorida e típica, a festa conta com danças folclóricas, barracas de comidas típicas deliciosas e muita música ao som das quadrilhas.',
    imageUrl:
        'https://pedrapreta.s3.sa-east-1.amazonaws.com/wp-content/uploads/2022/08/13135938/WhatsApp-Image-2022-08-03-at-08.57.00-2.jpeg',
    date: DateTime.now(),
    state: 'Piauí',
    cep: '64980-000',
    city: 'Corrente',
    district: 'Centro',
    street: 'Avenida Adolfo Jhon Terry',
    number: 875,
    latitude: '-10.43496',
    longitude: '-45.16187',
  ),
  Event(
    id: Random().nextDouble().toString(),
    userId: '1',
    name: 'Festa de halloween',
    phone: '89999454545',
    description:
        'Prepare-se para uma experiência arrepiante em Corrente! Nossa festa de Halloween é a combinação perfeita entre o assustador e o divertido.',
    imageUrl:
        'https://static.vecteezy.com/ti/vetor-gratis/p3/678647-banner-de-festa-de-halloween-do-grunge-gratis-vetor.jpg',
    date: DateTime.now(),
    state: 'Piauí',
    cep: '64980-000',
    city: 'Corrente',
    district: 'Centro',
    street: 'Rua Ipiranga',
    number: 5455,
    latitude: '-10.43478',
    longitude: '-45.16183',
  ),
];
