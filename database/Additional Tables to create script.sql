USE [HRMIS]
GO
ALTER TABLE [dbo].[Holiday] DROP CONSTRAINT [FK_dbo.PublicHoliday_Country]
GO
ALTER TABLE [dbo].[Location] DROP CONSTRAINT [DF_Location_Latitude]
GO
ALTER TABLE [dbo].[Location] DROP CONSTRAINT [DF_Location_Longitude]
GO
ALTER TABLE [dbo].[Holiday] DROP CONSTRAINT [DF_PublicHoliday_HolidayDate]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 24/Dec/2019 1:52:18 PM ******/
DROP TABLE [dbo].[Location]
GO
/****** Object:  Table [dbo].[Holiday]    Script Date: 24/Dec/2019 1:52:18 PM ******/
DROP TABLE [dbo].[Holiday]
GO
/****** Object:  Table [dbo].[ApprovalStatus]    Script Date: 24/Dec/2019 1:52:18 PM ******/
DROP TABLE [dbo].[ApprovalStatus]
GO
/****** Object:  Table [dbo].[ApprovalStatus]    Script Date: 24/Dec/2019 1:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApprovalStatus](
	[ID] [int] IDENTITY(0,1) NOT NULL,
	[StatusName] [nvarchar](50) NULL,
	[StatusRank] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Holiday]    Script Date: 24/Dec/2019 1:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holiday](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HolidayName] [nvarchar](50) NULL,
	[HolidayDate] [datetime] NOT NULL,
	[IsAnnual] [bit] NULL,
	[CountryID] [int] NULL,
	[IsHalfDayHoliday] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 24/Dec/2019 1:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](50) NULL,
	[LocationCode] [nvarchar](10) NULL,
	[LocationDescription] [nvarchar](50) NULL,
	[Longitude] [decimal](21, 16) NULL,
	[Latitude] [decimal](21, 16) NULL,
	[IsDefaultLocation] [bit] NULL,
	[IsActive] [bit] NULL,
	[CountryID] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ApprovalStatus] ON 

INSERT [dbo].[ApprovalStatus] ([ID], [StatusName], [StatusRank]) VALUES (0, N'Rejected', 0)
INSERT [dbo].[ApprovalStatus] ([ID], [StatusName], [StatusRank]) VALUES (1, N'Application', 1)
INSERT [dbo].[ApprovalStatus] ([ID], [StatusName], [StatusRank]) VALUES (2, N'Under Approval', 2)
INSERT [dbo].[ApprovalStatus] ([ID], [StatusName], [StatusRank]) VALUES (3, N'Pushed Back for Review', 3)
INSERT [dbo].[ApprovalStatus] ([ID], [StatusName], [StatusRank]) VALUES (4, N'Approved', 4)
SET IDENTITY_INSERT [dbo].[ApprovalStatus] OFF
SET IDENTITY_INSERT [dbo].[Holiday] ON 

INSERT [dbo].[Holiday] ([ID], [HolidayName], [HolidayDate], [IsAnnual], [CountryID], [IsHalfDayHoliday]) VALUES (1, N'New year', CAST(N'2018-01-01T00:00:00.000' AS DateTime), 1, 2, NULL)
INSERT [dbo].[Holiday] ([ID], [HolidayName], [HolidayDate], [IsAnnual], [CountryID], [IsHalfDayHoliday]) VALUES (3, N'Labour Day', CAST(N'2019-05-01T00:00:00.000' AS DateTime), 1, 1, NULL)
INSERT [dbo].[Holiday] ([ID], [HolidayName], [HolidayDate], [IsAnnual], [CountryID], [IsHalfDayHoliday]) VALUES (4, N'Christmas Day', CAST(N'2019-12-25T00:00:00.000' AS DateTime), 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[Holiday] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([ID], [LocationName], [LocationCode], [LocationDescription], [Longitude], [Latitude], [IsDefaultLocation], [IsActive], [CountryID]) VALUES (1, N'Mackinnon Rd', NULL, N'National office.', NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Location] OFF
ALTER TABLE [dbo].[Holiday] ADD  CONSTRAINT [DF_PublicHoliday_HolidayDate]  DEFAULT (getdate()) FOR [HolidayDate]
GO
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_Longitude]  DEFAULT ((0)) FOR [Longitude]
GO
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_Latitude]  DEFAULT ((0)) FOR [Latitude]
GO

/****** Object:  Table [dbo].[PayrollPeriod]    Script Date: 24/Dec/2019 1:54:10 PM ******/
DROP TABLE [dbo].[PayPeriod]
GO

