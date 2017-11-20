Bat でレジストリの操作  

操作方法
　　　コマンドプロンプト上でレジストリを操作するためには、「reg.exe」というツールが利用できる。 C:\Windows\System32にあります。

reg のサブコマンド
   reg query
   reg add
　 reg delete
   reg save 
   reg export
   reg import


使い方　　reg /?　で調べます


レジストリキーの指定方法
キー	正式なキー名称	       リモート
HKLM	HKEY_LOCAL_MACHINE	利用可能
HKCU	HKEY_CURRENT_USER	利用不可能
HKCR	HKEY_CLASSES_ROOT	利用不可能
HKU	HKEY_USERS	        利用可能
HKCC	HKEY_CURRENT_CONFIG	利用不可能


*******************************************************************

REG ADD キー名 [/v 値名 | /ve] [/t Type] [/s セパレータ] [/d データ] [/f]

  キー名    [\\コンピュータ\]完全キー
      コンピュータ  リモート コンピュータ名 - 現在のコンピュータを
                    既定として省略します。HKLM と HKU のみリモート 
                    コンピュータで利用できます。
      完全キー      ルートキー\サブキー
        ルートキー  [ HKLM | HKCU | HKCR | HKU | HKCC ]
        サブキー    選択したルートキーの下のレジストリ キーの完全な名前

  /v  選択したキーの下の追加される値名

  /ve キーの空の値名 <名前なし> を追加します

  /t  種類
           [ REG_SZ    | REG_MULTI_SZ  | REG_DWORD_BIG_ENDIAN    |
             REG_DWORD | REG_BINARY    | REG_DWORD_LITTLE_ENDIAN |
             REG_NONE  | REG_EXPAND_SZ ]
           省略された場合、REG_SZ を想定します

  /s  REG_MULTI_SZ のデータ文字列でセパレータとして使う文字を 1 つ
      指定します。省略した場合、"\0" がセパレータとして使われます
  /d  追加されているレジストリ 値名へ割り当てられるデータ

  /f  プロンプトなしで既存のレジストリ エントリを強制的に上書きします

例:

  REG ADD \\ABC\HKLM\Software\MyCo
    リモート コンピュータ ABC にキー HKLM\Software\MyCo を追加します

  REG ADD HKLM\Software\MyCo /v Data /t REG_BINARY /d fe340ead
    値を追加します (名前: Data、種類: REG_BINARY、データ: fe340ead)

  REG ADD HKLM\Software\MyCo /v MRU /t REG_MULTI_SZ /d fax\0mail
    値を追加します (名前: MRU、種類: REG_MUTLI_SZ、データ: fax\0mail\0\0)

  REG ADD HKLM\Software\MyCo /v Path /t REG_EXPAND_SZ /d %%systemroot%%
    値を追加します (名前: Path、種類: REG_EXPAND_SZ、データ: %systemroot%)
    注意:  文字列を展開するには、2 つの パーセント ( %% ) で囲んでください。

________________________________________________________________________________

REG QUERY キー名 [/v 値名 | /ve] [/s]

  キー名    [\コンピュータ\]完全キー
      コンピュータ  リモート コンピュータ名 - 現在のコンピュータを
                    既定として省略します。
                    HKLM と HKU のみリモート コンピュータで利用できます。
      完全キー      ルートキー\サブキー 名の形式
        ルートキー  [ HKLM | HKCU | HKCR | HKU | HKCC ]
        サブキー    選択したルートキーの下のレジストリ キーの完全な名前
  /v  特有のレジストリ キーのクエリ
        値名  -     選択されたキーの下でクエリしたい名前
                    省略された場合は、キーの下のすべての値がクエリされます
  /ve 既定の値、または空の値名 <名前なし> をクエリします
  /s  すべてのサブキーと値をクエリします

例:

  REG QUERY HKLM\Software\Microsoft\ResKit /v Version
    レジストリ値 Version の値を表示します

  REG QUERY HKLM\Software\Microsoft\ResKit\Nt\Setup /s
    レジストリ キー セットアップの下のすべてのサブキーと値を表示します

________________________________________________________________________________

REG SAVE キー名 ファイル名

  キー名    ルートキー\サブキー
    ルートキー  [ HKLM | HKCU | HKCR | HKU | HKCC ]
    サブキー    選択したルートキーの下のレジストリ キーの完全な名前
  ファイル名    保存されるディスク ファイル名。 パスが指定されない場合は、
                ファイルは、呼び出しているプロセスの現在のフォルダに
                作成されます

例:

  REG SAVE HKLM\Software\MyCo\MyApp AppBkUp.hiv
    hive MyApp を現在のフォルダのファイル AppBkUp.hiv に保存します


*******************************************************************


C#でレジストリの操作

namespace  Microsoft.Win32
    class  Registry
     
staticメソッド GetValue
               SetValue
               SetValue



******************************************************************

Bat のいろいろ

@コマンド　　「@」が先頭に付いている場合、プロンプト及び実行したコマンドについて画面に表示しません

echoコマンド 特定のコマンドだけではなく、コマンドの実行を画面に表示するかどうかそのものを切り替えることができます
   echo  on
   echo  off

echo  メッセージ   メッセージの表示
      
     注意　空白行を表示するとき
           echo.
     特殊な文字を出力するには文字の前に「^」をつけます
  

	<    -->   ^<
	>    -->   ^>
	|    -->   ^|
	&    -->   ^&
	^    -->   ^^

   
コマンド記述 REM
  例:
     rem 作成日2000
     @echo off
  
処理一時停止  
　　　pause
     




