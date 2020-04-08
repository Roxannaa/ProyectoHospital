
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/08/2020 05:56:21
-- Generated from EDMX file: C:\Users\Roxanna\Desktop\2020-C1\Programación III\proyectoHospital\ProyectoHospital\ProyectoHospital\ProyectoHospital\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SistemaHospital];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CitasPacientes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Citas] DROP CONSTRAINT [FK_CitasPacientes];
GO
IF OBJECT_ID(N'[dbo].[FK_CitasMedicos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Citas] DROP CONSTRAINT [FK_CitasMedicos];
GO
IF OBJECT_ID(N'[dbo].[FK_IngresosPacientes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ingresos] DROP CONSTRAINT [FK_IngresosPacientes];
GO
IF OBJECT_ID(N'[dbo].[FK_IngresosHabitaciones]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ingresos] DROP CONSTRAINT [FK_IngresosHabitaciones];
GO
IF OBJECT_ID(N'[dbo].[FK_AltasIngresos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Altas] DROP CONSTRAINT [FK_AltasIngresos];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Pacientes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pacientes];
GO
IF OBJECT_ID(N'[dbo].[Medicos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Medicos];
GO
IF OBJECT_ID(N'[dbo].[Habitaciones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Habitaciones];
GO
IF OBJECT_ID(N'[dbo].[Citas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Citas];
GO
IF OBJECT_ID(N'[dbo].[Ingresos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ingresos];
GO
IF OBJECT_ID(N'[dbo].[Altas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Altas];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Pacientes'
CREATE TABLE [dbo].[Pacientes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cedula] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Asegurado] bit  NOT NULL
);
GO

-- Creating table 'Medicos'
CREATE TABLE [dbo].[Medicos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Exequatur] nvarchar(max)  NOT NULL,
    [Especialidad] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Habitaciones'
CREATE TABLE [dbo].[Habitaciones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Numero] int  NOT NULL,
    [Tipo] nvarchar(max)  NOT NULL,
    [Precio] int  NOT NULL
);
GO

-- Creating table 'Citas'
CREATE TABLE [dbo].[Citas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Hora] time  NOT NULL,
    [PacientesId] int  NOT NULL,
    [Medico_Id] int  NOT NULL
);
GO

-- Creating table 'Ingresos'
CREATE TABLE [dbo].[Ingresos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FechaInicio] datetime  NOT NULL,
    [PacientesId] int  NOT NULL,
    [HabitacionesId] int  NOT NULL
);
GO

-- Creating table 'Altas'
CREATE TABLE [dbo].[Altas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FechaSalida] datetime  NOT NULL,
    [MontoPagar] int  NOT NULL,
    [Ingreso_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Pacientes'
ALTER TABLE [dbo].[Pacientes]
ADD CONSTRAINT [PK_Pacientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Medicos'
ALTER TABLE [dbo].[Medicos]
ADD CONSTRAINT [PK_Medicos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Habitaciones'
ALTER TABLE [dbo].[Habitaciones]
ADD CONSTRAINT [PK_Habitaciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Citas'
ALTER TABLE [dbo].[Citas]
ADD CONSTRAINT [PK_Citas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ingresos'
ALTER TABLE [dbo].[Ingresos]
ADD CONSTRAINT [PK_Ingresos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Altas'
ALTER TABLE [dbo].[Altas]
ADD CONSTRAINT [PK_Altas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PacientesId] in table 'Citas'
ALTER TABLE [dbo].[Citas]
ADD CONSTRAINT [FK_CitasPacientes]
    FOREIGN KEY ([PacientesId])
    REFERENCES [dbo].[Pacientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CitasPacientes'
CREATE INDEX [IX_FK_CitasPacientes]
ON [dbo].[Citas]
    ([PacientesId]);
GO

-- Creating foreign key on [Medico_Id] in table 'Citas'
ALTER TABLE [dbo].[Citas]
ADD CONSTRAINT [FK_CitasMedicos]
    FOREIGN KEY ([Medico_Id])
    REFERENCES [dbo].[Medicos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CitasMedicos'
CREATE INDEX [IX_FK_CitasMedicos]
ON [dbo].[Citas]
    ([Medico_Id]);
GO

-- Creating foreign key on [PacientesId] in table 'Ingresos'
ALTER TABLE [dbo].[Ingresos]
ADD CONSTRAINT [FK_IngresosPacientes]
    FOREIGN KEY ([PacientesId])
    REFERENCES [dbo].[Pacientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_IngresosPacientes'
CREATE INDEX [IX_FK_IngresosPacientes]
ON [dbo].[Ingresos]
    ([PacientesId]);
GO

-- Creating foreign key on [HabitacionesId] in table 'Ingresos'
ALTER TABLE [dbo].[Ingresos]
ADD CONSTRAINT [FK_IngresosHabitaciones]
    FOREIGN KEY ([HabitacionesId])
    REFERENCES [dbo].[Habitaciones]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_IngresosHabitaciones'
CREATE INDEX [IX_FK_IngresosHabitaciones]
ON [dbo].[Ingresos]
    ([HabitacionesId]);
GO

-- Creating foreign key on [Ingreso_Id] in table 'Altas'
ALTER TABLE [dbo].[Altas]
ADD CONSTRAINT [FK_AltasIngresos]
    FOREIGN KEY ([Ingreso_Id])
    REFERENCES [dbo].[Ingresos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AltasIngresos'
CREATE INDEX [IX_FK_AltasIngresos]
ON [dbo].[Altas]
    ([Ingreso_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------