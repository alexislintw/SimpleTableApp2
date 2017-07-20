# SimpleTableApp
iOS UITableView 教學用範例

- UITableViewController (主選單)
  - 練習使用static cell
  - 練習使用segue機制換頁
  
- TheaterListViewController
  - 練習使用UITableViewDataSource和UITableViewDelegate的methods:
    - tableView:numberOfRowsInSection:
    - tableView:cellForRowAtIndexPath:
    - numberOfSectionsInTableView:
    - tableView:titleForHeaderInSection:
  - 練習使用UITableViewCell不同的style
    - Default
    - Subtitle
    - Detail Right
  - 練習設定UITableViewCell的各項屬性
    - rowHeight
    - textColor
    - font
    - accessoryType
  - 練習場景轉換和傳遞參數
    - navigationController/segue

- MovieListViewController
  - 練習建立/使用custom的UITableViewCell
  
- BookmarkViewController
  - 練習使用Editing cells相關的methods
    - tableView:canEditRowAtIndexPath:
    - tableView:editingStyleForRowAtIndexPath
    - tableView:commitEditingStyle:forRowAtIndexPath
    
- NewsListViewController
  - 練習從遠端讀取資料
    - 從Firebase讀取資料

