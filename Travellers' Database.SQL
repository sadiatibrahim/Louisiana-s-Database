create database travelers;
use travelers;
create table Traveler (
	tID int not null primary key,
    ID_type varchar(45),
    tname varchar(45),
    DOB varchar(45),
    Street_Address varchar(45),
    state_country varchar(45),
    travel_reason varchar(45),
    scheduled_exit_date varchar(45) );
    
create table Plane (
	pID int not null primary key,
    ptype varchar(45),
    isPersonal varchar(45),
    max_capacity int,
    no_of_passengers int );
    
create table Harbor (
	hID int not null primary key,
    hname varchar(45),
    location varchar(45),
    max_capacity int,
    occupancy int );
    
create table Boat (
	bID int not null primary key,
    bname varchar(45),
    htype varchar(45) );
    
create table Airport (
	airport_ID int not null primary key,
    airport_name varchar(45),
    airport_location varchar(45),
    airport_type varchar(45),
    airport_max_capacity int,
    airport_occupancy int );

create table Airline (
	airline_ID int not null primary key,
    airline_name varchar(45) );

insert into Airline(airline_ID, airline_name)
values(34353, 'delta');

create table Traveling_with (
	tID int not null,
    tID2 int, 
    FOREIGN KEY (tID) references Traveler(tID),
    FOREIGN KEY (tID2) references Traveler(tID) );

create table Flies (
	tID int not null,
    pID int not null,
    FOREIGN KEY (tID) references Traveler(tID),
    FOREIGN KEY (pID) references Plane(pID) );

create table Stores (
	pID int not null,
    airport_ID int not null,
    FOREIGN KEY (pID) references Plane(pID),
    FOREIGN KEY (airport_ID) references Airport(airport_ID) );

create table Owns (
	pID int not null,
    airline_ID int not null,
    FOREIGN KEY (pID) references Plane(pID),
    FOREIGN KEY (airline_ID) references Airline(airline_ID) );
    
create table Lands_At (
	tID int not null,
    airport_ID int not null,
    FOREIGN KEY (tID) references Traveler(tID),
    FOREIGN KEY (airport_ID) references Airport(airport_ID) );

create table Sails (
	tID int not null,
    bID int not null,
    FOREIGN KEY (tID) references Traveler(tID),
    FOREIGN KEY (bID) references Boat(bID) );

create table Docked (
	hID int not null,
    bID int not null,
    FOREIGN KEY (hID) references Harbor(hID),
    FOREIGN KEY (bID) references Boat(bID) );
    
create table Docks_At (
	tID int not null,
    hID int not null,
	FOREIGN KEY (hID) references Harbor(hID),
	FOREIGN KEY (tID) references Traveler(tID) );
