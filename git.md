##### 全局设置
```bash
git config --global user.name 范圣帅
git config --global user.email fanshengshuai@gmail.com
git config --global core.editor vim
git config --global merge.tool vimdiff
git config --global color.ui true
sudo git config --system alias.st status     #git st
sudo git config --system alias.ci commit   #git commit
sudo git config --system alias.co checkout  #git co
sudo git config --system alias.br branch  #git branch
git config core.filemode false # 忽略权限变化
git config --global core.autocrlf false # 换行符
git config --global core.safecrlf true # 检查换行符
git config receive.denycurrentbranch ignore # 设置可以 push
git config branch.master.remote origin # 默认 pull
git config branch.master.merge refs/heads/master
# 配置一个git lg 用来显示分支图
git config --global alias.lg "log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative" 
git config --global push.default simple 
git config --list
```

##### 初始化远程仓库
```shell
git init --bare
```
##### 初始化仓库，并启用组共享
```shell
git init --bare --share
```

##### 客户端
```shell
git remote add -f origin fanshengshuai@xxx.xxx.xxx:/www/
```

##### 删除远程地址
```shell
git remote rm origin
```

##### 恢复
```shell
git reset --hard
```
##### 恢复所有没有push的本地commit
```
git fetch origin branch-name 
git reset --hard origin/branch-name
```

##### git 删除历史纪录中的某些文件
	https://git-scm.com/book/zh/v2/Git-工具-重写历史#核弹级选项:-filter-branch
```
# --prune-empty 表示如果修改后的提交为空则扔掉不要
# --all 是针对所有分支
# 正则批评要删除的文件，可以用 --index-filter ‘git rm --cached --ignore-unmatch *.jar’
git filter-branch --tree-filter 'rm -rf lib/flib' --prune-empty --
git push --force

# 修改纪录中的 提交者 和 email
git filter-branch -f --env-filter "GIT_AUTHOR_NAME='Newname'; GIT_AUTHOR_EMAIL='newemail'; GIT_COMMITTER_NAME='Newname'; GIT_COMMITTER_EMAIL='newemail';" HEAD


```

##### 将本地的状态回退到和远程的一样　　　　　　
```shell
git reset --hard origin/master　
```

##### 增加远程地址
```shell
git remote add origin ssh://git@dev.lemote.com/rt4ls.git
```

##### 导入svn到GIT

```shell
# 先制作 user.txt
svn log --xml svn://xxxxx/trunk |grep "<author" | sort -u \
	|  perl -pe 's/<author>(.*?)<\/author>/$1 = /' > user.txt
# 导入svn
git svn clone svn://xxxxx/trunk --no-metadata --localtime  --authors-file=user.txt
```

##### GIT导出代码
```sh
git archive --format zip --output "../archive.zip" master -0
```



##### 把本地仓库提交到远程仓库的master分支中
```shell
git push ssh://git@xxx.com/rt4ls.git master
git push origin master
```

Git 和Github初次使用
<http://apps.hi.baidu.com/share/detail/42643392>

##### 提交本地test分支作为远程的master分支
```shell
git push origin test:master
```

##### 提交本地test分支作为远程的test分支
```shell
git push origin test:test
```

如果想删除远程的分支呢？类似于上面，如果:左边的分支为空，那么将删除:右边的远程的分支。


```shell
# 刚提交到远程的test将被删除，但是本地还会保存的，不用担心
git push origin :test
```

在初始化远程仓库时最好使用 git --bare init   而不要使用：git init，如果使用了git init初始化，则远程仓库的目录下，也包含work tree，当本地仓库向远程仓库push时,   如果远程仓库正在push的分支上（如果当时不在push的分支，就没有问题）, 那么push后的结果不会反应在work tree上,  也即在远程仓库的目录下对应的文件还是之前的内容，必须得使用git reset --hard才能看到push后的内容.


> Pull is not possible because you have unmerged files.

    本地的push和merge会形成MERGE-HEAD(FETCH-HEAD), HEAD（PUSH-HEAD）这样的引用。HEAD代表本地最近成功push后形成的引用。MERGE-HEAD表示成功pull后形成的引用。可以通过MERGE-HEAD或者HEAD来实现类型与svn revet的效果。

	解决：
	1.将本地的冲突文件冲掉，不仅需要reset到MERGE-HEAD或者HEAD,还需要--hard。没有后面的hard，不会冲掉本地工作区。只会冲掉stage区。
	git reset --hard FETCH_HEAD

	2.git pull就会成功。


### Create a new repository on the command line

```shell
touch README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:fanshengshuai/vim.git
git push -u origin master
```

### Push an existing repository from the command line
```shell
git remote add origin https://github.com/fanshengshuai/vim.git
git push -u origin master
```


### GIT 针对不同分支，启用不同的RSA KEY
```sh
touch ~/.ssh/config
chmod 600 ~/.ssh/config
vim ~/.ssh/config
```
放入以下内容
```sh
Host VPSMate.github.com
HostName github.com
User git
IdentityFile ~/.ssh/id_rsa_vps_mate_github_com
```
然后，更改 GIT 的 remote
```
git remote rm origin
git remote add origin git@VPSMate.github.com:fanshengshuai/VPSMate.git
git push --all
```
  
