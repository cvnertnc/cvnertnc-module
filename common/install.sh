SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false
SKIPUNZIP=true

volume_bar() {
    ui_print " "
    ui_print "---IOS Volume-Bar için renk seçin"
    ui_print "  Vol ➕= Siyah"
    ui_print "  Vol ➖= Normal"
    ui_print " "
    if $VKSEL; then
        ui_print "- Siyah Renk seçildi"
        color_path="Black"
    else
        ui_print "- Normal Renk seçildi"
        color_path="NoBlack"
    fi
    
    cp -rf "$MODPATH/common/addon/files/$color_path/miui.systemui.plugin" "$MODPATH/system/media/theme/default/"
    sleep 2.0
    
    ui_print "IOS Volume-Bar için mod ister misin?"
    ui_print "  Vol ➕= Evet"
    ui_print "  Vol ➖= Hayır"
    ui_print " "
    if $VKSEL; then
        ui_print "- Mod seçildi"
        sleep 2.0
        cp -rf "$MODPATH/common/addon/files/MiuiSystemUIPlugin" "$MODPATH/system/app"
        echo "- Flaşlanıyor..."
        case "$CPU_ABI" in
          arm64*) Type=arm64 Wenj=arm64-v8a;;
          arm*) Type=arm Wenj=armeabi-v7a;;
          x86_64*) Type=x86_64 Wenj=x86_64;;
          x86*) Type=x86 Wenj=x86;;
        esac
        echo
        sleep 0.1
        echo "- System$TypeCpu"
        sleep 0.1
        echo "- MiuiSystemUIPlugin_APP_lib Patch'leniyor"
        mkdir -p $MODPATH/system/app/MiuiSystemUIPlugin/lib/$Type
        mkdir -p $MODPATH/MiuiSystemUIPlugin
        unzip -o $MODPATH/system/app/MiuiSystemUIPlugin/MiuiSystemUIPlugin.apk -d $MODPATH/MiuiSystemUIPlugin >&2
        cp -rf $MODPATH/MiuiSystemUIPlugin/lib/$Wenj/* $MODPATH/system/app/MiuiSystemUIPlugin/lib/$Type
        rm -rf $MODPATH/MiuiSystemUIPlugin
        tmp_list="MiuiSystemUIPlugin"
        dda=/data/dalvik-cache/arm
        [ -d $dda"64" ] && dda=$dda"64"
        for i in $tmp_list; do
          rm -f $dda/system@*@"$i"*
        done
        echo
        sleep 0.1
        set_perm_recursive $MODPATH 0 0 0755 0644
        cp -rf "$MODPATH/common/addon/files/com.systemui/com.android.systemui" "$MODPATH/system/media/theme/default/"
    else
        ui_print "- Mod iptal ediliyor"
        sleep 2.0
    fi
    
    ui_print "---Cihazınız MIUI Chine (CN) rom mu yoksa diğer EU, ID, RU, MI rom mu?"
    ui_print "  Power Menu için"
    ui_print "  Vol ➕= CN"
    ui_print "  Vol ➖= Diğer (EU ID RU MI)"
    ui_print " "
    if $VKSEL; then
        ui_print "- CN Seçildi"
        sleep 2.0
    else
        powmenu(){
            ui_print "- 12.5 seçildi"
            power_menu_path="chine"
        }
        newpowmemu(){
            ui_print "- New seçildi"
            power_menu_path="New"
        }
        rogpowmenu(){
            ui_print "- ROG seçildi"
            power_menu_path="ROG"
        }
        ui_print "- Diğer (EU ID RU MI) seçildi"
        sleep 2.0
            ui_print " "
            ui_print "- SEÇ"
            ui_print "    1️⃣. 12.5"
            ui_print "    2️⃣. New"
            ui_print "    3️⃣. ROG"
            ui_print "   "
        ui_print "  MOD SEÇİN:"
        SR=1
        while true; do
            ui_print "  $SR"
        	if $VKSEL; then
        		SR=$((SR + 1))
        	else 
        		break
        	fi
        	if [ $SR -gt 3 ]; then
        		SR=1
        	fi
        done
        ui_print "  MOD SEÇENEKLERİ: $SR"
        case $SR in
        	1 ) FCTEXTAD0="12.5()"; powmenu;;
        	2 ) FCTEXTAD0="New()"; newpowmemu;;
        	3 ) FCTEXTAD0="ROG()"; rogpowmenu;;
        esac
        ui_print "   "
    
        if [ -n "$power_menu_path" ]; then
            cp -rf "$MODPATH/common/addon/files/$power_menu_path/powermenu" "$MODPATH/system/media/theme/default/"
            cp -rf "$MODPATH/common/addon/files/$power_menu_path/powermenu_n" "$MODPATH/system/media/theme/default/"
            sleep 2.0
        fi
        rm -rf /system/app/MiuiSystemUIPlugin/*
    fi
}

launcher() {
    ui_print " "
    ui_print "---XiaoumiEU Ext apk yüklemek istiyor musun?"
    ui_print "- Bazı cihazlarda bootloop'a neden olabilir"
    ui_print "- Sorumluluk sizindir."
    ui_print "- search bar provider & get hide apps"
    ui_print "  Vol ➕= Evet"
    ui_print "  Vol ➖= Hayır"
    ui_print " "
    if $VKSEL; then
        ui_print "- XiaoumiEU Ext apk seçildi"
        cp -rf $MODPATH/common/addon/files/XiaomiEUExt $MODPATH/system/priv-app
        sleep 2.0
        echo "- Flaşlanıyor..."
        case "$CPU_ABI" in
          arm64*) Type=arm64 Wenj=arm64-v8a;;
          arm*) Type=arm Wenj=armeabi-v7a;;
          x86_64*) Type=x86_64 Wenj=x86_64;;
          x86*) Type=x86 Wenj=x86;;
        esac
        echo
        sleep 0.1
        echo "- System$TypeCpu"
        sleep 0.1
        echo "- XiaomiEUExt_APP_lib Patch'leniyor"
        mkdir -p $MODPATH/system/priv-app/XiaomiEUExt/lib/$Type
        mkdir -p $MODPATH/XiaomiEUExt
        unzip -o $MODPATH/system/app/XiaomiEUExt/XiaomiEUExt.apk -d $MODPATH/XiaomiEUExt >&2
        cp -rf $MODPATH/XiaomiEUExt/lib/$Wenj/* $MODPATH/system/priv-app/XiaomiEUExt/lib/$Type
        rm -rf $MODPATH/XiaomiEUExt
        tmp_list="XiaomiEUExt"
        dda=/data/dalvik-cache/arm
        [ -d $dda"64" ] && dda=$dda"64"
        for i in $tmp_list; do
          rm -f $dda/system@*@"$i"*
        done
        echo
        sleep 0.1
        rm -rf /data/system/package_cache/*
        set_perm_recursive $MODPATH 0 0 0755 0644
    else
        ui_print "İptal edildi..."
        sleep 2.0
    fi
    ui_print "---Modded App Vault yüklemek istiyor musun?"
    ui_print "  Vol ➕= Evet"
    ui_print "  Vol ➖= Hayır"
    ui_print " "
    if $VKSEL; then
        ui_print "- App Vault seçildi"
        ui_print "- Global & China App Vault güncellemeleri kaldırılıyor..."
        pm uninstall-system-updates com.miui.personalassistant
        pm uninstall-system-updates com.mi.globalminusscreen
        sleep 2.0
        ui_print "- Modded App Vault yüklendi"
        cp -rf $MODPATH/common/addon/files/Minus1 $MODPATH/system/app
        echo "- Flaşlanıyor..."
        case "$CPU_ABI" in
          arm64*) Type=arm64 Wenj=arm64-v8a;;
          arm*) Type=arm Wenj=armeabi-v7a;;
          x86_64*) Type=x86_64 Wenj=x86_64;;
          x86*) Type=x86 Wenj=x86;;
        esac
        echo
        sleep 0.1
        echo "- System$TypeCpu"
        sleep 0.1
        echo "- Minus1_APP_lib Patch'leniyor"
        mkdir -p $MODPATH/system/app/Minus1/lib/$Type
        mkdir -p $MODPATH/Minus1
        unzip -o $MODPATH/system/app/Minus1/Minus1.apk -d $MODPATH/Minus1 >&2
        cp -rf $MODPATH/Minus1/lib/$Wenj/* $MODPATH/system/app/Minus1/lib/$Type
        rm -rf $MODPATH/Minus1
        tmp_list="Minus1"
        dda=/data/dalvik-cache/arm
        [ -d $dda"64" ] && dda=$dda"64"
        for i in $tmp_list; do
          rm -f $dda/system@*@"$i"*
        done
        echo
        sleep 0.1
        rm -rf /data/system/package_cache/*
        set_perm_recursive $MODPATH 0 0 0755 0644
        sleep 2
        cp -rf $MODPATH/common/addon/files/GlobalMinusScreen $MODPATH/system/app
        echo "- Flaşlanıyor..."
        case "$CPU_ABI" in
          arm64*) Type=arm64 Wenj=arm64-v8a;;
          arm*) Type=arm Wenj=armeabi-v7a;;
          x86_64*) Type=x86_64 Wenj=x86_64;;
          x86*) Type=x86 Wenj=x86;;
        esac
        echo
        sleep 0.1
        echo "- System$TypeCpu"
        sleep 0.1
        echo "- GlobalMinusScreen_APP_lib Patch'leniyor"
        mkdir -p $MODPATH/system/app/GlobalMinusScreen/lib/$Type
        mkdir -p $MODPATH/GlobalMinusScreen
        unzip -o $MODPATH/system/app/GlobalMinusScreen/GlobalMinusScreen.apk -d $MODPATH/GlobalMinusScreen >&2
        cp -rf $MODPATH/GlobalMinusScreen/lib/$Wenj/* $MODPATH/system/app/GlobalMinusScreen/lib/$Type
        rm -rf $MODPATH/GlobalMinusScreen
        tmp_list="GlobalMinusScreen"
        dda=/data/dalvik-cache/arm
        [ -d $dda"64" ] && dda=$dda"64"
        for i in $tmp_list; do
          rm -f $dda/system@*@"$i"*
        done
        echo
        sleep 0.1
        rm -rf /data/system/package_cache/*
        set_perm_recursive $MODPATH 0 0 0755 0644
        sleep 2.0
    else {
        ui_print "- No App Vault seçildi, removing..."
        rm -rf $MODPATH/system/priv-app/Minus1
        sleep 2.0
    }
    fi
    rm -rf /system/priv-app/PersonalAssistant/*
    rm -rf /system/priv-app/GlobalMinusScreen/*
    rm -rf /system/app/GlobalMinusScreen/*
    rm -rf /system/app/Minus1/*
    sleep 3.0
    ui_print "- Özellikler aktif ediliyor"
    su -c  cmd settings put system key_home_screen_search_bar_provider com.google.android.googlequicksearchbox
    ABI=`grep_prop ro.product.cpu.abi`
    case "$ABI" in
        arm64*) Type=arm64 Wenj=arm64-v8a;;
        arm*) Type=arm Wenj=armeabi-v7a;;
        x86_64*) Type=x86_64 Wenj=x86_64;;
        x86*) Type=x86 Wenj=x86;;
        *) echo "Product not enough";;
    esac
    mkdir -p $MODPATH/system/priv-app/MiuiHome/lib/${Type}
    mkdir -p $MODPATH/Home
    unzip -o $MODPATH/system/priv-app/MiuiHome/MiuiHome.apk -d $MODPATH/Home >&2
    cp -rf $MODPATH/Home/lib/${Wenj}/* $MODPATH/system/priv-app/MiuiHome/lib/${Type}
    rm -rf $MODPATH/Home
    tmp_list="MiuiHome"
    
    dda=/data/dalvik-cache/arm
    [ -d $dda"64" ] && dda=$dda"64"
    for i in $tmp_list; do
    	rm -f $dda/system@*@"$i"*
    done
}

theme() {
    ui_print " "
    ui_print "- ModThemeManager uygulanıyor"
    cp -rf $MODPATH/common/addon/files/ThemeManager $MODPATH/system/app/
    sleep 2.0
    echo "- Flaşlanıyor..."
    unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
    case "$CPU_ABI" in
      arm64*) Type=arm64 Wenj=arm64-v8a;;
      arm*) Type=arm Wenj=armeabi-v7a;;
      x86_64*) Type=x86_64 Wenj=x86_64;;
      x86*) Type=x86 Wenj=x86;;
    esac
    echo
    sleep 0.1
    echo "- System$TypeCpu"
    sleep 0.1
    echo "- Theme_APP_lib Patch'leniyor"
    mkdir -p $MODPATH/system/app/ThemeManager/lib/$Type
    mkdir -p $MODPATH/ThemeManager
    unzip -o $MODPATH/system/app/ThemeManager/ThemeManager.apk -d $MODPATH/ThemeManager >&2
    cp -rf $MODPATH/ThemeManager/lib/$Wenj/* $MODPATH/system/app/ThemeManager/lib/$Type
    rm -rf $MODPATH/ThemeManager
    rm -rf $MODPATH/YuK
    tmp_list="ThemeManager"
    dda=/data/dalvik-cache/arm
    [ -d $dda"64" ] && dda=$dda"64"
    for i in $tmp_list; do
      rm -f $dda/system@*@"$i"*
    done
    echo
    sleep 0.1
    rm -rf /data/system/package_cache/*
    rm -rf /data/data/com.android.thememanager/*
    rm -rf /data/user/0/com.android.thememanager/*
    rm -rf /data/user_de/0/com.android.thememanager/*
    rm -rf /data/app/*/com.android.thememanager*
    rm -rf /data/app/com.android.thememanager*
    set_perm_recursive $MODPATH 0 0 0755 0644
}