/****** Object:  Table [dbo].[AbsenceCategory]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbsenceCategory](
	[ID] [int] NULL,
	[AbsenceCategory] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApprovalMethod]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApprovalMethod](
	[ID] [int] NULL,
	[ApprovalBy] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DrCr]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrCr](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DrCrName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InterestMethod]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterestMethod](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InterestMethodName] [nvarchar](50) NOT NULL,
	[InterestMethodCode] [nvarchar](10) NOT NULL,
	[Explanation] [nvarchar](1500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobScenario]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobScenario](
	[ID] [int] NOT NULL,
	[ScenarioName] [nvarchar](50) NOT NULL,
	[ScenarioDescription] [nvarchar](250) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobScenarioDetail]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobScenarioDetail](
	[ID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[ScenarioID] [int] NOT NULL,
	[Establishment] [decimal](21, 4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeaveBalance]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveBalance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[LeaveCalendarID] [int] NULL,
	[LeaveTypeID] [int] NOT NULL,
	[BroughtForward] [decimal](18, 4) NULL,
	[EntitledDays] [decimal](9, 2) NULL,
	[AccruedInYear] [decimal](9, 2) NULL,
	[TakenInYear] [decimal](9, 2) NULL,
	[ClosingBalance] [decimal](9, 2) NULL,
	[ForfeitedDays] [decimal](9, 2) NULL,
	[CarriedForward] [decimal](9, 2) NULL,
	[Remark] [nvarchar](1000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeaveCalendar]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveCalendar](
	[ID] [int] NULL,
	[CalendarYear] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[Enddate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeaveCountMethod]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveCountMethod](
	[ID] [int] NULL,
	[LeaveCountMethod] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeaveTimeOfDay]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveTimeOfDay](
	[ID] [int] NULL,
	[TimeofDay] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeaveTransaction]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveTransaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[LeaveTypeID] [int] NOT NULL,
	[LeaveDaysTaken] [numeric](8, 2) NULL,
	[LeaveDescription] [nvarchar](2000) NULL,
	[Startdate] [datetime] NOT NULL,
	[Enddate] [datetime] NOT NULL,
	[ApprovalStatusID] [int] NULL,
	[SupportingDocument] [varbinary](max) NULL,
	[ActingPersonID] [int] NULL,
	[ApplicationDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeaveTransactionDetail]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveTransactionDetail](
	[ID] [int] NULL,
	[LeaveTransactionID] [int] NULL,
	[LeaveDate] [datetime] NULL,
	[HalfDay] [bit] NULL,
	[LeaveTimeOfDayID] [int] NULL,
	[AbsenceCategoryID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeaveType]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LeaveName] [nvarchar](50) NULL,
	[LeaveCode] [nvarchar](50) NULL,
	[LeaveDescription] [nvarchar](255) NULL,
	[LeaveDuration] [int] NULL,
	[LeaveCountMethodID] [int] NULL,
	[EntitledPerRequest] [bit] NULL,
	[CountryID] [int] NULL,
	[GenderID] [int] NULL,
	[IsAccrued] [bit] NULL,
	[CanCarryForward] [bit] NULL,
	[MaxPercentForwadable] [decimal](9, 2) NULL,
	[MaxDaysForwadable] [decimal](9, 2) NULL,
	[RequireSupportingDocs] [bit] NULL,
	[ConsumeOtherLeaveType] [bit] NULL,
	[OtherLeaveTypeID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoanSchedule]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanSchedule](
	[ID] [int] NULL,
	[LoanTransactionID] [int] NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[OpeningBalance] [numeric](18, 4) NULL,
	[PrincipleAmount] [numeric](18, 4) NULL,
	[InterestAmount] [numeric](18, 4) NULL,
	[RecoveryAmount] [numeric](18, 4) NULL,
	[ClosingBalance] [numeric](18, 4) NULL,
	[PaymentStatus] [bit] NULL,
	[SkipRepayment] [bit] NULL,
	[RecoveryOnPayroll] [bit] NULL,
	[Remark] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoanTransaction]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanTransaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LoanTypeID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Amount] [decimal](18, 4) NULL,
	[CurrencyID] [int] NULL,
	[RepaymentPeriods] [int] NOT NULL,
	[GracePeriod] [int] NULL,
	[InterestMethodID] [int] NULL,
	[InterestRate] [decimal](18, 4) NULL,
	[StartDate] [datetime] NOT NULL,
	[StopDate] [datetime] NOT NULL,
	[ApprovalStatusID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoanType]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AdvanceName] [nvarchar](50) NOT NULL,
	[AdvanceCode] [nvarchar](10) NOT NULL,
	[MinimumAmount] [decimal](18, 4) NULL,
	[MaximumAmount] [decimal](18, 4) NULL,
	[CurrencyID] [int] NULL,
	[MaxGracePeriod] [int] NULL,
	[PayrollCodeID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayrollCode]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayrollCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nvarchar](10) NOT NULL,
	[NameOnPayslip] [nvarchar](50) NULL,
	[PayrollCodeCategoryID] [int] NULL,
	[PayslipRank] [int] NULL,
	[IsActive] [bit] NULL,
	[PayslipTextOperationID] [int] NULL,
	[SuspenseAcctNo] [nvarchar](20) NULL,
	[BudgetAcctNo] [nvarchar](50) NULL,
	[DrCrID] [int] NULL,
	[RoundToDigits] [int] NOT NULL,
	[MandatoryItem] [bit] NULL,
	[AmountBasisID] [int] NOT NULL,
	[ApplicationPeriodID] [int] NULL,
	[TrackBalanceChanges] [bit] NOT NULL,
	[BalanceEffectID] [int] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[Formula] [nvarchar](1500) NULL,
	[DisplayonPayslip] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayrollCodeCategory]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayrollCodeCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayrollCodeGroup]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayrollCodeGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PayrollCodeID] [int] NOT NULL,
	[PayrollGroupID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayrollFunction]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayrollFunction](
	[ID] [int] NULL,
	[PayrollFunctionName] [nvarchar](50) NULL,
	[PayrollFunctionDescription] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayrollReferenceTable]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayrollReferenceTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PayrollCodeID] [int] NOT NULL,
	[TaxBand] [int] NOT NULL,
	[ValueFrom] [decimal](18, 4) NOT NULL,
	[ValueTo] [decimal](18, 4) NOT NULL,
	[TaxValue] [decimal](18, 4) NOT NULL,
	[TaxationTypeID] [int] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayrollTransaction]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayrollTransaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PayrollCodeID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Amount] [decimal](21, 4) NOT NULL,
	[Balance] [decimal](21, 4) NOT NULL,
	[IsTurnedOff] [bit] NULL,
	[Remarks] [nvarchar](100) NULL,
	[PayrollPeriodID] [nvarchar](128) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayslipTextOperation]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayslipTextOperation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PayslipTextOperationName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaxationType]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxationType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionApproval]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionApproval](
	[ID] [int] NULL,
	[TransactionTypeID] [int] NULL,
	[TransactionID] [int] NULL,
	[TransactionApproverTypeID] [int] NULL,
	[ApproverID] [int] NULL,
	[AltApproverTypeID] [int] NULL,
	[AltApproverID] [int] NULL,
	[EscalatePeriod] [int] NULL,
	[TimeDurationID] [int] NULL,
	[EscalateApproverTypeID] [int] NULL,
	[EscalateApproverID] [int] NULL,
	[ApprovalStepRank] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionApproverType]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionApproverType](
	[ID] [int] NULL,
	[ApproverType] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 24/Dec/2019 2:07:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[id] [int] NOT NULL,
	[TransactionDescr] [nvarchar](100) NULL,
	[NoApprovalSteps] [int] NULL
) ON [PRIMARY]

GO
INSERT [dbo].[AbsenceCategory] ([ID], [AbsenceCategory]) VALUES (1, N'Leave Day')
INSERT [dbo].[AbsenceCategory] ([ID], [AbsenceCategory]) VALUES (2, N'Holiday')
INSERT [dbo].[AbsenceCategory] ([ID], [AbsenceCategory]) VALUES (3, N'Weekend')
INSERT [dbo].[AbsenceCategory] ([ID], [AbsenceCategory]) VALUES (4, N'Official Travel')
INSERT [dbo].[AbsenceCategory] ([ID], [AbsenceCategory]) VALUES (5, N'Official Training')
INSERT [dbo].[ApprovalMethod] ([ID], [ApprovalBy]) VALUES (1, N'By Position')
INSERT [dbo].[ApprovalMethod] ([ID], [ApprovalBy]) VALUES (2, N'By Employee')
INSERT [dbo].[ApprovalMethod] ([ID], [ApprovalBy]) VALUES (3, N'By Hierarchy Head')
SET IDENTITY_INSERT [dbo].[DrCr] ON 

INSERT [dbo].[DrCr] ([ID], [DrCrName]) VALUES (1, N'None')
INSERT [dbo].[DrCr] ([ID], [DrCrName]) VALUES (2, N'Debit')
INSERT [dbo].[DrCr] ([ID], [DrCrName]) VALUES (3, N'Credit')
SET IDENTITY_INSERT [dbo].[DrCr] OFF
SET IDENTITY_INSERT [dbo].[InterestMethod] ON 

INSERT [dbo].[InterestMethod] ([ID], [InterestMethodName], [InterestMethodCode], [Explanation]) VALUES (2, N'Flat Rate (Simple Interest)', N'FRInt', N'The interest to be applied to the loan is calculated at loan advancement stage then apportioned evenly to each repayment. The overall interest charged/paid is highest.')
INSERT [dbo].[InterestMethod] ([ID], [InterestMethodName], [InterestMethodCode], [Explanation]) VALUES (3, N'Reducing Balance', N'RBal', N'Interest is calculated on the remaining principal bal therefore the interest amount reduces each payment. Intalment amounts are equal.')
INSERT [dbo].[InterestMethod] ([ID], [InterestMethodName], [InterestMethodCode], [Explanation]) VALUES (4, N'Equal Principal Reducing Balance', N'EPRBal', N'The principal Amount per each instalment is equal and the interest is caculated on the principal balance. The amount per instalment is different.')
SET IDENTITY_INSERT [dbo].[InterestMethod] OFF
INSERT [dbo].[LeaveCalendar] ([ID], [CalendarYear], [StartDate], [Enddate]) VALUES (1, N'2019', CAST(N'2019-01-01T00:00:00.000' AS DateTime), CAST(N'2019-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[LeaveCalendar] ([ID], [CalendarYear], [StartDate], [Enddate]) VALUES (2, N'2020', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[LeaveCalendar] ([ID], [CalendarYear], [StartDate], [Enddate]) VALUES (3, N'2021', CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[LeaveCountMethod] ([ID], [LeaveCountMethod]) VALUES (1, N'Working Days')
INSERT [dbo].[LeaveCountMethod] ([ID], [LeaveCountMethod]) VALUES (2, N'Calendar Days')
INSERT [dbo].[LeaveCountMethod] ([ID], [LeaveCountMethod]) VALUES (3, N'Week Days')
INSERT [dbo].[LeaveTimeOfDay] ([ID], [TimeofDay]) VALUES (1, N'Morning')
INSERT [dbo].[LeaveTimeOfDay] ([ID], [TimeofDay]) VALUES (2, N'Afternoon')
SET IDENTITY_INSERT [dbo].[LeaveType] ON 

INSERT [dbo].[LeaveType] ([ID], [LeaveName], [LeaveCode], [LeaveDescription], [LeaveDuration], [LeaveCountMethodID], [EntitledPerRequest], [CountryID], [GenderID], [IsAccrued], [CanCarryForward], [MaxPercentForwadable], [MaxDaysForwadable], [RequireSupportingDocs], [ConsumeOtherLeaveType], [OtherLeaveTypeID]) VALUES (1, N'Annual', N'001', NULL, 30, 1, NULL, 1, NULL, 1, 1, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[LeaveType] OFF
SET IDENTITY_INSERT [dbo].[LoanTransaction] ON 

INSERT [dbo].[LoanTransaction] ([ID], [LoanTypeID], [EmployeeID], [Amount], [CurrencyID], [RepaymentPeriods], [GracePeriod], [InterestMethodID], [InterestRate], [StartDate], [StopDate], [ApprovalStatusID]) VALUES (1, 3, 3, CAST(50000.0000 AS Decimal(18, 4)), 50000, 10, 1, NULL, NULL, CAST(N'2018-07-01T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[LoanTransaction] ([ID], [LoanTypeID], [EmployeeID], [Amount], [CurrencyID], [RepaymentPeriods], [GracePeriod], [InterestMethodID], [InterestRate], [StartDate], [StopDate], [ApprovalStatusID]) VALUES (2, 3, 1, CAST(20000.0000 AS Decimal(18, 4)), 20000, 12, 1, NULL, NULL, CAST(N'2018-12-30T00:00:00.000' AS DateTime), CAST(N'2018-12-30T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[LoanTransaction] ([ID], [LoanTypeID], [EmployeeID], [Amount], [CurrencyID], [RepaymentPeriods], [GracePeriod], [InterestMethodID], [InterestRate], [StartDate], [StopDate], [ApprovalStatusID]) VALUES (3, 2, 1, CAST(20000.0000 AS Decimal(18, 4)), 20000, 12, 1, NULL, NULL, CAST(N'2018-12-30T00:00:00.000' AS DateTime), CAST(N'2018-12-30T00:00:00.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[LoanTransaction] OFF
SET IDENTITY_INSERT [dbo].[LoanType] ON 

INSERT [dbo].[LoanType] ([ID], [AdvanceName], [AdvanceCode], [MinimumAmount], [MaximumAmount], [CurrencyID], [MaxGracePeriod], [PayrollCodeID]) VALUES (1, N'Asset Disposal Loan', N'ADL', CAST(0.0000 AS Decimal(18, 4)), CAST(30000000.0000 AS Decimal(18, 4)), NULL, NULL, NULL)
INSERT [dbo].[LoanType] ([ID], [AdvanceName], [AdvanceCode], [MinimumAmount], [MaximumAmount], [CurrencyID], [MaxGracePeriod], [PayrollCodeID]) VALUES (2, N'Employee Car Loan', N'ECL', NULL, CAST(12000000.0000 AS Decimal(18, 4)), NULL, NULL, NULL)
INSERT [dbo].[LoanType] ([ID], [AdvanceName], [AdvanceCode], [MinimumAmount], [MaximumAmount], [CurrencyID], [MaxGracePeriod], [PayrollCodeID]) VALUES (3, N'Employee Relocation Loan', N'ERLM', CAST(50000.0000 AS Decimal(18, 4)), CAST(500000.0000 AS Decimal(18, 4)), 1, 3, NULL)
INSERT [dbo].[LoanType] ([ID], [AdvanceName], [AdvanceCode], [MinimumAmount], [MaximumAmount], [CurrencyID], [MaxGracePeriod], [PayrollCodeID]) VALUES (4, N'Rent Assistance Advance', N'ERAA', NULL, CAST(500000.0000 AS Decimal(18, 4)), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[LoanType] OFF
SET IDENTITY_INSERT [dbo].[PayrollCode] ON 

INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (3, N'BSC', N'Basic Salary', NULL, 1, 1, 1, NULL, NULL, 1, 0, 1, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (4, N'MALLW', N'Mileage Allowance', NULL, 2, 1, 1, NULL, NULL, 1, 0, 1, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (5, N'HSE ALLW', N'Housing Allowance', NULL, 5, 1, 1, NULL, NULL, 1, 0, 0, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (6, N'CTOA', N'Time off Allowance', NULL, 4, 1, 1, NULL, NULL, 1, 0, 0, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (7, N'Total Adj', N'Total Adjustments', NULL, 6, 1, 1, NULL, NULL, 1, 0, 1, 7, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'{C.HSE ALLW}+{C.MALLW}+{C.CTOA}+{C.Overtime}+{C.SALARREARS}+{C.AA}-{C.RH}', NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (8, N'Gross', N'Gross Pay', NULL, 7, 1, 1, NULL, NULL, 1, 0, 1, 7, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'{C.BSC}+{C.Total Adj}', NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (9, N'NSSF', N'NSSF', NULL, 14, 1, 1, NULL, NULL, 1, 0, 1, 7, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'5/100*{C.Gross}', NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (10, N'DOLR', N'Deduction of Laptop Replacement', NULL, 15, 1, 1, NULL, NULL, 1, 0, 0, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (11, N'CSCS', N'CSCS', NULL, 16, 1, 1, NULL, NULL, 1, 0, 1, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (12, N'TD', N'Total Deductions', NULL, 17, 1, 1, NULL, NULL, 1, 0, 1, 7, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'{C.CSCS}+{C.NSSF}+{C.DOLR}+{C.PAYE}+{C.RUP}+{C.OffReplace}+{C.LST}', NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (13, N'Net Pay', N'Net Pay', NULL, 24, 1, 1, NULL, NULL, 1, 0, 1, 7, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'{C.Gross}-{C.TD}', NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (14, N'EWD', N'Employee Worked Days', NULL, 8, 1, 1, NULL, NULL, 1, 0, 1, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (15, N'SALARREARS', N'Salary Arrears', NULL, 3, 1, 1, NULL, NULL, 1, 0, 1, 7, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'{C.EWD}/{P.WD}*{C.ArrearsBSC}', NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (16, N'PAYE', N'PAYE', NULL, 13, 1, 1, NULL, NULL, 1, 0, 1, 5, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (17, N'Overtime', N'Overtime', NULL, 9, 1, 1, NULL, NULL, 1, 0, 1, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (46, N'RUP', N'Recovery for Underpaid', NULL, 11, 1, 1, NULL, NULL, 1, 0, 1, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (47, N'RH', N'Recovery Housing', NULL, 18, 1, 1, NULL, NULL, 1, 0, 0, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (48, N'PAYE CORR', N'PayeCorrection', NULL, 21, 1, 1, NULL, NULL, 1, 0, 0, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (49, N'GTaxable', N'Gross Taxable', NULL, 12, 1, 1, NULL, NULL, 1, 0, 1, 7, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'{C.Gross}-{C.LST}-{C.PAYE CORR}', NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (50, N'AA', N'Acting Allowance', NULL, 10, 1, 1, NULL, NULL, 1, 0, 1, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (51, N'ArrearsBSC', N'ArrearsBasic', NULL, 22, 1, 1, NULL, NULL, 1, 0, 0, 7, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'{C.BSC}-{C.ArrearCorr}', NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (52, N'ArrearCorr', N'ArearCorrection', NULL, 23, 1, 1, NULL, NULL, 1, 0, 0, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (53, N'OffReplace', N'Office Replacements', NULL, 20, 1, 1, NULL, NULL, 1, 0, 0, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (54, N'LST', N'LST', NULL, 19, 1, 1, NULL, NULL, 1, 0, 1, 6, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (56, N'PAYE1', N'PAYE1', NULL, 25, 1, 1, NULL, NULL, 1, 0, 1, 5, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (57, N'PC', N'PERSONAL CODE', NULL, 26, 1, 1, NULL, NULL, NULL, 0, 0, 5, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PayrollCode] ([ID], [ItemCode], [NameOnPayslip], [PayrollCodeCategoryID], [PayslipRank], [IsActive], [PayslipTextOperationID], [SuspenseAcctNo], [BudgetAcctNo], [DrCrID], [RoundToDigits], [MandatoryItem], [AmountBasisID], [ApplicationPeriodID], [TrackBalanceChanges], [BalanceEffectID], [EffectiveDate], [Formula], [DisplayonPayslip]) VALUES (58, N'TEST', N'TEST', NULL, 27, 1, 1, NULL, NULL, NULL, 0, 0, 5, NULL, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[PayrollCode] OFF
SET IDENTITY_INSERT [dbo].[PayrollCodeCategory] ON 

INSERT [dbo].[PayrollCodeCategory] ([ID], [CategoryName]) VALUES (1, N'Cash Benefit')
INSERT [dbo].[PayrollCodeCategory] ([ID], [CategoryName]) VALUES (2, N'Non Cash Benefit')
INSERT [dbo].[PayrollCodeCategory] ([ID], [CategoryName]) VALUES (3, N'Before Tax Deduction')
INSERT [dbo].[PayrollCodeCategory] ([ID], [CategoryName]) VALUES (4, N'Taxation')
INSERT [dbo].[PayrollCodeCategory] ([ID], [CategoryName]) VALUES (5, N'Statutory Deduction')
INSERT [dbo].[PayrollCodeCategory] ([ID], [CategoryName]) VALUES (6, N'Company Recovery')
INSERT [dbo].[PayrollCodeCategory] ([ID], [CategoryName]) VALUES (7, N'Other Deductions')
INSERT [dbo].[PayrollCodeCategory] ([ID], [CategoryName]) VALUES (8, N'Balance')
INSERT [dbo].[PayrollCodeCategory] ([ID], [CategoryName]) VALUES (9, N'Operand')
SET IDENTITY_INSERT [dbo].[PayrollCodeCategory] OFF
SET IDENTITY_INSERT [dbo].[PayrollCodeGroup] ON 

INSERT [dbo].[PayrollCodeGroup] ([ID], [PayrollCodeID], [PayrollGroupID]) VALUES (1, 56, 3)
INSERT [dbo].[PayrollCodeGroup] ([ID], [PayrollCodeID], [PayrollGroupID]) VALUES (2, 5, 3)
INSERT [dbo].[PayrollCodeGroup] ([ID], [PayrollCodeID], [PayrollGroupID]) VALUES (3, 5, 1)
INSERT [dbo].[PayrollCodeGroup] ([ID], [PayrollCodeID], [PayrollGroupID]) VALUES (4, 57, 1)
INSERT [dbo].[PayrollCodeGroup] ([ID], [PayrollCodeID], [PayrollGroupID]) VALUES (5, 57, 3)
INSERT [dbo].[PayrollCodeGroup] ([ID], [PayrollCodeID], [PayrollGroupID]) VALUES (6, 58, 1)
INSERT [dbo].[PayrollCodeGroup] ([ID], [PayrollCodeID], [PayrollGroupID]) VALUES (7, 58, 3)
SET IDENTITY_INSERT [dbo].[PayrollCodeGroup] OFF
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (1, N'ACTCALDAYS()', N'Returns the Actual calendar days worked in the current month')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (2, N'ACTWEEKDAYS()', N'Returns the Actual week days worked in the current month')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (3, N'ACTWORKDAYS()', N'Returns the Actual working days worked in the current month')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (4, N'CALCINTBE()', N'Calculate the Interest benefit')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (5, N'CURRBAL()', N'Return the Current Balance of a parameter')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (6, N'CURRCODE()', N'Get Currency Code')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (7, N'DAYSWORKED()', N'Number of Days worked from Date Joined')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (8, N'DAYSWORKFRM()', N'Days worked from a specified cut-off Date')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (9, N'DEPCHILD()', N'Returns the number of children dependants that an employee has')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (10, N'DEPSPOUSE()', N'Returns the number of spouse dependants that an employee has')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (11, N'DEPTID()', N'Get Department ID')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (12, N'EXCHRATE()', N'Get Currency Exchange Rate from table')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (13, N'IIF()', N'IIF')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (14, N'INT()', N'Returns the Integer part of a number by truncating the decimal part')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (15, N'JOBID()', N'Get Job Title / Function')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (16, N'LNINTAMT()', N'Get interest amount of a loan')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (17, N'LNPRINCAMT()', N'Get Principle amount of a loan')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (18, N'LNRECOVAMT()', N'Get recovery amount of a loan')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (19, N'LOANBAL()', N'Get Balance of Loan Salary Item')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (20, N'LOCNID()', N'Gets Location ID')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (21, N'MONTH()', N'Current month')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (22, N'MTHCALDAYS()', N'Returns the number of Calendar days in a month')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (23, N'MTHSWRKD()', N'Get number of Payroll Periods worked from Join Date')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (24, N'MTHSWRKDCURR()', N'Get number of Payroll Periods worked in the current year')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (25, N'MTHWEEKDAYS()', N'Returns the number of Week days in a month')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (26, N'MTHWORKDAYS()', N'Returns the number of Working days in a month')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (27, N'PAYGROUP()', N'Get Payroll Group ID')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (28, N'PREVBAL()', N'Previous balance of Salary Item i.e. it''s balance in the previous payroll month')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (29, N'PREVVAL()', N'Previous Value of Salary Item i.e. it''s value in the previous payroll month')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (30, N'PRORATE()', N'Protate Salary Item for staff who join / leave part-way in the month')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (31, N'ROUND()', N'Rounds off a number to the nearest specified decimal places')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (32, N'SCALEAMT()', N'GET Basic Salary from Salary Scale / Job Grade table')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (33, N'VARCAT()', N'Determine an employee''s Variance Category as either: Joiner, Leaver, Prorated or Continuing')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (34, N'WORKYEARS()', N'Years worked so far')
INSERT [dbo].[PayrollFunction] ([ID], [PayrollFunctionName], [PayrollFunctionDescription]) VALUES (35, N'YEAR()', N'Current year')
SET IDENTITY_INSERT [dbo].[PayrollReferenceTable] ON 

INSERT [dbo].[PayrollReferenceTable] ([ID], [PayrollCodeID], [TaxBand], [ValueFrom], [ValueTo], [TaxValue], [TaxationTypeID], [EffectiveDate]) VALUES (29, 16, 1, CAST(0.0000 AS Decimal(18, 4)), CAST(235000.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PayrollReferenceTable] ([ID], [PayrollCodeID], [TaxBand], [ValueFrom], [ValueTo], [TaxValue], [TaxationTypeID], [EffectiveDate]) VALUES (30, 16, 5, CAST(10000001.0000 AS Decimal(18, 4)), CAST(9999999999.0000 AS Decimal(18, 4)), CAST(40.0000 AS Decimal(18, 4)), 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PayrollReferenceTable] ([ID], [PayrollCodeID], [TaxBand], [ValueFrom], [ValueTo], [TaxValue], [TaxationTypeID], [EffectiveDate]) VALUES (31, 16, 2, CAST(235001.0000 AS Decimal(18, 4)), CAST(335000.0000 AS Decimal(18, 4)), CAST(10.0000 AS Decimal(18, 4)), 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PayrollReferenceTable] ([ID], [PayrollCodeID], [TaxBand], [ValueFrom], [ValueTo], [TaxValue], [TaxationTypeID], [EffectiveDate]) VALUES (32, 16, 3, CAST(335001.0000 AS Decimal(18, 4)), CAST(410000.0000 AS Decimal(18, 4)), CAST(20.0000 AS Decimal(18, 4)), 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PayrollReferenceTable] ([ID], [PayrollCodeID], [TaxBand], [ValueFrom], [ValueTo], [TaxValue], [TaxationTypeID], [EffectiveDate]) VALUES (33, 16, 4, CAST(410001.0000 AS Decimal(18, 4)), CAST(10000000.0000 AS Decimal(18, 4)), CAST(30.0000 AS Decimal(18, 4)), 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PayrollReferenceTable] ([ID], [PayrollCodeID], [TaxBand], [ValueFrom], [ValueTo], [TaxValue], [TaxationTypeID], [EffectiveDate]) VALUES (34, 56, 1, CAST(0.0000 AS Decimal(18, 4)), CAST(50000.0000 AS Decimal(18, 4)), CAST(10.0000 AS Decimal(18, 4)), 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PayrollReferenceTable] ([ID], [PayrollCodeID], [TaxBand], [ValueFrom], [ValueTo], [TaxValue], [TaxationTypeID], [EffectiveDate]) VALUES (35, 56, 2, CAST(50001.0000 AS Decimal(18, 4)), CAST(2000000.0000 AS Decimal(18, 4)), CAST(30.0000 AS Decimal(18, 4)), 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[PayrollReferenceTable] OFF
SET IDENTITY_INSERT [dbo].[PayrollTransaction] ON 

INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (599, 3, 50, CAST(2615676.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (600, 3, 51, CAST(3067583.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (601, 3, 45, CAST(2615676.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (602, 3, 46, CAST(2615676.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (603, 3, 44, CAST(3846226.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (604, 3, 48, CAST(2615676.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (605, 3, 52, CAST(3238928.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (606, 3, 56, CAST(1417217.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (607, 3, 66, CAST(1417217.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (608, 3, 63, CAST(1417217.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (609, 3, 65, CAST(1417217.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (610, 3, 60, CAST(2756616.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (611, 3, 59, CAST(3238928.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (612, 3, 67, CAST(2615676.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (613, 3, 68, CAST(1417217.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (614, 3, 70, CAST(1417217.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (615, 3, 71, CAST(5079321.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (616, 3, 74, CAST(1793128.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (617, 3, 75, CAST(3238928.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (618, 3, 76, CAST(7854000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (619, 3, 77, CAST(3238928.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (620, 5, 25, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (621, 5, 52, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (622, 5, 70, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (623, 11, 1, CAST(80000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (624, 11, 2, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (625, 11, 14, CAST(243333.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (626, 11, 44, CAST(250000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (657, 6, 25, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (658, 6, 27, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (659, 6, 38, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (660, 6, 43, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (661, 6, 50, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (662, 6, 45, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (663, 6, 46, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (664, 6, 48, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (665, 6, 52, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (666, 6, 56, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (667, 6, 66, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (668, 6, 63, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (669, 6, 65, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (670, 6, 60, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (671, 6, 59, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (672, 6, 67, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (673, 6, 68, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (674, 6, 70, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (675, 6, 71, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (676, 6, 74, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (677, 6, 75, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (678, 6, 77, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (679, 4, 36, CAST(111394.0500 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (680, 4, 10, CAST(222788.1000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (681, 4, 71, CAST(368106.7100 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (682, 4, 38, CAST(373170.0700 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (683, 4, 43, CAST(417727.7000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (684, 4, 33, CAST(556970.2600 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (685, 4, 20, CAST(668364.3100 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (686, 4, 8, CAST(735200.7400 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (687, 4, 7, CAST(774188.6600 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (688, 4, 34, CAST(835455.3900 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (689, 4, 17, CAST(891152.4200 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (690, 4, 30, CAST(891152.4200 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (691, 4, 42, CAST(891152.4200 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (692, 4, 35, CAST(1058243.4900 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (693, 3, 148, CAST(1417217.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (694, 6, 148, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (695, 16, 148, CAST(354857.5000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (702, 16, 25, CAST(414857.8000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (16550, 3, 159, CAST(210526.3720 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (16551, 17, 1, CAST(0.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (627, 11, 3, CAST(279444.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (628, 11, 22, CAST(300000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (629, 11, 25, CAST(379444.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (630, 11, 23, CAST(450000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (631, 11, 12, CAST(458333.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (632, 11, 27, CAST(460000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (633, 11, 24, CAST(463333.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (634, 11, 9, CAST(471667.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (635, 11, 8, CAST(500000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (636, 11, 51, CAST(500000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (637, 11, 21, CAST(523333.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (638, 11, 4, CAST(543333.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (639, 11, 41, CAST(600000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (640, 11, 52, CAST(700000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (641, 11, 5, CAST(830000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (642, 11, 42, CAST(873333.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (643, 11, 10, CAST(907275.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (644, 11, 37, CAST(924000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (645, 11, 71, CAST(1000000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (646, 11, 76, CAST(1100000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (647, 11, 7, CAST(1233333.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (648, 11, 20, CAST(1233333.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (649, 11, 38, CAST(1480000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (650, 11, 36, CAST(1680000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (651, 11, 34, CAST(1826667.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (652, 11, 30, CAST(2033333.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (653, 11, 33, CAST(2416667.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (654, 11, 17, CAST(2566667.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (655, 11, 35, CAST(2746667.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
GO
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (656, 6, 31, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (275, 3, 78, CAST(5399160.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (276, 11, 78, CAST(600000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (278, 3, 79, CAST(14578344.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (280, 11, 79, CAST(1200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (571, 3, 4, CAST(1918802.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (572, 3, 5, CAST(1746938.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (573, 3, 31, CAST(1838896.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (574, 3, 7, CAST(11568195.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (575, 3, 8, CAST(10602433.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (576, 3, 9, CAST(1598045.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (577, 3, 10, CAST(6697685.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (578, 3, 12, CAST(1417218.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (579, 3, 14, CAST(2013295.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (580, 3, 17, CAST(5364999.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (581, 3, 20, CAST(9990878.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (582, 3, 21, CAST(4676260.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (583, 3, 22, CAST(3238928.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (584, 3, 37, CAST(3679115.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (585, 3, 23, CAST(3238928.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (586, 3, 24, CAST(1417218.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (587, 3, 25, CAST(1417218.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (588, 3, 27, CAST(1417218.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (589, 3, 30, CAST(5364999.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (590, 3, 32, CAST(4676260.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (591, 3, 33, CAST(5232375.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (592, 3, 34, CAST(19482167.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (593, 3, 35, CAST(5232375.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (594, 3, 36, CAST(8037224.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (595, 3, 38, CAST(8037223.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (596, 3, 41, CAST(3926662.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (597, 3, 43, CAST(5485666.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (598, 3, 42, CAST(5364999.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (518, 3, 72, CAST(2615676.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (519, 3, 73, CAST(1417217.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (520, 3, 80, CAST(5364999.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (521, 5, 50, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (522, 5, 49, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (523, 5, 46, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (524, 5, 47, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (525, 5, 55, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (526, 5, 54, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (527, 5, 57, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (528, 5, 64, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (529, 5, 69, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (530, 11, 6, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (531, 11, 11, CAST(200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (532, 11, 13, CAST(333333.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (533, 11, 15, CAST(493334.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (534, 11, 19, CAST(550000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (535, 11, 28, CAST(650667.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (536, 11, 18, CAST(772000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (537, 11, 16, CAST(960000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (538, 11, 26, CAST(1133333.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (539, 11, 47, CAST(1200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (540, 11, 57, CAST(1200000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (496, 3, 6, CAST(8772510.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (497, 3, 11, CAST(1417218.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (498, 3, 13, CAST(1417218.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (499, 3, 15, CAST(4676260.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (500, 3, 16, CAST(5888164.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (501, 3, 18, CAST(4676260.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (502, 3, 19, CAST(6232117.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (503, 3, 26, CAST(3093187.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (504, 3, 28, CAST(3093187.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (505, 3, 29, CAST(5079321.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (506, 3, 40, CAST(5079321.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (507, 3, 49, CAST(2615676.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (508, 3, 47, CAST(2615676.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (509, 3, 55, CAST(2615676.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (510, 3, 53, CAST(2615676.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (511, 3, 54, CAST(2615676.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (512, 3, 58, CAST(3926662.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (513, 3, 57, CAST(3238928.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (514, 3, 64, CAST(2615676.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (515, 3, 61, CAST(7376873.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (516, 3, 62, CAST(1417217.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (517, 3, 69, CAST(1417217.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (541, 11, 29, CAST(1622857.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (542, 11, 32, CAST(1890000.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (543, 6, 19, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (544, 6, 37, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (545, 6, 29, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (546, 6, 40, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (547, 6, 49, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (548, 6, 47, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (549, 6, 55, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (550, 6, 53, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (551, 6, 54, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (552, 6, 57, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (553, 6, 64, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (554, 6, 61, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (555, 6, 62, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (556, 6, 69, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (558, 6, 72, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (559, 6, 73, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (560, 6, 80, CAST(92308.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (563, 4, 6, CAST(835455.3900 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (565, 4, 19, CAST(306333.6400 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (566, 4, 29, CAST(373170.0700 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
GO
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (567, 4, 16, CAST(2116486.9900 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (568, 3, 1, CAST(1586196.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (569, 3, 2, CAST(1586196.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
INSERT [dbo].[PayrollTransaction] ([ID], [PayrollCodeID], [EmployeeID], [Amount], [Balance], [IsTurnedOff], [Remarks], [PayrollPeriodID]) VALUES (570, 3, 3, CAST(1417217.0000 AS Decimal(21, 4)), CAST(0.0000 AS Decimal(21, 4)), 0, NULL, N'047c8fb7-45f6-4372-a261-8406d815f219')
SET IDENTITY_INSERT [dbo].[PayrollTransaction] OFF
SET IDENTITY_INSERT [dbo].[PayslipTextOperation] ON 

INSERT [dbo].[PayslipTextOperation] ([ID], [PayslipTextOperationName]) VALUES (1, N'Normal')
INSERT [dbo].[PayslipTextOperation] ([ID], [PayslipTextOperationName]) VALUES (2, N'Bold')
INSERT [dbo].[PayslipTextOperation] ([ID], [PayslipTextOperationName]) VALUES (3, N'Underline')
INSERT [dbo].[PayslipTextOperation] ([ID], [PayslipTextOperationName]) VALUES (4, N'Italics')
INSERT [dbo].[PayslipTextOperation] ([ID], [PayslipTextOperationName]) VALUES (5, N'Double Underline')
SET IDENTITY_INSERT [dbo].[PayslipTextOperation] OFF
SET IDENTITY_INSERT [dbo].[TaxationType] ON 

INSERT [dbo].[TaxationType] ([ID], [TypeName]) VALUES (1, N'Cumulative')
INSERT [dbo].[TaxationType] ([ID], [TypeName]) VALUES (2, N'Single Value')
SET IDENTITY_INSERT [dbo].[TaxationType] OFF
INSERT [dbo].[TransactionApproverType] ([ID], [ApproverType]) VALUES (1, N'Line Manager - Immediate')
INSERT [dbo].[TransactionApproverType] ([ID], [ApproverType]) VALUES (2, N'Line Manager - Second')
INSERT [dbo].[TransactionApproverType] ([ID], [ApproverType]) VALUES (4, N'Specified Position')
INSERT [dbo].[TransactionApproverType] ([ID], [ApproverType]) VALUES (5, N'Specified Employee')
INSERT [dbo].[TransactionApproverType] ([ID], [ApproverType]) VALUES (3, N'Hierarchy Head')
INSERT [dbo].[TransactionType] ([id], [TransactionDescr], [NoApprovalSteps]) VALUES (1, N'Leave', 2)
INSERT [dbo].[TransactionType] ([id], [TransactionDescr], [NoApprovalSteps]) VALUES (2, N'Payroll', 3)
INSERT [dbo].[TransactionType] ([id], [TransactionDescr], [NoApprovalSteps]) VALUES (3, N'Loan', 2)
ALTER TABLE [dbo].[LoanType] ADD  CONSTRAINT [DF_LoanNAdvance_MinimumAmount]  DEFAULT ((0)) FOR [MinimumAmount]
GO
ALTER TABLE [dbo].[LoanType] ADD  CONSTRAINT [DF_LoanNAdvance_MaximumAmount]  DEFAULT ((0)) FOR [MaximumAmount]
GO
ALTER TABLE [dbo].[PayrollCode] ADD  CONSTRAINT [DF_PayrollCode_PayslipRank]  DEFAULT ((1)) FOR [PayslipRank]
GO
ALTER TABLE [dbo].[PayrollCode] ADD  CONSTRAINT [DF_PayrollCode_RoundToDigits]  DEFAULT ((0)) FOR [RoundToDigits]
GO
ALTER TABLE [dbo].[PayrollCode] ADD  CONSTRAINT [DF_PayrollCode_EffectiveDate]  DEFAULT ('1900-01-01T00:00:00.000') FOR [EffectiveDate]
GO
ALTER TABLE [dbo].[PayrollCodeCategory] ADD  CONSTRAINT [DF_TransactionCategory_CategoryName]  DEFAULT ('') FOR [CategoryName]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Period to Apply' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayrollCode', @level2type=N'COLUMN',@level2name=N'ApplicationPeriodID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'None (0), Increase (1) Or Decrease (2)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayrollCode', @level2type=N'COLUMN',@level2name=N'BalanceEffectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the Category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayrollCodeCategory', @level2type=N'COLUMN',@level2name=N'CategoryName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds Transaction Category details.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayrollCodeCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Whether Taxation is cumulative (1) or Single Value (2)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayrollReferenceTable', @level2type=N'COLUMN',@level2name=N'TaxationTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the rate becomes effective' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayrollReferenceTable', @level2type=N'COLUMN',@level2name=N'EffectiveDate'
GO
