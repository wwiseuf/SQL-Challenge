-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/sOuoJd
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [departments] (
    [dept_no] varchar  NOT NULL ,
    [dept_name] varchar  NOT NULL ,
    CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [dept_emp] (
    [emp_no] int  NOT NULL ,
    [dept_no] varchar  NOT NULL 
)

CREATE TABLE [dept_manager] (
    [dept_no] varchar  NOT NULL ,
    [emp_no] int  NOT NULL 
)

CREATE TABLE [employees] (
    [emp_no] int  NOT NULL ,
    [emp_title] varchar  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] varchar  NOT NULL ,
    [last_name] varchar  NOT NULL ,
    [sex] varchar  NOT NULL ,
    [hire_date] date  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC,[emp_title] ASC
    )
)

CREATE TABLE [salaries] (
    [emp_no] int  NOT NULL ,
    [salary] int  NOT NULL 
)

CREATE TABLE [titles] (
    [title_id] varchar  NOT NULL ,
    [title] varchar  NOT NULL 
)

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_emp_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_emp_no]

ALTER TABLE [salaries] WITH CHECK ADD CONSTRAINT [FK_salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [salaries] CHECK CONSTRAINT [FK_salaries_emp_no]

ALTER TABLE [titles] WITH CHECK ADD CONSTRAINT [FK_titles_title_id] FOREIGN KEY([title_id])
REFERENCES [employees] ([emp_title])

ALTER TABLE [titles] CHECK CONSTRAINT [FK_titles_title_id]

COMMIT TRANSACTION QUICKDBD