screenrecorder() {
    ui_print " "
    ui_print "- ModScreenRecorder uygulanıyor"
    cp -rf $MODPATH/common/addon/files/ScreenRecorderGlobalStub $MODPATH/system/app/
    echo "- Flaşlanıyor..."
    case "$CPU_ABI" in
      arm64*) Type=arm64 Wenj=arm64-v8a;;
      arm*) Type=arm Wenj=armeabi-v7a;;
      x86_64*) Type=x86_64 Wenj=x86_64;;
      x86*) Type=x86 Wenj=x86;;
    esac
    echo
    sleep 0.1
    echo "- System$TypeCpu"
    sleep 0.1
    echo "- ScreenRecorder_APP_lib Patch'leniyor"
    mkdir -p $MODPATH/system/app/ScreenRecorderGlobalStub/lib/$Type
    mkdir -p $MODPATH/ScreenRecorderGlobalStub
    unzip -o $MODPATH/system/app/ScreenRecorderGlobalStub/MiuiScreenRecorder.apk -d $MODPATH/ScreenRecorderGlobalStub >&2
    cp -rf $MODPATH/ScreenRecorderGlobalStub/lib/$Wenj/* $MODPATH/system/app/ScreenRecorderGlobalStub/lib/$Type
    rm -rf $MODPATH/ScreenRecorderGlobalStub
    tmp_list="ScreenRecorderGlobalStub"
    dda=/data/dalvik-cache/arm
    [ -d $dda"64" ] && dda=$dda"64"
    for i in $tmp_list; do
      rm -f $dda/system@*@"$i"*
    done
    echo
    sleep 0.1
    rm -rf /data/system/package_cache/*
    rm -rf /system/app/MIUIScreenRecorderGlobal/*
    rm -rf /system/app/MiuiScreenRecorder2/*
    rm -rf /system/app/ScreenRecorderGlobalStub/*
    ui_print "- ScreenRecorder updates will be uninstalled..."
    pm uninstall-system-updates com.miui.screenrecorder
    set_perm_recursive $MODPATH 0 0 0755 0644
}

cleanup() {
	rm -rf $MODPATH/addon 2>/dev/null
	rm -rf $MODPATH/common 2>/dev/null
	rm -rf $MODPATH/files 2>/dev/null
	rm -f $MODPATH/install.sh 2>/dev/null
	ui_print "- Deleting package cache files"
    rm -rf /data/resource-cache/*
    rm -rf /data/system/package_cache/*
    rm -rf /cache/*
    rm -rf /data/dalvik-cache/*
    ui_print "- Launcher updates will be uninstalled..."
    pm uninstall-system-updates com.miui.home
    ui_print "- Deleting old module (if it is installed)"
    touch /data/adb/modules/volume_bar/remove
}

run_install_old() {
    R='\e[01;91m' > /dev/null 2>&1;
    G='\e[01;92m' > /dev/null 2>&1;
    ui_print " "
    ui_print "- Yapılandırmanızı seçin"
    sleep 0.2
    ui_print "  [Volume ➕ ] Sonraki"
    ui_print "  [Volume ➖ ] Yükle"
    ui_print "   "
    ui_print "- SEÇ"
    ui_print "    1️⃣. Volume-UI"
    ui_print "    2️⃣. MIUI14-Launcher-Appvault"
    ui_print "    3️⃣. ModThemeManager"
    ui_print "    4️⃣. Çıkış"
    ui_print "   "
    while true; do
            ui_print " "
        ui_print "  MOD SEÇİN:"
        SR=1
        while true; do
            ui_print "  $SR"
        	if $VKSEL; then
        		SR=$((SR + 1))
        	else 
        		break
        	fi
        	if [ $SR -gt 4 ]; then
        		SR=1
        	fi
        done
        ui_print "  MOD SEÇENEKLERİ: $SR"
        case $SR in
        	1 ) FCTEXTAD0="Volume-Bar()"; volume_bar;;
        	2 ) FCTEXTAD0="Launcher14-Appvaultt()"; launcher;;
        	3 ) FCTEXTAD0="ModThemeManager()"; theme;;
        	4 ) ui_print "   ℹ️ İptal edildi. Değişiklikler kaydediliyor..."; return;;
        esac
        ui_print "   "
    done
}

run_install() {
    unzip -o "$MODPATH/common/addon/files/files.zip" -d "$MODPATH/common/addon/files/" >&2
    mkdir -p "$MODPATH/system/media/theme/default/"
    mkdir -p "$MODPATH/system/priv-app/"
    mkdir -p "$MODPATH/system/app/"
    mkdir -p "$MODPATH/system/vendor/overlay/"
    volume_bar
    sleep 2
    launcher
    sleep 2
    theme
    sleep 2
    screenrecorder
    sleep 2
}

on_install() {
	ui_print "- Kurulum başlıyor"
	run_install
	sleep 1
	ui_print " "
	ui_print "- Cleaning up"
	cleanup
	sleep 1
	ui_print " "
	ui_print "- Tamamlanıyor"
	sleep 1
}

on_install