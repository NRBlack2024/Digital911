use digital911;

CREATE TABLE `Active Look-Up Table` (phone_number varchar(10) NOT NULL, location_dictionary varchar(255) NOT NULL, PRIMARY KEY (phone_number));
CREATE TABLE `Archived Resident Table` (phone_number varchar(10) NOT NULL, date_of_update date NOT NULL, name_first varchar(255), name_last varchar(255), street_num int(4) NOT NULL, street varchar(255) NOT NULL, latitude varchar(255), longitude varchar(255), dispatch_ctr int(10) NOT NULL, disp_fire int(10) NOT NULL, disp_police int(10) NOT NULL, disp_emt int(10) NOT NULL, PRIMARY KEY (phone_number, date_of_update));
CREATE TABLE `Back-up Resident Table` (phone_number varchar(10) NOT NULL, name_first varchar(255), name_last varchar(255), street_num int(4) NOT NULL, street varchar(255) NOT NULL, latitude varchar(255), longitude varchar(255), dispatch_ctr int(10) NOT NULL, disp_fire int(10) NOT NULL, disp_police int(10) NOT NULL, disp_emt int(10) NOT NULL, PRIMARY KEY (phone_number));
CREATE TABLE `Current Resident Table` (phone_number varchar(10) NOT NULL, name_first varchar(255), name_last varchar(255), street_num int(4) NOT NULL, street varchar(255) NOT NULL, latitude varchar(255), longitude varchar(255), dispatch_ctr int(10) NOT NULL, disp_fire int(10) NOT NULL, disp_police int(10) NOT NULL, disp_emt int(10) NOT NULL, PRIMARY KEY (phone_number));
CREATE TABLE `Error Log` (ID int(10) NOT NULL AUTO_INCREMENT, update_type int(10) NOT NULL, time int(10) NOT NULL, PRIMARY KEY (ID));
CREATE TABLE `Update Log` (ID int(10) NOT NULL AUTO_INCREMENT, update_type varchar(255) NOT NULL, time time NOT NULL, PRIMARY KEY (ID));

ALTER TABLE `Archived Resident Table` ADD CONSTRAINT `FK_Archived` FOREIGN KEY (phone_number) REFERENCES `Current Resident Table` (phone_number);
ALTER TABLE `Back-up Resident Table` ADD CONSTRAINT `FK_Back-up` FOREIGN KEY (phone_number) REFERENCES `Current Resident Table` (phone_number);
ALTER TABLE `Current Resident Table` ADD CONSTRAINT `FK_Current` FOREIGN KEY (phone_number) REFERENCES `Active Look-Up Table` (phone_number);

--CREATE TABLE `Jurisdiction Table` (ID int(10) NOT NULL AUTO_INCREMENT, update_dictionary varchar(255), PRIMARY KEY (ID));
