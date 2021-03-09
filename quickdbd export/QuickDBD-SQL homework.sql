-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/sOuoJd
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE "departments" (
    "dept_no" varchar(30)  NOT NULL ,
    "dept_name" varchar(30)  NOT NULL ,
    CONSTRAINT "PK_departments" PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
);

CREATE TABLE [dept_emp] (
    [emp_no] int  NOT NULL ,
    [dept_no] varchar(30)  NOT NULL ,
    CONSTRAINT [PK_dept_emp] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
);

CREATE TABLE [dept_managers] (
    [dept_no] varchar(30)  NOT NULL ,
    [emp_no] int  NOT NULL 
);

CREATE TABLE [employees] (
    [emp_no] int  NOT NULL ,
    [emp_title] varchar(30)  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] varchar(30)  NOT NULL ,
    [last_name] varchar(30)  NOT NULL ,
    [sex] varchar(30)  NOT NULL ,
    [hire_date] date  NOT NULL 
);

CREATE TABLE [salaries] (
    [emp_no] int  NOT NULL ,
    [salary] int  NOT NULL 
);

CREATE TABLE [titles] (
    [title_id] varchar(30)  NOT NULL ,
    [title] varchar(30)  NOT NULL ,
    CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    );
);

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_dept_no]

ALTER TABLE [dept_managers] WITH CHECK ADD CONSTRAINT [FK_dept_managers_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_managers] CHECK CONSTRAINT [FK_dept_managers_dept_no]

ALTER TABLE [dept_managers] WITH CHECK ADD CONSTRAINT [FK_dept_managers_emp_no] FOREIGN KEY([emp_no])
REFERENCES [dept_emp] ([dept_no])

ALTER TABLE [dept_managers] CHECK CONSTRAINT [FK_dept_managers_emp_no]

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees_emp_no] FOREIGN KEY([emp_no])
REFERENCES [dept_emp] ([emp_no])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees_emp_no]

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees_emp_title] FOREIGN KEY([emp_title])
REFERENCES [titles] ([title_id])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees_emp_title]


COMMIT TRANSACTION QUICKDBD