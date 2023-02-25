/*
Created: 20.04.2022
Modified: 20.04.2022
Model: Lab6(Variant_18)
Database: MS SQL Server 2019
*/


-- Create tables section -------------------------------------------------

-- Table ������������

CREATE TABLE [������������]
(
 [���_������������] Int NOT NULL,
 [�����] Char(50) NOT NULL,
 [���] Char(50) NOT NULL,
 [������] Char(50) NOT NULL,
 [�������_������] Char(50) NOT NULL,
 [����������_����������_����_�������������] Int NOT NULL
)
go

-- Add keys for table ������������

ALTER TABLE [������������] ADD CONSTRAINT [���_������������] PRIMARY KEY ([���_������������])
go

-- Table �����������

CREATE TABLE [�����������]
(
 [���_�����������] Int NOT NULL,
 [��������_�����������] Char(50) NOT NULL,
 [�����_��������_�����������] Char(50) NOT NULL,
 [��������� ��������] Char(10) NOT NULL,
 [�������] Char(20) NOT NULL,
 [�������] Char(30) NOT NULL,
 [���_������] Date NOT NULL,
 [������] Char(30) NOT NULL,
 [����] Char(30) NOT NULL,
 [��������] Char(30) NOT NULL,
 [������] Char(100) NOT NULL,
 [�����������_��_��������] Char(15) NOT NULL
)
go

-- Add keys for table �����������

ALTER TABLE [�����������] ADD CONSTRAINT [���_�����������] PRIMARY KEY ([���_�����������])
go

-- Table ��������� ������������/E3

CREATE TABLE [��������� ������������/E3]
(
 [���_���������_������������] Int NOT NULL,
 [��������_���������] Char(30) NOT NULL,
 [��������_���������] Char(100) NOT NULL,
 [�������] Char(30) NULL,
 [��������_������_�����_�������] Char(30) NULL
)
go

-- Add keys for table ��������� ������������/E3

ALTER TABLE [��������� ������������/E3] ADD CONSTRAINT [���_���������] PRIMARY KEY ([���_���������_������������])
go

-- Table ������_ ����������

CREATE TABLE [������_ ����������]
(
 [���_������] Int NOT NULL,
 [���_�����������] Int NULL,
 [�������_����������] Char(40) NOT NULL,
 [��������_������] Char(30) NULL
)
go

-- Create indexes for table ������_ ����������

CREATE INDEX [IX_R5] ON [������_ ����������] ([���_�����������])
go

-- Add keys for table ������_ ����������

ALTER TABLE [������_ ����������] ADD CONSTRAINT [�����_������] PRIMARY KEY ([���_������])
go

-- Table ������������_������_ ����������

CREATE TABLE [������������_������_ ����������]
(
 [Attribute1] Int NOT NULL,
 [Attribute2] Int NOT NULL
)
go

-- Table ������������_�����������

CREATE TABLE [������������_�����������]
(
 [Attribute1] Int NOT NULL,
 [���_�����������] Int NOT NULL
)
go

-- Table �����������_��������� ������������/E3

CREATE TABLE [�����������_��������� ������������/E3]
(
 [Attribute1] Int NOT NULL,
 [���_�����������] Int NOT NULL
)
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [������_ ����������] ADD CONSTRAINT [R5] FOREIGN KEY ([���_�����������]) REFERENCES [�����������] ([���_�����������]) ON UPDATE NO ACTION ON DELETE NO ACTION
go
