create database etec;
use etec;

create table tbCds (
    codigo int primary key,
    nomeCd varchar (255) not null,
    dataCompra datetime,
    valorPago decimal (10,2),
    localCompra varchar (255),
    album enum ('Sim', 'Não') not null
);

insert into tbCds values
(1, 'Rock Clássico', '2023-01-10', 45.00, 'Submarino', 'Sim'),
(2, 'Pop Hits', '2023-02-15', 30.00, 'Americanas', 'Não'),
(3, 'Sertanejo Universitário', '2023-03-20', 50.00, 'Submarino', 'Sim'),
(4, 'MPB Essencial', '2023-04-25', 25.00, 'Magazine Luiza', 'Não'),
(5, 'Jazz Lounge', '2023-05-30', 60.00, 'Amazon', 'Sim');

create table tbMusicas (
    codigoCD int,
    numeroMusica int,
    nomeMusica varchar (255) not null,
    artista varchar(255),
    tempo time,
    constraint fk_codigocd
    FOREIGN KEY (CodigoCD) 
    REFERENCES tbCds(Codigo)
);

insert into tbMusicas values
(1, 1, 'Bohemian Rhapsody', 'Queen', '00:05:55'),
(1, 2, 'Stairway to Heaven', 'Led Zeppelin', '00:08:02'),
(1, 3, 'Hotel California', 'Eagles', '00:06:30'),
(1, 4, 'Sweet Child O Mine', 'Guns N Roses', '00:05:56'),
(1, 5, 'Smells Like Teen Spirit', 'Nirvana', '00:05:01'),

(2, 1, 'Shape of You', 'Ed Sheeran', '00:03:53'),
(2, 2, 'Uptown Funk', 'Mark Ronson', '00:04:30'),
(2, 3, 'Happy', 'Pharrell Williams', '00:03:53'),

(3, 1, 'Evidências', 'Chitãozinho & Xororó', '00:05:40'),
(3, 2, 'Flor e o Beija-Flor', 'Milionário & José Rico', '00:04:15'),
(3, 3, 'Escreve Aí', 'Os Barões da Pisadinha', '00:02:59'),

(5, 1, 'Take Five', 'Dave Brubeck', '00:05:24'),
(5, 2, 'So What', 'Miles Davis', '00:09:22'),
(5, 3, 'Blue Bossa', 'Kenny Dorham', '00:07:05'),
(5, 4, 'Autumn Leaves', 'Cannonball Adderley', '00:10:55');

select codigo, nomeCd, dataCompra, valorPago, localCompra, album from tbCds;

select nomeCd, dataCompra from tbCds order by nomeCd;

select nomeCd, dataCompra from tbCds order by dataCompra desc;

select nomeCd, dataCompra, valorPago from tbCds order by valorPago desc;

select sum(valorPago) as totalGasto from tbCds;

select codigoCD, numeroMusica, nomeMusica, artista, tempo from tbMusicas where codigoCD = 1;

select nomeMusica, artista from tbMusicas;

select numeroMusica, nomeMusica, tempo from tbMusicas 
where codigoCD = 5 
order by numeroMusica;

select count(nomeMusica) as totalMusicas from tbMusicas;

select nomeMusica from tbMusicas where artista = 'José Pedro';

select nomeCd from tbCds where localCompra = 'Submarino';

select nomeMusica from tbMusicas order by nomeMusica;

select codigo, nomeCd, dataCompra, valorPago, localCompra, album from tbCds where album = 'Sim';

select avg(valorPago) as mediaPrecos from tbCds;