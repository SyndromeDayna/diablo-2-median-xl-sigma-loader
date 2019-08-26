program median_xl_sigma_loader;

uses Windows;

function SetSecurityInfo
(
	process_handle:handle;
	object_type:dword;
	security_info:dword;
	owner:pointer;
	group:pointer;
	dacl:pointer;
	sacl:pointer
):dword; stdcall; external 'Advapi32.dll';
const
	SE_KERNEL_OBJECT = 6;

var
	diablo_process_handle:dword;

procedure death(how_did_i_die:unicodestring);
begin
	MessageBoxW(0,@how_did_i_die[1],nil,0); Halt;
end;

procedure create_diablo_process();
var
	startup_info: TSTARTUPINFOW;
	handles: TProcessInformation;
begin
	ZeroMemory(@startup_info,SizeOf(startup_info));
	startup_info.cb := SizeOf(startup_info);
	if CreateProcessW('game.exe',GetCommandLineW(),nil,nil,false,0,nil,nil,@startup_info,@handles) = false then
		death('Loader failed to launch game.exe');
	diablo_process_handle:= handles.hProcess;
end;

procedure wait_for_diablo_initialization();
const
	hour = 60*60*1000;
begin
	if WaitForInputIdle(diablo_process_handle,hour) <> 0 then
		death('Loader crashed while waiting for diablo initialization');
end;

procedure deprotect();
var
	zero:dword;
begin
	zero:= SetSecurityInfo
	(
		diablo_process_handle,
		SE_KERNEL_OBJECT,
		DACL_SECURITY_INFORMATION,
		nil,
		nil,
		nil,
		nil
	);
	if zero <> 0 then death('Loader failed to deprotect game.exe');
end;


begin
	create_diablo_process();
	wait_for_diablo_initialization();
	deprotect();
end.

