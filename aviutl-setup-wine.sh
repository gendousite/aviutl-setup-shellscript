#!/bin/bash
sudo apt-get update
sudo dpkg --add-architecture i386

read -p "WineとWinetricksをインストールしますか? ※wineの設定(windowsバージョン)はxpにしてください(y/n): " answer
case "$answer" in
	[yY]) sudo apt install wine 
	      sudo apt-get install winetricks
	　　　　cd "${HOME}/Downloads"
	　　　　wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
	　　　　chmod +x winetricks
	　　　　sudo cp winetricks /usr/local/bin
	      winecfg
	     　WINEPREFIX=~/.NET45-2 winetricks dotnet452
　　　　　　　　　WINEPREFIX=~/.NET45-2　winetricks fakejapanese_ipamona
	      winetricks dotnet452;;
	[nN]) echo "終了" ;;
	*) echo "ｙかｎのキーを押してよ"
esac

read -p "aviutlのセットアップを行います。 (y/n)" answer
case "$answer" in
	[yY]) 
	winetricks fakejapanese_ipamona
	wget http://spring-fragrance.mints.ne.jp/aviutl/aviutl110.zip
	wget http://spring-fragrance.mints.ne.jp/aviutl/exedit93rc1.zip
	wget https://gwdhla.dm.files.1drv.com/y4mSzKeZxrlo7VJZeAYXkbtM4OtK3r7L8PqzXhLVXVFkKzYe3J96cjwLA6MHUynyKaPqQahP_qb4sgje9NSoXZFfe8rVtmK7VHV9deOdShrqljJFW1_IPrw9cMgaNA9vH_97KWbHAKVrs3tc_BCwyiY3SnY0HPWfx-nOEnaqC0rz3MEyv7ec8qahAKw3hhBgAAZ/x264guiEx_2.68.zip
	wget https://pop.4-bit.jp/bin/l-smash/L-SMASH_Works_r940_plugins.zip
	sudo apt install unar
	unar aviutl110.zip
	unar exedit93rc1.zip
	unar x264guiEx_2.68.zip
	unar L-SMASH_Works_r940_plugins.zip
	cp -pR exedit93rc1/* aviutl110/
	mkdir aviutl110/Plugins
	cd  L-SMASH_Works_r940_plugins
	cp lwcolor.auc lwdumper.auf lwinput.aui lwmuxer.auf ../aviutl110/Plugins
	cd ../
	cp -r aviutl110 デスクトップ/
	WINEPREFIX=~/.NET45-2 wine x264guiEx_2.68/auo_setup.exe
        WINEARCH=win32 WINEPREFIX=$HOME/win32 winecfg 
        WINEPREFIX=$HOME/wine32 winetricks allfonts
        WINEARCH=win32 WINEPREFIX=$HOME/win32 winecfg 
        export WINEPREFIX=$HOME/wine32
        export WINEARCH=win32
	rm -r .NET45-2　x264guiEx_2.68 aviutl110 exedit93rc1 L-SMASH_Works_r940_plugins x264guiEx_2.68.zip aviutl110.zip exedit93rc1.zip L-SMASH_Works_r940_plugins.zip
	firefox https://aviutl.info/l-smash-works/#toc5;;
	[nN]) echo "終了" ;;
	*) echo "ｙかｎのキーを押してよ"
esac
