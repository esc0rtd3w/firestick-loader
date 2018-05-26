@echo off

color 0b

set adb="..\..\..\bin\adb.exe"
set shell=%adb% shell


cls
echo Settings^: backup_enabled 1
echo Settings^: secure backup_transport com.amazon.device.backup/.transport.BackupTransportService

%shell% settings --user 0 put secure backup_enabled 1
%shell% settings --user 0 put secure backup_transport com.amazon.device.backup/.transport.BackupTransportService

exit

