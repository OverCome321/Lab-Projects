use rental_property

insert into Owner (owner_code,surname,name,middle_name,passport_date,adress)
values 
	(1,'�������','������','���������', '1678-223456', '����� ��������� ��� 4 �� 220'),
	(2,'������','������','����������', '3266-687459', '����� ��������� ����� �� ��� 4 �� 210'),
	(3,'���������','������','���������', '7955-190876', '����� ��������� ��� 4 �� 220')

insert into Real_estate
values 
	(1,'����� ���������','������ 7 ���� ��� 2', 256, 150, 98000,1),
	(2,'������� ���������','������ �������� ����� �� ��� 4', 170, 80, 98000,1),
	(3,'������� ���������','������ ������ ����� ���������� ��� 3', 120, 60, 50000,2),
	(4,'����� ���������','������ 7 ��� ��� 1', 300, 220, 120000,3),
	(5,'����� ���������','������ 7 ��� ��� 10', 325, 280, 180000,3),
	(6,'������� ���������','������ 7 ��� ��� 10', 325, 280, 180000,3),
	(7,'����� ���������','������ 7 ��� ��� 10', 325, 280, 180000,3)




	-- �������������� 
	go
	Create view Counter_of_rent_amount as
	select * from dbo.Real_estate
		where rent_amount/living_space <= 1000
	with check option


	insert into Counter_of_rent_amount 
	values (8,'����� ���������','������ �������� ����� �� ��� 4',400,300,280000,2)


	select * from Counter_of_rent_amount

	
	
	
	go 

	insert into  Tenants (tenant_code,surname,name,middle_name,passport_date)
	values 
		(1,'������','�������','����������', '2354-908765'),
		(2,'��������', '����', '�����', '6789-556432'),
		(3,'������', '������', '������������', '9087-776213'),
		(4,'��������', '������', '������������', '9087-776213'),
		(5,'����', '����', '������������', '9087-776213'),
		(6,'������', '����������', '������������', '9087-776213'),
		(7,'������', '��������', '������������', '9087-776213')



	insert into Individuals (tenant_code,place_of_work, job_title)
	values 
		(1,'���:"�������"', '��������'),
		(2,'���:"��������"', '��������'),
		(3,'���:"���������"', '�����������'),
		(4,'���:"���������"', '����')

	insert into Legal_entities (tenant_code,name_of_organization,organization_adress,bank_details) 
	values 
		(5,'���:"�������"', '����� ������������ �������� 3 ��� 7', 'ES19 3894 0183'),
		(6,'���:"��������"', '����� ������������ �������� 4 ��� 8', 'WE20 9876 9073'),
		(7,'���:"���������"', '����� ������������ �������� 1 ��� 9', 'QE83 2178 9090')

	select * from lease_agreements
	insert into lease_agreements
	values 
	(1, '27.10.2008', '18.12.2012',1, 1),
	(2, '09.02.2022', '23.12.2022',2, 2),
	(3, '01.01.2021', '28.11.2022',3, 3),
	(4, '09.02.2022', '23.12.2022',4, 4),
	(5, '09.02.2022', '23.12.2022',5, 5),
	(6, '01.01.2021', '28.11.2022',6, 6),
	(7, '09.02.2022', '23.12.2022',7, 7),
	(8, '27.10.2022', '18.12.2012',1, 1),
	(9, '09.02.2022', '23.12.2022',2, 2),
	(10, '01.03.2022', '28.11.2022',3, 3),
	(11, '09.02.2022', '23.12.2022',4, 4),
	(12, '09.03.2022', '23.12.2022',5, 5),
	(13, '01.02.2022', '28.11.2022',6, 6),
	(14, '09.10.2022', '23.12.2022',7, 7)

	-- ����������������
go
alter view Counter_of_rent_places as
Select 
z1.����,z1.�����,z1.���,count(z1.�����) as ���������� 
from (
Select r.type_of_object as ���,month([rental_start_date]) as �����, case 
when
(t.tenant_code in (Select [tenant_code] from [dbo].[Legal_entities] ))
then '�����������'
when 
(t.tenant_code in (Select [tenant_code] from [dbo].[Individuals] ))
then '���������'
end as ����, l.contract_number as �����
from [dbo].[lease_agreements] l inner join [dbo].[Tenants] t on l.tenant_code=t.tenant_code
inner join
[dbo].[Real_estate] r on l.number_of_object = r.number_of_object
where YEAR(l.rental_start_date) = YEAR(GETDATE())
) as z1
group by
z1.����,z1.�����,z1.���


select * from Counter_of_rent_places








GO
CREATE OR ALTER TRIGGER TR_Counter_of_rent_places ON Counter_of_rent_places 
INSTEAD OF INSERT 
AS
BEGIN 
	SET NOCOUNT ON;
	INSERT INTO Counter_of_rent_places(���)
	SELECT CASE WHEN ��� = '���������� ����'   THEN '���������� ����' 
					WHEN ��� = '����������� ����' THEN '����������� ����'
	END
	FROM Counter_of_rent_places
END
GO