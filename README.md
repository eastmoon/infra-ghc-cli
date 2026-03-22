# Github Copilot CLI

本專案依據 [GitHub Copilot CLI 新手入門](https://copilot-cli-for-beginners.gh.miniasp.com/) 介紹，建立 Github Copilot CLI 操作環境並實務測試。

## 指令

使用 [devops-cli-framework](https://github.com/eastmoon/devops-cli-framework) 設計專案指令：

+ 啟動開發環境 ```do.bat dev```
+ 執行單句提示 ```do.bat prompt [ask question]```
	- 例如：```do.bat prompt Say hello and tell me what you can help with```
+ 執行計畫檔案 ```do.bat plan [markdown file in 'plan' folder]```
	- 例如：```do.bat plan demo.md```，demo.md 檔案在 [plan](./plan) 目錄中

執行上述指令需於 [devops-cli-framework](https://github.com/eastmoon/devops-cli-framework) 專案執行 ```do pack```，封裝必要映像檔。

## 環境容器

本專案開發環境使用 Docker 並啟動單一容器執行 Copilot 環境，容器映像檔設計參考如下文獻：

+ [Github CLI - Debian OS](https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian)
+ [Github Copilot CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli/set-up-copilot-cli/install-copilot-cli)

實務完成的容器映像檔參考 [Dockerfile](./conf/docker/copilot-cli)

## 登入帳號

由於開發環境使用 Docker 並啟動單一容器，這導致並無法依據文獻採用 ```/login``` 或 ```copilot login``` 來啟動瀏覽器進行驗證。

對此，採用 [Authenticating with GitHub CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli/set-up-copilot-cli/authenticate-copilot-cli#authenticating-with-github-cli) 方式：

1. 帳號申請個人存取權杖 ( Personal Access Token、PAT )
2. 將權杖複製至本專案檔案 ```/conf/devops/keys/GITHUB_API_KEY```
3. 執行 ```do.bat dev``` 啟動環境，啟動程序會檢查 GITHUB_API_KEY 檔案並設定相應環境變數給容器
4. 進入容器後，執行 ```gh auth status``` 檢驗 Github CLI 完成登入
5. 進入容器後，執行 ```copilot``` 進入互動介面，並執行 ```/user``` 顯示帳戶名稱

申請個人存取權杖時，有以下注意事項：

+ 進入 [Github.com](https://github.com/settings/personal-access-tokens) 設定個人存取權杖
+ 選擇 Fine-grained personal
+ 點擊 Generate new token
		- 添加權限 ( Add permissions ) Copilot Requests
		- 此權限僅能使用於用戶帳號為 Owner 的專案庫，因此，僅選擇 Public repositories 能設定
