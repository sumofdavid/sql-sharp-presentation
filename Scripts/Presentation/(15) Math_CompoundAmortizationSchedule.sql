USE SQL#Presentation
GO

/*
Parameters
1 = Loan Amount
2 = Annual Interest Rate
3 = Years of Loan
4 = Payments per year
5 = Start Date
6 = Optional Additional Payment amount

*/


SELECT * 
FROM SQL#.Math_CompoundAmortizationSchedule(500000, 3.5, 30, 12,'1/1/2013', 0)