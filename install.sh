#! /bin/bash


lowercase(){
	echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

####################################################################
# Get System Info
####################################################################
shootProfile(){
	OS=`lowercase \`uname\``
	KERNEL=`uname -r`
	MACH=`uname -m`

	if [ "${OS}" == "windowsnt" ]; then
		OS=windows
	elif [ "${OS}" == "darwin" ]; then
		OS=mac
	else
		OS=`uname`
		if [ "${OS}" = "SunOS" ] ; then
			OS=Solaris
			ARCH=`uname -p`
			OSSTR="${OS} ${REV}(${ARCH} `uname -v`)"
		elif [ "${OS}" = "AIX" ] ; then
			OSSTR="${OS} `oslevel` (`oslevel -r`)"
		elif [ "${OS}" = "Linux" ] ; then
			if [ -f /etc/redhat-release ] ; then
				DistroBasedOn='RedHat'
				DIST=`cat /etc/redhat-release |sed s/\ release.*//`
				PSUEDONAME=`cat /etc/redhat-release | sed s/.*\(// | sed s/\)//`
				REV=`cat /etc/redhat-release | sed s/.*release\ // | sed s/\ .*//`
			elif [ -f /etc/SuSE-release ] ; then
				DistroBasedOn='SuSe'
				PSUEDONAME=`cat /etc/SuSE-release | tr "\n" ' '| sed s/VERSION.*//`
				REV=`cat /etc/SuSE-release | tr "\n" ' ' | sed s/.*=\ //`
			elif [ -f /etc/mandrake-release ] ; then
				DistroBasedOn='Mandrake'
				PSUEDONAME=`cat /etc/mandrake-release | sed s/.*\(// | sed s/\)//`
				REV=`cat /etc/mandrake-release | sed s/.*release\ // | sed s/\ .*//`
			elif [ -f /etc/debian_version ] ; then
				DistroBasedOn='Debian'
				if [ -f /etc/lsb-release ] ; then
			        	DIST=`cat /etc/lsb-release | grep '^DISTRIB_ID' | awk -F=  '{ print $2 }'`
			                PSUEDONAME=`cat /etc/lsb-release | grep '^DISTRIB_CODENAME' | awk -F=  '{ print $2 }'`
			                REV=`cat /etc/lsb-release | grep '^DISTRIB_RELEASE' | awk -F=  '{ print $2 }'`
            			fi
			fi
			if [ -f /etc/UnitedLinux-release ] ; then
				DIST="${DIST}[`cat /etc/UnitedLinux-release | tr "\n" ' ' | sed s/VERSION.*//`]"
			fi
			OS=`lowercase $OS`
			DistroBasedOn=`lowercase $DistroBasedOn`
		 	readonly OS
		 	readonly DIST
			readonly DistroBasedOn
		 	readonly PSUEDONAME
		 	readonly REV
		 	readonly KERNEL
		 	readonly MACH
		fi

	fi
}
shootProfile
echo "OS: $OS"
echo "DIST: $DIST"
echo "PSUEDONAME: $PSUEDONAME"
echo "REV: $REV"
echo "DistroBasedOn: $DistroBasedOn"
echo "KERNEL: $KERNEL"
echo "MACH: $MACH"
echo "========"


########################################################

########################################################
DOTFILES_DIR=$HOME/.dotfiles

#pushd .
cd "$DOTFILES_DIR" || return
#git submodule update --init --recursive --remote
#git submodule foreach --recursive git pull origin master
#popd || return

# Create symlinks
#ln -s "$DOTFILES_DIR"/vim-plug.vim ~/.vim
#ln -s "$DOTFILES_DIR"/inputrc ~/.inputrc
#ln -s "$DOTFILES_DIR"/tmux.conf ~/.tmux.conf
#ln -s "$DOTFILES_DIR"/gdbinit ~/.gdbinit
#ln -s "$DOTFILES_DIR"/dir_colors ~/.dir_colors
#ln -s ~/dotfiles-local/inputrc ~/.inputrc
#ln -s ~/dotfiles-local/tmux.conf ~/.tmux.conf
#ln -s ~/dotfiles-local/vim-plug.vim ~/.vimrc
#ln -s ~/dotfiles-local/gdbinit ~/.gdbinit
#ln -s ~/dotfiles-local/dir_colors ~/.dircolors

# update sumodules
#cd "$DOTFILES_DIR"
#git submodule update --init --recursive

YUM_PACKAGE_NAME="zsh git iputils-ping tmux nmap"
DEB_PACKAGE_NAME="zsh git fd-find net-tools iputils-ping nmap"
BREW_PACKAGE_NAME="zsh git tmux nmap"

if [[ "$OS" == *mac* ]]; then
   echo "==============================================="
   echo "Installing packages $BREW_PACKAGE_NAME on MacOS"
   echo "==============================================="
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   brew update
   brew upgrade		
   brew install $BREW_PACKAGE_NAME
# elif cat /etc/*release | grep ^NAME | grep CentOS; then
#    echo "==============================================="
#    echo "Installing packages $YUM_PACKAGE_NAME on CentOS"
#    echo "==============================================="
#    yum install -y $YUM_PACKAGE_NAME
# elif cat /etc/*release | grep ^NAME | grep Red; then
#    echo "==============================================="
#    echo "Installing packages $YUM_PACKAGE_NAME on RedHat"
#    echo "==============================================="
#    yum install -y $YUM_PACKAGE_NAME
# elif cat /etc/*release | grep ^NAME | grep Fedora; then
#    echo "================================================"
#    echo "Installing packages $YUM_PACKAGE_NAME on Fedorea"
#    echo "================================================"
#    yum install -y $YUM_PACKAGE_NAME
elif cat /etc/*release | grep ^NAME | grep Ubuntu; then
   echo "==============================================="
   echo "Installing packages $DEB_PACKAGE_NAME on Ubuntu"
   echo "==============================================="
   apt-get update
   apt-get install -y $DEB_PACKAGE_NAME
# elif cat /etc/*release | grep ^NAME | grep Debian ; then
#    echo "==============================================="
#    echo "Installing packages $DEB_PACKAGE_NAME on Debian"
#    echo "==============================================="
#    apt-get update
#    apt-get install -y $DEB_PACKAGE_NAME
# elif cat /etc/*release | grep ^NAME | grep Mint ; then
#    echo "============================================="
#    echo "Installing packages $DEB_PACKAGE_NAME on Mint"
#    echo "============================================="
#    apt-get update
#    apt-get install -y $DEB_PACKAGE_NAME
# elif cat /etc/*release | grep ^NAME | grep Knoppix ; then
#    echo "================================================="
#    echo "Installing packages $DEB_PACKAGE_NAME on Kanoppix"
#    echo "================================================="
#    apt-get update
#    apt-get install -y $DEB_PACKAGE_NAME
# else
#    echo "OS NOT DETECTED, couldn't install package $PACKAGE"
#    exit 1;
fi

exit 0
#
