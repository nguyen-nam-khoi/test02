--CÂU 1

create table SinhVien(
MaSV char(5) not null primary key,
Hoten nvarchar(20),
Ngaysinh date)
create table MonHoc(
MaMH char(5) not null primary key,
TenMH nvarchar(20),
SoTC int)
create table Diem(
MaSV char(5) not null constraint fk_MaSV references Sinhvien(MaSV),
MaMH char(5) not null constraint fk_MaMH references MonHoc(MaMH),
DiemThi decimal
)

-----Nhập dữ liệu cho bảng-----

insert SinhVien values
('001', 'nam khoi', '2002-10-5'),
('002', 'Truong Vi', '2002-12-1'),
('003', 'Minh Toan', '2002-7-5')

insert MonHoc values
('MH1', 'LTW', '3'),
('MH2', 'HQTCSDL', '3'),
('MH3', 'LSDCSVN', '2')

insert Diem values
('001', 'MH3', '8'),
('002', 'MH1', '7.5'),
('001', 'MH2', '6'),
('003', 'MH2', '8.5'),
('003', 'MH1', '9')


SELECT *  FROM Diem;
SELECT * FROM MonHoc
SELECT * FROM SinhVien


--CÂU 2
go
create function tkmh (@tmh nvarchar(20))
returns int
as
begin
 declare @dem int
 set @dem = (select count(*)
 from Diem
where @dem<5)
 return @dem
end
go
select dbo.tkmh ('LTW')

-- câu 3
go
create procedure nhap_diem(@MaSV char(5),@MaMon char(5), @DiemThi float)
as
insert into Diem(MaSV,MaMH,Diemthi) values(@MaSV,@MaMon,@DiemThi)
go
nhap_diem '001','MH1',9
go
--CÂU 4
create trigger edit_createe
on Diem
FOR  INSERT, UPDATE
AS
if(select DiemThi From inserted)>10 and (select DiemThi From inserted)<0
begin
print
'khong cho phep'
rollback transaction
end
insert into Diem values ('001','MH3','2')
