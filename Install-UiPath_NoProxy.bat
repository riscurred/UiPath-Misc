@echo off

echo. ����������������������������������
echo. ��   UiPath�C���X�g�[���o�b�`   ��
echo. ����������������������������������
echo.

echo. start: %date% %time%

setlocal
rem # ���[�J���ϐ���������

rem # ���[�J���ϐ���`

rem ---- �y���O�m�F�z�C���X�g�[���[URL
rem ------ �ŐV��
set InstallerUri=https://download.uipath.com/UiPathStudioCloud.msi
rem ------ �o�[�W�����w��iURL���������K�v�j
rem set InstallerUri=https://download.uipath.com/versions/22.10.11/UiPathStudioCloud.msi

set DownloadAs=UiPathStudioCloud.msi

rem ---- �y���O�m�F�z�X�^���h�A�����̃��C�Z���X�A�N�e�B�x�[�V����
set LicenseCode=


rem # ���s�O�̃`�F�b�N

if "%LicenseCode%"=="" (
	echo. [!] ���C�Z���X�L�[���w�肳��Ă��܂���B���C�Z���X�L�[����͂��Ă��������B
	echo. [!] ���C�Z���X�L�[�ɂ��A�N�e�B�x�[�V���������Ȃ��ꍇ�́A���̂܂�Enter�L�[���������Ă��������B
	set /p LicenseCode="���C�Z���X�L�[: "
)

rem # �C���X�g�[���[�擾

echo.   ��UiPath�̃C���X�g�[���[���擾���Ă��܂�...

curl.exe -# -Lo "%DownloadAs%" "%InstallerUri%"

echo.   ���C���X�g�[���[��ۑ����܂����B
echo.

rem # �C���X�g�[���E���C�Z���X�A�N�e�B�x�[�V����

if "%LicenseCode%"=="" (

	rem ## ���C�Z���X�L�[���w�肳��Ă��Ȃ��ꍇ�A�C���X�g�[���̂�

	echo.   ��UiPath�̃C���X�g�[�������{���Ă��܂�
	%DownloadAs% /q ADDLOCAL=DesktopFeature,Studio,ExcelAddin,Robot,RegisterService,Packages,ChromeExtension,EdgeExtension CHROME_INSTALL_TYPE=POLICYOFFLINE EDGE_INSTALL_TYPE=POLICYOFFLINE TELEMETRY_ENABLED=0
	echo.   ��UiPath�̃C���X�g�[�����������܂����B

) else (

	echo.   ��UiPath�̃C���X�g�[���ƃ��C�Z���X�A�N�e�B�x�[�V���������{���Ă��܂�
	%DownloadAs% /q ADDLOCAL=DesktopFeature,Studio,ExcelAddin,Robot,RegisterService,Packages,ChromeExtension,EdgeExtension CODE=%LicenseCode% CHROME_INSTALL_TYPE=POLICYOFFLINE EDGE_INSTALL_TYPE=POLICYOFFLINE TELEMETRY_ENABLED=0
	echo.   ��UiPath�̃C���X�g�[���ƃ��C�Z���X�A�N�e�B�x�[�V�������������܂����B

)
echo.

rem # ���[�J���ϐ������܂�
endlocal

echo.   ���C���X�g�[���̎菇���������܂���
echo.   ���f�X�N�g�b�v�ɕۑ����ꂽ�C���X�g�[���[�́AStudio�̋N���m�F��ɍ폜���Ă��������B
echo.     �����L�[����������ƁA�o�b�`�t�@�C�����I�����܂��B

echo. end  : %date% %time%

pause > NUL