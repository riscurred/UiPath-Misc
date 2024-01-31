@echo off

echo. ■■■■■■■■■■■■■■■■■
echo. ■   UiPathインストールバッチ   ■
echo. ■■■■■■■■■■■■■■■■■
echo.

echo. start: %date% %time%

setlocal
rem # ローカル変数ここから

rem # ローカル変数定義

rem ---- 【事前確認】インストーラーURL
rem ------ 最新版
set InstallerUri=https://download.uipath.com/UiPathStudioCloud.msi
rem ------ バージョン指定（URL書き換え必要）
rem set InstallerUri=https://download.uipath.com/versions/22.10.11/UiPathStudioCloud.msi

set DownloadAs=UiPathStudioCloud.msi

rem ---- 【事前確認】スタンドアロンのライセンスアクティベーション
set LicenseCode=


rem # 実行前のチェック

if "%LicenseCode%"=="" (
	echo. [!] ライセンスキーが指定されていません。ライセンスキーを入力してください。
	echo. [!] ライセンスキーによるアクティベーションをしない場合は、そのままEnterキーを押下してください。
	set /p LicenseCode="ライセンスキー: "
)

rem # インストーラー取得

echo.   □UiPathのインストーラーを取得しています...

curl.exe -# -Lo "%DownloadAs%" "%InstallerUri%"

echo.   └インストーラーを保存しました。
echo.

rem # インストール・ライセンスアクティベーション

if "%LicenseCode%"=="" (

	rem ## ライセンスキーが指定されていない場合、インストールのみ

	echo.   □UiPathのインストールを実施しています
	%DownloadAs% /q ADDLOCAL=DesktopFeature,Studio,ExcelAddin,Robot,RegisterService,Packages,ChromeExtension,EdgeExtension CHROME_INSTALL_TYPE=POLICYOFFLINE EDGE_INSTALL_TYPE=POLICYOFFLINE TELEMETRY_ENABLED=0
	echo.   └UiPathのインストールが完了しました。

) else (

	echo.   □UiPathのインストールとライセンスアクティベーションを実施しています
	%DownloadAs% /q ADDLOCAL=DesktopFeature,Studio,ExcelAddin,Robot,RegisterService,Packages,ChromeExtension,EdgeExtension CODE=%LicenseCode% CHROME_INSTALL_TYPE=POLICYOFFLINE EDGE_INSTALL_TYPE=POLICYOFFLINE TELEMETRY_ENABLED=0
	echo.   └UiPathのインストールとライセンスアクティベーションが完了しました。

)
echo.

rem # ローカル変数ここまで
endlocal

echo.   ★インストールの手順が完了しました
echo.   └デスクトップに保存されたインストーラーは、Studioの起動確認後に削除してください。
echo.     何かキーを押下すると、バッチファイルを終了します。

echo. end  : %date% %time%

pause > NUL