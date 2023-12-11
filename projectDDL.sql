 create table Trainer
    (
        trainer_id SERIAL,
        first_name VARCHAR(255) NOT NULL,
        last_name VARCHAR(255) NOT NULL, 
        email VARCHAR(255) UNIQUE NOT NULL,
        phone_number VARCHAR(15),
        certification VARCHAR(255) NOT NULL,
        PRIMARY KEY (trainer_id)
    );

create table Member
(
    member_id SERIAL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL, 
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    join_date DATE DEFAULT CURRENT_DATE,
    loyalty_points INT DEFAULT 0,
    trainer_id INT,
    PRIMARY KEY (member_id),
    FOREIGN KEY (trainer_id) REFERENCES Trainer
);

create table Schedule
(
    member_id INT,
    trainer_id INT,
    schedule_date DATE DEFAULT CURRENT_DATE,
    schedule_time TIME,
    schedule_status VARCHAR(20) DEFAULT 'Scheduled',
    notes VARCHAR(255),
    PRIMARY KEY (member_id),
    FOREIGN KEY (member_id) REFERENCES Member,
    FOREIGN KEY (trainer_id) REFERENCES Trainer
);


create table Admin
(
    admin_id SERIAL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15),
    admin_role VARCHAR(25),
    PRIMARY KEY (admin_id)
);

create table Payment
(
    payment_id SERIAL,
    member_id INT,
    admin_id INT,
    payment_date DATE DEFAULT CURRENT_DATE,
    points INT,
    amount FLOAT,
    service_attained VARCHAR(255),
    PRIMARY KEY (payment_id),
    FOREIGN KEY (member_id) REFERENCES Member,
    FOREIGN KEY (admin_id) REFERENCES Admin
);


create table Equipment
(
    equipment_id SERIAL,
    equipment_name VARCHAR(255),
    admin_id INT,
    needs_maintenance BOOLEAN DEFAULT False,
    PRIMARY KEY (equipment_id),
    FOREIGN KEY (admin_id) REFERENCES Admin
);

create table Room
(
    room_id SERIAL,
    room_name VARCHAR(255),
    is_available BOOLEAN DEFAULT True,
    admin_id INT,
    PRIMARY KEY (room_id),
    FOREIGN KEY (admin_id) REFERENCES Admin
);

create table Event
(
    event_id SERIAL,
    event_type VARCHAR(255),
    event_date DATE DEFAULT CURRENT_DATE,
    event_time TIME,
    capacity INT,
    PRIMARY KEY (event_id)
);

create table Class
(
    class_id SERIAL,
    class_type VARCHAR(255),
    class_date DATE DEFAULT CURRENT_DATE,
    class_time TIME,
    capacity INT,
    PRIMARY KEY (class_id)
);

create table Register
(
    event_id INT,
    member_id INT,
    PRIMARY KEY (event_id, member_id),
    FOREIGN KEY (event_id) REFERENCES Event,
    FOREIGN KEY (member_id) REFERENCES Member
);


create table Billing
(
    bill_id SERIAL,
    bill_description VARCHAR(255),
    bill_amount FLOAT,
    bill_date DATE DEFAULT CURRENT_DATE,
    admin_id INT,
    PRIMARY KEY (bill_id),
    FOREIGN KEY (admin_id) REFERENCES Admin
);

create table Fitness_achievements
(
    member_id INT,
    fitness_achievements VARCHAR(255),
    PRIMARY KEY (member_id),
    FOREIGN KEY (member_id) REFERENCES Member
);

create table Fitness_goals
(
    member_id INT,
    fitness_goals VARCHAR(255),
    PRIMARY KEY (member_id),
    FOREIGN KEY (member_id) REFERENCES Member
);


create table Exercise_routines
(
    member_id INT,
    exercise_routines VARCHAR(255),
    PRIMARY KEY (member_id),
    FOREIGN KEY (member_id) REFERENCES Member
);

create table Health_metrics
(
    member_id INT,
    health_metrics VARCHAR(255),
    PRIMARY KEY (member_id),
    FOREIGN KEY (member_id) REFERENCES Member
);

create table Health_statistics
(
    member_id INT,
    health_statistics VARCHAR(255),
    PRIMARY KEY (member_id),
    FOREIGN KEY (member_id) REFERENCES Member
);