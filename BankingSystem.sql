
create database banking_database;

create  table nasabah(
id_nasabah varchar(100) primary key,
nama_nasabah varchar(100) not null,
nik varchar(15) not null,
tempat_lahir varchar(50) not null,
tanggal_lahir date not null,
alamat_nasabah varchar(255) not null,
nomor_telepon varchar(15) not null,
pekerjaan varchar(50)
);

create table akun(
id_akun uuid primary key default gen_random_uuid(),
saldo_akun decimal(15,2),
jenis_akun varchar(15),
tanggal_dibuat date not null,
id_nasabah varchar(100),
foreign key (id_nasabah) references nasabah(id_nasabah)
);

create table akun_login(
id_akun_login bigserial primary key,
email varchar(50) not null,
password varchar(255) not null,
pin int not null,
id_akun uuid unique not null,
foreign key(id_akun) references akun(id_akun)
);

create table transaksi(
id_transaksi uuid primary key default gen_random_uuid(),
jenis_transaksi varchar(50) not null,
jumlah_transaksi decimal(9,2) not null,
tanggal_transaksi date not null,
note_transaksi text,
id_akun uuid,
foreign key (id_akun) references akun(id_akun)
);

select * from nasabah;

insert into nasabah (id_nasabah,nama_nasabah, nik, tempat_lahir, tanggal_lahir, alamat_nasabah, nomor_telepon, pekerjaan)
values
('1977838c-aaff-4216', 'Yanto', '9232145643', 'Surabaya', '13-09-1998', 'Jl. Beranjak no.4 Bekasi, Jawa Barat','086923845964', 'Kasir'),
('ed3fdbcf-e273-4c81-a3a44', 'Egi', '9232323256', 'Solo', '09-08-1975', 'Jl. Merenung no.9 Sumedang, Jawa Barat', '089789343956', 'Guru SMK'),
('8d5ccac9-6a04-499f-8b08', 'Ohoyo', '9743434994', 'Malang', '12-09-1997', 'Jl. Senang no.10 Sumenep, Jawa Timur', '086836729495', 'Akuntansi');

insert into akun(saldo_akun, jenis_akun, tanggal_dibuat, id_nasabah)
values
('1000000', 'Gold', '12-09-2020', '1977838c-aaff-4216'),
('200000', 'Silver', '17-08-2017', '1977838c-aaff-4216'),
('3000000', 'Prioritas', '14-04-2023', 'ed3fdbcf-e273-4c81-a3a44'),
('15000000', 'Prioritas', '10-03-2012', '8d5ccac9-6a04-499f-8b08');

insert into akun_login (email, password, pin, id_akun)
values
('yantoyahu@gmail.com', 'yantoGant3ng9', '123543', 'c5b719d1-2199-48f4-9fc7-22c860348578'),
('yantoahuyyyy@gmail.com', 'Gant3ngy4t+0', '345754', '688c1978-976d-4129-8b42-a9b8a106d269'),
('egimaulaya@gmail.com', 'egi76as', '345765', 'd82e1520-0c0d-4508-80fd-67050849547b'),
('ohoho@gmail.com', 'oh)9=a', '096734', '88115ed2-f889-4960-bcac-2f629d118a34');

insert into transaksi(jenis_transaksi, jumlah_transaksi, tanggal_transaksi, note_transaksi, id_akun)
values
('withdraw', '20000', '24-05-2024', ' ','c5b719d1-2199-48f4-9fc7-22c860348578'),
('deposito', '300000', '23-06-2024', 'nabung','d82e1520-0c0d-4508-80fd-67050849547b'),
('withdraw', '50000', '22-06-2024', 'beli tamiya', '88115ed2-f889-4960-bcac-2f629d118a34');
