USE SQL#Presentation
GO

/*
Parameters
1 = Base number
2 = From unit
3 = To unit

Distance & Length
- Nanometer
- Micrometer
- Millimeter
- Centometer
- Meter
- Kilometer
- Inch
- Foot
- Yard
- Mile

Temperature
- Kelvin
- Celsius
- Fahrenheit
- Rankine
- Reaumer

Data Size
- Bit
- Byte
- Kilobyte
- Megabyte
- Gigabyte
- Terabyte
- Petabyte

*/


SELECT SQL#.Math_Convert(1,'Foot','Inch');
SELECT SQL#.Math_Convert(1,'Yard','Meter');
SELECT SQL#.Math_Convert(1,'Meter','Yard');
SELECT SQL#.Math_Convert(1,'Meter','Foot');
SELECT SQL#.Math_Convert(30,'Celsius','Fahrenheit');
SELECT SQL#.Math_Convert(100,'Fahrenheit','Celsius');
SELECT SQL#.Math_Convert(1,'Megabyte','Byte');
SELECT SQL#.Math_Truncate(SQL#.Math_Convert(1,'Megabyte','Byte'),0)  -- Math_Truncate does not round up or down, it just truncates at the specified decimal place