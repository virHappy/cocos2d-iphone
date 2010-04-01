#!/bin/bash

echo 'cocos2d-iphone template installer'

COCOS2D_VER='Cocos2d 0.99.1'
TEMPLATE_DIR="/Library/Application Support/Developer/Shared/Xcode/Project Templates/${COCOS2D_VER}/"

if [[ ! -d "$TEMPLATE_DIR" ]]; then
	echo '...creating cocos2d template directory'
	echo ''
	mkdir -p "$TEMPLATE_DIR"
fi

usage(){
cat << EOF
usage: $0 [options]
 
Install / update templates for ${COCOS2D_VER}
 
OPTIONS:
   -f      force overwrite if directories exist
   -h	   this help
EOF
}

copy_files(){
	rsync -r --exclude=.svn "$1" "$2"
}

check_dst_dir(){
	if [[ $DST_DIR ]];  then
		if [[ $force ]]; then
			echo "removing old libraries: ${DST_DIR}"
			rm -rf $DST_DIR
		else
		    echo "template already installed"
		    exit 1
		fi
	fi
	
	echo ...creating destination directory: $DST_DIR
	mkdir -p "$DST_DIR"
}

copy_base_files(){
	echo ...copying cocos2d files
	copy_files cocos2d "$LIBS_DIR"

	echo ...copying cocos2d dependency files
	copy_files external/FontLabel "$LIBS_DIR"

	echo ...copying CocosDenshion files
	copy_files CocosDenshion "$LIBS_DIR"

	echo ...copying cocoslive files
	copy_files cocoslive "$LIBS_DIR"

	echo ...copying cocoslive dependency files
	copy_files external/TouchJSON "$LIBS_DIR"
}

print_template_banner(){
	echo ''
	echo ''
	echo ''
	echo "$1"
	echo '----------------------------------------------------'
	echo ''
}

force=

while getopts "fh" OPTION; do
     case "$OPTION" in
         f)
             force=1
             ;;
		 h)
			 usage
			 exit 0
			 ;;
     esac
done

print_template_banner "Installing cocos2d template"

DST_DIR="$TEMPLATE_DIR""cocos2d Application/"
LIBS_DIR="$DST_DIR"libs

check_dst_dir

echo ...copying template files
copy_files templates/cocos2d_app/ "$DST_DIR"

copy_base_files

echo done!

print_template_banner "Installing cocos2d + box2d template"

DST_DIR="$TEMPLATE_DIR""cocos2d Box2d Application/"
LIBS_DIR="$DST_DIR"libs

check_dst_dir

echo ...copying template files
copy_files templates/cocos2d_box2d_app/ "$DST_DIR"

copy_base_files

echo ...copying Box2D files
copy_files external/Box2d/Box2D "$LIBS_DIR"

echo done!


print_template_banner "Installing cocos2d + chipmunk template"

DST_DIR="$TEMPLATE_DIR""cocos2d Chipmunk Application/"
LIBS_DIR="$DST_DIR"libs

check_dst_dir

echo ...copying template files
copy_files templates/cocos2d_chipmunk_app/ "$DST_DIR"

copy_base_files

echo ...copying Chipmunk files
copy_files external/Chipmunk "$LIBS_DIR"

echo done!
#!/bin/bash

echo 'cocos2d-iphone template installer'

COCOS2D_VER='Cocos2d 0.99.1'
TEMPLATE_DIR="/Library/Application Support/Developer/Shared/Xcode/Project Templates/${COCOS2D_VER}/"

if [[ ! -d "$TEMPLATE_DIR" ]]; then
	echo '...creating cocos2d template directory'
	echo ''
	mkdir -p "$TEMPLATE_DIR"
fi

usage(){
cat << EOF
usage: $0 [options]
 
Install / update templates for ${COCOS2D_VER}
 
OPTIONS:
   -f      force overwrite if directories exist
   -h	   this help
EOF
}

copy_files(){
	rsync -r --exclude=.svn "$1" "$2"
}

check_dst_dir(){
	if [[ $DST_DIR ]];  then
		if [[ $force ]]; then
			echo "removing old libraries: ${DST_DIR}"
			rm -rf $DST_DIR
		else
		    echo "template already installed"
		    exit 1
		fi
	fi
	
	echo ...creating destination directory: $DST_DIR
	mkdir -p "$DST_DIR"
}

copy_base_files(){
	echo ...copying cocos2d files
	copy_files cocos2d "$LIBS_DIR"

	echo ...copying cocos2d dependency files
	copy_files external/FontLabel "$LIBS_DIR"

	echo ...copying CocosDenshion files
	copy_files CocosDenshion "$LIBS_DIR"

	echo ...copying cocoslive files
	copy_files cocoslive "$LIBS_DIR"

	echo ...copying cocoslive dependency files
	copy_files external/TouchJSON "$LIBS_DIR"
}

print_template_banner(){
	echo ''
	echo ''
	echo ''
	echo "$1"
	echo '----------------------------------------------------'
	echo ''
}

force=

while getopts "fh" OPTION; do
     case "$OPTION" in
         f)
             force=1
             ;;
		 h)
			 usage
			 exit 0
			 ;;
     esac
done

print_template_banner "Installing cocos2d template"

DST_DIR="$TEMPLATE_DIR""cocos2d Application/"
LIBS_DIR="$DST_DIR"libs

check_dst_dir

echo ...copying template files
copy_files templates/cocos2d_app/ "$DST_DIR"

copy_base_files

echo done!

print_template_banner "Installing cocos2d + box2d template"

DST_DIR="$TEMPLATE_DIR""cocos2d Box2d Application/"
LIBS_DIR="$DST_DIR"libs

check_dst_dir

echo ...copying template files
copy_files templates/cocos2d_box2d_app/ "$DST_DIR"

copy_base_files

echo ...copying Box2D files
copy_files external/Box2d/Box2D "$LIBS_DIR"

echo done!


print_template_banner "Installing cocos2d + chipmunk template"

DST_DIR="$TEMPLATE_DIR""cocos2d Chipmunk Application/"
LIBS_DIR="$DST_DIR"libs

check_dst_dir

echo ...copying template files
copy_files templates/cocos2d_chipmunk_app/ "$DST_DIR"

copy_base_files

echo ...copying Chipmunk files
copy_files external/Chipmunk "$LIBS_DIR"

echo done!
