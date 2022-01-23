# Tools

開発した簡易ツール集です。

## Visual Studio Change Color Theme Setting.bat

タスクスケジューラに登録してVisual Studioのテーマカラーを変更します。
□使い方
1.VisualStudio起動→「ツール」→「オプション」→「環境」で淡色・濃色で設定したファイルを「設定のインポート・エクスポート」から出力します。
2.淡色の設定ファイル名を「WhiteColorSettings.vssettings」、濃色の設定ファイル名を「DarkColorSettings.vssettings」、現在の出力はそのまま「CurrentSettings.vssettings」とします。
3.コード内のsettingsDirectoryPathを「設定のエクスポートパス」のフォルダーパスに置き換えます。
4.タスクスケジューラでAM 6:00とPM 18:00、起動時にこのバッチファイルを起動するように設定します。

## C#PropertyNameFilterTool.html
C#プロパティ名抽出ツール
C#のソースコードからプロパティ名を抽出して、アクセス修飾子を取り除き表示します。
Excelで編集しやすいようにタブ区切りとしています。
コードを作成してからエクセル等に添付できるので、仕事で重宝しています。

## ScreenDesignDocumentHelperTool.html
画像に番号を追加して、再度画像を出力します。
画面設計書の作成で試行錯誤した結果、作成したが使用していないツールです。