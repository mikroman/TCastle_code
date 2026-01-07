@echo off
echo Const adTypeBinary = 1 > 2bytes.vbs
echo filename = "%~1" >> 2bytes.vbs
echo Set BinaryStream = CreateObject("ADODB.Stream") >> 2bytes.vbs
echo BinaryStream.Type = adTypeBinary >> 2bytes.vbs
echo BinaryStream.Open >> 2bytes.vbs
echo BinaryStream.LoadFromFile FileName >> 2bytes.vbs
echo buf = BinaryStream.Read >> 2bytes.vbs
echo BinaryStream.Close >> 2bytes.vbs
echo wscript.echo Hex(ASCB(MIDB(buf,1,1))) ^& "," ^& Hex(ASCB(MIDB(buf,2,1))) >> 2bytes.vbs
for /f "tokens=1,2 delims=," %%A in ('cscript //nologo 2bytes.vbs') do (
   set byte1=%%A
   set byte2=%%B
   )

echo ORIGIN: $%byte2%%byte1%